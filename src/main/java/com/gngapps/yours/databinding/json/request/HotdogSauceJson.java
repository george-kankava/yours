package com.gngapps.yours.databinding.json.request;

public class HotdogSauceJson {
	private Integer hotdogSauceId;
	private Integer hotdogSauceAmountAndPriceId;
	
	public Integer getHotdogSauceId() {
		return hotdogSauceId;
	}
	public void setHotdogSauceId(Integer hotdogSauceId) {
		this.hotdogSauceId = hotdogSauceId;
	}
	public Integer getHotdogSauceAmountAndPriceId() {
		return hotdogSauceAmountAndPriceId;
	}
	public void setHotdogSauceAmountAndPriceId(Integer hotdogSauceAmountAndPriceId) {
		this.hotdogSauceAmountAndPriceId = hotdogSauceAmountAndPriceId;
	}
	@Override
	public String toString() {
		return "HotdogSauceJson [hotdogSauceId=" + hotdogSauceId + ", hotdogSauceAmountAndPriceId=" + hotdogSauceAmountAndPriceId + "]";
	}
	
}
