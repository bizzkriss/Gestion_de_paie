package com.paie.mvc.controllers;




import com.paie.mvc.entites.Bulletin;
import com.paie.mvc.entites.Employe;
import com.paie.mvc.entites.Prestation;
import com.paie.mvc.entites.Salaire;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paie.mvc.services.IBulletinService;
import com.paie.mvc.services.IEmployeService;
import com.paie.mvc.services.IPrestationService;
import com.paie.mvc.services.ISalaireService;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;


@Controller
@RequestMapping(value="/paie")
public class PaieController {
	
	@Autowired
	private IBulletinService bulletinService;
	
	@Autowired
	private ISalaireService salaireService;
	
	@Autowired
	private IEmployeService employeService;
	
	@Autowired
	private IPrestationService prestationService;
	
	

	@RequestMapping(value="/bulletin")
	public String bulletinAfficher(Model model) {
		List<Bulletin> bulletins= bulletinService.selectAll();
		if(bulletins==null) {
			bulletins=new ArrayList<Bulletin>();
		}else {
			for(Bulletin bulletin:bulletins) {
				List<Salaire> ligneCdeClt=salaireService.getByIdBulletin(bulletin.getIdBulletin());
				bulletin.setSalaires(ligneCdeClt);
				for(Salaire sal:ligneCdeClt) {
					Employe empl=employeService.getById(sal.getEmploye().getIdEmpl());
					sal.setEmploye(empl);
					List<Prestation> lesPrest=prestationService.getByIdEmploye(empl.getIdEmpl());
					empl.setPrestations(lesPrest); 
				}
			}
		}
			
		
		model.addAttribute("bulletins", bulletins);
		return "bulletin/bulletin";
	}
	
	@RequestMapping(value="/bulletin/nouveau", method=RequestMethod.GET)
	public String ajouterBulletin(Model model) {
		Bulletin bull=new Bulletin();
		bull.setCodeBulletin(UUID.randomUUID().toString());
		bull.setDateDeb(new Date());
		model.addAttribute("bulletin", bull);
		
		return "bulletin/ajouterBulletin";
	}
	@RequestMapping(value="/bulletin/enregistrer", method=RequestMethod.POST)
	public String enregistrerBulletin(Model model, Bulletin bulletin) throws Exception {
		if(bulletin != null) {
			if(bulletin.getIdBulletin() != null) {
				bulletinService.update(bulletin);
			}else {
				bulletinService.save(bulletin);
				return "redirect:/paie/paiement/nouveau";
			}
			
		}
		return "redirect:/paie/bulletin";
	}
	
	@RequestMapping(value="/bulletin/modifier/{idBulletin}", method=RequestMethod.GET)
	public String modifierBulletin(Model model, @PathVariable Long idBulletin) {
		
		if(idBulletin != null) {
			Bulletin bull=bulletinService.getById(idBulletin);
			if(bull != null) {
				model.addAttribute("bulletin", bull);
			}
		}
		
		
		return "bulletin/ajouterBulletin";
	}
	
	@RequestMapping(value="/bulletin/supprimer/{idBulletin}", method=RequestMethod.GET)
	public String supprimerBulletin(Model model, @PathVariable Long idBulletin) {
		if(idBulletin != null) {
			Bulletin bull=bulletinService.getById(idBulletin);
			if(bull != null) {
				bulletinService.remove(idBulletin);
			}
		}
		
		
		return "redirect:/paie/bulletin";
	}
	
	@RequestMapping(value="/bulletin/report/{idBulletin}", method=RequestMethod.GET)
	public @ResponseBody void imprimer(HttpServletResponse response, @PathVariable Long idBulletin) {
				Bulletin bulletin=bulletinService.getById(idBulletin);
				List<Salaire> ligneCdeClt=salaireService.getByIdBulletin(idBulletin);
				bulletin.setSalaires(ligneCdeClt);
				for(Salaire sal:ligneCdeClt) {
					Employe empl=employeService.getById(sal.getEmploye().getIdEmpl());
					sal.setEmploye(empl);
					List<Prestation> lesPrest=prestationService.getByIdEmploye(empl.getIdEmpl());
					empl.setPrestations(lesPrest); 
				}
			try {
				InputStream jasperStream=this.getClass().getResourceAsStream("report/bulletinReport.jrxml");
				JasperDesign design=JRXmlLoader.load(jasperStream);
				JasperReport report= JasperCompileManager.compileReport(design);
				
				Map<String, Object> parameterMap=new HashMap();
				
				JRDataSource jRDataSource=new JRBeanCollectionDataSource(ligneCdeClt);
				
				parameterMap.put("datasource", jRDataSource);
				JasperPrint jasperPrint=JasperFillManager.fillReport(report, parameterMap, jRDataSource);
				response.setHeader("Content-Disposition", "inline; filename=bulletin_de_paie.pdf");
				
				final OutputStream outputstream = response.getOutputStream();
				JasperExportManager.exportReportToPdfStream(jasperPrint, outputstream );
				
			}catch(JRException ex) {
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	@RequestMapping(value="/paiement")
	public String paiement(Model model) {
		List<Salaire> salaires= salaireService.selectAll();
		if(salaires==null ) {
			salaires=new ArrayList<Salaire>();
		}else {
			for(Salaire sal:salaires) {
				Employe empl=employeService.getById(sal.getEmploye().getIdEmpl());
				sal.setEmploye(empl);
				List<Prestation> lesPrest=prestationService.getByIdEmploye(empl.getIdEmpl());
				empl.setPrestations(lesPrest); 
			}
		}
		model.addAttribute("salaires", salaires);
		return "paiement/paiement";
	}
	
	@RequestMapping(value="/paiement/nouveau", method=RequestMethod.GET)
	public String ajouterPaiement(Model model) {
		List<Bulletin> bulletins= bulletinService.selectAll();
		if(bulletins==null) {
			bulletins=new ArrayList<Bulletin>();
		}
		model.addAttribute("bulletins", bulletins);
		List<Employe> employes= employeService.selectAll();
		if(employes==null) {
			employes=new ArrayList<Employe>();
		}
		model.addAttribute("employes", employes);
		Salaire sal=new Salaire();
		sal.setCodeSalaire(UUID.randomUUID().toString());
		model.addAttribute("paiement", sal);
		return "paiement/ajouterPaiement";
	}
	
	@RequestMapping(value="/paiement/enregistrer", method=RequestMethod.POST)
	public String enregistrerPaiement(Model model, Salaire salaire) {
		if(salaire != null) {
			if(salaire.getIdSalaire() != null) {
				salaireService.update(salaire);
			}else {
				salaireService.save(salaire);
			}
			
		}
		return "redirect:/paie/paiement";
	}
	
	
	
	@RequestMapping(value="/paiement/modifier/{idSalaire}", method=RequestMethod.GET)
	public String modifierDepartement(Model model, @PathVariable Long idSalaire) {
		List<Bulletin> bulletins= bulletinService.selectAll();
		if(bulletins==null) {
			bulletins=new ArrayList<Bulletin>();
		}
		model.addAttribute("bulletins", bulletins);
		List<Employe> employes= employeService.selectAll();
		if(employes==null) {
			employes=new ArrayList<Employe>();
		}
		model.addAttribute("employes", employes);
		if(idSalaire != null) {
			Salaire sal=salaireService.getById(idSalaire);
			if(sal != null) {
				model.addAttribute("paiement", sal);
			}
		}
		
		
		return "paiement/ajouterPaiement";
	}
	
	@RequestMapping(value="/paiement/supprimer/{idSalaire}", method=RequestMethod.GET)
	public String supprimerDepartement(Model model, @PathVariable Long idSalaire) {
		if(idSalaire != null) {
			Salaire sal=salaireService.getById(idSalaire);
			if(sal != null) {
				salaireService.remove(idSalaire);
			}
		}
		
		
		return "redirect:/paie/paiement";
	}
	
	
	
}
