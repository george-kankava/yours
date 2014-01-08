package com.gngapps.yours.databinding.json.request;

import javax.validation.constraints.NotNull;

public class SandwichBreadJson {
	@NotNull(message = "yours.food.service.sandwich.bread.null.message")
	private Integer sandwichBreadId;
	@NotNull(message = "yours.food.service.sandwich.bread.null.message")
	private Integer sandwichBreadSizeAndPriceId;
	
	public Integer getSandwichBreadId() {
		return sandwichBreadId;
	}
	public void setSandwichBreadId(Integer sandwichBreadId) {
		this.sandwichBreadId = sandwichBreadId;
	}
	public Integer getSandwichBreadSizeAndPriceId() {
		return sandwichBreadSizeAndPriceId;
	}
	public void setSandwichBreadSizeAndPriceId(Integer sandwichBreadSizeAndPriceId) {
		this.sandwichBreadSizeAndPriceId = sandwichBreadSizeAndPriceId;
	}
	
	@Override
	public String toString() {
		return "SandwichBreadJson [sandwichBreadId=" + sandwichBreadId + ", sandwichBreadSizeAndPriceId=" + sandwichBreadSizeAndPriceId + "]";
	}
	
}
