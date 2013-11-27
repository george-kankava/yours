package com.gngapps.yours.databinding.json.request;

import java.util.List;

public class SandwichSauceJson {
	private List<SandwichSauceIdWithAmountAndPrice> sandwichSauces;

	public List<SandwichSauceIdWithAmountAndPrice> getSandwichSauces() {
		return sandwichSauces;
	}

	public void setSandwichSauces(List<SandwichSauceIdWithAmountAndPrice> sandwichSauces) {
		this.sandwichSauces = sandwichSauces;
	}

	@Override
	public String toString() {
		return "SandwichSauceJson [sandwichSauces=" + sandwichSauces + "]";
	}
	
}
