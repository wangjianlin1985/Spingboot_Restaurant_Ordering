package com.study.restaurant.service.impl;

import com.study.common.core.base.BaseServiceImpl;
import com.study.restaurant.dao.OrderDao;
import com.study.restaurant.entity.Order;
import com.study.restaurant.service.OrderService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl extends BaseServiceImpl<Order> implements OrderService {

    @Autowired
    private OrderDao dao;

    @Override
    public int updateStatus(Order order) {
        return dao.updateStatus(order);
    }

    @Override
    public int updateMoney(Order order) {
        return dao.updateMoney(order);
    }

    @Override
    public Integer selectMaxRockover(Order order) {
        return dao.selectMaxRockover(order);
    }

	@Override
	public Order getLastOrder(Order order) {
		return dao.getLastOrder(order);
	}

	@Override
	public List<Order> listGroupMoney(Order order) {
		return dao.listGroupMoney(order);
	}
}
