package com.paie.mvc.dao;

import java.util.List;

import com.paie.mvc.entites.Salaire;

public interface ISalaireDao extends IGenericDao<Salaire> {
	public List<Salaire> getByIdBulletin(Long idBulletin);

}
