package com.dream.petstore.service;

import java.util.List;

import com.dream.petstore.entity.Order;

/**
 * OrderService接口
 * 
 * @author ronghua
 * @version 1.0
 * @date 2016年12月6日 下午11:16:13
 * @since 1.8
 */
public interface IOrderService {

	public void insertOrder(Order order);
	
	public Order getOrder(int orderId);
	
	public List<Order> getOrdersByUsername(String username);
	
	public int getNextId(String name);
}
