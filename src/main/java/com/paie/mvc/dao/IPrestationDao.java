package com.paie.mvc.dao;

import java.util.List;

import com.paie.mvc.entites.Prestation;

public interface IPrestationDao  extends IGenericDao<Prestation>{
	public List<Prestation> getByIdEmploye(Long idEmpl);

}
