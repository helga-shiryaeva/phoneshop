package com.es.core.model.order;

import com.es.core.order.EmptyOrderListException;
import com.es.core.order.OrderService;

import java.util.List;
import java.util.Optional;

public interface OrderDao {
    int count();
    Optional<Order> get(String key);
    void save(Order order) throws EmptyOrderListException;
    List<Order> findAll(int offset, int limit);
    void updateStatus(String key, OrderStatus orderStatus);
}
