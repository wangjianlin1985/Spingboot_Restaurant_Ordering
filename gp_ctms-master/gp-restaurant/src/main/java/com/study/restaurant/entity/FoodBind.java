package com.study.restaurant.entity;

import com.study.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 预定或现场点餐，餐品绑定
 */
@Data
@EqualsAndHashCode(callSuper=false)
@ToString
public class FoodBind extends BaseEntity{

	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	private Food food;
	
	private Integer num;
	
	private Float price;
	
	private Integer type;  // 1预定  2消费
	
	private Long mainId;

}
