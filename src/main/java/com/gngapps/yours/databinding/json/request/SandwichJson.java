package com.gngapps.yours.databinding.json.request;

import javax.validation.Valid;


public class SandwichJson {
	@Valid
	private SandwichBreadJson sandwichBread;
	@Valid
	private SandwichSausageJson sandwichSausages;
	private SandwichVegetableJson sandwichVegetables;
	private SandwichSauceJson sandwichSauces;
	private SandwichSpiceJson sandwichSpices;
	
	
	public SandwichBreadJson getSandwichBread() {
		return sandwichBread;
	}
	public void setSandwichBread(SandwichBreadJson sandwichBread) {
		this.sandwichBread = sandwichBread;
	}
	public SandwichSausageJson getSandwichSausages() {
		return sandwichSausages;
	}
	public void setSandwichSausages(SandwichSausageJson sandwichSausages) {
		this.sandwichSausages = sandwichSausages;
	}
	public SandwichVegetableJson getSandwichVegetables() {
		return sandwichVegetables;
	}
	public void setSandwichVegetables(SandwichVegetableJson sandwichVegetables) {
		this.sandwichVegetables = sandwichVegetables;
	}
	public SandwichSauceJson getSandwichSauces() {
		return sandwichSauces;
	}
	public void setSandwichSauces(SandwichSauceJson sandwichSauces) {
		this.sandwichSauces = sandwichSauces;
	}
	public SandwichSpiceJson getSandwichSpices() {
		return sandwichSpices;
	}
	public void setSandwichSpices(SandwichSpiceJson sandwichSpices) {
		this.sandwichSpices = sandwichSpices;
	}
	@Override
	public String toString() {
		return "Sandwich [sandwichBread=" + sandwichBread + ", sandwichSausages=" + sandwichSausages + ", sandwichVegetables=" + sandwichVegetables
				+ ", sandwichSauces=" + sandwichSauces + ", sandwichSpices=" + sandwichSpices + "]";
	}

}
