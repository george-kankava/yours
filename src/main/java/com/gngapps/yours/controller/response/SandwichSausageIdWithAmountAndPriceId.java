package com.gngapps.yours.controller.response;

public class SandwichSausageIdWithAmountAndPriceId {
	private Integer sandwichSausageId;
	private Integer sandwichSausageAmountAndPriceId;
	
	public Integer getSandwichSausageId() {
		return sandwichSausageId;
	}
	public void setSandwichSausageId(Integer sandwichSausageId) {
		this.sandwichSausageId = sandwichSausageId;
	}
	public Integer getSandwichSausageAmountAndPriceId() {
		return sandwichSausageAmountAndPriceId;
	}
	public void setSandwichSausageAmountAndPriceId(
			Integer sandwichSausageAmountAndPriceId) {
		this.sandwichSausageAmountAndPriceId = sandwichSausageAmountAndPriceId;
	}
	
	@Override
	public String toString() {
		return "SandwichSausageIdWithAmountAndPriceId [sandwichSausageId=" + sandwichSausageId + ", sandwichSausageAmountAndPriceId="
				+ sandwichSausageAmountAndPriceId + "]";
	}
	
	
}
