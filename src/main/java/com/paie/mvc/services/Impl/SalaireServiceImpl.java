package com.paie.mvc.services.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.paie.mvc.dao.ISalaireDao;
import com.paie.mvc.entites.Salaire;
import com.paie.mvc.services.ISalaireService;

@Transactional
public class SalaireServiceImpl implements ISalaireService {
	
	private ISalaireDao dao ;
	
	public void setDao(ISalaireDao dao) {
		this.dao=dao;
	}

	@Override
	public Salaire save(Salaire entity) {
		return dao.save(entity);
	}

	@Override
	public Salaire update(Salaire entity) {
		return dao.update(entity);
	}

	@Override
	public List<Salaire> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Salaire> selectAll(String sortField, String sort) {
		return dao.selectAll(sortField, sort);
	}

	@Override
	public Salaire getById(Long id) {
		return dao.getById(id);
	}

	@Override
	public void remove(Long id) {
		dao.remove(id);
	}

	@Override
	public Salaire findOne(String paramName, Object paramValue) {
		return dao.findOne(paramName, paramValue);
	}

	@Override
	public Salaire findOne(String[] paramNames, Object[] paramValues) {
		return dao.findOne(paramNames, paramValues);
	}

	@Override
	public int findCountBy(String paramName, String paramValue) {
		return dao.findCountBy(paramName, paramValue);
	}

	@Override
	public List<Salaire> getByIdBulletin(Long idBulletin) {
		return dao.getByIdBulletin(idBulletin);
	}

	

}
