package com.gngapps.yours.controller.json.request;

public class HotdogSausageJson {
	private Integer hotdogSausageId;
	private Integer hotdogSausageAmountAndPriceId;
	
	public Integer getHotdogSausageId() {
		return hotdogSausageId;
	}
	public void setHotdogSausageId(Integer hotdogSausageId) {
		this.hotdogSausageId = hotdogSausageId;
	}
	public Integer getHotdogSausageAmountAndPriceId() {
		return hotdogSausageAmountAndPriceId;
	}
	public void setHotdogSausageAmountAndPriceId(
			Integer hotdogSausageAmountAndPriceId) {
		this.hotdogSausageAmountAndPriceId = hotdogSausageAmountAndPriceId;
	}
	
	@Override
	public String toString() {
		return "HotdogSausageJson [hotdogSausageId=" + hotdogSausageId + ", hotdogSausageAmountAndPriceId=" + hotdogSausageAmountAndPriceId + "]";
	}

}
