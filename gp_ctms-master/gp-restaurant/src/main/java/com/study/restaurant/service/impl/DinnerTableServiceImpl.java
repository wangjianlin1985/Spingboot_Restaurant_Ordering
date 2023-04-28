package com.study.restaurant.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.common.core.base.BaseServiceImpl;
import com.study.restaurant.dao.DinnerTableDao;
import com.study.restaurant.entity.DinnerTable;
import com.study.restaurant.service.DinnerTableService;

@Service
public class DinnerTableServiceImpl extends BaseServiceImpl<DinnerTable> implements DinnerTableService{

	@Autowired
	private DinnerTableDao dao;
	
	@Override
	public int updateStatus(DinnerTable dinnerTable) {
		return dao.updateStatus(dinnerTable);
	}

}
