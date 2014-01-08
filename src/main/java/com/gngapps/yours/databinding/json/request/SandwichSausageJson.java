package com.gngapps.yours.databinding.json.request;

import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

public class SandwichSausageJson {
	
	@NotEmpty(message = "yours.food.service.sandwich.sausage.empty.message")
	private List<SandwichSausageIdWithAmountAndPriceId> sandwichSausages;

	public List<SandwichSausageIdWithAmountAndPriceId> getSandwichSausages() {
		return sandwichSausages;
	}

	public void setSandwichSausages(List<SandwichSausageIdWithAmountAndPriceId> sandwichSausages) {
		this.sandwichSausages = sandwichSausages;
	}

	@Override
	public String toString() {
		return "SandwichSausageIdWithAmountAndPriceIds [sandwichSausages=" + sandwichSausages + "]";
	}
	
	
}
