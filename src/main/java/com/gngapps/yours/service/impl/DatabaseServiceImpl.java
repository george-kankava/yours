package com.gngapps.yours.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gngapps.yours.controller.YoursController;
import com.gngapps.yours.dao.DataGetterDao;
import com.gngapps.yours.dao.DataRemoverDao;
import com.gngapps.yours.dao.DataSaverDao;
import com.gngapps.yours.databinding.json.request.CustoemrOrderJson;
import com.gngapps.yours.databinding.json.request.DrinkAddonIdWithAmountAndSizeId;
import com.gngapps.yours.databinding.json.request.DrinkIdWithDrinkSizeAndPriceId;
import com.gngapps.yours.databinding.json.request.DrinksJson;
import com.gngapps.yours.databinding.json.request.HotdogJson;
import com.gngapps.yours.databinding.json.request.HotdogSauceJson;
import com.gngapps.yours.databinding.json.request.SaladIngredientIdWithAmountAndPriceId;
import com.gngapps.yours.databinding.json.request.SaladJson;
import com.gngapps.yours.databinding.json.request.SandwichJson;
import com.gngapps.yours.databinding.json.request.SandwichSauceIdWithAmountAndPrice;
import com.gngapps.yours.databinding.json.request.SandwichSausageIdWithAmountAndPriceId;
import com.gngapps.yours.databinding.json.request.SandwichSpiceIdWithAmountAndPriceId;
import com.gngapps.yours.databinding.json.request.SandwichVegetableIdWithAmountAndPriceId;
import com.gngapps.yours.entities.Address;
import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.CustomerDrink;
import com.gngapps.yours.entities.CustomerHotdog;
import com.gngapps.yours.entities.CustomerOrder;
import com.gngapps.yours.entities.CustomerSalad;
import com.gngapps.yours.entities.CustomerSandwich;
import com.gngapps.yours.entities.Drink;
import com.gngapps.yours.entities.DrinkAddOn;
import com.gngapps.yours.entities.DrinkAddOnAmountAndPrice;
import com.gngapps.yours.entities.DrinkAddonWithAmountAndPrice;
import com.gngapps.yours.entities.DrinkSizeAndPrice;
import com.gngapps.yours.entities.DrinkWithSizeAndPrice;
import com.gngapps.yours.entities.HotDogBread;
import com.gngapps.yours.entities.HotDogSauce;
import com.gngapps.yours.entities.HotDogSauceWithAmountAndPrice;
import com.gngapps.yours.entities.HotDogSausage;
import com.gngapps.yours.entities.HotDogSausageAmountAndPrice;
import com.gngapps.yours.entities.HotdogBreadSizeAndPrice;
import com.gngapps.yours.entities.HotdogSauceAmountAndPrice;
import com.gngapps.yours.entities.Phone;
import com.gngapps.yours.entities.SaladIngredient;
import com.gngapps.yours.entities.SaladIngredientAmountAndPrice;
import com.gngapps.yours.entities.SaladIngredientWithAmountAndPrice;
import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichBreadSizeAndPrice;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSauceAmountAndPrice;
import com.gngapps.yours.entities.SandwichSauceWithAmountAndPrice;
import com.gngapps.yours.entities.SandwichSausage;
import com.gngapps.yours.entities.SandwichSausageAmountAndPrice;
import com.gngapps.yours.entities.SandwichSausageWithAmountAndPrice;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichSpiceAmountAndPrice;
import com.gngapps.yours.entities.SandwichSpiceWithAmountAndPrice;
import com.gngapps.yours.entities.SandwichVegetable;
import com.gngapps.yours.entities.SandwichVegetableAmountAndPrice;
import com.gngapps.yours.entities.SandwichVegetableWithAmountAndPrice;
import com.gngapps.yours.service.DatabaseService;

@Service("databaseService")
public class DatabaseServiceImpl implements DatabaseService {

	@Autowired
	private DataSaverDao dataSaverDao;
	
	@Autowired
	private DataGetterDao dataGetterDao;
	
	@Autowired
	private DataRemoverDao dataRemoverDao;
	
	private static final Logger logger = LoggerFactory.getLogger(YoursController.class);
	
	@Override
	public Customer findCustomerByUsername(String username) {
		return dataGetterDao.findCustomerByUsername(username);
	}
	
	@Override
	@Transactional
	public Customer registerCustomer(Customer customer) {
		return dataSaverDao.saveCustomer(customer);
	}
	
	@Override
	@Transactional
	public SandwichBread addNewSandwichBreadType(SandwichBread sandwichBread) {
		return dataSaverDao.saveSandwichBreadType(sandwichBread);
	}

	@Override
	public List<SandwichBread> getSandwichBreads() {
		return dataGetterDao.getSandwichBreads();
	}

	@Override
	public List<SandwichSausage> getSandwichSausages() {
		return dataGetterDao.getSandwichSausages();
	}
	
	@Override
	public List<SandwichVegetable> getSandwichVegetables() {
		return dataGetterDao.getSandwichVegetables();
	}

	@Override
	public List<SandwichSauce> getSandwichSauces() {
		return dataGetterDao.getSandwichSauces();
	}
	
	@Override
	@Transactional
	public SandwichSauce addNewSandwichSauce(SandwichSauce sandwichSauce) {
		return dataSaverDao.saveSandwichSauce(sandwichSauce);
	}
	
	@Override
	@Transactional
	public SandwichSauceAmountAndPrice addNewSandwichSauceAmountAndPrice(Integer sandwichSauceId, String amount, BigDecimal price) {
		SandwichSauceAmountAndPrice amountAndPrice = new SandwichSauceAmountAndPrice();
		amountAndPrice.setPortion(amount);
		amountAndPrice.setPrice(price);
		dataSaverDao.saveSandwichSauceAmountAndPrice(amountAndPrice);
		SandwichSauce sandwichSauce = dataGetterDao.findSandwichSauceById(sandwichSauceId);
		sandwichSauce.getSauceAmountAndPrices().add(amountAndPrice);
		return amountAndPrice;
	}

	@Override
	public List<SandwichSpice> getsandwichSpices() {
		return dataGetterDao.getSandwichSpices();
	}

	@Override
	@Transactional
	public SandwichBreadSizeAndPrice addNewSandwichBreadSizeAndPrice(Integer sandwichBreadId, String size, BigDecimal price) {
		SandwichBreadSizeAndPrice sandwichBreadSizeAndPrice = new SandwichBreadSizeAndPrice();
		sandwichBreadSizeAndPrice.setSize(size);
		sandwichBreadSizeAndPrice.setPrice(price);
		dataSaverDao.saveSandwichBreadSizeAndPrice(sandwichBreadSizeAndPrice);
		SandwichBread sandwichBread = dataGetterDao.findSandwichBreadById(sandwichBreadId);
		sandwichBread.getSandwichBreadSizeAndPrices().add(sandwichBreadSizeAndPrice);
		return sandwichBreadSizeAndPrice;
	}

	@Override
	@Transactional
	public SandwichSausageAmountAndPrice addNewSandwichSausageAmountAndPrice(Integer sandwichSausageId, String sandwichSausageAmount, BigDecimal sandwichSausagePrice) {
		SandwichSausageAmountAndPrice sandwichSausageAmountAndPrice = new SandwichSausageAmountAndPrice();
		sandwichSausageAmountAndPrice.setPortion(sandwichSausageAmount);
		sandwichSausageAmountAndPrice.setPrice(sandwichSausagePrice);
		dataSaverDao.saveSandwichSausageAmountAndPrice(sandwichSausageAmountAndPrice);
		SandwichSausage sandwichSausage = dataGetterDao.findSandwichSausageById(sandwichSausageId);
		sandwichSausage.getSausageAmountAndPrices().add(sandwichSausageAmountAndPrice);
		return sandwichSausageAmountAndPrice;
	}

	@Override
	@Transactional
	public SandwichVegetableAmountAndPrice addNewSandwichVegetableAmountAndPrice(Integer sandwichVegetableId, String amount, BigDecimal price) {
		SandwichVegetableAmountAndPrice svaap = new SandwichVegetableAmountAndPrice();
		svaap.setPortion(amount);
		svaap.setPrice(price);
		dataSaverDao.saveSanwichVegetableAmountAndPrice(svaap);
		SandwichVegetable sandwichVegetable = dataGetterDao.findSandwichVegetableById(sandwichVegetableId);
		sandwichVegetable.getVegetableAmountAndPrices().add(svaap);
		return svaap;
	}

	@Override
	@Transactional
	public SandwichVegetable addSandwichVegetable(SandwichVegetable sandwichVegetable) {
		return dataSaverDao.saveSandwichVegetable(sandwichVegetable);
	}

	@Override
	@Transactional
	public void addNewSandwichSpice(SandwichSpice sandwichSpice) {
		dataSaverDao.saveSandwichSpice(sandwichSpice);
	}

	@Override
	@Transactional
	public SandwichSpiceAmountAndPrice addNewSandwichSpiceAmountAndPrice(Integer sandwichSpiceId, String amount, BigDecimal price) {
		SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice = new SandwichSpiceAmountAndPrice();
		sandwichSpiceAmountAndPrice.setPortion(amount);
		sandwichSpiceAmountAndPrice.setPrice(price);
		dataSaverDao.saveSanwichSpiceAmountAndPrice(sandwichSpiceAmountAndPrice);
		SandwichSpice sandwichSpice = dataGetterDao.findSandwichSpiceById(sandwichSpiceId);
		sandwichSpice.getSpiceAmountAndPrice().add(sandwichSpiceAmountAndPrice);
		return sandwichSpiceAmountAndPrice;
	}

	@Override
	@Transactional
	public void removeSandwichBread(Integer sandwichBreadId) {
		dataRemoverDao.removeSandwichBread(sandwichBreadId);
	}
	
	@Override
	@Transactional
	public void removeSandwichBreadSizeAndPrice(Integer sandwichBreadSizeAndPrice) {
		dataRemoverDao.removeSandwichBreadSizeAndPrice(sandwichBreadSizeAndPrice);
	}

	@Override
	@Transactional
	public void removeSandwichSauceAmountAndPrice(Integer sandwichSauceAmountAndPriceId) {
		dataRemoverDao.removeSandwichSauceAmountAndPrice(sandwichSauceAmountAndPriceId);
	}

	@Override
	@Transactional
	public void removeSandwichSauce(Integer sandwichSauceId) {
		dataRemoverDao.removeSandwichSauce(sandwichSauceId);
	}

	@Override
	@Transactional
	public void removeSandwichVegetableAmountAndPrice(Integer sandwichVegetableAmountAndPriceId) {
		dataRemoverDao.removeSandwichVegetableAmountAndPrice(sandwichVegetableAmountAndPriceId);
	}

	@Override
	@Transactional
	public void removeSandwichVegetable(Integer sandwichVegetableId) {
		dataRemoverDao.removeSandwichVegetable(sandwichVegetableId);
	}

	@Override
	@Transactional
	public void removeSandwichSausageAmountAndPrice(Integer sandwichSausageAmountAndPriceId) {
		dataRemoverDao.removeSandwichSausageAmountAndPrice(sandwichSausageAmountAndPriceId);
	}

	@Override
	@Transactional
	public void removeSandwichSausage(Integer sandwichSausageId) {
		dataRemoverDao.removeSandwichSausage(sandwichSausageId);
	}

	@Override
	@Transactional
	public void addNewSandwichSausage(SandwichSausage sandwichSausage) {
		dataSaverDao.saveSandwichSausage(sandwichSausage);
	}

	@Override
	@Transactional
	public void removeSandwichSpice(Integer sandwichSpiceId) {
		dataRemoverDao.removeSandwichSpice(sandwichSpiceId);
	}

	@Override
	@Transactional
	public void removeSandwichSpiceAmountAndPrice(Integer sandwichSpiceAmountAndPriceId) {
		dataRemoverDao.removeSandwichSpiceAmountAndPrice(sandwichSpiceAmountAndPriceId);
	}

	@Override
	@Transactional
	public void addNewSaladIngredient(SaladIngredient saladIngredient) {
		dataSaverDao.saveSaladIngredient(saladIngredient);
	}

	@Override
	public List<SaladIngredient> getSaladIngredients() {
		return dataGetterDao.getSaladIngredients();
	}

	@Override
	@Transactional
	public void removeSaladIngredient(Integer saladIngredientId) {
		dataRemoverDao.removeSaladIngredient(saladIngredientId);
	}

	@Override
	@Transactional
	public void removeSaladIngredientAmountAndPrice(Integer saladIngredientAmountAndPriceId) {
		dataRemoverDao.removeSaladIngredientAmountAndPrice(saladIngredientAmountAndPriceId);
	}

	@Override
	@Transactional
	public SaladIngredientAmountAndPrice addNewSaladIngredientAmountAndPrice(Integer saladIngredientId, String amount, BigDecimal price) {
		SaladIngredientAmountAndPrice saladIngredientAmountAndPrice = new SaladIngredientAmountAndPrice();
		saladIngredientAmountAndPrice.setAmount(amount);
		saladIngredientAmountAndPrice.setPrice(price);
		dataSaverDao.saveSaladIngredientAmountAndPrice(saladIngredientAmountAndPrice);
		SaladIngredient saladIngredient = dataGetterDao.findSaladIngredientById(saladIngredientId);
		saladIngredient.getSaladIngredientAmountAndPrices().add(saladIngredientAmountAndPrice);
		return saladIngredientAmountAndPrice;
	}

	@Override
	@Transactional
	public void addNewDrink(Drink drink) {
		dataSaverDao.SaveDrink(drink);
	}

	@Override
	@Transactional
	public void removeDrink(Integer drinkId) {
		dataRemoverDao.removeDrink(drinkId);
	}

	@Override
	@Transactional
	public void removeDrinkSizeAndPrice(Integer drinkSizeAndPriceId) {
		dataRemoverDao.removerDrinkSizeAndPrice(drinkSizeAndPriceId);
	}

	@Override
	@Transactional
	public DrinkSizeAndPrice addNewDrinkSizeAndPrice(Integer drinkId, String size, BigDecimal price) {
		DrinkSizeAndPrice drinkSizeAndPrice = new DrinkSizeAndPrice();
		drinkSizeAndPrice.setSize(size);
		drinkSizeAndPrice.setPrice(price);
		dataSaverDao.saveDrinkSizeAndPrice(drinkSizeAndPrice);
		Drink drink = dataGetterDao.findDrinkById(drinkId);
		drink.getDrinkSizeAndPrices().add(drinkSizeAndPrice);
		return drinkSizeAndPrice;
	}

	@Override
	public List<Drink> getDrinks() {
		return dataGetterDao.getDrinks();
	}

	@Override
	@Transactional
	public DrinkAddOnAmountAndPrice addNewDrinkAddOnAmountAndPrice(Integer drinkAddOnId, String amount, BigDecimal price) {
		DrinkAddOnAmountAndPrice amountAndPrice = new DrinkAddOnAmountAndPrice();
		amountAndPrice.setAmount(amount);
		amountAndPrice.setPrice(price);
		dataSaverDao.saveDrinkAddOnAmountAndPrice(amountAndPrice);
		DrinkAddOn drinkAddOn = dataGetterDao.findDrinkAddOnById(drinkAddOnId);
		drinkAddOn.getDrinkAddOnAmountAndPrices().add(amountAndPrice);
		return amountAndPrice;
	}

	@Override
	@Transactional
	public void removeDrinkAddOn(Integer drinkAddOnId) {
		dataRemoverDao.removeDrinkAddOn(drinkAddOnId);
	}

	@Override
	@Transactional
	public void removeDrinkAddOnAmountAndPrice(Integer drinkAddOnAmountAndPriceId) {
		dataRemoverDao.removeDrinkAddOnAmountAndPrice(drinkAddOnAmountAndPriceId);
	}

	@Override
	public List<DrinkAddOn> getDrinkAddOns() {
		return dataGetterDao.getDrinkAddOns();
	}

	@Override
	@Transactional
	public void addNewHotdogBread(HotDogBread hotdogBread) {
		dataSaverDao.saveHotdogBread(hotdogBread);
	}

	@Override
	@Transactional
	public HotdogBreadSizeAndPrice addNewHotdogBreadSizeAndPrice(Integer hotdogBreadId, String size, BigDecimal price) {
		HotdogBreadSizeAndPrice sizeAndPrice = new HotdogBreadSizeAndPrice();
		sizeAndPrice.setSize(size);
		sizeAndPrice.setPrice(price);
		dataSaverDao.saveHotdogBreadSizeAndPrice(sizeAndPrice);
		HotDogBread hotdogBread = dataGetterDao.findHotdogBreadById(hotdogBreadId);
		hotdogBread.getHotdogBreadSizeAndPrices().add(sizeAndPrice);
		return sizeAndPrice;
	}

	@Override
	@Transactional
	public void removeHotdogBread(Integer hotdogBreadId) {
		dataRemoverDao.removeHotdogBread(hotdogBreadId);
	}

	@Override
	public List<HotDogBread> getHotdogBreads() {
		return dataGetterDao.getHotdogBreads();
	}

	@Override
	@Transactional
	public void removeHotdogBreadSizeAndPrice(Integer hotdogBreadSizeAndPriceId) {
		dataRemoverDao.removeHotdogBreadSizeAndPrice(hotdogBreadSizeAndPriceId);
	}

	@Override
	@Transactional
	public void addNewHotdogSausage(HotDogSausage hotdogSausage) {
		dataSaverDao.saveHotdogSausage(hotdogSausage);
	}

	@Override
	@Transactional
	public HotDogSausageAmountAndPrice addNewHotdogSausageAmountAndPrice(Integer hotdogSausageId, String amount, BigDecimal price) {
		HotDogSausageAmountAndPrice amountAndPrice = new HotDogSausageAmountAndPrice();
		amountAndPrice.setPortion(amount);
		amountAndPrice.setPrice(price);
		dataSaverDao.saveHotdogSausageAmountAndPrice(amountAndPrice);
		HotDogSausage hotDogSausage = dataGetterDao.findHotdogSausageById(hotdogSausageId);
		hotDogSausage.getHotDogSausageAmountAndPrice().add(amountAndPrice);
		return amountAndPrice;
	}

	@Override
	@Transactional
	public void removeHotdogSausage(Integer hotdogSausageId) {
		dataRemoverDao.removeHotdogSausage(hotdogSausageId);
	}

	@Override
	@Transactional
	public void removeHotdogSausageAmountAndPrice(Integer hotdogSausageAmountAndPriceId) {
		dataRemoverDao.removeHotdogSausageAmountAndPrice(hotdogSausageAmountAndPriceId);
	}

	@Override
	public List<HotDogSausage> getHotdogSausages() {
		return dataGetterDao.getHotdogSausages();
	}

	@Override
	@Transactional
	public void addNewHotdogSauce(HotDogSauce hotdogSauce) {
		dataSaverDao.saveHotdogSauce(hotdogSauce);
	}

	@Override
	@Transactional
	public HotdogSauceAmountAndPrice addNewHotdogSauceAmountAndPrice(Integer hotdogSauceId, String amount, BigDecimal price) {
		HotdogSauceAmountAndPrice amountAndPrice = new HotdogSauceAmountAndPrice();
		amountAndPrice.setAmount(amount);
		amountAndPrice.setPrice(price);
		dataSaverDao.saveHotdogSauceAmountAndPrice(amountAndPrice);
		HotDogSauce sauce = dataGetterDao.findHotdogSauceById(hotdogSauceId);
		sauce.getHotdogSauceAmountAndPrice().add(amountAndPrice);
		return amountAndPrice;
	}

	@Override
	@Transactional
	public void removeHotdogSauce(Integer hotdogSauceId) {
		dataRemoverDao.removeHotdogSauce(hotdogSauceId);
	}

	@Override
	@Transactional
	public void removeHotdogSauceAmountAndPrice(Integer hotdogSauceAmountAndPriceId) {
		dataRemoverDao.removeHotdogSauceAmountAndPrice(hotdogSauceAmountAndPriceId);
	}

	@Override
	public List<HotDogSauce> getHotdogSauces() {
		return dataGetterDao.getHotdogSauces();
	}

	@Override
	@Transactional
	public void saveCustomerSandwich(SandwichJson sandwich, String username) {
		try {
			com.gngapps.yours.entities.CustomerSandwich sandwichEntity = new com.gngapps.yours.entities.CustomerSandwich();
			Integer sandwichBreadId = sandwich.getSandwichBread().getSandwichBreadId();
			Integer sandwichBreadSizeAndPriceId = sandwich.getSandwichBread().getSandwichBreadSizeAndPriceId();
			if(sandwichBreadId == null || sandwichBreadSizeAndPriceId == null) {
				throw new IllegalArgumentException("sandwichBreadId or sandwichBreadSizeAndPriceId is null");
			}
			SandwichBread sandwichBread = dataGetterDao.findSandwichBreadById(sandwichBreadId);
			SandwichBreadSizeAndPrice sizeAndPrice = dataGetterDao.findSandwichBreadSizeAndPriceId(sandwichBreadSizeAndPriceId);
			Customer customer = findCustomerByUsername(username);
			List<SandwichSausageIdWithAmountAndPriceId> sandwichSausages = sandwich.getSandwichSausages().getSandwichSausages();
			List<SandwichSausageWithAmountAndPrice> sandwichSausageWithAmountAndPrices = new ArrayList<SandwichSausageWithAmountAndPrice>();
			fillSandwichSausageWithAmountAndPriceList(sandwichSausages, sandwichSausageWithAmountAndPrices);
			List<SandwichVegetableIdWithAmountAndPriceId> sandwichVegetableIdWithAmountAndPriceIds = sandwich.getSandwichVegetables().getSandwichVegetables();
			List<SandwichVegetableWithAmountAndPrice> sandwichVegetableWithAmountAndPrices = new ArrayList<SandwichVegetableWithAmountAndPrice>();
			fillSandwichVegetableWIthAmountAndPriceList(sandwichVegetableIdWithAmountAndPriceIds, sandwichVegetableWithAmountAndPrices);
			List<SandwichSauceIdWithAmountAndPrice> sandwichSauceIdWithAmountAndPriceIds = sandwich.getSandwichSauces().getSandwichSauces();
			List<SandwichSauceWithAmountAndPrice> sandwichSauceWithAmountAndPrices = new ArrayList<SandwichSauceWithAmountAndPrice>();
			fillSandwichSauceWithAmountAndPriceList(sandwichSauceIdWithAmountAndPriceIds, sandwichSauceWithAmountAndPrices);
			List<SandwichSpiceIdWithAmountAndPriceId> sandwichSpiceIdWithAmountAndPriceIds = sandwich.getSandwichSpices().getSandwichSpices();
			List<SandwichSpiceWithAmountAndPrice> sandwichSpiceAmountAndPrices = new ArrayList<SandwichSpiceWithAmountAndPrice>();
			fillSandwichSpiceWithAmountAndPriceList(sandwichSpiceIdWithAmountAndPriceIds, sandwichSpiceAmountAndPrices);
			setPropertiesForSandwichEntity(sandwichEntity, sandwichBread, sizeAndPrice, sandwichSausageWithAmountAndPrices, sandwichVegetableWithAmountAndPrices,
					sandwichSauceWithAmountAndPrices, sandwichSpiceAmountAndPrices, customer);
			
			dataSaverDao.saveCustomerSandwich(sandwichEntity);
		} catch(Exception ex) {
			logger.error(ex.getMessage());
		}
	}

	/**
	 * @param sandwichEntity
	 * @param sandwichBread
	 * @param sizeAndPrice
	 * @param sandwichSausageWithAmountAndPrices
	 * @param sandwichVegetableWithAmountAndPrices
	 * @param sandwichSauceWithAmountAndPrices
	 * @param sandwichSpiceAmountAndPrices
	 */
	private void setPropertiesForSandwichEntity(
			com.gngapps.yours.entities.CustomerSandwich sandwichEntity,
			SandwichBread sandwichBread,
			SandwichBreadSizeAndPrice sizeAndPrice,
			List<SandwichSausageWithAmountAndPrice> sandwichSausageWithAmountAndPrices,
			List<SandwichVegetableWithAmountAndPrice> sandwichVegetableWithAmountAndPrices,
			List<SandwichSauceWithAmountAndPrice> sandwichSauceWithAmountAndPrices,
			List<SandwichSpiceWithAmountAndPrice> sandwichSpiceAmountAndPrices,
			Customer customer) {
		sandwichEntity.setCustomer(customer);
		sandwichEntity.setSandwichBread(sandwichBread);
		sandwichEntity.setSandwichBreadSizeAndPrice(sizeAndPrice);
		sandwichEntity.setSandwichSausages(sandwichSausageWithAmountAndPrices);
		sandwichEntity.setSandwichVegetables(sandwichVegetableWithAmountAndPrices);
		sandwichEntity.setSandwichSauce(sandwichSauceWithAmountAndPrices);
		sandwichEntity.setSandwichSpices(sandwichSpiceAmountAndPrices);
	}

	/**
	 * @param sandwichSpiceIdWithAmountAndPriceIds
	 * @param sandwichSpiceAmountAndPrices
	 */
	private void fillSandwichSpiceWithAmountAndPriceList(List<SandwichSpiceIdWithAmountAndPriceId> sandwichSpiceIdWithAmountAndPriceIds, List<SandwichSpiceWithAmountAndPrice> sandwichSpiceAmountAndPrices) {
		for(SandwichSpiceIdWithAmountAndPriceId sandwichSpiceIdWithAmountAndPriceId : sandwichSpiceIdWithAmountAndPriceIds) {
			Integer sandwichSpiceId = sandwichSpiceIdWithAmountAndPriceId.getSandwichSpiceId();
			Integer sandwichSpiceAmountAndPriceId = sandwichSpiceIdWithAmountAndPriceId.getSandwichSpiceAmountAndPriceId();
			if(sandwichSpiceId == null || sandwichSpiceAmountAndPriceId == null) {
				throw new IllegalArgumentException("sandwichSpiceId or sandwichSpiceAmountAndPriceId is null");
			}
			SandwichSpice sandwichSpice = dataGetterDao.findSandwichSpiceById(sandwichSpiceId);
			SandwichSpiceAmountAndPrice amountAndPrice = dataGetterDao.findSandwichSpiceAmountAndPriceById(sandwichSpiceAmountAndPriceId);
			SandwichSpiceWithAmountAndPrice sandwichSpiceWithAmountAndPrice = new SandwichSpiceWithAmountAndPrice();
			sandwichSpiceWithAmountAndPrice.setSandwichSpice(sandwichSpice);
			sandwichSpiceWithAmountAndPrice.setSandwichSpiceAmountAndPrice(amountAndPrice);
			sandwichSpiceAmountAndPrices.add(sandwichSpiceWithAmountAndPrice);
		}
	}

	/**
	 * @param sandwichSauceIdWithAmountAndPriceIds
	 * @param sandwichSauceWithAmountAndPrices
	 */
	private void fillSandwichSauceWithAmountAndPriceList(List<SandwichSauceIdWithAmountAndPrice> sandwichSauceIdWithAmountAndPriceIds, List<SandwichSauceWithAmountAndPrice> sandwichSauceWithAmountAndPrices) {
		for(SandwichSauceIdWithAmountAndPrice sandwichSauceIdWithAmountAndPrice : sandwichSauceIdWithAmountAndPriceIds) {
			Integer sandwichSauceId = sandwichSauceIdWithAmountAndPrice.getSandwichSauceId();
			Integer sandwichSauceAmountAndPriceId = sandwichSauceIdWithAmountAndPrice.getSandwichSauceAmountAndPriceId();
			if(sandwichSauceId == null || sandwichSauceAmountAndPriceId == null) {
				throw new IllegalArgumentException("sandwichSauceId or sandwichSauceAmountAndPriceId is null");
			}
			SandwichSauce sandwichSauce = dataGetterDao.findSandwichSauceById(sandwichSauceId);
			SandwichSauceAmountAndPrice amountAndPrice = dataGetterDao.findSandwichSauceAmountAndPriceById(sandwichSauceAmountAndPriceId);
			SandwichSauceWithAmountAndPrice sandwichSauceWithAmountAndPrice = new SandwichSauceWithAmountAndPrice();
			sandwichSauceWithAmountAndPrice.setSandwichSauce(sandwichSauce);
			sandwichSauceWithAmountAndPrice.setSandwichSauceAmountAndPrice(amountAndPrice);
			sandwichSauceWithAmountAndPrices.add(sandwichSauceWithAmountAndPrice);
		}
	}

	/**
	 * @param sandwichVegetableIdWithAmountAndPriceIds
	 * @param sandwichVegetableWithAmountAndPrices
	 */
	private void fillSandwichVegetableWIthAmountAndPriceList(List<SandwichVegetableIdWithAmountAndPriceId> sandwichVegetableIdWithAmountAndPriceIds, List<SandwichVegetableWithAmountAndPrice> sandwichVegetableWithAmountAndPrices) {
		for(SandwichVegetableIdWithAmountAndPriceId sandwichVegetableIdWithAmountAndPriceId : sandwichVegetableIdWithAmountAndPriceIds) {
			Integer sandwichVegetableId = sandwichVegetableIdWithAmountAndPriceId.getSandwichVegetableId();
			Integer sandwichVegetableAmountAndPriceId = sandwichVegetableIdWithAmountAndPriceId.getSandwichVegetableAmountAndPriceId();
			if(sandwichVegetableId == null || sandwichVegetableAmountAndPriceId == null) {
				throw new IllegalArgumentException("sandwichVegetableId or sandwichVegetableAmountAndPriceId is null");
			}
			SandwichVegetable sandwichVegetable = dataGetterDao.findSandwichVegetableById(sandwichVegetableId);
			SandwichVegetableAmountAndPrice amountAndPrice = dataGetterDao.findSandwichVegetableAmountAndPriceById(sandwichVegetableAmountAndPriceId);
			SandwichVegetableWithAmountAndPrice sandwichVegetableWithAmountAndPrice = new SandwichVegetableWithAmountAndPrice();
			sandwichVegetableWithAmountAndPrice.setSandwichVegetable(sandwichVegetable);
			sandwichVegetableWithAmountAndPrice.setSandwichVegetableAmountAndPrice(amountAndPrice);
			sandwichVegetableWithAmountAndPrices.add(sandwichVegetableWithAmountAndPrice);
		}
	}

	/**
	 * @param sandwichSausages
	 * @param sandwichSausageWithAmountAndPrices
	 */
	private void fillSandwichSausageWithAmountAndPriceList(List<SandwichSausageIdWithAmountAndPriceId> sandwichSausages, List<SandwichSausageWithAmountAndPrice> sandwichSausageWithAmountAndPrices) {
		for(SandwichSausageIdWithAmountAndPriceId sandwichSausageWithAmountAndPriceId : sandwichSausages) {
			Integer sandwichSausageId = sandwichSausageWithAmountAndPriceId.getSandwichSausageId();
			Integer sandwichSausageAmountAndPriceId = sandwichSausageWithAmountAndPriceId.getSandwichSausageAmountAndPriceId();
			if(sandwichSausageId == null || sandwichSausageAmountAndPriceId == null) {
				throw new IllegalArgumentException("sandwichSausageId or sandwichSausageAmountAndPriceId is null");
			}
			SandwichSausage sandwichSausage = dataGetterDao.findSandwichSausageById(sandwichSausageId);
			SandwichSausageAmountAndPrice amountAndPrice = dataGetterDao.findSandwichSausageAmountAndPriceById(sandwichSausageAmountAndPriceId);
			SandwichSausageWithAmountAndPrice sandwichSausageWithAmountAndPrice = new SandwichSausageWithAmountAndPrice();
			sandwichSausageWithAmountAndPrice.setSandwichSausage(sandwichSausage);
			sandwichSausageWithAmountAndPrice.setAmountAndPrice(amountAndPrice);
			sandwichSausageWithAmountAndPrices.add(sandwichSausageWithAmountAndPrice);
		}
	}

	@Override
	@Transactional
	public void saveCustomerSalad(SaladJson salad, String username) {
		try {
			Customer customer = findCustomerByUsername(username);
			CustomerSalad customerSalad = new CustomerSalad();
			List<SaladIngredientIdWithAmountAndPriceId> saladIngredientIdWithAmountAndPriceIds = salad.getSaladIngredients().getSaladIngredients();
			List<SaladIngredientWithAmountAndPrice> saladIngredientWithAmountAndPrices = new ArrayList<SaladIngredientWithAmountAndPrice>();
			for(SaladIngredientIdWithAmountAndPriceId saladIngredientIdWithAmountAndPriceId : saladIngredientIdWithAmountAndPriceIds) {
				Integer saladIngredientId = saladIngredientIdWithAmountAndPriceId.getSaladIngredientId();
				Integer saladIngredientAmountAndPriceId = saladIngredientIdWithAmountAndPriceId.getSaladIngredientAmountAndPriceId();
				if(saladIngredientId == null || saladIngredientAmountAndPriceId == null) {
					throw new IllegalArgumentException("saladIngredientId or saladIngredientAmountAndPriceId is null");
				}
				SaladIngredient saladIngredient = dataGetterDao.findSaladIngredientById(saladIngredientId);
				SaladIngredientAmountAndPrice amountAndPrice = dataGetterDao.findSaladIngredientAmountAndPriceById(saladIngredientAmountAndPriceId);
				SaladIngredientWithAmountAndPrice saladIngredientWithAmountAndPrice = new SaladIngredientWithAmountAndPrice();
				saladIngredientWithAmountAndPrice.setSaladIngredient(saladIngredient);
				saladIngredientWithAmountAndPrice.setAmountAndPrice(amountAndPrice);
				saladIngredientWithAmountAndPrices.add(saladIngredientWithAmountAndPrice);
			}
			customerSalad.setCustomer(customer);
			customerSalad.setIngredientWithAmountAndPrices(saladIngredientWithAmountAndPrices);
			dataSaverDao.saveCustomerSalad(customerSalad);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}

	@Override
	@Transactional
	public void saveCustomerDrink(DrinksJson drinkJson, String username) {
		try {
			DrinkIdWithDrinkSizeAndPriceId drinkIdWithDrinkSizeAndPriceId = drinkJson.getDrink();
			Integer drinkId = drinkIdWithDrinkSizeAndPriceId.getDrinkId();
			Integer drinkSizeAndPriceId = drinkIdWithDrinkSizeAndPriceId.getDrinkSizeAndPriceId();
			if(drinkId == null || drinkSizeAndPriceId == null) {
				throw new IllegalArgumentException("drinkId or drinkSizeAndPriceId is  null");
			}
			Drink drink = dataGetterDao.findDrinkById(drinkId);
			DrinkSizeAndPrice sizeAndPrice = dataGetterDao.findDrinkSizeAndPriceById(drinkSizeAndPriceId);
			DrinkWithSizeAndPrice drinkWithSizeAndPrice = new DrinkWithSizeAndPrice();
			drinkWithSizeAndPrice.setDrink(drink);
			drinkWithSizeAndPrice.setSizeAndPrice(sizeAndPrice);
			List<DrinkAddonIdWithAmountAndSizeId> addonIdsWithDrinkSizeAndPriceIds = drinkJson.getDrinkAddons().getDrinkAddons();
			List<DrinkAddonWithAmountAndPrice> drinkAddonWithAmountAndPrices = new ArrayList<DrinkAddonWithAmountAndPrice>();
			for(DrinkAddonIdWithAmountAndSizeId drinkAddonIdWithAmountAndSizeId : addonIdsWithDrinkSizeAndPriceIds) {
				Integer addonId = drinkAddonIdWithAmountAndSizeId.getDrinkAddonId();
				Integer addonAmountAndPriceId = drinkAddonIdWithAmountAndSizeId.getDrinkAddonAmountAndPriceId();
				DrinkAddOn drinkAddOn = dataGetterDao.findDrinkAddOnById(addonId);
				DrinkAddOnAmountAndPrice addOnAmountAndPrice = dataGetterDao.findDrinkAddOnAmountAndPriceById(addonAmountAndPriceId);
				DrinkAddonWithAmountAndPrice addonWithAmountAndPrice = new DrinkAddonWithAmountAndPrice();
				addonWithAmountAndPrice.setDrinkAddOn(drinkAddOn);
				addonWithAmountAndPrice.setAddOnAmountAndPrice(addOnAmountAndPrice);
				drinkAddonWithAmountAndPrices.add(addonWithAmountAndPrice);
			}
			Customer customer = findCustomerByUsername(username);
			CustomerDrink customerDrink = new CustomerDrink();
			customerDrink.setCustomer(customer);
			customerDrink.setDrinkWithSizeAndPrice(drinkWithSizeAndPrice);
			customerDrink.setAddonWithAmountAndPrices(drinkAddonWithAmountAndPrices);
			dataSaverDao.saveCustomerDrink(customerDrink);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}

	@Override
	@Transactional
	public void addNewDrinkAddOn(String nameGeo, String nameRus, String nameEng, String descriptionGeo, String descriptionEng, String descriptionRus, Integer drinkId) {
		Drink drink = dataGetterDao.findDrinkById(drinkId);
		DrinkAddOn addOn = new DrinkAddOn();
		addOn.setNameEng(nameEng);
		addOn.setNameGeo(nameGeo);
		addOn.setNameRus(nameRus);
		addOn.setDescriptionEng(descriptionEng);
		addOn.setDescriptionGeo(descriptionGeo);
		addOn.setDescriptionRus(descriptionRus);
		addOn.setDrink(drink);
		dataSaverDao.saveDrinkAddOn(addOn);
	}

	@Override
	@Transactional
	public void saveCustomerHotdog(HotdogJson hotdogJson, String username) {
		try {
			Integer hotdogBreadId = hotdogJson.getHotdogBread().getHotdogBreadId();
			Integer hotdogBreadSizeAndPriceId = hotdogJson.getHotdogBread().getHotdogBreadSizeAndPriceId();
			if(hotdogBreadId == null || hotdogBreadSizeAndPriceId == null) {
				throw new IllegalArgumentException("hotdogBreadId or hotdogBreadSizeAndPriceId is  null");
			}
			HotDogBread bread = dataGetterDao.findHotdogBreadById(hotdogBreadId);
			HotdogBreadSizeAndPrice sizeAndPrice = dataGetterDao.findHotdogBreadSizeAndPriceById(hotdogBreadSizeAndPriceId); 
			Integer hotdogSausageId = hotdogJson.getHotdogSausage().getHotdogSausageId();
			Integer hotdogSausageAmountAndPriceId = hotdogJson.getHotdogSausage().getHotdogSausageAmountAndPriceId();
			if(hotdogSausageId == null || hotdogSausageAmountAndPriceId == null) {
				throw new IllegalArgumentException("hotdogSausageId or hotdogSausageAmountAndPriceId is  null");
			}
			HotDogSausage sausage = dataGetterDao.findHotdogSausageById(hotdogSausageId);
			HotDogSausageAmountAndPrice amountAndPrice = dataGetterDao.findHotdogSausageAmountAndPriceById(hotdogSausageAmountAndPriceId);
			List<HotdogSauceJson> hotdogSauces = hotdogJson.getHotdogSauces();
			List<HotDogSauceWithAmountAndPrice> sauceWithAmountAndPrices = new ArrayList<HotDogSauceWithAmountAndPrice>();
			for(HotdogSauceJson sauceJson : hotdogSauces) {
				Integer hotdogSauceId = sauceJson.getHotdogSauceId();
				Integer hotdogSauceAmountAndPriceId = sauceJson.getHotdogSauceAmountAndPriceId();
				HotDogSauce sauce = dataGetterDao.findHotdogSauceById(hotdogSauceId);
				HotdogSauceAmountAndPrice sauceAmountAndPrice = dataGetterDao.findHotdogSauceAmountAndPriceById(hotdogSauceAmountAndPriceId);
				HotDogSauceWithAmountAndPrice withAmountAndPrice = new HotDogSauceWithAmountAndPrice();
				withAmountAndPrice.setSauce(sauce);
				withAmountAndPrice.setAmountAndPrice(sauceAmountAndPrice);
				sauceWithAmountAndPrices.add(withAmountAndPrice);
			}
			Customer customer = findCustomerByUsername(username);
			CustomerHotdog customerHotdog = new CustomerHotdog();
			customerHotdog.setCustomer(customer);
			customerHotdog.setBread(bread);
			customerHotdog.setSizeAndPrice(sizeAndPrice);
			customerHotdog.setSausage(sausage);
			customerHotdog.setAmountAndPrice(amountAndPrice);
			customerHotdog.setAmountAndPrices(sauceWithAmountAndPrices);
			dataSaverDao.saveCustomerHotdog(customerHotdog);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}

	@Override
	public Map<String, Object> getCustomerMeals(String customerUsername) {
		Customer customer = dataGetterDao.findCustomerByUsername(customerUsername);
		Map<String, Object> customerMeals = new LinkedHashMap<String, Object>();
		if(customer != null) {
			customerMeals.put("sandwiches", customer.getSandwichs());
			customerMeals.put("salads", customer.getSalads());
			customerMeals.put("drinks", customer.getDrinks());
			customerMeals.put("hotdogs", customer.getHotdogs());
		}
		return customerMeals;
	}

	@Override
	@Transactional
	public void removeCustomerSandwich(Integer customerSandwichId) {
		try {
			if(customerSandwichId == null) {
				throw new IllegalArgumentException("customerSandwichId is null");
			}
			dataRemoverDao.removeCustomerSandwich(customerSandwichId);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}

	@Override
	@Transactional
	public void removeCustomerSalad(Integer customerSaladId) {
		try {
			if(customerSaladId == null) {
				throw new IllegalArgumentException("customerSaladId is null");
			}
			dataRemoverDao.removeCustomerSalad(customerSaladId);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}

	@Override
	@Transactional
	public void removeCustomerDrink(Integer customerDrinkId) {
		try {
			if(customerDrinkId == null) {
				throw new IllegalArgumentException("customerDrinkId is null");
			}
			dataRemoverDao.removeCustomerDrink(customerDrinkId);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}	
	}

	@Override
	@Transactional
	public void removeCustomerHotdog(Integer customerHotdogId) {
		try {
			if(customerHotdogId == null) {
				throw new IllegalArgumentException("customerHotdogId is null");
			}
			dataRemoverDao.removeCustomerHotdog(customerHotdogId);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}

	@Override
	@Transactional
	public List<CustomerOrder> getCustomerActiveOrders() {
		try {
			return dataGetterDao.getCustomerActiveOrders();
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
		return Collections.emptyList();
	}

	@Override
	@Transactional
	public void createCustomerOrder(String username, CustoemrOrderJson customerFoodsAndDrinks) {
		try {
			List<CustomerSandwich> customerSandwichs = buildCustomerSandwichOrder(customerFoodsAndDrinks);
			List<Integer> saladIds = customerFoodsAndDrinks.getSaladIds();
			List<CustomerSalad> customerSalads = new LinkedList<CustomerSalad>();
			Customer customer = findCustomerByUsername(username);
			for(Integer saladId : saladIds) {
				CustomerSalad salad = dataGetterDao.findCustomerSaladById(saladId);
				customerSalads.add(salad);
			}
			List<Integer> drinkIds = customerFoodsAndDrinks.getDrinkIds();
			List<CustomerDrink> customerDrinks = new LinkedList<CustomerDrink>();
			for(Integer drinkId : drinkIds) {
				CustomerDrink drink = dataGetterDao.findCustomerDrinkById(drinkId);
				customerDrinks.add(drink);
			}
			List<Integer> hotdogIds = customerFoodsAndDrinks.getHotdogIds();
			List<CustomerHotdog> customerHotdogs = new LinkedList<CustomerHotdog>();
			for(Integer hotdogId : hotdogIds) {
				CustomerHotdog hotdog = dataGetterDao.findCustomerHotdogById(hotdogId);
				customerHotdogs.add(hotdog);
			}
			String customerPhoneNumebr = customerFoodsAndDrinks.getCustomerPhoneNumber();
			Phone phone = dataGetterDao.findPhoneByPhoneNumber(customerPhoneNumebr);
			if(customer.getPhoneNumbers().contains(phone)) {
				phone.setCustomer(customer);
				phone.setPhoneNumber(customerPhoneNumebr);
				customer.getPhoneNumbers().add(phone);
			}
			String customerShipmentAddress = customerFoodsAndDrinks.getCustomerShipmentAddress();
			if(!customer.getAddresses().contains(customerShipmentAddress)) {
				Address address = new Address();
				address.setAddress(customerShipmentAddress);
				address.setCustomer(customer);
				customer.getAddresses().add(address);
			}
			CustomerOrder order = new CustomerOrder();
			order.setActiveOrder(true);
			order.setCustomer(customer);
			order.setCustomerSandwichs(customerSandwichs);
			order.setCustomerSalads(customerSalads);
			order.setCustomerDrinks(customerDrinks);
			order.setCustomerHotdogs(customerHotdogs);
			order.setDate(new Date());
			order.setPhoneNumber(customerFoodsAndDrinks.getCustomerPhoneNumber());
			order.setShipmentAddress(customerFoodsAndDrinks.getCustomerShipmentAddress());
			dataSaverDao.saveCustomerOrder(order);
			
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}

	private List<CustomerSandwich> buildCustomerSandwichOrder(CustoemrOrderJson customerFoodsAndDrinks) {
		List<Integer> sandwichIds = customerFoodsAndDrinks.getSandwichIds();
		List<CustomerSandwich> customerSandwichs = new LinkedList<CustomerSandwich>();
		for(Integer sandwichId : sandwichIds) {
			CustomerSandwich sandwich = dataGetterDao.findSandwichById(sandwichId);
			customerSandwichs.add(sandwich);
		}
		return customerSandwichs;
	}

}
