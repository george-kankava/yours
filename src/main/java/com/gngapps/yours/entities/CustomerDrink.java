package com.gngapps.yours.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class CustomerDrink {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "drink_with_size_and_price_id")
	private DrinkWithSizeAndPrice drinkWithSizeAndPrice;
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_drink_id")
	private List<DrinkAddonWithAmountAndPrice> addonWithAmountAndPrices;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public DrinkWithSizeAndPrice getDrinkWithSizeAndPrice() {
		return drinkWithSizeAndPrice;
	}

	public void setDrinkWithSizeAndPrice(DrinkWithSizeAndPrice drinkWithSizeAndPrice) {
		this.drinkWithSizeAndPrice = drinkWithSizeAndPrice;
	}

	public List<DrinkAddonWithAmountAndPrice> getAddonWithAmountAndPrices() {
		return addonWithAmountAndPrices;
	}

	public void setAddonWithAmountAndPrices(
			List<DrinkAddonWithAmountAndPrice> addonWithAmountAndPrices) {
		this.addonWithAmountAndPrices = addonWithAmountAndPrices;
	}

	@Override
	public String toString() {
		return "CustomerDrink [id=" + id + ", drinkWithSizeAndPrice=" + drinkWithSizeAndPrice + ", addonWithAmountAndPrices=" + addonWithAmountAndPrices + "]";
	}
	
}
