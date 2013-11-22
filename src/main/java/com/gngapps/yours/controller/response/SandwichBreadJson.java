package com.gngapps.yours.controller.response;

public class SandwichBreadJson {
	private Integer sandwichBreadId;
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
