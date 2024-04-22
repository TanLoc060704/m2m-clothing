package m2m_phase2.clothing.clothing.service.impl;

import m2m_phase2.clothing.clothing.constant.OrderStatus;
import m2m_phase2.clothing.clothing.data.dto.OrderDto;
import m2m_phase2.clothing.clothing.data.entity.Order;
import m2m_phase2.clothing.clothing.repository.OrderRepo;
import m2m_phase2.clothing.clothing.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderRepo repo;

    @Override
    public List<Order> findAllOrders() {
        return repo.findAll();
    }


    @Override
    public List<Object[]> findOrdersWithUsernameByEmail(String email) {
        return repo.findOrdersWithUsernameByEmail(email);
    }

    @Override
    public byte updatePaymentStatusByOrderId(OrderDto orderDto) {
        String paymentMethod = OrderStatus.PAID.getValue();
        Long orderId = orderDto.getOrderId();
        return repo.updatePaymentStatusByOrderId(paymentMethod, orderId);
    }


}
