package com.study.restaurant.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.common.core.base.BaseServiceImpl;
import com.study.restaurant.dao.ReserveDao;
import com.study.restaurant.entity.Reserve;
import com.study.restaurant.service.ReserveService;

@Service
public class ReserveServiceImpl extends BaseServiceImpl<Reserve> implements ReserveService{

	@Autowired
	private ReserveDao dao;
	
	@Override
	public int updateStatus(Reserve reserve) {
		return dao.updateStatus(reserve);
	}

	@Override
	public int updateTotal(Reserve reserve) {
		return dao.updateTotal(reserve);
	}

}
