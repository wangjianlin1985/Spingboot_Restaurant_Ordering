package com.study.restaurant.dao;

import java.util.List;

import com.study.common.core.base.BaseDao;
import com.study.restaurant.entity.Order;

public interface OrderDao extends BaseDao<Order> {
    // 更新状态
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
