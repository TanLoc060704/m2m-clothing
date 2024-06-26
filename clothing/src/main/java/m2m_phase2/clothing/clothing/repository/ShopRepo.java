package m2m_phase2.clothing.clothing.repository;

import jakarta.transaction.Transactional;


import m2m_phase2.clothing.clothing.data.entity.ShopE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface ShopRepo extends JpaRepository<ShopE, Integer> {

    List<ShopE> findAll();

    Optional<ShopE> findByUserE_Email(String email);

    @Query(value = "select s from ShopE s where s.userE.email = :email")
    ShopE findShopByUser(@Param("email") String email);

    @Modifying
    @Transactional
    @Query(value = "insert into Shop (name_shop, date_established, id) " +
            "values (:name_shop, :date_established, :id)", nativeQuery = true)
    int insertShop(@Param("name_shop") String nameShop,
                   @Param("date_established") Date dateEstablished,
                   @Param("id") Long id);

    @Modifying
    @Transactional
    @Query(value = "update ShopE set nameShop = :nameShop, logo = :logo where userE.email = :email")
    int updateShop(@Param("nameShop") String nameShop,
                   @Param("logo") String logo,
                   @Param("email") String email);


}
