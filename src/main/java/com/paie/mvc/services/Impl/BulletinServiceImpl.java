package com.paie.mvc.services.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.paie.mvc.dao.IBulletinDao;
import com.paie.mvc.dao.impl.BulletinDaoImpl;
import com.paie.mvc.entites.Bulletin;
import com.paie.mvc.services.IBulletinService;

@Transactional
public class BulletinServiceImpl implements IBulletinService {
	
	private IBulletinDao dao ;
	
	public void setDao(IBulletinDao dao) {
		this.dao=dao;
	}

	@Override
	public Bulletin save(Bulletin entity) {
		return dao.save(entity);
	}

	@Override
	public Bulletin update(Bulletin entity) {
		return dao.update(entity);
	}

	@Override
	public List<Bulletin> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Bulletin> selectAll(String sortField, String sort) {
		return dao.selectAll(sortField, sort);
	}

	@Override
	public Bulletin getById(Long id) {
		return dao.getById(id);
	}

	@Override
	public void remove(Long id) {
		dao.remove(id);
	}

	@Override
	public Bulletin findOne(String paramName, Object paramValue) {
		return dao.findOne(paramName, paramValue);
	}

	@Override
	public Bulletin findOne(String[] paramNames, Object[] paramValues) {
		return dao.findOne(paramNames, paramValues);
	}

	@Override
	public int findCountBy(String paramName, String paramValue) {
		return dao.findCountBy(paramName, paramValue);
	}

}
