package com.paie.mvc.services;

import java.util.List;

import com.paie.mvc.entites.Employe;

public interface IEmployeService {
	public Employe save(Employe entity);
	
	public Employe update(Employe entity);
	
	public List<Employe> selectAll(); 
	
	public List<Employe> selectAll(String sortField, String sort);
	
	public Employe getById(Long id);
	
	public void remove(Long id);
	
	public Employe findOne(String paramName, Object paramValue);
	
	public Employe findOne(String[] paramNames, Object[] paramValues);
	
	public int findCountBy(String paramName, String paramValue);

	
}
