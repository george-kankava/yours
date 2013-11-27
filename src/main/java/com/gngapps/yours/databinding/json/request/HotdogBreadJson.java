package com.gngapps.yours.databinding.json.request;

public class HotdogBreadJson {
	private Integer hotdogBreadId;
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
