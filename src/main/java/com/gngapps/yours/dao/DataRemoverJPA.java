package com.gngapps.yours.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichBreadSizeAndPrice;

@Repository("dataRemoverDao")
public class DataRemoverJPA implements DataRemoverDao {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public void removeSandwichBreadSizeAndPrice(Integer sandwichBreadSizeAndPrice) {
		SandwichBreadSizeAndPrice breadSizeAndPrice = em.find(SandwichBreadSizeAndPrice.class, sandwichBreadSizeAndPrice);
		em.remove(breadSizeAndPrice);
	}

	@Override
	public void removeSandwichBread(Integer sandwichBreadId) {
		SandwichBread sandwichBread = em.find(SandwichBread.class, sandwichBreadId);
		em.remove(sandwichBread);
	}
}
