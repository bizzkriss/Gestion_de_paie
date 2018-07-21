package com.paie.mvc.entites;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name = "departement")
public class Departement implements Serializable{
	

	@Id
	@GeneratedValue
	private Long idDep;
	
	private String nomDep;
	private String depParent;
	private String gestionnaire;
	
	@OneToMany(mappedBy="departement")
	private List<Employe> employes;
	
	

	public Departement() {
		super();
	}

	public Long getIdDep() {
		return idDep;
	}

	public void setIdDep(Long idDep) {
		this.idDep = idDep;
	}

	public String getNomDep() {
		return nomDep;
	}

	public void setNomDep(String nomDep) {
		this.nomDep = nomDep;
	}

	public String getDepParent() {
		return depParent;
	}

	public void setDepParent(String depParent) {
		this.depParent = depParent;
	}

	public String getGestionnaire() {
		return gestionnaire;
	}

	public void setGestionnaire(String gestionnaire) {
		this.gestionnaire = gestionnaire;
	}
	
	@JsonIgnore
	public List<Employe> getEmployes() {
		return employes;
	}

	public void setEmployes(List<Employe> employes) {
		this.employes = employes;
	}
	
}
