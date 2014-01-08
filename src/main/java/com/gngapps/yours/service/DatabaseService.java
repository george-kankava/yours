package com.gngapps.yours.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.gngapps.yours.databinding.json.request.CustoemrOrderJson;
import com.gngapps.yours.databinding.json.request.DrinksJson;
import com.gngapps.yours.databinding.json.request.HotdogJson;
import com.gngapps.yours.databinding.json.request.SaladJson;
import com.gngapps.yours.databinding.json.request.SandwichJson;
import com.gngapps.yours.entities.ChangePasswordToken;
import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.CustomerOrder;
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
import com.gngapps.yours.exceptions.PhoneAlreadyInUseException;

public interface DatabaseService {
	Customer findCustomerByEmail(String username);
	Customer registerCustomer(Customer customer);
	SandwichBread addNewSandwichBreadType(SandwichBread sandwichBread);
	List<SandwichBread> getSandwichBreads();
	List<SandwichSausage> getSandwichSausages();
	List<SandwichVegetable> getSandwichVegetables();
	List<SandwichSauce> getSandwichSauces();
	List<SandwichSpice> getsandwichSpices();
	SandwichBreadSizeAndPrice addNewSandwichBreadSizeAndPrice(Integer sandwichBreadId, String size, BigDecimal price);
	SandwichSausageAmountAndPrice addNewSandwichSausageAmountAndPrice(Integer sandwichSausageId, String sandwichSausageAmount, BigDecimal sandwichSausagePrice);
	SandwichVegetableAmountAndPrice addNewSandwichVegetableAmountAndPrice(Integer sandwichVegetableId, String amount, BigDecimal price);
	SandwichVegetable addSandwichVegetable(SandwichVegetable sandwichVegetable);
	SandwichSauce addNewSandwichSauce(SandwichSauce sandwichSauce);
	SandwichSauceAmountAndPrice addNewSandwichSauceAmountAndPrice(Integer sandwichSauceId, String amount, BigDecimal price);
	void addNewSandwichSpice(SandwichSpice sandwichSpice);
	SandwichSpiceAmountAndPrice addNewSandwichSpiceAmountAndPrice(Integer sandwichSpiceId, String amount, BigDecimal price);
	void removeSandwichBreadSizeAndPrice(Integer sandwichBreadSizeAndPrice);
	void removeSandwichBread(Integer sandwichBreadId);
	void removeSandwichSauceAmountAndPrice(Integer sandwichSauceAmountAndPriceId);
	void removeSandwichSauce(Integer sandwichSauceId);
	void removeSandwichVegetableAmountAndPrice(Integer sandwichVegetableAmountAndPriceId);
	void removeSandwichVegetable(Integer sandwichVegetableId);
	void removeSandwichSausageAmountAndPrice(Integer sandwichSausageAmountAndPriceId);
	void removeSandwichSausage(Integer sandwichSausageId);
	void addNewSandwichSausage(SandwichSausage sandwichSausage);
	void removeSandwichSpice(Integer sandwichSpiceId);
	void removeSandwichSpiceAmountAndPrice(Integer sandwichSpiceAmountAndPriceId);
	void addNewSaladIngredient(SaladIngredient saladIngredient);
	List<SaladIngredient> getSaladIngredients();
	void removeSaladIngredient(Integer saladIngredientId);
	void removeSaladIngredientAmountAndPrice(Integer saladIngredientAmountAndPriceId);
	SaladIngredientAmountAndPrice addNewSaladIngredientAmountAndPrice(Integer saladIngredientId, String amount, BigDecimal price);
	void addNewDrink(Drink drink);
	void removeDrink(Integer drinkId);
	void removeDrinkSizeAndPrice(Integer drinkSizeAndPriceId);
	DrinkSizeAndPrice addNewDrinkSizeAndPrice(Integer drinkId, String size, BigDecimal price);
	List<Drink> getDrinks();
	DrinkAddOnAmountAndPrice addNewDrinkAddOnAmountAndPrice(Integer drinkAddOnId, String amount, BigDecimal price);
	void removeDrinkAddOn(Integer drinkAddOnId);
	void removeDrinkAddOnAmountAndPrice(Integer drinkAddOnAmountAndPriceId);
	List<DrinkAddOn> getDrinkAddOns();
	void addNewHotdogBread(HotDogBread hotdogBread);
	HotdogBreadSizeAndPrice addNewHotdogBreadSizeAndPrice(Integer hotdogBreadId, String size, BigDecimal price);
	void removeHotdogBread(Integer hotdogBreadId);
	List<HotDogBread> getHotdogBreads();
	void removeHotdogBreadSizeAndPrice(Integer hotdogBreadSizeAndPriceId);
	void addNewHotdogSausage(HotDogSausage hotdogSausage);
	HotDogSausageAmountAndPrice addNewHotdogSausageAmountAndPrice(Integer hotdogSausageId, String amount, BigDecimal price);
	void removeHotdogSausage(Integer hotdogSausageId);
	void removeHotdogSausageAmountAndPrice(Integer hotdogSausageAmountAndPriceId);
	List<HotDogSausage> getHotdogSausages();
	void addNewHotdogSauce(HotDogSauce hotdogSauce);
	HotdogSauceAmountAndPrice addNewHotdogSauceAmountAndPrice(Integer hotdogSauceId, String amount, BigDecimal price);
	void removeHotdogSauce(Integer hotdogSauceId);
	void removeHotdogSauceAmountAndPrice(Integer hotdogSauceAmountAndPriceId);
	List<HotDogSauce> getHotdogSauces();
	void saveCustomerSandwich(SandwichJson sandwich, String username);
	void saveCustomerSalad(SaladJson salad, String username);
	void saveCustomerDrink(DrinksJson drink, String username);
	DrinkAddOn addNewDrinkAddOn(String nameGeo, String nameRus, String nameEng, String descriptionGeo, String descriptionEng, String descriptionRus, Integer drinkId);
	void saveCustomerHotdog(HotdogJson hotdog, String username);
	Map<String, Object> getCustomerMeals(String customerUsername);
	void removeCustomerSandwich(Integer customerSandwichId);
	void removeCustomerSalad(Integer customerSaladId);
	void removeCustomerDrink(Integer customerDrinkId);
	void removeCustomerHotdog(Integer customerHotdogId);
	List<CustomerOrder> getCustomerActiveOrders(int start, int end);
	void createCustomerOrder(String username, CustoemrOrderJson customerFoodsAndDrinks) throws PhoneAlreadyInUseException;
	void removeCustomerAddress(Integer customerAddressId);
	void removeCustomerPhone(Integer customerPhoneId);
	void changeCustomerOrderActiveStatus(Integer customerOrderId, boolean b);
	Long getActiveOrdersPagesCount();
	List<CustomerOrder> getCustomerOrderListByPageNumber(Integer pageNumber);
	Long getActiveCustomerOrdersCount();
	void countAndAssemblePaginationBar(ModelAndView mav, Integer paginationIndex);
	List<CustomerSandwich> getSandwichesByIds(List<Integer> sandwichIds);
	List<CustomerSalad> getSaladsByIds(List<Integer> saladIds);
	List<CustomerSalad> getDrinksByIds(List<Integer> drinkIds);
	List<CustomerSalad> getHotdogByIds(List<Integer> hotdogIds);
	void saveChangePasswordToken(Customer customer, String token, Date timestamp);
	ChangePasswordToken getPasswordChangeToken(String changePasswordToken);
	void changeCustomerPasswordAndRemovePasswordChangeToken(String changePasswordToken, String password);
	void removeCustomerPasswordChangeToken(ChangePasswordToken token);
	Drink findDrinkById(Integer drinkId);
}
