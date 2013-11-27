package com.gngapps.yours.databinding.json.request;

import java.util.List;

public class SandwichSpiceJson {
	private List<SandwichSpiceIdWithAmountAndPriceId> sandwichSpices;

	public List<SandwichSpiceIdWithAmountAndPriceId> getSandwichSpices() {
		return sandwichSpices;
	}

	public void setSandwichSpices(List<SandwichSpiceIdWithAmountAndPriceId> sandwichSpices) {
		this.sandwichSpices = sandwichSpices;
	}
	
	@Override
	public String toString() {
		return "SandwichSpiceJson [sandwichSpices=" + sandwichSpices + "]";
	}
}
