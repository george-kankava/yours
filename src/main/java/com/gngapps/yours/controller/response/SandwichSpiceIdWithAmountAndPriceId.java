package com.gngapps.yours.controller.response;

public class SandwichSpiceIdWithAmountAndPriceId {
	private Integer sandwichSpiceId;
	private Integer sandwichSpiceAmountAndPriceId;
	
	public Integer getSandwichSpiceId() {
		return sandwichSpiceId;
	}
	public void setSandwichSpiceId(Integer sandwichSpiceId) {
		this.sandwichSpiceId = sandwichSpiceId;
	}
	public Integer getSandwichSpiceAmountAndPriceId() {
		return sandwichSpiceAmountAndPriceId;
	}
	public void setSandwichSpiceAmountAndPriceId(
			Integer sandwichSpiceAmountAndPriceId) {
		this.sandwichSpiceAmountAndPriceId = sandwichSpiceAmountAndPriceId;
	}
	
	@Override
	public String toString() {
		return "SandwichSpiceIdWithAmountAndPriceId [sandwichSpiceId=" + sandwichSpiceId + ", sandwichSpiceAmountAndPriceId="
				+ sandwichSpiceAmountAndPriceId + "]";
	}
	
	
}
