package com.paie.mvc.services.Impl;

import java.io.InputStream;

import com.paie.mvc.dao.IFlickerDao;
import com.paie.mvc.services.IFlickerService;

public class FlickerServiceImpl implements IFlickerService{
	private IFlickerDao dao ;
	
	public void setDao(IFlickerDao dao) {
		this.dao=dao;
	}
	@Override
	public String savePhoto(InputStream strem, String fileName) throws Exception {
		return dao.savePhoto(strem, fileName);
	}

}
