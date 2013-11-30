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

import com.gngapps.yours.databinding.json.request.SaladJson;
import com.gngapps.yours.entities.SaladIngredient;
import com.gngapps.yours.entities.SaladIngredientAmountAndPrice;
import com.gngapps.yours.service.DatabaseService;

@Controller
public class SaladController {

	@Autowired
	private DatabaseService databaseService;

	private static final Logger logger = LoggerFactory.getLogger(SaladController.class);
    
	@ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/process-add-salad", consumes = "application/json", method = RequestMethod.POST)
	public void processAddSalad(Principal principal, @RequestBody SaladJson salad) {
		String username = principal.getName();
    	databaseService.saveCustomerSalad(salad, username);
    }
	
	@RequestMapping("/remove-customer-salad")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeCustomerSalad(@RequestParam Integer customerSaladId) {
		try {
			databaseService.removeCustomerSalad(customerSaladId);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
    }
	
	@RequestMapping(value = "admin/add-salad-ingredient-form")
	public ModelAndView addSaladIngredientForm(ModelAndView mav) {
    	List<SaladIngredient> saladIngredients = databaseService.getSaladIngredients();
    	mav.addObject("saladIngredients", saladIngredients);
    	mav.setViewName("add-salad-ingredient-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-salad-ingredient-form", method = RequestMethod.POST, consumes = {"application/json"})
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddSaladIngredientForm(ModelAndView mav, @RequestBody SaladIngredient saladIngredient, BindingResult result) {
    	databaseService.addNewSaladIngredient(saladIngredient);
    	mav.addObject("saladIngredient", saladIngredient);
    	mav.setViewName("add-salad-ingredient-response");
    	return mav;
	}
    
    @RequestMapping("admin/remove-salad-ingredient")
    @ResponseStatus(HttpStatus.OK)
    public void removeSaladIngredient(@RequestParam Integer saladIngredientId) {
    	databaseService.removeSaladIngredient(saladIngredientId);
    }
    
    @RequestMapping("admin/remove-salad-ingredient-amount-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeSaladIngredientAmountAndPrice(@RequestParam(required=true) Integer saladIngredientAmountAndPriceId) {
    	databaseService.removeSaladIngredientAmountAndPrice(saladIngredientAmountAndPriceId);
    }
    
    @ResponseBody
    @RequestMapping(value = "admin/process-salad-ingredient-amount-and-price", produces = {"application/json"})
    public SaladIngredientAmountAndPrice processSaladIngredientAmountAndPrice(ModelAndView mav, @RequestParam Integer saladIngredientId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	SaladIngredientAmountAndPrice ingredientAmountAndPrice = databaseService.addNewSaladIngredientAmountAndPrice(saladIngredientId, amount, price);
    	return ingredientAmountAndPrice;
    }
}
