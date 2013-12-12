package com.gngapps.yours.dao;


public interface DataRemoverDao {
	void removeSandwichBreadSizeAndPrice(Integer sandwichBreadSizeAndPrice);

	void removeSandwichBread(Integer sandwichBreadId);

	void removeSandwichSauceAmountAndPrice(Integer sandwichSauceAmountAndPriceId);

	void removeSandwichSauce(Integer sandwichSauceId);

	void removeSandwichVegetableAmountAndPrice(Integer sandwichVegetableAmountAndPriceId);

	void removeSandwichVegetable(Integer sandwichVegetableId);

	void removeSandwichSausageAmountAndPrice(Integer sandwichSausageAmountAndPriceId);

	void removeSandwichSausage(Integer sandwichSausageId);

	void removeSandwichSpice(Integer sandwichSpiceId);

	void removeSandwichSpiceAmountAndPrice(Integer sandwichSpiceAmountAndPriceId);

	void removeSaladIngredient(Integer saladIngredientId);

	void removeSaladIngredientAmountAndPrice(Integer saladIngredientAmountAndPriceId);

	void removeDrink(Integer drinkId);

	void removerDrinkSizeAndPrice(Integer drinkSizeAndPriceId);

	void removeDrinkAddOn(Integer drinkAddOnId);

	void removeDrinkAddOnAmountAndPrice(Integer drinkAddOnAmountAndPriceId);

	void removeHotdogBread(Integer hotdogBreadId);

	void removeHotdogBreadSizeAndPrice(Integer hotdogBreadSizeAndPriceId);

	void removeHotdogSausage(Integer hotdogSausageId);

	void removeHotdogSausageAmountAndPrice(Integer hotdogSausageAmountAndPriceId);

	void removeHotdogSauce(Integer hotdogSauceId);

	void removeHotdogSauceAmountAndPrice(Integer hotdogSauceAmountAndPriceId);

	void removeCustomerSandwich(Integer customerSandwichId);

	void removeCustomerSalad(Integer customerSaladId);

	void removeCustomerDrink(Integer customerDrinkId);

	void removeCustomerHotdog(Integer customerHotdogId);

	void removeCustomerAddress(Integer customerAddressId);

	void removeCustomerPhone(Integer customerPhoneId);
}
