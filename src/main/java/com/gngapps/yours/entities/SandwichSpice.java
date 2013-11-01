package com.gngapps.yours.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class SandwichSpice {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nameGeo;
	private String nameEng;
	private String nameRus;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "spice_id")
	private List<SandwichSpiceAmountAndPrice> spiceAmountAndPrice;
	
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
	public List<SandwichSpiceAmountAndPrice> getSpiceAmountAndPrice() {
		return spiceAmountAndPrice;
	}
	public void setSpiceAmountAndPrice(List<SandwichSpiceAmountAndPrice> spiceAmountAndPrice) {
		this.spiceAmountAndPrice = spiceAmountAndPrice;
	}
	
	@Override
	public String toString() {
		return "Spice [id=" + id + ", nameGeo=" + nameGeo + ", nameEng=" + nameEng + ", nameRus=" + nameRus + ", spiceAmountAndPrice=" + spiceAmountAndPrice + "]";
	}
	
}
