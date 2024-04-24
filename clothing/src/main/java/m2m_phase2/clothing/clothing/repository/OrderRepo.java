package m2m_phase2.clothing.clothing.repository;

import jakarta.transaction.Transactional;
import m2m_phase2.clothing.clothing.data.entity.Order;
import m2m_phase2.clothing.clothing.data.entity.UserE;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepo extends JpaRepository<Order, Long> {
    List<Order> findAll();
    @Query("SELECT o.orderId, u.username, o.orderDate, o.phoneNumber, o.deliveryAddress, o.paymentMethod, o.totalAmount, o.orderStatus " +
            "FROM Order o JOIN o.customer u WHERE u.email = :email")
    List<Object[]> findOrdersWithUsernameByEmail(@Param("email") String email);
    @Modifying
    @Transactional
    @Query(value = "update [Order] " +
            "set order_status = :orderStatus " +
            "where order_id = :orderId", nativeQuery = true)
    int updateOrderStatus(@Param("orderId") Long orderId, @Param("orderStatus") String orderStatus);

    @Override
    Optional<Order> findById(Long id);


}