package com.gngapps.yours.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

/**
 * Entity implementation class for Entity: CustomerOrder
 *
 */
@Entity
public class CustomerOrder implements Serializable {

	public CustomerOrder() {
		super();
	}
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	private Customer customer;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "CustomerSandwichOrders",
			joinColumns = {@JoinColumn(name = "customer_order_id", referencedColumnName = "id")},
			inverseJoinColumns = {@JoinColumn(name = "customer_sandwich_id", referencedColumnName = "id")})
	private List<CustomerSandwich> customerSandwichs;
	@ManyToMany
	@JoinTable(name = "CustomerSaladOrders",
			joinColumns = {@JoinColumn(name = "customer_order_id", referencedColumnName = "id")},
			inverseJoinColumns = {@JoinColumn(name = "customer_salad_id", referencedColumnName = "id")})
	private List<CustomerSalad> customerSalads;
	@ManyToMany
	@JoinTable(name = "CustomerDrinkOrders",
			joinColumns = {@JoinColumn(name = "customer_order_id", referencedColumnName = "id")},
			inverseJoinColumns = {@JoinColumn(name = "customer_drink_id", referencedColumnName = "id")})
	private List<CustomerDrink> customerDrinks;	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "CustomerHotdogOrders",
			joinColumns = {@JoinColumn(name = "customer_order_id", referencedColumnName = "id")},
			inverseJoinColumns = {@JoinColumn(name = "customer_hotdog_id", referencedColumnName = "id")})
	private List<CustomerHotdog> customerHotdogs;
	private String shipmentAddress;
	private String phoneNumber;
	private Date date;
	private boolean activeOrder;
	
	private static final long serialVersionUID = 1L;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<CustomerSandwich> getCustomerSandwichs() {
		return customerSandwichs;
	}

	public void setCustomerSandwichs(List<CustomerSandwich> customerSandwichs) {
		this.customerSandwichs = customerSandwichs;
	}

	public List<CustomerSalad> getCustomerSalads() {
		return customerSalads;
	}

	public void setCustomerSalads(List<CustomerSalad> customerSalads) {
		this.customerSalads = customerSalads;
	}

	public List<CustomerDrink> getCustomerDrinks() {
		return customerDrinks;
	}

	public void setCustomerDrinks(List<CustomerDrink> customerDrinks) {
		this.customerDrinks = customerDrinks;
	}

	public List<CustomerHotdog> getCustomerHotdogs() {
		return customerHotdogs;
	}

	public void setCustomerHotdogs(List<CustomerHotdog> customerHotdogs) {
		this.customerHotdogs = customerHotdogs;
	}

	public String getShipmentAddress() {
		return shipmentAddress;
	}

	public void setShipmentAddress(String shipmentAddress) {
		this.shipmentAddress = shipmentAddress;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isActiveOrder() {
		return activeOrder;
	}

	public void setActiveOrder(boolean activeOrder) {
		this.activeOrder = activeOrder;
	}

	@Override
	public String toString() {
		return "CustomerOrder [id=" + id + ", customer=" + customer
				+ ", customerSandwichs=" + customerSandwichs
				+ ", customerSalads=" + customerSalads + ", customerDrinks="
				+ customerDrinks + ", customerHotdogs=" + customerHotdogs
				+ ", shipmentAddress=" + shipmentAddress + ", phoneNumber="
				+ phoneNumber + ", date=" + date + ", activeOrder="
				+ activeOrder + "]";
	}
   
}
