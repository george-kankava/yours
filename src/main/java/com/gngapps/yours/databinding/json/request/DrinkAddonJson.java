package com.gngapps.yours.databinding.json.request;

import java.util.List;

public class DrinkAddonJson {
	private List<DrinkAddonIdWithAmountAndSizeId> drinkAddons;

	public List<DrinkAddonIdWithAmountAndSizeId> getDrinkAddons() {
		return drinkAddons;
	}

	public void setDrinkAddons(List<DrinkAddonIdWithAmountAndSizeId> drinkAddons) {
		this.drinkAddons = drinkAddons;
	}

	@Override
	public String toString() {
		return "DrinkAddonJson [drinkAddons=" + drinkAddons + "]";
	}
	
}
