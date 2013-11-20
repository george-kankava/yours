package com.gngapps.yours.entities;

public class SandwichSausageWithAmountAndPrice {
	private SandwichSausage sandwichSausage;
	private SandwichSausageAmountAndPrice amountAndPrice;
	public SandwichSausage getSandwichSausage() {
		return sandwichSausage;
	}
	public void setSandwichSausage(SandwichSausage sandwichSausage) {
		this.sandwichSausage = sandwichSausage;
	}
	public SandwichSausageAmountAndPrice getAmountAndPrice() {
		return amountAndPrice;
	}
	public void setAmountAndPrice(SandwichSausageAmountAndPrice amountAndPrice) {
		this.amountAndPrice = amountAndPrice;
	}
	
	@Override
	public String toString() {
		return "SandwichSausageWithAmountAndPrice [sandwichSausage=" + sandwichSausage + ", amountAndPrice=" + amountAndPrice + "]";
	}
}
