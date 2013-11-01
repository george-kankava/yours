package com.gngapps.yours.dao;

import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichBreadSizeAndPrice;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSauceAmountAndPrice;
import com.gngapps.yours.entities.SandwichSausageAmountAndPrice;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichSpiceAmountAndPrice;
import com.gngapps.yours.entities.SandwichVegetable;
import com.gngapps.yours.entities.SandwichVegetableAmountAndPrice;


public interface DataSaverDao {
	
	Customer saveCustomer(Customer customer);
	Customer findCustomerByUsername(String username);
	SandwichBread saveSandwichBreadType(SandwichBread sandwichBread);
	void saveSandwichBreadSizeAndPrice(SandwichBreadSizeAndPrice sandwichBreadSizeAndPrice);
	void saveSandwichSausageAmountAndPrice(SandwichSausageAmountAndPrice sandwichSausageAmountAndPrice);
	void saveSanwichVegetableAmountAndPrice(SandwichVegetableAmountAndPrice svaap);
	SandwichVegetable saveSandwichVegetable(SandwichVegetable sandwichVegetable);
	void saveSandwichSauce(SandwichSauce sandwichSauce);
	void saveSandwichSauceAmountAndPrice(SandwichSauceAmountAndPrice amountAndPrice);
	void saveSandwichSpice(SandwichSpice sandwichSpice);
	void saveSanwichVegetableAmountAndPrice(SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice);
}
