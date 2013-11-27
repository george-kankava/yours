package com.gngapps.yours.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class HotDogSauceWithAmountAndPrice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "hotdog_sauce_id")
	private HotDogSauce sauce;
	@ManyToOne
	@JoinColumn(name = "hotdog_sauce_amount_and_price_id")
	private HotdogSauceAmountAndPrice amountAndPrice;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public HotDogSauce getSauce() {
		return sauce;
	}
	public void setSauce(HotDogSauce sauce) {
		this.sauce = sauce;
	}
	public HotdogSauceAmountAndPrice getAmountAndPrice() {
		return amountAndPrice;
	}
	public void setAmountAndPrice(HotdogSauceAmountAndPrice amountAndPrice) {
		this.amountAndPrice = amountAndPrice;
	}
	@Override
	public String toString() {
		return "HotDogSauceWithAmountAndPrice [id=" + id + ", sauce=" + sauce + ", amountAndPrice=" + amountAndPrice + "]";
	}
	
}
