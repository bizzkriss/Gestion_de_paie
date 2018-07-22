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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
@Table(name = "bulletin")
public class Bulletin implements Serializable{
	@Id
	@GeneratedValue
	private Long idBulletin;
	
	private String  codeBulletin;
	
	private String periode;
	
	
	private String nomBul;
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateDeb;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateFin;
	
	@Transient
	private BigDecimal totalBulletin;
	
	
	@OneToMany(mappedBy="bulletin")
	private List<Salaire> salaires;
	
	public Bulletin() {
		
	}


	public void setIdBulletin(Long id) {
		this.idBulletin = id;
	}

	public String getCodeBulletin() {
		return codeBulletin;
	}

	public void setCodeBulletin(String codeBulletin) {
		this.codeBulletin = codeBulletin;
	}
	public String getNomBul() {
		return nomBul;
	}

	public void setNomBul(String nomBul) {
		this.nomBul = nomBul;
	}

	public Date getDateDeb() {
		return dateDeb;
	}

	public void setDateDeb(Date dateDeb) {
		this.dateDeb = dateDeb;
	}

	public Date getDateFin() {
		return dateFin;
	}

	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}

	@JsonIgnore
	public List<Salaire> getSalaires() {
		return salaires;
	}

	public void setSalaires(List<Salaire> salaires) {
		this.salaires = salaires;
	}

	public Long getIdBulletin() {
		return idBulletin;
	}

	public String getPeriode() {
		return periode;
	}

	public void setPeriode(String periode) {
		this.periode = periode;
	}


	public BigDecimal getTotalBulletin() {
		if(!salaires.isEmpty()) {
			BigDecimal totalLigne=BigDecimal.ZERO;
			for(Salaire salaire:salaires) {
				//totalLigne =totalLigne.add(salaire.getTotalSalaire());
				totalLigne=totalLigne.add(BigDecimal.valueOf(salaire.getEmploye().getHeureSuppl(salaire.getPeriode())).multiply(salaire.getEmploye().getContrats().getSalaireBase())).add(salaire.getTotalSalaire().add(salaire.getTotalAvantage())).subtract(salaire.getTotalSoncial().add(salaire.getAutres()));
			}
			totalBulletin=totalLigne;
		}
		return totalBulletin;
	}
	
	
	
	
}
