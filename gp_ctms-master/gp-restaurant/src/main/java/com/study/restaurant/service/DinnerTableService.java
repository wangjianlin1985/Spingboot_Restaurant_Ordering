package com.study.restaurant.service;

import com.study.common.core.base.BaseService;
import com.study.restaurant.entity.DinnerTable;

public interface DinnerTableService extends BaseService<DinnerTable>{

	int updateStatus(DinnerTable dinnerTable);
	
}
