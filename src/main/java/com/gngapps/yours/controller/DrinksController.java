package com.gngapps.yours.controller;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.gngapps.yours.databinding.json.request.DrinksJson;
import com.gngapps.yours.entities.Drink;
import com.gngapps.yours.entities.DrinkAddOn;
import com.gngapps.yours.entities.DrinkAddOnAmountAndPrice;
import com.gngapps.yours.entities.DrinkSizeAndPrice;
import com.gngapps.yours.entities.FoodComponentImage;
import com.gngapps.yours.service.DatabaseService;
import com.gngapps.yours.service.impl.YoursHelper;

@Controller
public class DrinksController {

	@Autowired
	private DatabaseService databaseService;
	
	@Autowired
	private LocaleResolver localeResolver;
	
	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	private YoursHelper helper;
	
	@Autowired
	private ServletContext servletContext;

	private static final Logger logger = LoggerFactory.getLogger(DrinksController.class);
	
    @ResponseBody
    @RequestMapping(value = "/process-add-drink", consumes = "application/json", produces = {"application/json;charset=UTF-8"}, method = RequestMethod.POST)
	public String processAddDrinks(HttpServletRequest request, Principal principal, @RequestBody @Valid DrinksJson drink, BindingResult result) {
    	try {
    		Locale locale = localeResolver.resolveLocale(request);
			if(result.hasErrors()) {
				String messageCode = result.getFieldError().getDefaultMessage();
				String errMessage = messageSource.getMessage(messageCode, null, locale);
				return "{\"drinkErrorMessage\" : \"" + errMessage + "\"}";
			}
    		String username = principal.getName();
        	databaseService.saveCustomerDrink(drink, username);
			String drinkSavedMessage = messageSource.getMessage("yours.food.service.food.componenet.list.drink.saved", null, locale);
			return "{\"drinkSavedMessage\" : \"" + drinkSavedMessage + "\"}";
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			Locale locale = localeResolver.resolveLocale(request);
			String serverError = messageSource.getMessage("yours.food.service.ajax.server.error", null, locale);
			return "{\"drinkSavedMessage\" : \"" + serverError + "\"}";
		}
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping("remove-customer-drink")
    public void removeCustomerDrink(@RequestParam Integer customerDrinkId) {
    	try {
    		databaseService.removeCustomerDrink(customerDrinkId);
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    	}
    }
    
    @RequestMapping(value = "admin/add-drink-form")
	public ModelAndView addDrinkForm(ModelAndView mav) {
    	List<Drink> drinks = databaseService.getDrinks();
    	mav.addObject("drinks", drinks);
    	mav.setViewName("add-drink-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-drink-form", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddDrinkForm(ModelAndView mav, @RequestParam String nameGeo, @RequestParam String nameEng, @RequestParam String nameRus, @RequestParam String descriptionGeo, @RequestParam  String descriptionEng, @RequestParam String descriptionRus, @RequestParam(value="image", required = false) MultipartFile image) {
    	try {
	    	Drink drink = new Drink();
	    	drink.setNameEng(nameEng);
	    	drink.setNameGeo(nameGeo);
	    	drink.setNameRus(nameRus);
	    	drink.setDescriptionEng(descriptionEng);
	    	drink.setDescriptionGeo(descriptionGeo);
	    	drink.setDescriptionRus(descriptionRus);
	    	if(!image.isEmpty()) {
	    		FoodComponentImage foodComponentImage = helper.writeFoodComponentImage(image, servletContext);
	    		databaseService.saveFoodComponentImage(foodComponentImage);
	    		drink.setFoodComponentImage(foodComponentImage);
	    	}
	    	databaseService.addNewDrink(drink);
	    	mav.addObject("drink", drink);
	    	mav.setViewName("add-drink-response");
	    	return mav;
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("add-drink-response");
	    	return mav;
    	}
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-drink-size-and-price", produces={"application/json"})
	public DrinkSizeAndPrice processAddDrinkSizeAndPrice(@RequestParam Integer drinkId, @RequestParam String size, @RequestParam BigDecimal price) {
    	DrinkSizeAndPrice drinkSizeAndPrice = databaseService.addNewDrinkSizeAndPrice(drinkId, size, price);
    	return drinkSizeAndPrice;
    	
	}
    
    @RequestMapping("admin/remove-drink")
    @ResponseStatus(HttpStatus.OK)
    public void removeDrink(@RequestParam Integer drinkId) {
    	databaseService.removeDrink(drinkId);
    }
    
    @RequestMapping("admin/remove-drink-size-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeDrinkSizeAndPrice(@RequestParam(required=true) Integer drinkSizeAndPriceId) {
    	databaseService.removeDrinkSizeAndPrice(drinkSizeAndPriceId);
    }
    
    @RequestMapping(value = "admin/add-drink-addon-form")
	public ModelAndView addDrinkAddonForm(ModelAndView mav) {
    	List<Drink> drinks = databaseService.getDrinks();
    	mav.addObject("drinks", drinks);
    	List<DrinkAddOn> drinkAddons = databaseService.getDrinkAddOns();
    	mav.addObject("drinkAddOns", drinkAddons);
    	mav.setViewName("add-drink-addon-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-drink-add-on-form", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddDrinkAddOnForm(ModelAndView mav, @RequestParam String nameGeo, @RequestParam String nameEng, @RequestParam String nameRus, @RequestParam String descriptionGeo, @RequestParam  String descriptionEng, @RequestParam String descriptionRus, @RequestParam Integer drinkId, @RequestParam(value="image", required = false) MultipartFile image) {
    	try {
    		DrinkAddOn drinkAddon = new DrinkAddOn();
    		drinkAddon.setNameEng(nameEng);
    		drinkAddon.setNameGeo(nameGeo);
    		drinkAddon.setNameRus(nameRus);
    		drinkAddon.setDescriptionEng(descriptionEng);
    		drinkAddon.setDescriptionGeo(descriptionGeo);
    		drinkAddon.setDescriptionRus(descriptionRus);
    		if(!image.isEmpty()) {
    			FoodComponentImage foodComponentImage = helper.writeFoodComponentImage(image, servletContext);
    			databaseService.saveFoodComponentImage(foodComponentImage);
    			drinkAddon.setFoodComponentImage(foodComponentImage);
    		}
    		databaseService.addNewDrinkAddOn(drinkId, drinkAddon);
    		mav.addObject("drinkAddOn", drinkAddon);
    		mav.setViewName("add-drink-add-on-response");
    		return mav;
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("add-drink-add-on-response");
        	return mav;
    	}
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-drink-add-on-amount-and-price", produces={"application/json"})
	public DrinkAddOnAmountAndPrice processAddDrinkAddOnAmountAndPrice(@RequestParam Integer drinkAddOnId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	DrinkAddOnAmountAndPrice drinkAddOnAmountAndPrice = databaseService.addNewDrinkAddOnAmountAndPrice(drinkAddOnId, amount, price);
    	return drinkAddOnAmountAndPrice;
	}
    
    @RequestMapping("admin/remove-drink-add-on")
    @ResponseStatus(HttpStatus.OK)
    public void removeDrinkAddOn(@RequestParam Integer drinkAddOnId) {
    	databaseService.removeDrinkAddOn(drinkAddOnId);
    }
    
    @RequestMapping("admin/remove-drink-add-on-amount-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeDrinkAddOnAmountAndPrice(@RequestParam(required=true) Integer drinkAddOnAmountAndPriceId) {
    	databaseService.removeDrinkAddOnAmountAndPrice(drinkAddOnAmountAndPriceId);
    }
}
