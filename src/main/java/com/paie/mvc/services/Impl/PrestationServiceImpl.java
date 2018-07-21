package com.paie.mvc.services.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.paie.mvc.dao.IPrestationDao;
import com.paie.mvc.dao.impl.PrestationDaoImpl;
import com.paie.mvc.entites.Prestation;
import com.paie.mvc.services.IPrestationService;

@Transactional
public class PrestationServiceImpl implements IPrestationService {
	
	private IPrestationDao dao ;
	
	public void setDao(IPrestationDao dao) {
		this.dao=dao;
	}

	@Override
	public Prestation save(Prestation entity) {
		return dao.save(entity);
	}

	@Override
	public Prestation update(Prestation entity) {
		return dao.update(entity);
	}

	@Override
	public List<Prestation> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Prestation> selectAll(String sortField, String sort) {
		return dao.selectAll(sortField, sort);
	}

	@Override
	public Prestation getById(Long id) {
		return dao.getById(id);
	}

	@Override
	public void remove(Long id) {
		dao.remove(id);
	}

	@Override
	public Prestation findOne(String paramName, Object paramValue) {
		return dao.findOne(paramName, paramValue);
	}

	@Override
	public Prestation findOne(String[] paramNames, Object[] paramValues) {
		return dao.findOne(paramNames, paramValues);
	}

	@Override
	public int findCountBy(String paramName, String paramValue) {
		return dao.findCountBy(paramName, paramValue);
	}

	@Override
	public List<Prestation> getByIdEmploye(Long idEmpl) {
		return dao.getByIdEmploye(idEmpl);
	}

}
