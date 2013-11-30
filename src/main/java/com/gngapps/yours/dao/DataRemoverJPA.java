package com.gngapps.yours.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.gngapps.yours.entities.CustomerSalad;
import com.gngapps.yours.entities.CustomerSandwich;
import com.gngapps.yours.entities.Drink;
import com.gngapps.yours.entities.DrinkAddOn;
import com.gngapps.yours.entities.DrinkAddOnAmountAndPrice;
import com.gngapps.yours.entities.DrinkSizeAndPrice;
import com.gngapps.yours.entities.HotDogBread;
import com.gngapps.yours.entities.HotDogSauce;
import com.gngapps.yours.entities.HotDogSausage;
import com.gngapps.yours.entities.HotDogSausageAmountAndPrice;
import com.gngapps.yours.entities.HotdogBreadSizeAndPrice;
import com.gngapps.yours.entities.HotdogSauceAmountAndPrice;
import com.gngapps.yours.entities.SaladIngredient;
import com.gngapps.yours.entities.SaladIngredientAmountAndPrice;
import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichBreadSizeAndPrice;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSauceAmountAndPrice;
import com.gngapps.yours.entities.SandwichSausage;
import com.gngapps.yours.entities.SandwichSausageAmountAndPrice;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichSpiceAmountAndPrice;
import com.gngapps.yours.entities.SandwichVegetable;
import com.gngapps.yours.entities.SandwichVegetableAmountAndPrice;

@Repository("dataRemoverDao")
public class DataRemoverJPA implements DataRemoverDao {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public void removeSandwichBreadSizeAndPrice(Integer sandwichBreadSizeAndPrice) {
		SandwichBreadSizeAndPrice breadSizeAndPrice = em.find(SandwichBreadSizeAndPrice.class, sandwichBreadSizeAndPrice);
		em.remove(breadSizeAndPrice);
	}

	@Override
	public void removeSandwichBread(Integer sandwichBreadId) {
		SandwichBread sandwichBread = em.find(SandwichBread.class, sandwichBreadId);
		em.remove(sandwichBread);
	}

	@Override
	public void removeSandwichSauceAmountAndPrice(Integer sandwichSauceAmountAndPriceId) {
		SandwichSauceAmountAndPrice sauceAmountAndPrice = em.find(SandwichSauceAmountAndPrice.class, sandwichSauceAmountAndPriceId);
		em.remove(sauceAmountAndPrice);
	}

	@Override
	public void removeSandwichSauce(Integer sandwichSauceId) {
		SandwichSauce sandwichSauce = em.find(SandwichSauce.class, sandwichSauceId);
		em.remove(sandwichSauce);
	}

	@Override
	public void removeSandwichVegetableAmountAndPrice(Integer sandwichVegetableAmountAndPriceId) {
		SandwichVegetableAmountAndPrice vegetableAmountAndPrice = em.find(SandwichVegetableAmountAndPrice.class, sandwichVegetableAmountAndPriceId);
		em.remove(vegetableAmountAndPrice);
	}

	@Override
	public void removeSandwichVegetable(Integer sandwichVegetableId) {
		SandwichVegetable sandwichVegetable = em.find(SandwichVegetable.class, sandwichVegetableId);
		em.remove(sandwichVegetable);
	}

	@Override
	public void removeSandwichSausageAmountAndPrice(Integer sandwichSausageAmountAndPriceId) {
		SandwichSausageAmountAndPrice sandwichSausageAmountAndPrice = em.find(SandwichSausageAmountAndPrice.class, sandwichSausageAmountAndPriceId);
		em.remove(sandwichSausageAmountAndPrice);
	}

	@Override
	public void removeSandwichSausage(Integer sandwichSausageId) {
		SandwichSausage sandwichSausage = em.find(SandwichSausage.class, sandwichSausageId);
		em.remove(sandwichSausage);
	}

	@Override
	public void removeSandwichSpice(Integer sandwichSpiceId) {
		SandwichSpice sandwichSpice = em.find(SandwichSpice.class, sandwichSpiceId);
		em.remove(sandwichSpice);
	}

	@Override
	public void removeSandwichSpiceAmountAndPrice(Integer sandwichSpiceAmountAndPriceId) {
		SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice = em.find(SandwichSpiceAmountAndPrice.class, sandwichSpiceAmountAndPriceId);
		em.remove(sandwichSpiceAmountAndPrice);
	}

	@Override
	public void removeSaladIngredient(Integer saladIngredientId) {
		SaladIngredient saladIngredient = em.find(SaladIngredient.class, saladIngredientId);
		em.remove(saladIngredient);
	}

	@Override
	public void removeSaladIngredientAmountAndPrice(Integer saladIngredientAmountAndPriceId) {
		SaladIngredientAmountAndPrice amountAndPrice = em.find(SaladIngredientAmountAndPrice.class, saladIngredientAmountAndPriceId);
		em.remove(amountAndPrice);
	}

	@Override
	public void removeDrink(Integer drinkId) {
		Drink drink = em.find(Drink.class, drinkId);
		em.remove(drink);
	}

	@Override
	public void removerDrinkSizeAndPrice(Integer drinkSizeAndPriceId) {
		DrinkSizeAndPrice drinkSizeAndPrice = em.find(DrinkSizeAndPrice.class, drinkSizeAndPriceId);
		em.remove(drinkSizeAndPrice);
	}

	@Override
	public void removeDrinkAddOn(Integer drinkAddOnId) {
		DrinkAddOn drinkAddOn = em.find(DrinkAddOn.class, drinkAddOnId);
		em.remove(drinkAddOn);
	}

	@Override
	public void removeDrinkAddOnAmountAndPrice(Integer drinkAddOnAmountAndPriceId) {
		DrinkAddOnAmountAndPrice amountAndPrice = em.find(DrinkAddOnAmountAndPrice.class, drinkAddOnAmountAndPriceId);
		em.remove(amountAndPrice);
	}

	@Override
	public void removeHotdogBread(Integer hotdogBreadId) {
		HotDogBread bread = em.find(HotDogBread.class, hotdogBreadId);
		em.remove(bread);
	}

	@Override
	public void removeHotdogBreadSizeAndPrice(Integer hotdogBreadSizeAndPriceId) {
		HotdogBreadSizeAndPrice sizeAndPrice = em.find(HotdogBreadSizeAndPrice.class, hotdogBreadSizeAndPriceId);
		em.remove(sizeAndPrice);
	}

	@Override
	public void removeHotdogSausage(Integer hotdogSausageId) {
		HotDogSausage sausage = em.find(HotDogSausage.class, hotdogSausageId);
		em.remove(sausage);
	}

	@Override
	public void removeHotdogSausageAmountAndPrice(Integer hotdogSausageAmountAndPriceId) {
		HotDogSausageAmountAndPrice amountAndPrice = em.find(HotDogSausageAmountAndPrice.class, hotdogSausageAmountAndPriceId);
		em.remove(amountAndPrice);
	}

	@Override
	public void removeHotdogSauce(Integer hotdogSauceId) {
		HotDogSauce sauce = em.find(HotDogSauce.class, hotdogSauceId);
		em.remove(sauce);
	}

	@Override
	public void removeHotdogSauceAmountAndPrice(Integer hotdogSauceAmountAndPriceId) {
		HotdogSauceAmountAndPrice amountAndPrice = em.find(HotdogSauceAmountAndPrice.class, hotdogSauceAmountAndPriceId);
		em.remove(amountAndPrice);
	}

	@Override
	public void removeCustomerSandwich(Integer customerSandwichId) {
		CustomerSandwich sandwich = em.find(CustomerSandwich.class, customerSandwichId);
		em.remove(sandwich);
	}

	@Override
	public void removeCustomerSalad(Integer customerSaladId) {
		CustomerSalad customerSalad = em.find(CustomerSalad.class, customerSaladId);
		em.remove(customerSalad);
	}
}
