package com.paie.mvc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import com.paie.mvc.dao.ISalaireDao;
import com.paie.mvc.entites.Salaire;

public class SalaireDaoImpl extends GenericDaoImpl<Salaire> implements ISalaireDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Salaire> getByIdBulletin(Long idBulletin) {
		String queryString = "select lc from " + Salaire.class.getSimpleName() + " lc where lc.bulletin.idBulletin = :x";
		Query query = em.createQuery(queryString);
		query.setParameter("x", idBulletin);
		return query.getResultList();
	}

}
