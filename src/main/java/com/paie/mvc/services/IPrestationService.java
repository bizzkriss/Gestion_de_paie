package com.paie.mvc.services;

import java.util.List;

import com.paie.mvc.entites.Prestation;

public interface IPrestationService {
	public Prestation save(Prestation entity);
	
	public Prestation update(Prestation entity);
	
	public List<Prestation> selectAll(); 
	
	public List<Prestation> selectAll(String sortField, String sort);
	
	public Prestation getById(Long id);
	
	public void remove(Long id);
	
	public Prestation findOne(String paramName, Object paramValue);
	
	public Prestation findOne(String[] paramNames, Object[] paramValues);
	
	public int findCountBy(String paramName, String paramValue);

	public List<Prestation> getByIdEmploye(Long idEmpl);
}
