package com.paie.mvc.services;

import java.util.List;

import com.paie.mvc.entites.Departement;

public interface IDepartementService {
	public Departement save(Departement entity);
	
	public Departement update(Departement entity);
	
	public List<Departement> selectAll(); 
	
	public List<Departement> selectAll(String sortField, String sort);
	
	public Departement getById(Long id);
	
	public void remove(Long id);
	
	public Departement findOne(String paramName, Object paramValue);
	
	public Departement findOne(String[] paramNames, Object[] paramValues);
	
	public int findCountBy(String paramName, String paramValue);
}
