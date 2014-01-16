package com.gngapps.yours.dao;

import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.CustomerDrink;
import com.gngapps.yours.entities.CustomerHotdog;
import com.gngapps.yours.entities.CustomerOrder;
import com.gngapps.yours.entities.CustomerSalad;
import com.gngapps.yours.entities.CustomerSandwich;
import com.gngapps.yours.entities.DeliveredOrders;
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
import com.gngapps.yours.entities.ChangePasswordToken;
import com.gngapps.yours.entities.Role;
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


@Repository(value="dataSaverDao")
public class DataSaverJPA implements DataSaverDao {
	@PersistenceContext
	private EntityManager em;
	
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
	public SandwichVegetableAmountAndPrice saveSanwichVegetableAmountAndPrice(SandwichVegetableAmountAndPrice svaap) {
		if(svaap.getId() != null) {
			em.merge(svaap);
		} else {
			em.persist(svaap);
		}
		return svaap;
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
	public SandwichSauce saveSandwichSauce(SandwichSauce sandwichSauce) {
		if(sandwichSauce.getId() != null) {
			em.merge(sandwichSauce);
		} else {
			em.persist(sandwichSauce);
		}
		return sandwichSauce;
	}
	
	@Override
	public SandwichSauceAmountAndPrice saveSandwichSauceAmountAndPrice(SandwichSauceAmountAndPrice amountAndPrice) {
		if(amountAndPrice.getId() != null) {
			em.merge(amountAndPrice);
		} else {
			em.persist(amountAndPrice);
		}
		return amountAndPrice;
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

	@Override
	public SandwichSausage saveSandwichSausage(SandwichSausage sandwichSausage) {
		if(sandwichSausage.getId() != null) {
			em.merge(sandwichSausage);
		} else {
			em.persist(sandwichSausage);
		}
		return sandwichSausage;
	}

	@Override
	public void saveSanwichSpiceAmountAndPrice(SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice) {
		if(sandwichSpiceAmountAndPrice.getId() != null) {
			em.merge(sandwichSpiceAmountAndPrice);
		} else {
			em.persist(sandwichSpiceAmountAndPrice);
		}
	}

	@Override
	public void saveSaladIngredient(SaladIngredient saladIngredient) {
		if(saladIngredient.getId() != null) {
			em.merge(saladIngredient);
		} else {
			em.persist(saladIngredient);
		}
	}

	@Override
	public void saveSaladIngredientAmountAndPrice(SaladIngredientAmountAndPrice saladIngredientAmountAndPrice) {
		if(saladIngredientAmountAndPrice.getId() != null) {
			em.merge(saladIngredientAmountAndPrice);
		} else {
			em.persist(saladIngredientAmountAndPrice);
		}
	}

	@Override
	public void SaveDrink(Drink drink) {
		if(drink.getId() != null) {
			em.merge(drink);
		} else {
			em.persist(drink);
		}
	}

	@Override
	public void saveDrinkSizeAndPrice(DrinkSizeAndPrice drinkSizeAndPrice) {
		if(drinkSizeAndPrice.getId() != null) {
			em.merge(drinkSizeAndPrice);
		} else {
			em.persist(drinkSizeAndPrice);
		}
	}

	@Override
	public DrinkAddOn saveDrinkAddOn(DrinkAddOn drinkAddOn) {
		if(drinkAddOn.getId() != null) {
			em.merge(drinkAddOn);
		} else {
			em.persist(drinkAddOn);
		}
		return drinkAddOn;
 	}

	@Override
	public void saveDrinkAddOnAmountAndPrice(DrinkAddOnAmountAndPrice amountAndPrice) {
		if(amountAndPrice.getId() != null) {
			em.merge(amountAndPrice); 
		} else {
			em.persist(amountAndPrice);
		}
	}

	@Override
	public void saveHotdogBread(HotDogBread hotdogBread) {
		if(hotdogBread.getId() != null) {
			em.merge(hotdogBread);
		} else {
			em.persist(hotdogBread);
		}
	}

	@Override
	public void saveHotdogBreadSizeAndPrice(HotdogBreadSizeAndPrice sizeAndPrice) {
		if(sizeAndPrice != null) {
			em.merge(sizeAndPrice);
		} else {
			em.persist(sizeAndPrice);
		}
	}

	@Override
	public void saveHotdogSausage(HotDogSausage hotdogSausage) {
		if(hotdogSausage.getId() != null) {
			em.merge(hotdogSausage);
		} else {
			em.persist(hotdogSausage);
		}
	}

	@Override
	public void saveHotdogSausageAmountAndPrice(HotDogSausageAmountAndPrice amountAndPrice) {
		if(amountAndPrice.getId() != null) {
			em.merge(amountAndPrice);
		} else {
			em.persist(amountAndPrice);
		}
	}

	@Override
	public void saveHotdogSauce(HotDogSauce hotdogSauce) {
		if(hotdogSauce.getId() != null) {
			em.merge(hotdogSauce);
		} else {
			em.persist(hotdogSauce);
		}
	}

	@Override
	public void saveHotdogSauceAmountAndPrice(HotdogSauceAmountAndPrice amountAndPrice) {
		if(amountAndPrice.getId() != null) {
			em.merge(amountAndPrice);
		} else {
			em.persist(amountAndPrice);
		}
	}

	@Override
	public void saveCustomerSandwich(CustomerSandwich sandwich) {
		if(sandwich.getId() != null) {
			em.merge(sandwich);
		} else {
			em.persist(sandwich);
		}
	}

	@Override
	public void saveCustomerSalad(CustomerSalad customerSalad) {
		if(customerSalad.getId() != null) {
			em.merge(customerSalad);
		} else {
			em.persist(customerSalad);
		}
	}

	@Override
	public void saveCustomerDrink(CustomerDrink customerDrink) {
		if(customerDrink.getId() != null) {
			em.merge(customerDrink);
		} else {
			em.persist(customerDrink);
		}
	}

	@Override
	public void saveCustomerHotdog(CustomerHotdog customerHotdog) {
		if(customerHotdog.getId() != null) {
			em.merge(customerHotdog);
		} else {
			em.persist(customerHotdog);
		}
	}

	@Override
	public void saveCustomerOrder(CustomerOrder order) {
		if(order.getId() != null) {
			em.merge(order);
		} else {
			em.persist(order);
		}
	}

	@Override
	public void saveChangePasswordToken(ChangePasswordToken passwordToken) {
		if(passwordToken.getId() != null) {
			em.merge(passwordToken);
		} else {
			em.persist(passwordToken);
		}
	}

	@Override
	public void saveCustomerDeliveredOrder(DeliveredOrders deliveredOrder) {
		if(deliveredOrder.getId() != null) {
			em.merge(deliveredOrder);
		} else {
			em.persist(deliveredOrder);
		}
	}

}
