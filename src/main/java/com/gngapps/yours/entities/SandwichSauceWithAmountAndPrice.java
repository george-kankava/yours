package com.gngapps.yours.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class SandwichSauceWithAmountAndPrice {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	private SandwichSauce sandwichSauce;
	@ManyToOne
	private SandwichSauceAmountAndPrice sandwichSauceAmountAndPrice;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public SandwichSauce getSandwichSauce() {
		return sandwichSauce;
	}
	public void setSandwichSauce(SandwichSauce sandwichSauce) {
		this.sandwichSauce = sandwichSauce;
	}
	public SandwichSauceAmountAndPrice getSandwichSauceAmountAndPrice() {
		return sandwichSauceAmountAndPrice;
	}
	public void setSandwichSauceAmountAndPrice(SandwichSauceAmountAndPrice sandwichSauceAmountAndPrice) {
		this.sandwichSauceAmountAndPrice = sandwichSauceAmountAndPrice;
	}
	
	@Override
	public String toString() {
		return "SandwichSauceWithAmountAndPrice [id=" + id + ", sandwichSauce=" + sandwichSauce + ", sandwichSauceAmountAndPrice="
				+ sandwichSauceAmountAndPrice + "]";
	}
	
	
}
