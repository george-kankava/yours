package com.gngapps.yours.service.impl;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gngapps.yours.dao.DataGetterDao;
import com.gngapps.yours.dao.DataRemoverDao;
import com.gngapps.yours.dao.DataSaverDao;
import com.gngapps.yours.entities.Customer;
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
import com.gngapps.yours.service.DatabaseService;

@Service("databaseService")
public class DatabaseServiceImpl implements DatabaseService {

	@Autowired
	private DataSaverDao dataSaverDao;
	
	@Autowired
	private DataGetterDao dataGetterDao;
	
	@Autowired
	private DataRemoverDao dataRemoverDao;

	
	@Override
	public Customer findCustomerByUsername(String username) {
		return dataSaverDao.findCustomerByUsername(username);
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
	public void addNewSandwichSauce(SandwichSauce sandwichSauce) {
		dataSaverDao.saveSandwichSauce(sandwichSauce);
	}
	
	@Override
	@Transactional
	public void addNewSandwichSauceAmountAndPrice(Integer sandwichSauceId, String amount, BigDecimal price) {
		SandwichSauceAmountAndPrice amountAndPrice = new SandwichSauceAmountAndPrice();
		amountAndPrice.setPortion(amount);
		amountAndPrice.setPrice(price);
		dataSaverDao.saveSandwichSauceAmountAndPrice(amountAndPrice);
		SandwichSauce sandwichSauce = dataGetterDao.findSandwichSauceById(sandwichSauceId);
		sandwichSauce.getSauceAmountAndPrices().add(amountAndPrice);
	}

	@Override
	public List<SandwichSpice> getsandwichSpices() {
		return dataGetterDao.getSandwichSpices();
	}

	@Override
	@Transactional
	public SandwichBreadSizeAndPrice addNewSandwichBreadSizeAndPrice(Integer sandwichBreadId, Integer size, Integer price) {
		SandwichBreadSizeAndPrice sandwichBreadSizeAndPrice = new SandwichBreadSizeAndPrice();
		sandwichBreadSizeAndPrice.setSize(size);
		sandwichBreadSizeAndPrice.setPrice(new BigDecimal(price));
		dataSaverDao.saveSandwichBreadSizeAndPrice(sandwichBreadSizeAndPrice);
		SandwichBread sandwichBread = dataGetterDao.findSandwichBreadById(sandwichBreadId);
		sandwichBread.getSandwichBreadSizeAndPrices().add(sandwichBreadSizeAndPrice);
		return sandwichBreadSizeAndPrice;
	}

	@Override
	@Transactional
	public void addNewSandwichSausageSizeAndPrice(Integer sandwichSausageId, Integer sandwichSausageAmount, Integer sandwichSausagePrice) {
		SandwichSausageAmountAndPrice sandwichSausageAmountAndPrice = new SandwichSausageAmountAndPrice();
		sandwichSausageAmountAndPrice.setPortion(String.valueOf(sandwichSausageAmount));
		sandwichSausageAmountAndPrice.setPrice(new BigDecimal(sandwichSausagePrice));
		dataSaverDao.saveSandwichSausageAmountAndPrice(sandwichSausageAmountAndPrice);
		SandwichSausage sandwichSausage = dataGetterDao.findSandwichSausageById(sandwichSausageId);
		sandwichSausage.getSausageAmountAndPrices().add(sandwichSausageAmountAndPrice);
	}

	@Override
	@Transactional
	public void addNewSandwichVegetableAmountAndPrice(Integer sandwichVegetableId, String amount, BigDecimal price) {
		SandwichVegetableAmountAndPrice svaap = new SandwichVegetableAmountAndPrice();
		svaap.setPortion(amount);
		svaap.setPrice(price);
		dataSaverDao.saveSanwichVegetableAmountAndPrice(svaap);
		SandwichVegetable sandwichVegetable = dataGetterDao.findSandwichVegetableById(sandwichVegetableId);
		sandwichVegetable.getVegetableAmountAndPrices().add(svaap);
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
	public void addNewSandwichSpiceAmountAndPrice(Integer sandwichSpiceId, String amount, BigDecimal price) {
		SandwichSpiceAmountAndPrice sandwichSpice = new SandwichSpiceAmountAndPrice();
		sandwichSpice.setPortion(amount);
		sandwichSpice.setPrice(price);
		dataSaverDao.saveSanwichVegetableAmountAndPrice(sandwichSpice);
		SandwichSpice sandwichVegetable = dataGetterDao.findSandwichSpiceById(sandwichSpiceId);
		sandwichVegetable.getSpiceAmountAndPrice().add(sandwichSpice);
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

}
