package com.gngapps.yours.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSausage;
import com.gngapps.yours.entities.SandwichSausageAmountAndPrice;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichVegetable;

@Repository("dataGetterDao")
public class DataGetterJPA implements DataGetterDao {
	
	@PersistenceContext
	private EntityManager em;
	
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
}
