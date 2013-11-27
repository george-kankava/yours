package com.gngapps.yours.databinding.json.request;

import java.util.List;

public class SaladIngredientJson {
	
	private List<SaladIngredientIdWithAmountAndPriceId> saladIngredients;

	public List<SaladIngredientIdWithAmountAndPriceId> getSaladIngredients() {
		return saladIngredients;
	}

	public void setSaladIngredients(List<SaladIngredientIdWithAmountAndPriceId> ingredientAndAmountAndPriceIds) {
		this.saladIngredients = ingredientAndAmountAndPriceIds;
	}

	@Override
	public String toString() {
		return "SaladIngredientJson [saladIngredients=" + saladIngredients + "]";
	}
	
}
