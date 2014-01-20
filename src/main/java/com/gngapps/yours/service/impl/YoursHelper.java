package com.gngapps.yours.service.impl;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.gngapps.yours.AppConstants;
import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.FoodComponentImage;

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
		String token = UUID.randomUUID().toString();
		return token;
	}
	
	public String emptyJson() {
		return "{}";
	}
	
	public FoodComponentImage writeFoodComponentImage(MultipartFile image, ServletContext servletContext) throws Exception {
		StringBuilder foodComponentImageVirtualPath = new StringBuilder();
		foodComponentImageVirtualPath.append(AppConstants.FOOD_COMPONENT_IMAGES_RELATIVE_LOCATION).append(image.getOriginalFilename());
		String foodComponentImageAbsolutePath = servletContext.getRealPath(foodComponentImageVirtualPath.toString());
		OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(foodComponentImageAbsolutePath));
		try {
			outputStream.write(image.getBytes());
			outputStream.flush();
		} finally {
			outputStream.close();
		}
		FoodComponentImage foodComponentImage = new FoodComponentImage();
		foodComponentImage.setImageFileName(image.getOriginalFilename());
		return foodComponentImage;
	}
	
}
