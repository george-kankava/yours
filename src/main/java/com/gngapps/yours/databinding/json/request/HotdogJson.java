package com.gngapps.yours.databinding.json.request;

import java.util.List;

public class HotdogJson {
	private HotdogBreadJson hotdogBread;
	private HotdogSausageJson hotdogSausage;
	private List<HotdogSauceJson> hotdogSauces;
	
	public HotdogBreadJson getHotdogBread() {
		return hotdogBread;
	}
	public void setHotdogBread(HotdogBreadJson hotdogBread) {
		this.hotdogBread = hotdogBread;
	}
	public HotdogSausageJson getHotdogSausage() {
		return hotdogSausage;
	}
	public void setHotdogSausage(HotdogSausageJson hotdogSausage) {
		this.hotdogSausage = hotdogSausage;
	}
	public List<HotdogSauceJson> getHotdogSauces() {
		return hotdogSauces;
	}
	public void setHotdogSauces(List<HotdogSauceJson> hotdogSauces) {
		this.hotdogSauces = hotdogSauces;
	}
	@Override
	public String toString() {
		return "HotdogJson [hotdogBread=" + hotdogBread + ", hotdogSausage=" + hotdogSausage + ", hotdogSauces=" + hotdogSauces + "]";
	}

}
