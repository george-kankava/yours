package com.gngapps.yours.service;

import java.math.BigDecimal;
import java.util.List;

import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichBreadSizeAndPrice;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSausage;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichVegetable;

public interface DatabaseService {
	Customer findCustomerByUsername(String username);
	Customer registerCustomer(Customer customer);
	SandwichBread addNewSandwichBreadType(SandwichBread sandwichBread);
	List<SandwichBread> getSandwichBreads();
	List<SandwichSausage> getSandwichSausages();
	List<SandwichVegetable> getSandwichVegetables();
	List<SandwichSauce> getSandwichSauces();
	List<SandwichSpice> getsandwichSpices();
	SandwichBreadSizeAndPrice addNewSandwichBreadSizeAndPrice(Integer sandwichBreadId, Integer size, Integer price);
	void addNewSandwichSausageSizeAndPrice(Integer sandwichSausageId, Integer sandwichSausageAmount, Integer sandwichSausagePrice);
	void addNewSandwichVegetableAmountAndPrice(Integer sandwichVegetableId, String amount, BigDecimal price);
	SandwichVegetable addSandwichVegetable(SandwichVegetable sandwichVegetable);
	void addNewSandwichSauce(SandwichSauce sandwichSauce);
	void addNewSandwichSauceAmountAndPrice(Integer sandwichSauceId, String amount, BigDecimal price);
	void addNewSandwichSpice(SandwichSpice sandwichSpice);
	void addNewSandwichSpiceAmountAndPrice(Integer sandwichSpiceId, String amount, BigDecimal price);
	void removeSandwichBreadSizeAndPrice(Integer sandwichBreadSizeAndPrice);
	void removeSandwichBread(Integer sandwichBreadId);
}
