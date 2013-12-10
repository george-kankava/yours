package com.gngapps.yours.databinding.json.request;

import java.util.List;

public class CustoemrOrderJson {
	private List<Integer> sandwichIds;
	private List<Integer> saladIds;
	private List<Integer> drinkIds;
	private List<Integer> hotdogIds;
	private String customerPhoneNumber;
	private String customerShipmentAddress;
	
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
	public String getCustomerPhoneNumber() {
		return customerPhoneNumber;
	}
	public void setCustomerPhoneNumber(String customerPhoneNumber) {
		this.customerPhoneNumber = customerPhoneNumber;
	}
	public String getCustomerShipmentAddress() {
		return customerShipmentAddress;
	}
	public void setCustomerShipmentAddress(String customerShipmentAddress) {
		this.customerShipmentAddress = customerShipmentAddress;
	}
	@Override
	public String toString() {
		return "CustoemrOrderJson [sandwichIds=" + sandwichIds + ", saladIds="
				+ saladIds + ", drinkIds=" + drinkIds + ", hotdogIds="
				+ hotdogIds + ", customerPhoneNumber=" + customerPhoneNumber
				+ ", customerShipmentAddress=" + customerShipmentAddress + "]";
	}
	
}
