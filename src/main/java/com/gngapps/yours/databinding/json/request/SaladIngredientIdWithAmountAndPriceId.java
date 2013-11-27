package com.gngapps.yours.databinding.json.request;

public class SaladIngredientIdWithAmountAndPriceId {
	
	private Integer saladIngredientId;
	private Integer saladIngredientAmountAndPriceId;
	
	public Integer getSaladIngredientId() {
		return saladIngredientId;
	}
	public void setSaladIngredientId(Integer saladIngredientId) {
		this.saladIngredientId = saladIngredientId;
	}
	public Integer getSaladIngredientAmountAndPriceId() {
		return saladIngredientAmountAndPriceId;
	}
	public void setSaladIngredientAmountAndPriceId(
			Integer saladIngredientAmountAndPriceId) {
		this.saladIngredientAmountAndPriceId = saladIngredientAmountAndPriceId;
	}
	
	@Override
	public String toString() {
		return "SaladIngredientIdWithAmountAndPriceId [saladIngredientId=" + saladIngredientId + ", saladIngredientAmountAndPriceId=" + saladIngredientAmountAndPriceId + "]";
	}
	
}
