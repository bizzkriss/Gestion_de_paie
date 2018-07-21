package com.paie.mvc.dao.impl;

import java.util.List;

import javax.persistence.Query;

import com.paie.mvc.dao.IPrestationDao;
import com.paie.mvc.entites.Prestation;
import com.paie.mvc.entites.Salaire;


public class PrestationDaoImpl extends GenericDaoImpl<Prestation> implements IPrestationDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<Prestation> getByIdEmploye(Long idEmpl) {
		String queryString = "select lc from " + Prestation.class.getSimpleName() + " lc where lc.employe.idEmpl = :x";
		Query query = em.createQuery(queryString);
		query.setParameter("x", idEmpl);
		return query.getResultList();
	}

}
