package com.paie.mvc.services.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.paie.mvc.dao.ILieu_affectationDao;
import com.paie.mvc.dao.impl.Lieu_affectationDaoImpl;
import com.paie.mvc.entites.Lieu_affectation;
import com.paie.mvc.services.ILieu_affectationService;

@Transactional
public class Lieu_affectationServiceImpl implements ILieu_affectationService {
	
	private ILieu_affectationDao dao ;
	
	public void setDao(ILieu_affectationDao dao) {
		this.dao=dao;
	}

	@Override
	public Lieu_affectation save(Lieu_affectation entity) {
		return dao.save(entity);
	}

	@Override
	public Lieu_affectation update(Lieu_affectation entity) {
		return dao.update(entity);
	}

	@Override
	public List<Lieu_affectation> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Lieu_affectation> selectAll(String sortField, String sort) {
		return dao.selectAll(sortField, sort);
	}

	@Override
	public Lieu_affectation getById(Long id) {
		return dao.getById(id);
	}

	@Override
	public void remove(Long id) {
		dao.remove(id);
	}

	@Override
	public Lieu_affectation findOne(String paramName, Object paramValue) {
		return dao.findOne(paramName, paramValue);
	}

	@Override
	public Lieu_affectation findOne(String[] paramNames, Object[] paramValues) {
		return dao.findOne(paramNames, paramValues);
	}

	@Override
	public int findCountBy(String paramName, String paramValue) {
		return dao.findCountBy(paramName, paramValue);
	}

}
