package com.study.restaurant.entity;

import com.study.common.core.domain.BaseEntity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper=false)
@ToString
public class Reserve extends BaseEntity{

	private static final long serialVersionUID = 1L;

	private Long id;
	
	private String name;
	
	private String phone;
	
	private Integer num;
	
	private String date;
	
	private Integer status; // 0未开始    1 已消费    2取消
	
	private Float total;
	
	private String remark;
}
