package com.study.restaurant.entity;

import com.study.common.core.domain.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 订单管理
 */
@Data
@EqualsAndHashCode(callSuper=false)
@ToString
public class Order extends BaseEntity {

    private static final long serialVersionUID = 1L;

    private Long id;

    private String no;

    private String date;

    private String startTime;

    private String endTime;

    private Float total;

    private Integer status; // 1正在吃  2已付款  3取消

    private String remark;

    private DinnerTable table;

    private Integer rockover; // 数字，表示这个是今天该桌的第几桌

    private Float money;

    private Integer type; // 1现场 2从预订转入

}
