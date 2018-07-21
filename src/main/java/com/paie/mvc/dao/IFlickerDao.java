package com.paie.mvc.dao;

import java.io.InputStream;

public interface IFlickerDao {
	public String savePhoto(InputStream  strem, String fileName) throws Exception;
}
