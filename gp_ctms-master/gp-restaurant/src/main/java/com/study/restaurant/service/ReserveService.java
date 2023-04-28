package com.study.restaurant.service;

import com.study.common.core.base.BaseService;
import com.study.restaurant.entity.Reserve;

public interface ReserveService extends BaseService<Reserve> {
	
	int updateStatus(Reserve reserve);
	
	int updateTotal(Reserve reserve);

}
