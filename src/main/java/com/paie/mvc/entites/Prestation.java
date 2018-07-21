package com.paie.mvc.entites;

import java.io.Serializable;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Prestation implements Serializable{
	@Id
	@GeneratedValue
	private Long idPrest;
	
	@ManyToOne
	@JoinColumn(name ="idEmpl")
	private Employe employe;
	
	@ManyToOne
	@JoinColumn(name ="idLieu")
	private Lieu_affectation lieu_affectation;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date datePrestation;
	
	
	private String heureDebut;
	
	
	private String heureFin;
	
	private Long heurePrest;
	
	private String periode;

	public Prestation() {
		super();
	}



	public Long getIdPrest() {
		return idPrest;
	}



	public void setIdPrest(Long idPrest) {
		this.idPrest = idPrest;
	}



	public Employe getEmploye() {
		return employe;
	}



	public void setEmploye(Employe employe) {
		this.employe = employe;
	}



	public Lieu_affectation getLieu_affectation() {
		return lieu_affectation;
	}
	public void setLieu_affectation(Lieu_affectation lieu_affectation) {
		this.lieu_affectation = lieu_affectation;
	}



	public Date getDatePrestation() {
		
			return datePrestation;
	}
	public void setDatePrestation(Date datePrestation) {
		this.datePrestation = datePrestation;
	}
	
	public Long getHeurePrest() {
		return heurePrest;
	}



	public void setHeurePrest(Long heurePrest) {
		this.heurePrest = heurePrest;
	}



	public String getHeureDebut() {
		return heureDebut;
	}



	public void setHeureDebut(String heureDebut) {
		this.heureDebut = heureDebut;
	}



	public String getHeureFin() {
		return heureFin;
	}



	public void setHeureFin(String heureFin) {
		this.heureFin = heureFin;
	}



	public String getPeriode() {
		return periode;
	}



	public void setPeriode(String periode) {
		this.periode = periode;
	}

	
	
}
