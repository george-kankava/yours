package com.gngapps.yours.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class SandwichVegetableWithAmountAndPrice {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	private SandwichVegetable sandwichVegetable;
	@ManyToOne
	private SandwichVegetableAmountAndPrice sandwichVegetableAmountAndPrice;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public SandwichVegetable getSandwichVegetable() {
		return sandwichVegetable;
	}
	public void setSandwichVegetable(SandwichVegetable sandwichVegetable) {
		this.sandwichVegetable = sandwichVegetable;
	}
	public SandwichVegetableAmountAndPrice getSandwichVegetableAmountAndPrice() {
		return sandwichVegetableAmountAndPrice;
	}
	public void setSandwichVegetableAmountAndPrice(SandwichVegetableAmountAndPrice sandwichVegetableAmountAndPrice) {
		this.sandwichVegetableAmountAndPrice = sandwichVegetableAmountAndPrice;
	}
	@Override
	public String toString() {
		return "SandwichVegetableWithAmountAndPrice [id=" + id + ", sandwichVegetable=" + sandwichVegetable 
				+ ", sandwichVegetableAmountAndPrice=" + sandwichVegetableAmountAndPrice + "]";
	}
	
	
}
