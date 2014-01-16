package com.gngapps.yours.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: DeliveredOrders
 *
 */
@Entity
public class DeliveredOrders implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@ManyToOne
	private Customer customer;
	
	@ManyToOne
	private CustomerOrder order;
	
	private Date deliveryTime;

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

	public CustomerOrder getOrder() {
		return order;
	}

	public void setOrder(CustomerOrder order) {
		this.order = order;
	}

	public Date getDeliveryTime() {
		return deliveryTime;
	}

	public void setDeliveryTime(Date deliveryTime) {
		this.deliveryTime = deliveryTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "DeliveredOrders [id=" + id + ", customer=" + customer + ", order=" + order + ", deliveryTime=" + deliveryTime + "]";
	}
   
}
