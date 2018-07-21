package com.paie.mvc.entites;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Lieu_affectation implements Serializable{
	@Id
	@GeneratedValue
	private Long idLieu;
	private String codeLieu;
	private String nomLieu;
	private String gestionnaire;
	
	@OneToMany(mappedBy="lieu_afectation")
	private List<Employe> employes;
	
	@OneToMany(mappedBy="lieu_affectation")
	private List<Prestation> prestations;
	

	public Lieu_affectation() {
		super();
	}



	public Long getIdLieu() {
		return idLieu;
	}



	public void setIdLieu(Long idLieu) {
		this.idLieu = idLieu;
	}



	public String getCodeLieu() {
		return codeLieu;
	}



	public void setCodeLieu(String codeLieu) {
		this.codeLieu = codeLieu;
	}



	public String getNomLieu() {
		return nomLieu;
	}



	public void setNomLieu(String nomLieu) {
		this.nomLieu = nomLieu;
	}



	public List<Employe> getEmployes() {
		return employes;
	}



	public void setEmployes(List<Employe> employes) {
		this.employes = employes;
	}



	public List<Prestation> getPrestations() {
		return prestations;
	}



	public void setPrestations(List<Prestation> prestations) {
		this.prestations = prestations;
	}



	public String getGestionnaire() {
		return gestionnaire;
	}



	public void setGestionnaire(String gestionnaire) {
		this.gestionnaire = gestionnaire;
	}





	

	
	
	
	
}
