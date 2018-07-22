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
import javax.persistence.Transient;

@Entity
public class Salaire implements Serializable{
	@Id
	@GeneratedValue
	private Long idSalaire;

	@ManyToOne
	@JoinColumn(name ="idEmpl")
	private Employe employe;
	
	
	@ManyToOne
	@JoinColumn(name ="idBulletin")
	private Bulletin bulletin;

	
	private String codeSalaire;
	private BigDecimal primeFonction;
	private BigDecimal primeDipmlome;
	private BigDecimal annuites;
	private BigDecimal regularisation;
	private int heureSup;
	private String periode;
	
	private BigDecimal logement;
	private BigDecimal transport;
	private BigDecimal familliale;
	
	private BigDecimal inss;
	private BigDecimal retenu;
	
	private BigDecimal avance;
	private BigDecimal acompte;
	private BigDecimal pretEchus;
	private BigDecimal epargne;
	private BigDecimal contribution;
	private BigDecimal suspendu;
	private BigDecimal muso;
	private BigDecimal ferme;
	
	public Salaire() {
		super();
	}
	public Long getIdSalaire() {
		return idSalaire;
	}
	public void setIdSalaire(Long idSalaire) {
		this.idSalaire = idSalaire;
	}
	public Employe getEmploye() {
		return employe;
	}
	public void setEmploye(Employe employe) {
		this.employe = employe;
	}
	
	public String getCodeSalaire() {
		return codeSalaire;
	}
	public void setCodeSalaire(String codeSalaire) {
		this.codeSalaire = codeSalaire;
	}
	public BigDecimal getPrimeFonction() {
		return primeFonction;
	}
	public void setPrimeFonction(BigDecimal primeFonction) {
		this.primeFonction = primeFonction;
	}
	public BigDecimal getPrimeDipmlome() {
		return primeDipmlome;
	}
	public void setPrimeDipmlome(BigDecimal primeDipmlome) {
		this.primeDipmlome = primeDipmlome;
	}
	public BigDecimal getAnnuites() {
		return annuites;
	}
	public void setAnnuites(BigDecimal annuites) {
		this.annuites = annuites;
	}
	public BigDecimal getRegularisation() {
		return regularisation;
	}
	public void setRegularisation(BigDecimal regularisation) {
		this.regularisation = regularisation;
	}
	public int getHeureSup() {
		return heureSup-8;
	}
	public void setHeureSup(int heureSup) {
		this.heureSup = heureSup;
	}
	public Bulletin getBulletin() {
		return bulletin;
	}
	public void setBulletin(Bulletin bulletin) {
		this.bulletin = bulletin;
	}
	
	public String getPeriode() {
		return periode;
	}
	public void setPeriode(String periode) {
		
		this.periode = periode;
	}
	
	
	
	public BigDecimal getLogement() {
		return logement;
	}
	public void setLogement(BigDecimal logement) {
		this.logement = logement;
	}
	public BigDecimal getTransport() {
		return transport;
	}
	public void setTransport(BigDecimal transport) {
		this.transport = transport;
	}
	public BigDecimal getFamilliale() {
		return familliale;
	}
	public void setFamilliale(BigDecimal familliale) {
		this.familliale = familliale;
	}
	public BigDecimal getInss() {
		return inss;
	}
	public void setInss(BigDecimal inss) {
		this.inss = inss;
	}
	public BigDecimal getRetenu() {
		return retenu;
	}
	public void setRetenu(BigDecimal retenu) {
		this.retenu = retenu;
	}
	public BigDecimal getAvance() {
		return avance;
	}
	public void setAvance(BigDecimal avance) {
		this.avance = avance;
	}
	
	public BigDecimal getAcompte() {
		return acompte;
	}
	public void setAcompte(BigDecimal acompte) {
		this.acompte = acompte;
	}
	public BigDecimal getPretEchus() {
		return pretEchus;
	}
	public void setPretEchus(BigDecimal pretEchus) {
		this.pretEchus = pretEchus;
	}
	public BigDecimal getEpargne() {
		return epargne;
	}
	public void setEpargne(BigDecimal epargne) {
		this.epargne = epargne;
	}
	public BigDecimal getContribution() {
		return contribution;
	}
	public void setContribution(BigDecimal contribution) {
		this.contribution = contribution;
	}
	public BigDecimal getSuspendu() {
		return suspendu;
	}
	public void setSuspendu(BigDecimal suspendu) {
		this.suspendu = suspendu;
	}
	public BigDecimal getMuso() {
		return muso;
	}
	public void setMuso(BigDecimal muso) {
		this.muso = muso;
	}
	public BigDecimal getFerme() {
		return ferme;
	}
	public void setFerme(BigDecimal ferme) {
		this.ferme = ferme;
	}
	
	@Transient
	public BigDecimal getTotalSalaire() {
		 
		//return salaireBase.multiply(BigDecimal.valueOf(employe.getHeurePreste())).add(primeFonction).add(primeDipmlome).add(annuites).add(regularisation).add(salaireBase.multiply(BigDecimal.valueOf(employe.getHeureSuppl())));
		return employe.getContrats().getSalaireBase().multiply(BigDecimal.valueOf(employe.getHeurePreste(periode))).add(primeFonction).add(primeDipmlome).add(annuites).add(regularisation).add(employe.getContrats().getSalaireBase().multiply(BigDecimal.valueOf(employe.getHeureSuppl(periode))));
	}
	
	public BigDecimal getTotalAvantage() {
		return familliale.multiply(BigDecimal.valueOf(employe.getEnfant())).add(logement).add(transport);
	}
	
	public BigDecimal getTotalSoncial() {
		return inss.add(retenu);
	}
	
	public BigDecimal getAutres() {
		return avance.add(acompte).add(pretEchus).add(epargne).add(contribution).add(suspendu).add(muso).add(ferme);
	}
	
	
}
