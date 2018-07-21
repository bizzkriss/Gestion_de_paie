package com.paie.mvc.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.paie.mvc.entites.Employe;
import com.paie.mvc.entites.Lieu_affectation;
import com.paie.mvc.entites.Prestation;
import com.paie.mvc.entites.Salaire;
import com.paie.mvc.entites.Departement;
import com.paie.mvc.entites.Bulletin;
import com.paie.mvc.entites.Contrat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.paie.mvc.services.IContratService;
import com.paie.mvc.services.IDepartementService;
import com.paie.mvc.services.IEmployeService;
import com.paie.mvc.services.IFlickerService;
import com.paie.mvc.services.ILieu_affectationService;
import com.paie.mvc.services.IPrestationService;

@Controller
@RequestMapping(value="/employer")
public class EmployeController {
	
	@Autowired
	private IEmployeService employeService;
	
	@Autowired
	private IDepartementService departementService;
	
	@Autowired
	private IContratService contratService;
	
	@Autowired
	private IFlickerService flickerService;
	
	@Autowired
	private ILieu_affectationService lieu_affectationService;
	
	@Autowired
	private IPrestationService prestationService;

	@RequestMapping(value="/")
	public String Employe(Model model) {
		List<Employe> employes= employeService.selectAll();
		if(employes==null) {
			employes=new ArrayList<Employe>();
		}
		model.addAttribute("employes", employes);
		return "employe/employe";
	}
	@RequestMapping(value="/nouveau", method=RequestMethod.GET)
	public String ajouterEmploye(Model model) {
		Employe emp=new Employe();
		List<Departement> departements=departementService.selectAll();
		if(departements == null) {
			departements=new ArrayList<Departement>();
		}
		
		model.addAttribute("employe", emp);
		model.addAttribute("departements", departements);
		return "employe/ajouterEmploye";
	}
	@RequestMapping(value="/enregistrer", method=RequestMethod.POST)
	public String enregistrerEmploye(Model model, Employe employe, MultipartFile file) throws Exception {
		String photoUrl=null;
		
		if(employe != null) {
			if(file != null) {
				if(! file.isEmpty()) {
					InputStream stream=file.getInputStream();
					photoUrl=flickerService.savePhoto(stream, employe.getNomEmpl());
				}
			}
			employe.setPhoto(photoUrl);
			if(employe.getIdEmpl() != null) {
				employeService.update(employe);
			}else {
				employeService.save(employe);
			}
			
		}
		return "redirect:/employer/";
	}
	
	@RequestMapping(value="/modifier/{idEmpl}", method=RequestMethod.GET)
	public String modifierEmploye(Model model, @PathVariable Long idEmpl) {
		List<Departement> departements=departementService.selectAll();
		if(departements == null) {
			departements=new ArrayList<Departement>();
		}
		model.addAttribute("departements", departements);
		if(idEmpl != null) {
			Employe empl=employeService.getById(idEmpl);
			if(empl != null) {
				model.addAttribute("employe", empl);
			}
		}
		
		
		return "employe/ajouterEmploye";
	}
	
	@RequestMapping(value="/supprimer/{idEmpl}", method=RequestMethod.GET)
	public String supprimerEmploye(Model model, @PathVariable Long idEmpl) {
		if(idEmpl != null) {
			Employe dep=employeService.getById(idEmpl);
			if(dep != null) {
				employeService.remove(idEmpl);
			}
		}
		
		
		return "redirect:/employer/";
	}
	
	@RequestMapping(value="/departement")
	public String Departement(Model model) {
		List<Departement> departements= departementService.selectAll();
		if(departements==null) {
			departements=new ArrayList<Departement>();
		}
		model.addAttribute("departements", departements);
		return "departement/departement";
	}
	
	@RequestMapping(value="/departement/nouveau", method=RequestMethod.GET)
	public String ajouterDepartement(Model model) {
		Departement dep=new Departement();
		model.addAttribute("departement", dep);
		return "departement/ajouterDepartement";
	}
	
	@RequestMapping(value="/departement/enregistrer", method=RequestMethod.POST)
	public String enregistrerDepartement(Model model, Departement departement) {
		if(departement != null) {
			if(departement.getIdDep() != null) {
				departementService.update(departement);
			}else {
				departementService.save(departement);
			}
			
		}
		return "redirect:/employer/departement";
	}
	
	
	
	@RequestMapping(value="/departement/modifier/{idDep}", method=RequestMethod.GET)
	public String modifierDepartement(Model model, @PathVariable Long idDep) {
		if(idDep != null) {
			Departement dep=departementService.getById(idDep);
			if(dep != null) {
				model.addAttribute("departement", dep);
			}
		}
		
		
		return "departement/ajouterDepartement";
	}
	
	@RequestMapping(value="/departement/supprimer/{idDep}", method=RequestMethod.GET)
	public String supprimerDepartement(Model model, @PathVariable Long idDep) {
		if(idDep != null) {
			Departement dep=departementService.getById(idDep);
			if(dep != null) {
				departementService.remove(idDep);
			}
		}
		
		
		return "redirect:/employer/departement";
	}
	
	@RequestMapping(value="/contrat")
	public String ContratAffiche(Model model) {
		List<Contrat> contrats= contratService.selectAll();
		if(contrats==null) {
			contrats=new ArrayList<Contrat>();
		}
		model.addAttribute("contrats", contrats);
		return "contrat/contrat";
	}
	
	@RequestMapping(value="/contrat/nouveau", method=RequestMethod.GET)
	public String ajouterContrat(Model model) {
		Contrat cont=new Contrat();
		List<Employe> employes=employeService.selectAll();
		if(employes == null) {
			employes=new ArrayList<Employe>();
		}
		
		model.addAttribute("contrat", cont);
		model.addAttribute("employes", employes);
		return "contrat/ajouterContrat";
	}
	
	@RequestMapping(value="/contrat/enregistrer", method=RequestMethod.POST)
	public String enregistrerContrat(Model model, Contrat contrat) {
		if(contrat != null) {
			if(contrat.getIdContrat() != null) {
				contratService.update(contrat);
			}else {
				contratService.save(contrat);
			}
			
		}
		return "redirect:/employer/contrat";
	}
	
	
	
	@RequestMapping(value="/contrat/modifier/{idContrat}", method=RequestMethod.GET)
	public String modifierContrat(Model model, @PathVariable Long idContrat) {
		List<Employe> employes=employeService.selectAll();
		if(employes== null) {
			employes=new ArrayList<Employe>();
		}
		model.addAttribute("employes", employes);
		if(idContrat != null) {
			Contrat contr=contratService.getById(idContrat);
			if(contr != null) {
				model.addAttribute("contrat", contr);
			}
		}
		
		
		return "contrat/ajouterContrat";
	}
	
	@RequestMapping(value="/contrat/supprimer/{idContrat}", method=RequestMethod.GET)
	public String supprimerContrat(Model model, @PathVariable Long idContrat) {
		if(idContrat != null) {
			Contrat contr=contratService.getById(idContrat);
			if(contr != null) {
				contratService.remove(idContrat);
			}
		}
		
		
		return "redirect:/employer/contrat";
	}
	
	@RequestMapping(value="/affectation")
	public String affectationAffiche(Model model) {
		List<Lieu_affectation> affectations= lieu_affectationService.selectAll();
		if(affectations==null) {
			affectations=new ArrayList<Lieu_affectation>();
		}
		model.addAttribute("affectations", affectations);
		return "affectation/affectation";
	}
	
	@RequestMapping(value="/affectation/nouveau", method=RequestMethod.GET)
	public String ajouterAffectation(Model model) {
		Lieu_affectation affect=new Lieu_affectation();
		List<Employe> employes=employeService.selectAll();
		if(employes == null) {
			employes=new ArrayList<Employe>();
		}
		
		model.addAttribute("affectation", affect);
		model.addAttribute("employes", employes);
		return "affectation/ajouterAffectation";
	}
	
	@RequestMapping(value="/affectation/enregistrer", method=RequestMethod.POST)
	public String enregistrerAffectation(Model model, Lieu_affectation affectation) {
		if(affectation != null) {
			if(affectation.getIdLieu() != null) {
				lieu_affectationService.update(affectation);
			}else {
				lieu_affectationService.save(affectation);
			}
			
		}
		return "redirect:/employer/affectation";
	}
	
	
	
	@RequestMapping(value="/affectation/modifier/{idLieu}", method=RequestMethod.GET)
	public String modifierAffectation(Model model, @PathVariable Long idLieu) {
		List<Employe> employes=employeService.selectAll();
		if(employes== null) {
			employes=new ArrayList<Employe>();
		}
		model.addAttribute("employes", employes);
		if(idLieu != null) {
			Lieu_affectation affect=lieu_affectationService.getById(idLieu);
			if(affect != null) {
				model.addAttribute("affectation", affect);
			}
		}
		
		
		return "affectation/ajouterAffectation";
	}
	
	@RequestMapping(value="/affectation/supprimer/{idLieu}", method=RequestMethod.GET)
	public String supprimerAffectation(Model model, @PathVariable Long idLieu) {
		if(idLieu != null) {
			Lieu_affectation affect=lieu_affectationService.getById(idLieu);
			if(affect != null) {
				lieu_affectationService.remove(idLieu);
			}
		}
		
		
		return "redirect:/employer/affectation";
	}
	
	@RequestMapping(value="/prestation")
	public String prestationAffiche(Model model) {
		List<Prestation> prestations= prestationService.selectAll();
		if(prestations==null) {
			prestations=new ArrayList<Prestation>();
		}
		model.addAttribute("prestations", prestations);
		return "prestation/prestation";
	}
	
	@RequestMapping(value="/prestation/nouveau", method=RequestMethod.GET)
	public String ajouterPrestation(Model model) {
		Prestation prest=new Prestation();
		List<Lieu_affectation > affectations=lieu_affectationService.selectAll();
		List<Employe> employes=employeService.selectAll();
		if(employes == null) {
			employes=new ArrayList<Employe>();
		}
		if(affectations == null) {
			affectations=new ArrayList<Lieu_affectation>();
		}
		model.addAttribute("prestation", prest);
		model.addAttribute("affectations", affectations);
		model.addAttribute("employes", employes);
		return "prestation/ajouterPrestation";
	}
	
	@RequestMapping(value="/prestation/enregistrer", method=RequestMethod.POST)
	public String enregistrerPrestation(Model model, Prestation prestation) {
		if(prestation != null) {
			if(prestation.getIdPrest() != null) {
				prestationService.update(prestation);
			}else {
				prestationService.save(prestation);
			}
			
		}
		return "redirect:/employer/prestation";
	}
	
	
	
	@RequestMapping(value="/prestation/modifier/{idPrest}", method=RequestMethod.GET)
	public String modifierPrestation(Model model, @PathVariable Long idPrest) {
		List<Lieu_affectation > affectations=lieu_affectationService.selectAll();
		List<Employe> employes=employeService.selectAll();
		if(employes == null) {
			employes=new ArrayList<Employe>();
		}
		if(affectations == null) {
			affectations=new ArrayList<Lieu_affectation>();
		}
		model.addAttribute("affectations", affectations);
		model.addAttribute("employes", employes);
		if(idPrest != null) {
			Prestation prest=prestationService.getById(idPrest);
			if(prest != null) {
				model.addAttribute("prestation", prest);
			}
		}
		
		
		return "prestation/ajouterPrestation";
	}
	
	@RequestMapping(value="/prestation/supprimer/{idPrest}", method=RequestMethod.GET)
	public String supprimerPrestation(Model model, @PathVariable Long idPrest) {
		if(idPrest != null) {
			Prestation prest=prestationService.getById(idPrest);
			if(prest != null) {
				prestationService.remove(idPrest);
			}
		}
		
		
		return "redirect:/employer/prestation";
	}
	
}
