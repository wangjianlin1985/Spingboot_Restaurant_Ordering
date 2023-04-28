package com.study.restaurant.service;

import java.util.List;

import com.study.common.core.base.BaseService;
import com.study.restaurant.entity.Order;

public interface OrderService extends BaseService<Order> {

    // 结账更新
    int updateStatus(Order order);

    // 加减菜时更新钱
    int updateMoney(Order order);

    // 查询某个桌子某日的最大翻台号
    Integer selectMaxRockover(Order order);
    
    // 获取某个桌子某日的最新的订单
    Order getLastOrder(Order order);
    
    // 查询一段时间范围内每天的营业额
    List<Order> listGroupMoney(Order order);

}
