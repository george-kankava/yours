package com.gngapps.yours.dao;

import java.util.List;

import com.gngapps.yours.entities.Customer;
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

	DrinkAddOn findDrinkAddOnById(Integer drinkAddOnId);

	List<DrinkAddOn> getDrinkAddOns();

	HotDogBread findHotdogBreadById(Integer hotdogBreadId);

	List<HotDogBread> getHotdogBreads();

	HotDogSausage findHotdogSausageById(Integer hotdogSausageId);

	List<HotDogSausage> getHotdogSausages();

	HotDogSauce findHotdogSauceById(Integer hotdogSauceId);

	List<HotDogSauce> getHotdogSauces();

	SandwichBreadSizeAndPrice findSandwichBreadSizeAndPriceId(Integer sandwichBreadSizeAndPriceId);

	SandwichSausageAmountAndPrice findSandwichSausageAmountAndPriceById(Integer sandwichSausageAmountAndPriceId);

	SandwichVegetableAmountAndPrice findSandwichVegetableAmountAndPriceById(Integer sandwichVegetableAmountAndPriceId);

	SandwichSauceAmountAndPrice findSandwichSauceAmountAndPriceById(Integer sandwichSauceAmountAndPriceId);

	SandwichSpiceAmountAndPrice findSandwichSpiceAmountAndPriceById(Integer sandwichSpiceAmountAndPriceId);

	SaladIngredientAmountAndPrice findSaladIngredientAmountAndPriceById(Integer saladIngredientAmountAndPriceId);

	DrinkSizeAndPrice findDrinkSizeAndPriceById(Integer drinkSizeAndPriceId);

	DrinkAddOnAmountAndPrice findDrinkAddOnAmountAndPriceById(Integer addonAmountAndPriceId);

	HotdogBreadSizeAndPrice findHotdogBreadSizeAndPriceById(Integer hotdogBreadSizeAndPriceId);

	HotDogSausageAmountAndPrice findHotdogSausageAmountAndPriceById(Integer hotdogSausageAmountAndPriceId);

	HotdogSauceAmountAndPrice findHotdogSauceAmountAndPriceById(Integer hotdogSauceAmountAndPriceId);

	Customer findCustomerById(Integer customerId);

}
