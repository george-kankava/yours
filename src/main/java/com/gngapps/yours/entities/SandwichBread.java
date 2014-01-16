package com.gngapps.yours.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

@Entity
public class SandwichBread {
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nameGeo;
	private String nameEng;
	private String nameRus;
	private String descriptionGeo;
	private String descriptionEng;
	private String descriptionRus;
	
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name = "bread_id")
	private List<SandwichBreadSizeAndPrice> sandwichBreadSizeAndPrices;       

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNameGeo() {
		return nameGeo;
	}

	public void setNameGeo(String nameGeo) {
		this.nameGeo = nameGeo;
	}

	public String getNameEng() {
		return nameEng;
	}

	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}

	public String getNameRus() {
		return nameRus;
	}

	public void setNameRus(String nameRus) {
		this.nameRus = nameRus;
	}

	public String getDescriptionGeo() {
		return descriptionGeo;
	}

	public void setDescriptionGeo(String descriptionGeo) {
		this.descriptionGeo = descriptionGeo;
	}

	public String getDescriptionEng() {
		return descriptionEng;
	}

	public void setDescriptionEng(String descriptionEng) {
		this.descriptionEng = descriptionEng;
	}

	public String getDescriptionRus() {
		return descriptionRus;
	}

	public void setDescriptionRus(String descriptionRus) {
		this.descriptionRus = descriptionRus;
	}

	public List<SandwichBreadSizeAndPrice> getSandwichBreadSizeAndPrices() {
		return sandwichBreadSizeAndPrices;
	}

	public void setSandwichBreadSizeAndPrices(
			List<SandwichBreadSizeAndPrice> sandwichBreadSizeAndPrices) {
		this.sandwichBreadSizeAndPrices = sandwichBreadSizeAndPrices;
	}

	@Override
	public String toString() {
		return "Bread [id=" + id + ", nameGeo=" + nameGeo + ", nameEng=" + nameEng + ", nameRus=" + nameRus + ", descriptionGeo=" 
				+ descriptionGeo + ", descriptionEng=" + descriptionEng + ", descriptionRus=" + descriptionRus + ", breadSizes=" + sandwichBreadSizeAndPrices + "]";
	}
}
