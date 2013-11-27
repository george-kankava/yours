package com.gngapps.yours.databinding.json.request;

public class SandwichSauceIdWithAmountAndPrice {
	private Integer sandwichSauceId;
	private Integer sandwichSauceAmountAndPriceId;
	
	public Integer getSandwichSauceId() {
		return sandwichSauceId;
	}
	public void setSandwichSauceId(Integer sandwichSauceId) {
		this.sandwichSauceId = sandwichSauceId;
	}
	public Integer getSandwichSauceAmountAndPriceId() {
		return sandwichSauceAmountAndPriceId;
	}
	public void setSandwichSauceAmountAndPriceId(
			Integer sandwichSauceAmountAndPriceId) {
		this.sandwichSauceAmountAndPriceId = sandwichSauceAmountAndPriceId;
	}
	
	@Override
	public String toString() {
		return "SandwichSauceIdWithAmountAndPrice [sandwichSauceId=" + sandwichSauceId + ", sandwichSauceAmountAndPriceId="
				+ sandwichSauceAmountAndPriceId + "]";
	}
	
}
