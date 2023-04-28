package com.study.restaurant.dao;

import com.study.common.core.base.BaseDao;
import com.study.restaurant.entity.DinnerTable;

public interface DinnerTableDao extends BaseDao<DinnerTable>{
	
	int updateStatus(DinnerTable dinnerTable);

}
