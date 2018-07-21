package com.paie.mvc.services.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.paie.mvc.dao.IContratDao;
import com.paie.mvc.entites.Contrat;
import com.paie.mvc.services.IContratService;

@Transactional
public class ContratServiceImpl implements IContratService {
	
	private IContratDao dao ;
	
	public void setDao(IContratDao dao) {
		this.dao=dao;
	}

	@Override
	public Contrat save(Contrat entity) {
		return dao.save(entity);
	}

	@Override
	public Contrat update(Contrat entity) {
		return dao.update(entity);
	}

	@Override
	public List<Contrat> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Contrat> selectAll(String sortField, String sort) {
		return dao.selectAll(sortField, sort);
	}

	@Override
	public Contrat getById(Long id) {
		return dao.getById(id);
	}

	@Override
	public void remove(Long id) {
		dao.remove(id);
	}

	@Override
	public Contrat findOne(String paramName, Object paramValue) {
		return dao.findOne(paramName, paramValue);
	}

	@Override
	public Contrat findOne(String[] paramNames, Object[] paramValues) {
		return dao.findOne(paramNames, paramValues);
	}

	@Override
	public int findCountBy(String paramName, String paramValue) {
		return dao.findCountBy(paramName, paramValue);
	}

}
