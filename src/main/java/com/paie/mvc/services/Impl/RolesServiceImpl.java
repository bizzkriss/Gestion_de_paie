package com.paie.mvc.services.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.paie.mvc.dao.IRolesDao;
import com.paie.mvc.dao.impl.RolesDaoImpl;
import com.paie.mvc.entites.Roles;
import com.paie.mvc.services.IRolesService;

@Transactional
public class RolesServiceImpl implements IRolesService {
	
	private IRolesDao dao ;
	
	public void setDao(IRolesDao dao) {
		this.dao=dao;
	}

	@Override
	public Roles save(Roles entity) {
		return dao.save(entity);
	}

	@Override
	public Roles update(Roles entity) {
		return dao.update(entity);
	}

	@Override
	public List<Roles> selectAll() {
		return dao.selectAll();
	}

	@Override
	public List<Roles> selectAll(String sortField, String sort) {
		return dao.selectAll(sortField, sort);
	}

	@Override
	public Roles getById(Long id) {
		return dao.getById(id);
	}

	@Override
	public void remove(Long id) {
		dao.remove(id);
	}

	@Override
	public Roles findOne(String paramName, Object paramValue) {
		return dao.findOne(paramName, paramValue);
	}

	@Override
	public Roles findOne(String[] paramNames, Object[] paramValues) {
		return dao.findOne(paramNames, paramValues);
	}

	@Override
	public int findCountBy(String paramName, String paramValue) {
		return dao.findCountBy(paramName, paramValue);
	}

}
