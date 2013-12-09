package com.gngapps.yours.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.CustomerDrink;
import com.gngapps.yours.entities.CustomerHotdog;
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

@Repository("dataGetterDao")
public class DataGetterJPA implements DataGetterDao {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Customer findCustomerByUsername(String username) {
		try {
			return (Customer)em.createQuery("FROM Customer c WHERE c.username = :username").setParameter("username", username).getSingleResult();
		} catch(NoResultException e) {
			return null;
		}
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<SandwichBread> getSandwichBreads() {
		String qlString = "FROM SandwichBread sb";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SandwichSausage> getSandwichSausages() {
		String qlString = "FROM SandwichSausage ss";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SandwichVegetable> getSandwichVegetables() {
		String qlString = "FROM SandwichVegetable sv";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SandwichSauce> getSandwichSauces() {
		String qlString = "FROM SandwichSauce ss";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SandwichSpice> getSandwichSpices() {
		String qlString = "FROM SandwichSpice ss";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	public SandwichBread findSandwichBreadById(Integer sandwichBreadId) {
		return em.find(SandwichBread.class, sandwichBreadId);
	}

	@Override
	public SandwichSausage findSandwichSausageById(Integer sandwichSausageId) {
		return em.find(SandwichSausage.class, sandwichSausageId);
	}

	@Override
	public SandwichVegetable findSandwichVegetableById(Integer sandwichVegetableId) {
		return em.find(SandwichVegetable.class, sandwichVegetableId);
	}
	
	@Override
	public SandwichSauce findSandwichSauceById(Integer sandwichSauceId) {
		return em.find(SandwichSauce.class, sandwichSauceId);
	}

	@Override
	public SandwichSpice findSandwichSpiceById(Integer sandwichSpiceId) {
		return em.find(SandwichSpice.class, sandwichSpiceId);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SaladIngredient> getSaladIngredients() {
		String qlString = "FROM SaladIngredient si";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	public SaladIngredient findSaladIngredientById(Integer saladIngredientId) {
		return em.find(SaladIngredient.class, saladIngredientId);
	}

	@Override
	public Drink findDrinkById(Integer drinkId) {
		return em.find(Drink.class, drinkId);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Drink> getDrinks() {
		String qlString = "FROM Drink d";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	public DrinkAddOn findDrinkAddOnById(Integer drinkAddOnId) {
		return em.find(DrinkAddOn.class, drinkAddOnId);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<DrinkAddOn> getDrinkAddOns() {
		String qlString = "FROM DrinkAddOn dao";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	public HotDogBread findHotdogBreadById(Integer hotdogBreadId) {
		return em.find(HotDogBread.class, hotdogBreadId);
	}

	
	@Override
	@SuppressWarnings("unchecked")
	public List<HotDogBread> getHotdogBreads() {
		String qlString = "FROM HotDogBread bread";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	public HotDogSausage findHotdogSausageById(Integer hotdogSausageId) {
		return em.find(HotDogSausage.class, hotdogSausageId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HotDogSausage> getHotdogSausages() {
		String qlString = "FROM HotDogSausage sausage";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	public HotDogSauce findHotdogSauceById(Integer hotdogSauceId) {
		return em.find(HotDogSauce.class, hotdogSauceId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<HotDogSauce> getHotdogSauces() {
		String qlString = "FROM HotDogSauce sauce";
		return em.createQuery(qlString).getResultList();
	}

	@Override
	public SandwichBreadSizeAndPrice findSandwichBreadSizeAndPriceId(Integer sandwichBreadSizeAndPriceId) {
		return em.find(SandwichBreadSizeAndPrice.class, sandwichBreadSizeAndPriceId);
	}

	@Override
	public SandwichSausageAmountAndPrice findSandwichSausageAmountAndPriceById(Integer sandwichSausageAmountAndPriceId) {
		return em.find(SandwichSausageAmountAndPrice.class, sandwichSausageAmountAndPriceId);
	}

	@Override
	public SandwichVegetableAmountAndPrice findSandwichVegetableAmountAndPriceById(Integer sandwichVegetableAmountAndPriceId) {
		return em.find(SandwichVegetableAmountAndPrice.class, sandwichVegetableAmountAndPriceId);
	}

	@Override
	public SandwichSauceAmountAndPrice findSandwichSauceAmountAndPriceById(Integer sandwichSauceAmountAndPriceId) {
		return em.find(SandwichSauceAmountAndPrice.class, sandwichSauceAmountAndPriceId);
	}

	@Override
	public SandwichSpiceAmountAndPrice findSandwichSpiceAmountAndPriceById(Integer sandwichSpiceAmountAndPriceId) {
		return em.find(SandwichSpiceAmountAndPrice.class, sandwichSpiceAmountAndPriceId);
	}

	@Override
	public SaladIngredientAmountAndPrice findSaladIngredientAmountAndPriceById(Integer saladIngredientAmountAndPriceId) {
		return em.find(SaladIngredientAmountAndPrice.class, saladIngredientAmountAndPriceId);
	}

	@Override
	public DrinkSizeAndPrice findDrinkSizeAndPriceById(Integer drinkSizeAndPriceId) {
		return em.find(DrinkSizeAndPrice.class, drinkSizeAndPriceId);
	}

	@Override
	public DrinkAddOnAmountAndPrice findDrinkAddOnAmountAndPriceById(Integer addonAmountAndPriceId) {
		return em.find(DrinkAddOnAmountAndPrice.class, addonAmountAndPriceId);
	}

	@Override
	public HotdogBreadSizeAndPrice findHotdogBreadSizeAndPriceById(Integer hotdogBreadSizeAndPriceId) {
		return em.find(HotdogBreadSizeAndPrice.class, hotdogBreadSizeAndPriceId);
	}

	@Override
	public HotDogSausageAmountAndPrice findHotdogSausageAmountAndPriceById(Integer hotdogSausageAmountAndPriceId) {
		return em.find(HotDogSausageAmountAndPrice.class, hotdogSausageAmountAndPriceId);
	}

	@Override
	public HotdogSauceAmountAndPrice findHotdogSauceAmountAndPriceById(Integer hotdogSauceAmountAndPriceId) {
		return em.find(HotdogSauceAmountAndPrice.class, hotdogSauceAmountAndPriceId);
	}

	@Override
	public Customer findCustomerById(Integer customerId) {
		return em.find(Customer.class, customerId);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<CustomerOrder> getCustomerActiveOrders() {
		return em.createQuery("FROM CustomerOrder co WHERE co.activeOrder := activeOrder").setParameter("activeOrder", true).getResultList();
	}

	@Override
	public CustomerSandwich findSandwichById(Integer sandwichId) {
		CustomerSandwich sandwich = em.find(CustomerSandwich.class, sandwichId);
		return sandwich;
	}

	@Override
	public CustomerSalad findCustomerSaladById(Integer saladId) {
		return em.find(CustomerSalad.class, saladId);
	}

	@Override
	public CustomerDrink findCustomerDrinkById(Integer drinkId) {
		return em.find(CustomerDrink.class, drinkId);
	}

	@Override
	public CustomerHotdog findCustomerHotdogById(Integer hotdogId) {
		return em.find(CustomerHotdog.class, hotdogId);
	}
	
}
