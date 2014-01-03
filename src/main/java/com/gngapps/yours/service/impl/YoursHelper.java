package com.gngapps.yours.service.impl;

import java.util.Random;

import org.springframework.stereotype.Component;

import com.gngapps.yours.AppConstants;
import com.gngapps.yours.entities.Customer;

@Component("yoursHelper")
public class YoursHelper {
	public String appendLeadingZeroToNumber(Integer randomInt) {
		if(randomInt < 10) {
			return AppConstants.FOUR_ZEROS + randomInt;
		} else if(randomInt < 100) {
			return AppConstants.THREE_ZEROS + randomInt;
		} else if(randomInt < 1000) {
			return AppConstants.TWO_ZEROS + randomInt;
		} else if(randomInt < 10000) {
			return AppConstants.ONE_ZERO + randomInt;
		} else {
			return String.valueOf(randomInt);
		}
	}
	
	/**
	 * @param customer
	 */
	public String generateUniqueCustomerUsername(Customer customer) {
		Random random = new Random();
		Integer randomInt = random.nextInt(AppConstants.CUSTOMER_GENERATOR_MAX_NUMBER);
		String randomString = appendLeadingZeroToNumber(randomInt);
		String firstnameInitial = customer.getFirstname().substring(0, 1).toUpperCase();
		String lastnameInitial = customer.getLastname().substring(0, 1).toUpperCase();
		StringBuilder customerUsername = new StringBuilder();
		customerUsername.append(firstnameInitial).append(lastnameInitial).append(randomString);
		return customerUsername.toString();
	}

	public String generateCustomerPasswordChangeToken(Customer customer) {
		Random random = new Random();
		Integer randomInt = random.nextInt(AppConstants.CUSTOMER_GENERATOR_MAX_NUMBER);
		StringBuilder changePasswordToken = new StringBuilder();
		String customerFistnameFirstInitial = customer.getFirstname().substring(0, 1).toLowerCase();
		String customerLastnameFirstInitial = customer.getLastname().substring(0, 1).toLowerCase();
		changePasswordToken.append(customerFistnameFirstInitial).append(randomInt).append(customerLastnameFirstInitial);
		return changePasswordToken.toString();
	}
}
