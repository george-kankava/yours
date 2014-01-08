package com.gngapps.yours.databinding.json.request;

import java.util.List;

import javax.validation.constraints.Size;

public class SaladIngredientJson {
	
	@Size(min = 2, message = "yours.food.service.salad.min.ingredients.amount.message")
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
