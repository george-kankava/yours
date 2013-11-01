package com.gngapps.yours.dao;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.Role;
import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichBreadSizeAndPrice;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSauceAmountAndPrice;
import com.gngapps.yours.entities.SandwichSausageAmountAndPrice;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichSpiceAmountAndPrice;
import com.gngapps.yours.entities.SandwichVegetable;
import com.gngapps.yours.entities.SandwichVegetableAmountAndPrice;


@Repository(value="dataSaverDao")
public class DataSaverJPA implements DataSaverDao {
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
	public Customer saveCustomer(Customer customer) {
		Role role = new Role();
		role.setRole(2);
		em.persist(role);
		customer.setRole(role);
		em.persist(customer);
		return customer;
	}

	@Override
	public SandwichBread saveSandwichBreadType(SandwichBread sandwichBread) {
		if(sandwichBread.getId() != null) {
			em.merge(sandwichBread);
		} else {
			em.persist(sandwichBread);
		}
		return sandwichBread;
	}

	@Override
	public void saveSandwichBreadSizeAndPrice(SandwichBreadSizeAndPrice sandwichBreadSizeAndPrice) {
		if(sandwichBreadSizeAndPrice.getId() != null) {
			em.merge(sandwichBreadSizeAndPrice);
		} else {
			em.persist(sandwichBreadSizeAndPrice);
		}
	}

	@Override
	public void saveSandwichSausageAmountAndPrice(SandwichSausageAmountAndPrice sandwichSausageAmountAndPrice) {
		if(sandwichSausageAmountAndPrice.getId() != null) {
			em.merge(sandwichSausageAmountAndPrice);
		} else {
			em.persist(sandwichSausageAmountAndPrice);
		}
	}

	@Override
	public void saveSanwichVegetableAmountAndPrice(SandwichVegetableAmountAndPrice svaap) {
		if(svaap.getId() != null) {
			em.merge(svaap);
		} else {
			em.persist(svaap);
		}
	}

	@Override
	public SandwichVegetable saveSandwichVegetable(SandwichVegetable sandwichVegetable) {
		if(sandwichVegetable.getId() != null) {
			em.merge(sandwichVegetable);
		} else {
			em.persist(sandwichVegetable);
		}
		return sandwichVegetable;
	}
	
	@Override
	public void saveSandwichSauce(SandwichSauce sandwichSauce) {
		if(sandwichSauce.getId() != null) {
			em.merge(sandwichSauce);
		} else {
			em.persist(sandwichSauce);
		}
	}
	
	@Override
	public void saveSandwichSauceAmountAndPrice(SandwichSauceAmountAndPrice amountAndPrice) {
		if(amountAndPrice.getId() != null) {
			em.merge(amountAndPrice);
		} else {
			em.persist(amountAndPrice);
		}
	}

	@Override
	public void saveSandwichSpice(SandwichSpice sandwichSpice) {
		if(sandwichSpice.getId() != null) {
			em.merge(sandwichSpice);
		} else {
			em.persist(sandwichSpice);
		}
	}

	@Override
	public void saveSanwichVegetableAmountAndPrice(SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice) {
		if(sandwichSpiceAmountAndPrice.getId() != null) {
			em.merge(sandwichSpiceAmountAndPrice);
		} else {
			em.persist(sandwichSpiceAmountAndPrice);
		}
	}

}
