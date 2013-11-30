package com.gngapps.yours.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 * Entity implementation class for Entity: CustomerSalad
 *
 */
@Entity
public class CustomerSalad implements Serializable {

	private Integer id;
	private Customer customer;
	private List<SaladIngredientWithAmountAndPrice> ingredientWithAmountAndPrices;
	private static final long serialVersionUID = 1L;

	public CustomerSalad() {
		super();
	}
	
	@Id    
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}   
	
	@ManyToOne
	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "salad_id")
	public List<SaladIngredientWithAmountAndPrice> getIngredientWithAmountAndPrices() {
		return ingredientWithAmountAndPrices;
	}
	
	public void setIngredientWithAmountAndPrices(List<SaladIngredientWithAmountAndPrice> ingredientWithAmountAndPrices) {
		this.ingredientWithAmountAndPrices = ingredientWithAmountAndPrices;
	}
	@Override
	public String toString() {
		return "CustomerSalad [id=" + id + ", customer=" + customer + ", ingredientWithAmountAndPrices=" + ingredientWithAmountAndPrices + "]";
	}
   
}
