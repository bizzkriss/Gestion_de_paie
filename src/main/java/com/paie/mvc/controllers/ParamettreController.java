package com.paie.mvc.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.paie.mvc.entites.Utilisateur;
import com.paie.mvc.services.IFlickerService;
import com.paie.mvc.services.IUtilisateurService;

@Controller
@RequestMapping(value="/paramettre")
public class ParamettreController {
	
	@Autowired
	private IUtilisateurService utilisateurService;
	
	@Autowired
	private IFlickerService flickerService;
	

	@RequestMapping(value="/utilisateur")
	public String Utilisateur(Model model) {
		List<Utilisateur> utilisateurs= utilisateurService.selectAll();
		if(utilisateurs==null) {
			utilisateurs=new ArrayList<Utilisateur>();
		}
		model.addAttribute("utilisateurs", utilisateurs);
		return "utilisateur/utilisateur";
	}
	@RequestMapping(value="/utilisateur/nouveau", method=RequestMethod.GET)
	public String ajouterUtilisateur(Model model) {
		Utilisateur uti=new Utilisateur();
		
		model.addAttribute("utilisateur", uti);
		return "utilisateur/ajouterUtilisateur";
	}
	@RequestMapping(value="/utilisateur/enregistrer", method=RequestMethod.POST)
	public String enregistrerEmploye(Model model, Utilisateur utilisateur, MultipartFile file) throws Exception {
		String photoUrl=null;
		
		if(utilisateur != null) {
			if(file != null) {
				if(! file.isEmpty()) {
					InputStream stream=file.getInputStream();
					photoUrl=flickerService.savePhoto(stream, utilisateur.getNom());
				}
			}
			if(utilisateur.getIdUtilisateur() != null) {
				utilisateurService.update(utilisateur);
			}else {
				utilisateurService.save(utilisateur);
			}
			
		}
		return "redirect:/paramettre/utilisateur";
	}
	
	@RequestMapping(value="/utilisateur/modifier/{idUti}", method=RequestMethod.GET)
	public String modifierEmploye(Model model, @PathVariable Long idUti) {
		
		if(idUti != null) {
			Utilisateur util=utilisateurService.getById(idUti);
			if(util != null) {
				model.addAttribute("utilisateur", util);
			}
		}
		
		
		return "utilisateur/ajouterUtilisateur";
	}
	
	@RequestMapping(value="/utilisateur/supprimer/{idUti}", method=RequestMethod.GET)
	public String supprimerEmploye(Model model, @PathVariable Long idUti) {
		if(idUti != null) {
			Utilisateur uti=utilisateurService.getById(idUti);
			if(uti != null) {
				utilisateurService.remove(idUti);
			}
		}
		
		
		return "redirect:/utilisateur";
	}
	
	
}
