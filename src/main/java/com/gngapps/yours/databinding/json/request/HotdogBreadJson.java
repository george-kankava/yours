package com.gngapps.yours.databinding.json.request;

import javax.validation.constraints.NotNull;

public class HotdogBreadJson {
	@NotNull(message = "yours.food.service.hotdog.bread.null.message")
	private Integer hotdogBreadId;
	@NotNull(message = "yours.food.service.hotdog.bread.null.message")
	private Integer hotdogBreadSizeAndPriceId;
	
	public Integer getHotdogBreadId() {
		return hotdogBreadId;
	}
	public void setHotdogBreadId(Integer hotdogBreadId) {
		this.hotdogBreadId = hotdogBreadId;
	}
	public Integer getHotdogBreadSizeAndPriceId() {
		return hotdogBreadSizeAndPriceId;
	}
	public void setHotdogBreadSizeAndPriceId(Integer hotdogBreadSizeAndPriceId) {
		this.hotdogBreadSizeAndPriceId = hotdogBreadSizeAndPriceId;
	}
	@Override
	public String toString() {
		return "HotdogBreadJson [hotdogBreadId=" + hotdogBreadId + ", hotdogBreadSizeAndPriceId=" + hotdogBreadSizeAndPriceId + "]";
	}
}
