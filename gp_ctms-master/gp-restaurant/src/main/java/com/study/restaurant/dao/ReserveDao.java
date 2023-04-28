package com.study.restaurant.dao;

import com.study.common.core.base.BaseDao;
import com.study.restaurant.entity.Reserve;

public interface ReserveDao extends BaseDao<Reserve>{
	
	int updateStatus(Reserve reserve);
	
	int updateTotal(Reserve reserve);

}
