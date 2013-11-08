package com.gngapps.yours.dao;

import java.util.List;

import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.Drink;
import com.gngapps.yours.entities.DrinkAddOn;
import com.gngapps.yours.entities.HotDogBread;
import com.gngapps.yours.entities.HotDogSauce;
import com.gngapps.yours.entities.HotDogSausage;
import com.gngapps.yours.entities.SaladIngredient;
import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSausage;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichVegetable;

public interface DataGetterDao {
	
	Customer findCustomerByUsername(String username);

	List<SandwichBread> getSandwichBreads();

	List<SandwichSausage> getSandwichSausages();

	List<SandwichVegetable> getSandwichVegetables();

	List<SandwichSauce> getSandwichSauces();

	List<SandwichSpice> getSandwichSpices();

	SandwichBread findSandwichBreadById(Integer sandwichBreadId);

	SandwichSausage findSandwichSausageById(Integer sandwichSausageId);

	SandwichVegetable findSandwichVegetableById(Integer sandwichVegetableId);

	SandwichSauce findSandwichSauceById(Integer sandwichSauceId);

	SandwichSpice findSandwichSpiceById(Integer sandwichSpiceId);

	List<SaladIngredient> getSaladIngredients();

	SaladIngredient findSaladIngredientById(Integer saladIngredientId);

	Drink findDrinkById(Integer drinkId);

	List<Drink> getDrinks();

	DrinkAddOn findDrinkAddOn(Integer drinkAddOnId);

	List<DrinkAddOn> getDrinkAddOns();

	HotDogBread findHotdogBreadById(Integer hotdogBreadId);

	List<HotDogBread> getHotdogBreads();

	HotDogSausage findHotdogSausageById(Integer hotdogSausageId);

	List<HotDogSausage> getHotdogSausages();

	HotDogSauce findHotdogSauceById(Integer hotdogSauceId);

	List<HotDogSauce> getHotdogSauces();

}
