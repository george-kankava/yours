package com.gngapps.yours.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

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

@Repository("dataGetterDao")
public class DataGetterJPA implements DataGetterDao {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Customer findCustomerByUsername(String username) {
		try {
			return (Customer)em.createQuery("FROM Customer c WHERE c.username := username").setParameter("username", username).getSingleResult();
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
	public DrinkAddOn findDrinkAddOn(Integer drinkAddOnId) {
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
	
}
