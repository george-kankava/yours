/**
 * Customer Hotdog entity for saving customer hotdogs
 */
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

/**
 * @author ggkankava
 *
 */

@Entity
public class CustomerHotdog {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne
	@JoinColumn(name = "hotdog_bread_id")
	private HotDogBread bread;
	@ManyToOne
	@JoinColumn(name = "hotdog_bread_size_and_price_id")
	private HotdogBreadSizeAndPrice sizeAndPrice;
	@ManyToOne
	@JoinColumn(name = "hotdog_sausage_id")
	private HotDogSausage sausage;
	@ManyToOne
	@JoinColumn(name = "hotdog_sausage_amount_and_price_id")
	private HotDogSausageAmountAndPrice amountAndPrice;
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_hotdog_id")
	private List<HotDogSauceWithAmountAndPrice> amountAndPrices;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public HotDogBread getBread() {
		return bread;
	}
	public void setBread(HotDogBread bread) {
		this.bread = bread;
	}
	public HotdogBreadSizeAndPrice getSizeAndPrice() {
		return sizeAndPrice;
	}
	public void setSizeAndPrice(HotdogBreadSizeAndPrice sizeAndPrice) {
		this.sizeAndPrice = sizeAndPrice;
	}
	public HotDogSausage getSausage() {
		return sausage;
	}
	public void setSausage(HotDogSausage sausage) {
		this.sausage = sausage;
	}
	public HotDogSausageAmountAndPrice getAmountAndPrice() {
		return amountAndPrice;
	}
	public void setAmountAndPrice(HotDogSausageAmountAndPrice amountAndPrice) {
		this.amountAndPrice = amountAndPrice;
	}
	public List<HotDogSauceWithAmountAndPrice> getAmountAndPrices() {
		return amountAndPrices;
	}
	public void setAmountAndPrices(
			List<HotDogSauceWithAmountAndPrice> amountAndPrices) {
		this.amountAndPrices = amountAndPrices;
	}
	@Override
	public String toString() {
		return "CustomerHotdog [id=" + id + ", bread=" + bread + ", sizeAndPrice=" + sizeAndPrice + ", sausage=" + sausage
				+ ", amountAndPrice=" + amountAndPrice + ", amountAndPrices=" + amountAndPrices + "]";
	}
	
}
