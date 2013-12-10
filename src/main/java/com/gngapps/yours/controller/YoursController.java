package com.gngapps.yours.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.gngapps.yours.databinding.json.request.CustoemrOrderJson;
import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.CustomerOrder;
import com.gngapps.yours.entities.Drink;
import com.gngapps.yours.entities.DrinkAddOn;
import com.gngapps.yours.entities.HotDogBread;
import com.gngapps.yours.entities.HotDogSauce;
import com.gngapps.yours.entities.HotDogSausage;
import com.gngapps.yours.entities.SaladIngredient;
import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSausage;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichVegetable;
import com.gngapps.yours.service.DatabaseService;

@Controller
public class YoursController {
	
	@Autowired
	private DatabaseService databaseService;

	private static final Logger logger = LoggerFactory.getLogger(YoursController.class);
	
	@RequestMapping("operator/customer-active-orders")
	public ModelAndView customerActiveOrders(Principal principal, ModelAndView mav) {
		try {
			mav.setViewName("active-orders");
			List<CustomerOrder> customerOrders = databaseService.getCustomerActiveOrders();
			mav.addObject("customerOrders", customerOrders);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
		return mav;
	}
	
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@RequestMapping(value = "/process-purchase-customer-order", consumes = "application/json", method = RequestMethod.POST)
	public ModelAndView processPurchaseCustomerOrder(Principal principal, ModelAndView mav, @RequestBody CustoemrOrderJson customerFoodsAndDrinks) {
		try {
		databaseService.createCustomerOrder(principal.getName(), customerFoodsAndDrinks);
		mav.setViewName("customer-order-info");
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
		return mav;
		
	}
    
	@RequestMapping("operator/customer-meals")
	public ModelAndView customerMeals(Principal principal, ModelAndView mav) {
		mav.setViewName("customer-meals-list");
		return mav;
	}
	
	@RequestMapping("operator/find-customer-meals.ajax")
	public ModelAndView findCustomerMeals(Principal principal, @RequestParam String username, ModelAndView mav) {
		try {
			if(username == null) {
				throw new IllegalArgumentException("username is null");
			}
			mav.setViewName("customer-meal-list-ajax");
			Map<String, Object> customerMeals = databaseService.getCustomerMeals(username);
			if(!customerMeals.isEmpty()) {
				mav.addObject("username", username);
				mav.addObject("meals", customerMeals);
			}
			return mav;
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
		return mav;
	}

	@RequestMapping("/meals-list")
	public ModelAndView mealsList(Principal principal, ModelAndView mav) {
		Map<String, Object> customerMeals = databaseService.getCustomerMeals(principal.getName());
		mav.addObject("meals", customerMeals);
		mav.setViewName("meals-list");
		return mav;
	}
	
    @RequestMapping(value = "/food-components-list")
	public ModelAndView foodComponentsList(ModelAndView mav) {
    	List<SandwichBread> sandwichBreads = databaseService.getSandwichBreads();
    	mav.addObject("sandwichBreads", sandwichBreads);
    	List<SandwichSausage> sandwichSausages = databaseService.getSandwichSausages();
    	mav.addObject("sandwichSausages", sandwichSausages);
    	List<SandwichVegetable> sandwichVegetables = databaseService.getSandwichVegetables();
    	mav.addObject("sandwichVegetables", sandwichVegetables);
    	List<SandwichSauce> sandwichSauces = databaseService.getSandwichSauces();
    	mav.addObject("sandwichSauces", sandwichSauces);
    	List<SandwichSpice> sandwichSpices = databaseService.getsandwichSpices();
    	mav.addObject("sandwichSpices", sandwichSpices);
    	List<SaladIngredient> saladIngredients = databaseService.getSaladIngredients();
    	mav.addObject("saladIngredients", saladIngredients);
    	List<Drink> drinks = databaseService.getDrinks();
    	mav.addObject("drinks", drinks);
    	List<DrinkAddOn> drinkAddons = databaseService.getDrinkAddOns();
    	mav.addObject("drinkAddOns", drinkAddons);
    	List<HotDogBread> hotdogBreads = databaseService.getHotdogBreads();
    	mav.addObject("hotdogBreads", hotdogBreads);
    	List<HotDogSausage> hotdogSausages = databaseService.getHotdogSausages();
    	mav.addObject("hotdogSausages", hotdogSausages);
    	List<HotDogSauce> hotdogSauces = databaseService.getHotdogSauces();
    	mav.addObject("hotdogSauces", hotdogSauces);
    	mav.setViewName("food-components-list");
    	return mav;
	}
    
    @RequestMapping(value = "/index.html")
	public String indexPage(ModelAndView mav, HttpSession session) {
    	return "redirect:/food-components-list";
	}
    
    
    @RequestMapping(value = "/signin")
	public String signin(ModelAndView mav, HttpSession session) {
    	return "signin";
	}
    
    @RequestMapping(value = "/register-user")
	public String register(@ModelAttribute("customer") Customer customer, BindingResult result) {
    	return "register-user";
	}
    
    @RequestMapping(value = "/process-register-user", method = RequestMethod.POST)
	public String processRegister(ModelAndView mav, HttpServletRequest request, HttpSession session, @ModelAttribute @Valid Customer customer, BindingResult result) {
    	if(result.hasErrors()) {
    		return "register-user";
    	}
    	databaseService.registerCustomer(customer);
    	return "signin";
	}
    
    @RequestMapping(value = "admin/add-food-components")
	public ModelAndView addFoodComponents(ModelAndView mav) {
    	mav.setViewName("add-food-components");
    	return mav;
	}
    
}
