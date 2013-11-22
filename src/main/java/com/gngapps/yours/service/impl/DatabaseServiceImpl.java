package com.gngapps.yours.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gngapps.yours.controller.YoursController;
import com.gngapps.yours.controller.response.Sandwich;
import com.gngapps.yours.controller.response.SandwichSauceIdWithAmountAndPrice;
import com.gngapps.yours.controller.response.SandwichSausageIdWithAmountAndPriceId;
import com.gngapps.yours.controller.response.SandwichSpiceIdWithAmountAndPriceId;
import com.gngapps.yours.controller.response.SandwichVegetableIdWithAmountAndPriceId;
import com.gngapps.yours.dao.DataGetterDao;
import com.gngapps.yours.dao.DataRemoverDao;
import com.gngapps.yours.dao.DataSaverDao;
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
	public void addNewDrinkAddOn(DrinkAddOn drinkAddOn) {
		dataSaverDao.saveDrinkAddOn(drinkAddOn);
	}

	@Override
	@Transactional
	public DrinkAddOnAmountAndPrice addNewDrinkAddOnAmountAndPrice(Integer drinkAddOnId, String amount, BigDecimal price) {
		DrinkAddOnAmountAndPrice amountAndPrice = new DrinkAddOnAmountAndPrice();
		amountAndPrice.setAmount(amount);
		amountAndPrice.setPrice(price);
		dataSaverDao.saveDrinkAddOnAmountAndPrice(amountAndPrice);
		DrinkAddOn drinkAddOn = dataGetterDao.findDrinkAddOn(drinkAddOnId);
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
	public void saveCustomerSandwich(Sandwich sandwich) {
		try {
			com.gngapps.yours.entities.Sandwich sandwichEntity = new com.gngapps.yours.entities.Sandwich();
			Integer sandwichBreadId = sandwich.getSandwichBread().getSandwichBreadId();
			Integer sandwichBreadSizeAndPriceId = sandwich.getSandwichBread().getSandwichBreadSizeAndPriceId();
			if(sandwichBreadId == null || sandwichBreadSizeAndPriceId == null) {
				throw new IllegalArgumentException("sandwichBreadId or sandwichBreadSizeAndPriceId is null");
			}
			SandwichBread sandwichBread = dataGetterDao.findSandwichBreadById(sandwichBreadId);
			SandwichBreadSizeAndPrice sizeAndPrice = dataGetterDao.findSandwichBreadSizeAndPriceId(sandwichBreadSizeAndPriceId);
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
					sandwichSauceWithAmountAndPrices, sandwichSpiceAmountAndPrices);
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
			com.gngapps.yours.entities.Sandwich sandwichEntity,
			SandwichBread sandwichBread,
			SandwichBreadSizeAndPrice sizeAndPrice,
			List<SandwichSausageWithAmountAndPrice> sandwichSausageWithAmountAndPrices,
			List<SandwichVegetableWithAmountAndPrice> sandwichVegetableWithAmountAndPrices,
			List<SandwichSauceWithAmountAndPrice> sandwichSauceWithAmountAndPrices,
			List<SandwichSpiceWithAmountAndPrice> sandwichSpiceAmountAndPrices) {
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

}
