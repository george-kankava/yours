package com.gngapps.yours.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class DrinkWithSizeAndPrice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "drink_id")
	private Drink drink;
	
	@ManyToOne
	@JoinColumn(name = "drink_size_and_price_id")
	private DrinkSizeAndPrice sizeAndPrice;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Drink getDrink() {
		return drink;
	}

	public void setDrink(Drink drink) {
		this.drink = drink;
	}

	public DrinkSizeAndPrice getSizeAndPrice() {
		return sizeAndPrice;
	}

	public void setSizeAndPrice(DrinkSizeAndPrice sizeAndPrice) {
		this.sizeAndPrice = sizeAndPrice;
	}

	@Override
	public String toString() {
		return "DrinkWithSizeAndPrice [id=" + id + ", drink=" + drink + ", sizeAndPrice=" + sizeAndPrice + "]";
	}
	
}
