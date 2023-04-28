package com.study.restaurant.entity;

import com.study.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 菜品管理
 */
@Data
@EqualsAndHashCode(callSuper=false)
@ToString
public class Food extends BaseEntity{
	
	private static final long serialVersionUID = 1L;
	
	/**主键ID*/
	private Long foodId;
	
	/**名称*/
	private String foodName;
	
	/**照片*/
	private String photo;
	
	/**简介*/
	private String remark;
	
	/**价格*/
	private Float price;
	
	private Integer status; // 0正常 1下架

}
