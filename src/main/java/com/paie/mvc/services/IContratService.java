package com.paie.mvc.services;

import java.util.List;

import com.paie.mvc.entites.Bulletin;
import com.paie.mvc.entites.Contrat;

public interface IContratService {
	public Contrat save(Contrat entity);
	
	public Contrat update(Contrat entity);
	
	public List<Contrat> selectAll(); 
	
	public List<Contrat> selectAll(String sortField, String sort);
	
	public Contrat getById(Long id);
	
	public void remove(Long id);
	
	public Contrat findOne(String paramName, Object paramValue);
	
	public Contrat findOne(String[] paramNames, Object[] paramValues);
	
	public int findCountBy(String paramName, String paramValue);
}
