package com.gngapps.yours.dao;

import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.CustomerDrink;
import com.gngapps.yours.entities.CustomerHotdog;
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
import com.gngapps.yours.entities.SaladIngredientWithAmountAndPrice;
import com.gngapps.yours.entities.CustomerSandwich;
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


public interface DataSaverDao {
	
	Customer saveCustomer(Customer customer);
	SandwichBread saveSandwichBreadType(SandwichBread sandwichBread);
	void saveSandwichBreadSizeAndPrice(SandwichBreadSizeAndPrice sandwichBreadSizeAndPrice);
	void saveSandwichSausageAmountAndPrice(SandwichSausageAmountAndPrice sandwichSausageAmountAndPrice);
	SandwichVegetableAmountAndPrice saveSanwichVegetableAmountAndPrice(SandwichVegetableAmountAndPrice svaap);
	SandwichVegetable saveSandwichVegetable(SandwichVegetable sandwichVegetable);
	SandwichSauce saveSandwichSauce(SandwichSauce sandwichSauce);
	SandwichSauceAmountAndPrice saveSandwichSauceAmountAndPrice(SandwichSauceAmountAndPrice amountAndPrice);
	void saveSandwichSpice(SandwichSpice sandwichSpice);
	void saveSanwichVegetableAmountAndPrice(SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice);
	SandwichSausage saveSandwichSausage(SandwichSausage sandwichSausage);
	void saveSanwichSpiceAmountAndPrice(SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice);
	void saveSaladIngredient(SaladIngredient saladIngredient);
	void saveSaladIngredientAmountAndPrice(SaladIngredientAmountAndPrice saladIngredientAmountAndPrice);
	void SaveDrink(Drink drink);
	void saveDrinkSizeAndPrice(DrinkSizeAndPrice drinkSizeAndPrice);
	void saveDrinkAddOn(DrinkAddOn drinkAddOn);
	void saveDrinkAddOnAmountAndPrice(DrinkAddOnAmountAndPrice amountAndPrice);
	void saveHotdogBread(HotDogBread hotdogBread);
	void saveHotdogBreadSizeAndPrice(HotdogBreadSizeAndPrice sizeAndPrice);
	void saveHotdogSausage(HotDogSausage hotdogSausage);
	void saveHotdogSausageAmountAndPrice(HotDogSausageAmountAndPrice amountAndPrice);
	void saveHotdogSauce(HotDogSauce hotdogSauce);
	void saveHotdogSauceAmountAndPrice(HotdogSauceAmountAndPrice amountAndPrice);
	void saveCustomerSandwich(CustomerSandwich sandwich);
	void saveCustomerSalad(SaladIngredientWithAmountAndPrice saladIngredientWithAmountAndPrice);
	void saveCustomerDrink(CustomerDrink customerDrink);
	void saveCustomerHotdog(CustomerHotdog customerHotdog);
}
