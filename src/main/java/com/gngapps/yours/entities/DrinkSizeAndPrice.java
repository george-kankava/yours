package com.gngapps.yours.entities;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;

@Entity
public class DrinkSizeAndPrice {

	@Id
	@GeneratedValue(strategy = IDENTITY)
	private Integer id;
	private String size;
	private BigDecimal price;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "DrinkSizeAndPrice [id=" + id + ", size=" + size + ", price="
				+ price + "]";
	}
	
	
}
