package com.example.shopapp.repository;

import com.example.shopapp.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    //tìm đơn hàng của 1 user
    List<Order> findByUserId(Long userId);
}
