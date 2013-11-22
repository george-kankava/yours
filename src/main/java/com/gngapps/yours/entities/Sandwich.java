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
	@OneToMany
	@JoinColumn(name = "sandwich_id")
	private List<SandwichVegetableWithAmountAndPrice> sandwichVegetables;
	@OneToMany
	@JoinColumn(name = "sandwich_id")
	private List<SandwichSauceWithAmountAndPrice> sandwichSauce;
	@OneToMany
	@JoinColumn(name = "sandwich_id")
	private List<SandwichSpiceWithAmountAndPrice> sandwichSpices;
	
}
