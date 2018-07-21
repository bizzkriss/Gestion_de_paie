package com.paie.mvc;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import com.paie.mvc.dao.impl.FlickerDaoImpl;

public class Test {

	public static void main(String[] args) {
		FlickerDaoImpl flickr = new FlickerDaoImpl();
		//flickr.auth();
		
		try {
			InputStream stream =new FileInputStream(new File("E:\\img\\logo2.png"));
			String url= flickr.savePhoto(stream, "My Logo");
			System.out.println(url);
		}catch(Exception ex) {
			ex.printStackTrace();
		}

	}

}
