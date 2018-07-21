package com.paie.mvc.entites;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name = "employe")
public class Employe implements Serializable{
	@Id
	@GeneratedValue
	private Long idEmpl;
	
	private String nomEmpl;
	
	@ManyToOne
	@JoinColumn(name ="idDep")
	private Departement departement;
	
	@ManyToOne
	@JoinColumn(name ="idLieu")
	private Lieu_affectation lieu_afectation;
	
	@OneToOne(mappedBy="employe")
	private Contrat contrats;
	
	@OneToMany(mappedBy="employe")
	private List<Prestation> prestations;
	
	@OneToMany(mappedBy="employe")
	private List<Salaire> salaires;
	
	
	private String adress;
	
	@Transient
	private Long totalHeures;
	
	@Transient
	private Long totalHeuresSup;
	
	private String photo;
	private String mail;
	
	private Long enfant;
	
	public Employe() {
		super();
	}
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public Long getIdEmpl() {
		return idEmpl;
	}

	public String getNomEmpl() {
		return nomEmpl;
	}

	public void setNomEmpl(String nomEmpl) {
		this.nomEmpl = nomEmpl;
	}

	
	

	public Contrat getContrats() {
		return contrats;
	}

	public void setContrats(Contrat contrats) {
		this.contrats = contrats;
	}

	public Long getTotalHeures() {
		return totalHeures;
	}

	public void setTotalHeures(Long totalHeures) {
		this.totalHeures = totalHeures;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	
	

	public Departement getDepartement() {
		return departement;
	}

	public void setDepartement(Departement departement) {
		this.departement = departement;
	}

	public void setIdEmpl(Long id) {
		this.idEmpl = id;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}


	public Lieu_affectation getLieu_afectation() {
		return lieu_afectation;
	}

	public void setLieu_afectation(Lieu_affectation lieu_afectation) {
		this.lieu_afectation = lieu_afectation;
	}

	
	public List<Prestation> getPrestations() {
		return prestations;
	}

	public void setPrestations(List<Prestation> prestations) {
		this.prestations = prestations;
	}

	public List<Salaire> getSalaires() {
		return salaires;
	}

	public void setSalaires(List<Salaire> salaires) {
		this.salaires = salaires;
	}

	
	public Long getEnfant() {
		return enfant;
	}

	public void setEnfant(Long enfant) {
		this.enfant = enfant;
	}

	public Long getHeurePreste(String periode) {
		if(!prestations.isEmpty()) {
			int totalLigne=0;
			for(Prestation prestation:prestations) {
				if(periode.equals(prestation.getPeriode())) {
					totalLigne +=prestation.getHeurePrest();
				}
				
			}
			totalHeures=Long.valueOf(totalLigne);
		}
		return totalHeures;
	}
	
	public Long getHeureSuppl(String periode) {
		if(!prestations.isEmpty()) {
			int totalLigne=0;
			for(Prestation prestation:prestations) {
				if(periode.equals(prestation.getPeriode())) {
					totalLigne +=prestation.getHeurePrest()-8;
				}
				
			}
			totalHeuresSup=Long.valueOf(totalLigne);
		}
		return totalHeuresSup;
	}
	
	
	
}
