package com.gngapps.yours.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Sandwich {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	private SandwichBread sandwichBread;
	@ManyToOne
	private SandwichBreadSizeAndPrice sandwichBreadSizeAndPrice;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "sandwich_id")
	private List<SandwichSausageWithAmountAndPrice> sandwichSausages;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "sandwich_id")
	private List<SandwichVegetableWithAmountAndPrice> sandwichVegetables;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "sandwich_id")
	private List<SandwichSauceWithAmountAndPrice> sandwichSauce;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "sandwich_id")
	private List<SandwichSpiceWithAmountAndPrice> sandwichSpices;
	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public SandwichBread getSandwichBread() {
		return sandwichBread;
	}
	public void setSandwichBread(SandwichBread sandwichBread) {
		this.sandwichBread = sandwichBread;
	}
	public SandwichBreadSizeAndPrice getSandwichBreadSizeAndPrice() {
		return sandwichBreadSizeAndPrice;
	}
	public void setSandwichBreadSizeAndPrice(
			SandwichBreadSizeAndPrice sandwichBreadSizeAndPrice) {
		this.sandwichBreadSizeAndPrice = sandwichBreadSizeAndPrice;
	}
	public List<SandwichSausageWithAmountAndPrice> getSandwichSausages() {
		return sandwichSausages;
	}
	public void setSandwichSausages(
			List<SandwichSausageWithAmountAndPrice> sandwichSausages) {
		this.sandwichSausages = sandwichSausages;
	}
	public List<SandwichVegetableWithAmountAndPrice> getSandwichVegetables() {
		return sandwichVegetables;
	}
	public void setSandwichVegetables(
			List<SandwichVegetableWithAmountAndPrice> sandwichVegetables) {
		this.sandwichVegetables = sandwichVegetables;
	}
	public List<SandwichSauceWithAmountAndPrice> getSandwichSauce() {
		return sandwichSauce;
	}
	public void setSandwichSauce(List<SandwichSauceWithAmountAndPrice> sandwichSauce) {
		this.sandwichSauce = sandwichSauce;
	}
	public List<SandwichSpiceWithAmountAndPrice> getSandwichSpices() {
		return sandwichSpices;
	}
	public void setSandwichSpices(
			List<SandwichSpiceWithAmountAndPrice> sandwichSpices) {
		this.sandwichSpices = sandwichSpices;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@Override
	public String toString() {
		return "Sandwich [id=" + id + ", sandwichBread=" + sandwichBread + ", sandwichBreadSizeAndPrice=" + sandwichBreadSizeAndPrice
				+ ", sandwichSausages=" + sandwichSausages + ", sandwichVegetables=" + sandwichVegetables
				+ ", sandwichSauce=" + sandwichSauce + ", sandwichSpices=" + sandwichSpices + ", customer=" + customer + "]";
	}
	
}
