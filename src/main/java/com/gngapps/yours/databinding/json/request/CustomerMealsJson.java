package com.gngapps.yours.databinding.json.request;

import java.util.List;

public class CustomerMealsJson {
	List<Integer> sandwichIds;
	List<Integer> saladIds;
	List<Integer> drinkIds;
	List<Integer> hotdogIds;
	
	public List<Integer> getSandwichIds() {
		return sandwichIds;
	}
	public void setSandwichIds(List<Integer> sandwichIds) {
		this.sandwichIds = sandwichIds;
	}
	public List<Integer> getSaladIds() {
		return saladIds;
	}
	public void setSaladIds(List<Integer> saladIds) {
		this.saladIds = saladIds;
	}
	public List<Integer> getDrinkIds() {
		return drinkIds;
	}
	public void setDrinkIds(List<Integer> drinkIds) {
		this.drinkIds = drinkIds;
	}
	public List<Integer> getHotdogIds() {
		return hotdogIds;
	}
	public void setHotdogIds(List<Integer> hotdogIds) {
		this.hotdogIds = hotdogIds;
	}
	@Override
	public String toString() {
		return "CustomerMealsJson [sandwichIds=" + sandwichIds + ", saladIds=" + saladIds + ", drinkIds=" + drinkIds + ", hotdogIds=" + hotdogIds + "]";
	}
	
	
}
