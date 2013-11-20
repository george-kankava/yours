package com.gngapps.yours.controller.response;

import java.util.List;

public class SandwichSausageJson {
	
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
