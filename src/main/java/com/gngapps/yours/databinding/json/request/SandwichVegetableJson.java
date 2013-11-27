package com.gngapps.yours.databinding.json.request;

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
