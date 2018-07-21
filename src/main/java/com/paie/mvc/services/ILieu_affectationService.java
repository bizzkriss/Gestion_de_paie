package com.paie.mvc.services;

import java.util.List;

import com.paie.mvc.entites.Lieu_affectation;

public interface ILieu_affectationService {
	public Lieu_affectation save(Lieu_affectation entity);
	
	public Lieu_affectation update(Lieu_affectation entity);
	
	public List<Lieu_affectation> selectAll(); 
	
	public List<Lieu_affectation> selectAll(String sortField, String sort);
	
	public Lieu_affectation getById(Long id);
	
	public void remove(Long id);
	
	public Lieu_affectation findOne(String paramName, Object paramValue);
	
	public Lieu_affectation findOne(String[] paramNames, Object[] paramValues);
	
	public int findCountBy(String paramName, String paramValue);
}
