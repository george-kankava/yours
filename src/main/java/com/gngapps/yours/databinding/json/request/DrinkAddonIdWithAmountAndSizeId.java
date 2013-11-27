package com.gngapps.yours.databinding.json.request;

public class DrinkAddonIdWithAmountAndSizeId {
	private Integer drinkAddonId;
	private Integer drinkAddonAmountAndPriceId;
	
	public Integer getDrinkAddonId() {
		return drinkAddonId;
	}
	public void setDrinkAddonId(Integer drinkAddonId) {
		this.drinkAddonId = drinkAddonId;
	}
	public Integer getDrinkAddonAmountAndPriceId() {
		return drinkAddonAmountAndPriceId;
	}
	public void setDrinkAddonAmountAndPriceId(Integer drinkAddonAmountAndPriceId) {
		this.drinkAddonAmountAndPriceId = drinkAddonAmountAndPriceId;
	}
	
	@Override
	public String toString() {
		return "DrinkAddonIdWithAmountAndSizeId [drinkAddonId=" + drinkAddonId + ", drinkAddonAmountAndPriceId=" + drinkAddonAmountAndPriceId + "]";
	}
	
}
