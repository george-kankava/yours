package com.gngapps.yours.databinding.json.request;

import javax.validation.constraints.NotNull;

public class HotdogSausageJson {
	@NotNull(message = "yours.food.service.hotdog.sausage.null.message")
	private Integer hotdogSausageId;
	@NotNull(message = "yours.food.service.hotdog.sausage.null.message")
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
