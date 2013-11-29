package com.gngapps.yours.controller;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.gngapps.yours.databinding.json.request.DrinkAddonRequestJson;
import com.gngapps.yours.databinding.json.request.DrinksJson;
import com.gngapps.yours.entities.Drink;
import com.gngapps.yours.entities.DrinkAddOn;
import com.gngapps.yours.entities.DrinkAddOnAmountAndPrice;
import com.gngapps.yours.entities.DrinkSizeAndPrice;
import com.gngapps.yours.service.DatabaseService;

@Controller
public class DrinksController {

	@Autowired
	private DatabaseService databaseService;

	private static final Logger logger = LoggerFactory.getLogger(DrinksController.class);
	
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/process-add-drink", consumes = "application/json", method = RequestMethod.POST)
	public void processAddDrinks(Principal principal, @RequestBody DrinksJson drink) {
    	String username = principal.getName();
    	databaseService.saveCustomerDrink(drink, username);
    }
    
    @RequestMapping(value = "admin/add-drink-form")
	public ModelAndView addDrinkForm(ModelAndView mav) {
    	List<Drink> drinks = databaseService.getDrinks();
    	mav.addObject("drinks", drinks);
    	mav.setViewName("add-drink-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-drink-form", method = RequestMethod.POST, consumes = {"application/json"})
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddDrinkForm(ModelAndView mav, @RequestBody Drink drink, BindingResult result) {
    	databaseService.addNewDrink(drink);
    	mav.addObject("drink", drink);
    	mav.setViewName("add-drink-response");
    	return mav;
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
    
    @RequestMapping(value = "admin/process-add-drink-add-on-form", method = RequestMethod.POST, consumes = {"application/json"})
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddDrinkAddOnForm(ModelAndView mav, @RequestBody DrinkAddonRequestJson drinkAddonJson, BindingResult result) {
    	DrinkAddOn drinkAddOn = new DrinkAddOn();
    	databaseService.addNewDrinkAddOn(drinkAddonJson.getNameGeo(), drinkAddonJson.getNameRus(), drinkAddonJson.getNameEng(), 
    			drinkAddonJson.getDescriptionEng(), drinkAddonJson.getDescriptionEng(), drinkAddonJson.getDescriptionRus(), drinkAddonJson.getDrinkId());
    	mav.addObject("drinkAddOn", drinkAddOn);
    	mav.setViewName("add-drink-add-on-response");
    	return mav;
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
