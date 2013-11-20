package com.gngapps.yours.controller.response;

import java.util.List;

public class SandwichVegetableJson {
	private List<SandwichVegetableIdWithAmountAndPriceId> sandwichVegetables;

	public List<SandwichVegetableIdWithAmountAndPriceId> getSandwichVegetables() {
		return sandwichVegetables;
	}

	public void setSandwichVegetables(List<SandwichVegetableIdWithAmountAndPriceId> sandwichVegetables) {
		this.sandwichVegetables = sandwichVegetables;
	}

	@Override
	public String toString() {
		return "SandwichVegetableIdWithAmountAndPriceIds [sandwichVegetables=" + sandwichVegetables + "]";
	}
	
	
}
