package com.gngapps.yours.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "SandwichSpiceWithAmountAndPrice")
public class SandwichSpiceWithAmountAndPrice {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "sandwich_spice_id")
	private SandwichSpice sandwichSpice;
	@ManyToOne
	@JoinColumn(name = "sandwich_spice_amount_and_price_id")
	SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public SandwichSpice getSandwichSpice() {
		return sandwichSpice;
	}
	public void setSandwichSpice(SandwichSpice sandwichSpice) {
		this.sandwichSpice = sandwichSpice;
	}
	public SandwichSpiceAmountAndPrice getSandwichSpiceAmountAndPrice() {
		return sandwichSpiceAmountAndPrice;
	}
	public void setSandwichSpiceAmountAndPrice(
			SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice) {
		this.sandwichSpiceAmountAndPrice = sandwichSpiceAmountAndPrice;
	}
	@Override
	public String toString() {
		return "SandwichSpiceWithAmountAndPrice [id=" + id + ", sandwichSpice=" + sandwichSpice + ", sandwichSpiceAmountAndPrice="
				+ sandwichSpiceAmountAndPrice + "]";
	}
	
}
