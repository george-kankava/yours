package com.gngapps.yours.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class DrinkAddonWithAmountAndPrice {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "drink_addon_id")
	private DrinkAddOn drinkAddOn;
	
	@ManyToOne
	@JoinColumn(name = "addon_amount_and_price_id")
	private DrinkAddOnAmountAndPrice addOnAmountAndPrice;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public DrinkAddOn getDrinkAddOn() {
		return drinkAddOn;
	}

	public void setDrinkAddOn(DrinkAddOn drinkAddOn) {
		this.drinkAddOn = drinkAddOn;
	}

	public DrinkAddOnAmountAndPrice getAddOnAmountAndPrice() {
		return addOnAmountAndPrice;
	}

	public void setAddOnAmountAndPrice(DrinkAddOnAmountAndPrice addOnAmountAndPrice) {
		this.addOnAmountAndPrice = addOnAmountAndPrice;
	}

	@Override
	public String toString() {
		return "DrinkAddonWithAmountAndPrice [id=" + id + ", drinkAddOn=" + drinkAddOn + ", addOnAmountAndPrice=" + addOnAmountAndPrice + "]";
	}
	
}
