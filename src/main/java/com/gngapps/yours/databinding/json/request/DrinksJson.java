package com.gngapps.yours.databinding.json.request;


public class DrinksJson {
	private DrinkIdWithDrinkSizeAndPriceId drink;
	private DrinkAddonJson drinkAddons;
	
	public DrinkIdWithDrinkSizeAndPriceId getDrink() {
		return drink;
	}
	public void setDrink(DrinkIdWithDrinkSizeAndPriceId drink) {
		this.drink = drink;
	}
	public DrinkAddonJson getDrinkAddons() {
		return drinkAddons;
	}
	public void setDrinkAddons(DrinkAddonJson drinkAddons) {
		this.drinkAddons = drinkAddons;
	}
	
	@Override
	public String toString() {
		return "DrinksJson [drink=" + drink + ", drinkAddons=" + drinkAddons + "]";
	}
	
}
