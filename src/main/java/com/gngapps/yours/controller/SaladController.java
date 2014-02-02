package com.gngapps.yours.controller;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

import com.gngapps.yours.AppConstants;
import com.gngapps.yours.databinding.json.request.SaladJson;
import com.gngapps.yours.entities.CustomerSalad;
import com.gngapps.yours.entities.FoodComponentImage;
import com.gngapps.yours.entities.SaladIngredient;
import com.gngapps.yours.entities.SaladIngredientAmountAndPrice;
import com.gngapps.yours.service.DatabaseService;
import com.gngapps.yours.service.impl.YoursHelper;

@Controller
public class SaladController {

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

	private static final Logger logger = LoggerFactory.getLogger(SaladController.class);
    
	@ResponseBody
	@RequestMapping(value = "/add-customer-salad-to-session", produces = "application/json")
	public String addSaladToClientSession(HttpSession session, @RequestParam Integer saladId) {
		try {
			CustomerSalad salad = databaseService.findSaladById(saladId);
			if(salad == null) {
				throw new IllegalArgumentException("salad with id not found : " + saladId);
			}
			@SuppressWarnings("unchecked")
			Map<Integer, CustomerSalad> customerSalads = (Map<Integer, CustomerSalad>)session.getAttribute(AppConstants.CUSTOMER_SALAD_SESSION_TOKEN);
			if(customerSalads == null) {
				customerSalads = new LinkedHashMap<Integer, CustomerSalad>();
				customerSalads.put(salad.getId(), salad);
				session.setAttribute(AppConstants.CUSTOMER_SALAD_SESSION_TOKEN, customerSalads);
			} else {
				customerSalads.put(salad.getId(), salad);
			}
			return "{\"saladId\" : \"" + salad.getId() + "\"}";
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			return helper.emptyJson();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/remove-customer-salad-from-session", produces = "application/json")
	public String removeSaladFromClientSession(HttpSession session, @RequestParam Integer saladId) {
		try {
			CustomerSalad salad = databaseService.findSaladById(saladId);
			if(salad == null) {
				throw new IllegalArgumentException("salad with id not found : " + saladId);
			}
			@SuppressWarnings("unchecked")
			Map<Integer, CustomerSalad> customerSalads = (Map<Integer, CustomerSalad>)session.getAttribute(AppConstants.CUSTOMER_SALAD_SESSION_TOKEN);
			customerSalads.remove(saladId);
			return "{\"saladId\" : \"" + salad.getId() + "\"}";
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			return helper.emptyJson();
		}
	}
	
	@ResponseBody
    @RequestMapping(value = "/process-add-salad", consumes = "application/json",  produces = {"application/json;charset=UTF-8"}, method = RequestMethod.POST)
	public String processAddSalad(HttpServletRequest request, Principal principal, @RequestBody @Valid SaladJson salad, BindingResult result) {
		try {
			Locale locale = localeResolver.resolveLocale(request);
			if(result.hasErrors()) {
				String messageCode = result.getFieldError().getDefaultMessage();
				String errMessage = messageSource.getMessage(messageCode, null, locale);
				return "{\"saladErrorMessage\" : \"" + errMessage + "\"}";
			}
			String username = principal.getName();
	    	databaseService.saveCustomerSalad(salad, username);
	    	String saladSavedMessage = messageSource.getMessage("yours.food.service.food.componenet.list.salad.saved", null, locale);
	    	return "{\"saladSavedMessage\" : \"" + saladSavedMessage + "\"}";
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			Locale locale = localeResolver.resolveLocale(request);
			String serverError = messageSource.getMessage("yours.food.service.food.componenet.list.salad.saved", null, locale);
			return "{\"saladSavedMessage\" : \"" + serverError + "\"}";
		}
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
    
    @RequestMapping(value = "admin/process-add-salad-ingredient-form", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddSaladIngredientForm(ModelAndView mav, @RequestParam String nameGeo, @RequestParam String nameEng, @RequestParam String nameRus,@RequestParam String descriptionGeo, @RequestParam  String descriptionEng, @RequestParam String descriptionRus, @RequestParam(value="image", required = false) MultipartFile image) {
    	try {
	    	SaladIngredient saladIngredient = new SaladIngredient();
	    	saladIngredient.setNameEng(nameEng);
	    	saladIngredient.setNameGeo(nameGeo);
	    	saladIngredient.setNameRus(nameRus);
	    	saladIngredient.setDescriptionEng(descriptionEng);
	    	saladIngredient.setDescriptionGeo(descriptionGeo);
	    	saladIngredient.setDescriptionRus(descriptionRus);
	    	if(!image.isEmpty()) {
	    		FoodComponentImage foodComponentImage = helper.writeFoodComponentImage(image, servletContext);
	    		databaseService.saveFoodComponentImage(foodComponentImage);
	    		saladIngredient.setFoodComponentImage(foodComponentImage);
	    	}
	    	databaseService.addNewSaladIngredient(saladIngredient);
	    	mav.addObject("saladIngredient", saladIngredient);
	    	mav.setViewName("add-salad-ingredient-response");
	    	return mav;
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("add-salad-ingredient-response");
        	return mav;
    	}
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
