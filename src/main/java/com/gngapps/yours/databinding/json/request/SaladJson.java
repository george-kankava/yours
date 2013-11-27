package com.gngapps.yours.databinding.json.request;

public class SaladJson {
	
	private SaladIngredientJson saladIngredients;

	public SaladIngredientJson getSaladIngredients() {
		return saladIngredients;
	}

	public void setSaladIngredients(SaladIngredientJson saladIngredients) {
		this.saladIngredients = saladIngredients;
	}

	@Override
	public String toString() {
		return "SaladJson [saladIngredients=" + saladIngredients + "]";
	}
	
}
