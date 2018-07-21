package com.paie.mvc.services;

import java.util.List;

import com.paie.mvc.entites.Bulletin;
import com.paie.mvc.entites.Salaire;

public interface ISalaireService {
	public Salaire save(Salaire entity);
	
	public Salaire update(Salaire entity);
	
	public List<Salaire> selectAll(); 
	
	public List<Salaire> selectAll(String sortField, String sort);
	
	public Salaire getById(Long id);
	
	public void remove(Long id);
	
	public Salaire findOne(String paramName, Object paramValue);
	
	public Salaire findOne(String[] paramNames, Object[] paramValues);
	
	public int findCountBy(String paramName, String paramValue);

	public List<Salaire> getByIdBulletin(Long idBulletin);
}
