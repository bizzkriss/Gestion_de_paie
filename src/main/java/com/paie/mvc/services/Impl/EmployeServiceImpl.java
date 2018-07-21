package com.paie.mvc.services.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.paie.mvc.dao.IEmployeDao;
import com.paie.mvc.entites.Employe;
import com.paie.mvc.services.IEmployeService;


@Transactional
public class EmployeServiceImpl implements IEmployeService {
	
	private IEmployeDao dao ;
	
	public void setDao(IEmployeDao dao) {
		this.dao=dao;
	}

	@Override
	public Employe save(Employe entity) {
		return dao.save(entity);
	}

	@Override
	public Employe update(Employe entity) {
		return dao.update(entity);
	}

	@Override
	public List<Employe> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Employe> selectAll(String sortField, String sort) {
		return dao.selectAll(sortField, sort);
	}

	@Override
	public Employe getById(Long id) {
		return dao.getById(id);
	}

	@Override
	public void remove(Long id) {
		dao.remove(id);
	}

	@Override
	public Employe findOne(String paramName, Object paramValue) {
		return dao.findOne(paramName, paramValue);
	}

	@Override
	public Employe findOne(String[] paramNames, Object[] paramValues) {
		return dao.findOne(paramNames, paramValues);
	}

	@Override
	public int findCountBy(String paramName, String paramValue) {
		return dao.findCountBy(paramName, paramValue);
	}

	
}
