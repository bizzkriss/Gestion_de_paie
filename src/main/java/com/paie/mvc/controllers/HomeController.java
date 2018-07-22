package com.paie.mvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paie.mvc.entites.Employe;
import com.paie.mvc.entites.Prestation;
import com.paie.mvc.entites.Salaire;
import com.paie.mvc.services.IEmployeService;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	
	@Autowired
	private IEmployeService employeService;
	
	@RequestMapping(value="/")
	public String Home(Model model) {
		
		return "home/home";
	}
	
	@RequestMapping(value="/blank")
	public String blankHome() {
		return "blank/blank";
	}

}
