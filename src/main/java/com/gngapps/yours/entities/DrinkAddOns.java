package com.gngapps.yours.entities;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DrinkAddOns {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nameGeo;
	private String nameEng;
	private String nameRus;
	private BigDecimal price;
	private String descriptionGeo;
	private String descriptionEng;
	private String descriptionRus;
	
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
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
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
	
	@Override
	public String toString() {
		return "DrinkAddOns [id=" + id + ", nameGeo=" + nameGeo + ", nameEng=" + nameEng + ", nameRus=" + nameRus + ", price=" + price
				+ ", descriptionGeo=" + descriptionGeo + ", descriptionEng=" + descriptionEng + ", descriptionRus=" + descriptionRus + "]";
	}
	
}
