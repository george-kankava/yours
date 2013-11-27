package com.gngapps.yours.databinding.json.request;

public class DrinkIdWithDrinkSizeAndPriceId {
	private Integer drinkId;
	private Integer drinkSizeAndPriceId;
	
	public Integer getDrinkId() {
		return drinkId;
	}
	public void setDrinkId(Integer drinkId) {
		this.drinkId = drinkId;
	}
	public Integer getDrinkSizeAndPriceId() {
		return drinkSizeAndPriceId;
	}
	public void setDrinkSizeAndPriceId(Integer drinkSizeAndPriceId) {
		this.drinkSizeAndPriceId = drinkSizeAndPriceId;
	}
	
	@Override
	public String toString() {
		return "DrinkIdWithDrinkSizeAndPriceId [drinkId=" + drinkId + ", drinkSizeAndPriceId=" + drinkSizeAndPriceId + "]";
	}
	
}
