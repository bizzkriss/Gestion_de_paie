package com.paie.mvc.services;

import java.io.InputStream;

public interface IFlickerService {
	public String savePhoto(InputStream  strem, String fileName) throws Exception;
}
