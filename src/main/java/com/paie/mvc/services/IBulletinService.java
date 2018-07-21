package com.paie.mvc.services;

import java.util.List;

import com.paie.mvc.entites.Bulletin;

public interface IBulletinService {
	public Bulletin save(Bulletin entity);
	
	public Bulletin update(Bulletin entity);
	
	public List<Bulletin> selectAll(); 
	
	public List<Bulletin> selectAll(String sortField, String sort);
	
	public Bulletin getById(Long id);
	
	public void remove(Long id);
	
	public Bulletin findOne(String paramName, Object paramValue);
	
	public Bulletin findOne(String[] paramNames, Object[] paramValues);
	
	public int findCountBy(String paramName, String paramValue);
}
