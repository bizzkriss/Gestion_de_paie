package com.paie.mvc.entites;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Contrat implements Serializable{
	@Id
	@GeneratedValue
	private Long idContrat;
	
	private String ref;
	
	private String typeContrat;
	private String titrePoste;
	private BigDecimal salaireBase;
	
	@OneToOne
	@JoinColumn(name ="idEmpl")
	private Employe employe;
	

	public Contrat() {
		super();
	}

	public Long getIdContrat() {
		return idContrat;
	}

	public void setIdContrat(Long id) {
		this.idContrat = id;
	}

	public String getRef() {
		return ref;
	}

	public void setRef(String ref) {
		this.ref = ref;
	}
	public Employe getEmploye() {
		return employe;
	}

	public void setEmploye(Employe employe) {
		this.employe = employe;
	}

	public String getTypeContrat() {
		return typeContrat;
	}

	public void setTypeContrat(String typeContrat) {
		this.typeContrat = typeContrat;
	}

	public String getTitrePoste() {
		return titrePoste;
	}

	public void setTitrePoste(String titrePoste) {
		this.titrePoste = titrePoste;
	}

	public BigDecimal getSalaireBase() {
		return salaireBase;
	}

	public void setSalaireBase(BigDecimal salaireBase) {
		this.salaireBase = salaireBase;
	}

	
	

	
}
