package com.gngapps.yours.dao;

import java.util.List;

import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSausage;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichVegetable;

public interface DataGetterDao {

	List<SandwichBread> getSandwichBreads();

	List<SandwichSausage> getSandwichSausages();

	List<SandwichVegetable> getSandwichVegetables();

	List<SandwichSauce> getSandwichSauces();

	List<SandwichSpice> getSandwichSpices();

	SandwichBread findSandwichBreadById(Integer sandwichBreadId);

	SandwichSausage findSandwichSausageById(Integer sandwichSausageId);

	SandwichVegetable findSandwichVegetableById(Integer sandwichVegetableId);

	SandwichSauce findSandwichSauceById(Integer sandwichSauceId);

	SandwichSpice findSandwichSpiceById(Integer sandwichSpiceId);

}
