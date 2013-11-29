package com.gngapps.yours.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class SaladIngredientWithAmountAndPrice {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "salad_ingredient_id")
	private SaladIngredient saladIngredient;
	@ManyToOne
	@JoinColumn(name = "salad_ingredient_amount_and_price_id")
	private SaladIngredientAmountAndPrice amountAndPrice;
	@ManyToOne
	private Customer customer;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public SaladIngredient getSaladIngredient() {
		return saladIngredient;
	}
	public void setSaladIngredient(SaladIngredient saladIngredient) {
		this.saladIngredient = saladIngredient;
	}
	public SaladIngredientAmountAndPrice getAmountAndPrice() {
		return amountAndPrice;
	}
	public void setAmountAndPrice(SaladIngredientAmountAndPrice amountAndPrice) {
		this.amountAndPrice = amountAndPrice;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@Override
	public String toString() {
		return "SaladIngredientWithAmountAndPrice [id=" + id + ", saladIngredient=" + saladIngredient + ", amountAndPrice=" + amountAndPrice + ", customer=" + customer + "]";
	}
	
}
