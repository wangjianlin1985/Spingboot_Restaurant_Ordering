package com.study.restaurant.entity;

import com.study.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

/**
 * 餐桌管理
 */
@Data
@EqualsAndHashCode(callSuper=false)
@ToString
public class DinnerTable extends BaseEntity{
	
	private static final long serialVersionUID = 1L;
	
	private Long tableId;
	
	private String tableName;
	
	private Integer seat;
	
	private Integer status; // 0空闲 1使用

}
