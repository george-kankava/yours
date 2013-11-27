package com.gngapps.yours.databinding.json.request;

import java.util.List;

public class DrinkJson {
	private List<DrinkIdWithDrinkSizeAndPriceId> drinks;

	public List<DrinkIdWithDrinkSizeAndPriceId> getDrinks() {
		return drinks;
	}

	public void setDrinks(List<DrinkIdWithDrinkSizeAndPriceId> drinks) {
		this.drinks = drinks;
	}

	@Override
	public String toString() {
		return "DrinkJson [drinks=" + drinks + "]";
	}

}
