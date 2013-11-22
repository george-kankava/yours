package com.gngapps.yours.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class SandwichSausageWithAmountAndPrice {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@OneToOne
	private SandwichSausage sandwichSausage;
	@ManyToOne
	private SandwichSausageAmountAndPrice amountAndPrice;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public SandwichSausage getSandwichSausage() {
		return sandwichSausage;
	}
	public void setSandwichSausage(SandwichSausage sandwichSausage) {
		this.sandwichSausage = sandwichSausage;
	}
	public SandwichSausageAmountAndPrice getAmountAndPrice() {
		return amountAndPrice;
	}
	public void setAmountAndPrice(SandwichSausageAmountAndPrice amountAndPrice) {
		this.amountAndPrice = amountAndPrice;
	}
	
	@Override
	public String toString() {
		return "SandwichSausageWithAmountAndPrice [sandwichSausage=" + sandwichSausage + ", amountAndPrice=" + amountAndPrice + "]";
	}
}
