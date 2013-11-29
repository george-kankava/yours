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

import com.gngapps.yours.databinding.json.request.HotdogJson;
import com.gngapps.yours.entities.HotDogBread;
import com.gngapps.yours.entities.HotDogSauce;
import com.gngapps.yours.entities.HotDogSausage;
import com.gngapps.yours.entities.HotDogSausageAmountAndPrice;
import com.gngapps.yours.entities.HotdogBreadSizeAndPrice;
import com.gngapps.yours.entities.HotdogSauceAmountAndPrice;
import com.gngapps.yours.service.DatabaseService;

@Controller
public class HotdogController {
	@Autowired
	private DatabaseService databaseService;

	private static final Logger logger = LoggerFactory.getLogger(HotdogController.class);
	
	@ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/process-add-hotdog", consumes = "application/json", method = RequestMethod.POST)
	public void processAddHotdog(Principal principal, @RequestBody HotdogJson hotdog) {
		String username = principal.getName();
    	databaseService.saveCustomerHotdog(hotdog, username);
    }
	
	@RequestMapping(value = "admin/add-hotdog-ingredient-bread-form")
	public ModelAndView addHotDogIngredientBreadForm(ModelAndView mav) {
    	List<HotDogBread> hotdogBreads = databaseService.getHotdogBreads();
    	mav.addObject("hotdogBreads", hotdogBreads);
    	mav.setViewName("add-hotdog-ingredient-bread-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-hotdog-bread-form", method = RequestMethod.POST, consumes = {"application/json"})
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddHotdogBreadForm(ModelAndView mav, @RequestBody HotDogBread hotdogBread, BindingResult result) {
    	databaseService.addNewHotdogBread(hotdogBread);
    	mav.addObject("hotdogBread", hotdogBread);
    	mav.setViewName("add-hotdog-bread-response");
    	return mav;
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-hotdog-bread-size-and-price", produces={"application/json"})
	public HotdogBreadSizeAndPrice processAddHotdogBreadSizeAndPrice(@RequestParam Integer hotdogBreadId, @RequestParam String size, @RequestParam BigDecimal price) {
    	HotdogBreadSizeAndPrice sizeAndPrice = databaseService.addNewHotdogBreadSizeAndPrice(hotdogBreadId, size, price);
    	return sizeAndPrice;
	}
    
    @RequestMapping("admin/remove-hotdog-bread")
    @ResponseStatus(HttpStatus.OK)
    public void removeHotdogBread(@RequestParam Integer hotdogBreadId) {
    	databaseService.removeHotdogBread(hotdogBreadId);
    }
    
    @RequestMapping("admin/remove-hotdog-bread-size-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeHotdogBreadSizeAndPrice(@RequestParam(required=true) Integer hotdogBreadSizeAndPriceId) {
    	databaseService.removeHotdogBreadSizeAndPrice(hotdogBreadSizeAndPriceId);
    }
    
    @RequestMapping(value = "admin/add-hotdog-ingredient-sausage-form")
   	public ModelAndView addHotDogIngredientSausageForm(ModelAndView mav) {
    	List<HotDogSausage> sausages = databaseService.getHotdogSausages();
    	mav.addObject("hotdogSausages", sausages);
       	mav.setViewName("add-hotdog-ingredient-sausage-form");
       	return mav;
   	}
    
    @RequestMapping(value = "admin/process-add-hotdog-sausage-form", method = RequestMethod.POST, consumes = {"application/json"})
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddHotdogSausageForm(ModelAndView mav, @RequestBody HotDogSausage hotdogSausage, BindingResult result) {
    	databaseService.addNewHotdogSausage(hotdogSausage);
    	mav.addObject("hotdogSausage", hotdogSausage);
    	mav.setViewName("add-hotdog-sausage-response");
    	return mav;
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-hotdog-sausage-amount-and-price", produces={"application/json"})
	public HotDogSausageAmountAndPrice processAddHotdogSausageAmountAndPrice(@RequestParam Integer hotdogSausageId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	HotDogSausageAmountAndPrice sizeAndPrice = databaseService.addNewHotdogSausageAmountAndPrice(hotdogSausageId, amount, price);
    	return sizeAndPrice;
	}
    
    @RequestMapping("admin/remove-hotdog-sausage")
    @ResponseStatus(HttpStatus.OK)
    public void removeHotdogSausage(@RequestParam Integer hotdogSausageId) {
    	databaseService.removeHotdogSausage(hotdogSausageId);
    }
    
    @RequestMapping("admin/remove-hotdog-sausage-amount-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeHotdogSausageAmountAndPrice(@RequestParam(required=true) Integer hotdogSausageAmountAndPriceId) {
    	databaseService.removeHotdogSausageAmountAndPrice(hotdogSausageAmountAndPriceId);
    }
    
    @RequestMapping(value = "admin/add-hotdog-ingredient-sauce-form")
   	public ModelAndView addHotDogIngredientSauceForm(ModelAndView mav) {
    	List<HotDogSauce> hotdogSauces = databaseService.getHotdogSauces();
    	mav.addObject("hotdogSauces", hotdogSauces);
       	mav.setViewName("add-hotdog-ingredient-sauce-form");
       	return mav;
   	}
    
    @RequestMapping(value = "admin/process-add-hotdog-sauce-form", method = RequestMethod.POST, consumes = {"application/json"})
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddHotdogSauceForm(ModelAndView mav, @RequestBody HotDogSauce hotdogSauce, BindingResult result) {
    	databaseService.addNewHotdogSauce(hotdogSauce);
    	mav.addObject("hotdogSauce", hotdogSauce);
    	mav.setViewName("add-hotdog-sauce-response");
    	return mav;
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-hotdog-sauce-amount-and-price", produces={"application/json"})
	public HotdogSauceAmountAndPrice processAddHotdogSauceAmountAndPrice(@RequestParam Integer hotdogSauceId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	HotdogSauceAmountAndPrice sizeAndPrice = databaseService.addNewHotdogSauceAmountAndPrice(hotdogSauceId, amount, price);
    	return sizeAndPrice;
	}
    
    @RequestMapping("admin/remove-hotdog-sauce")
    @ResponseStatus(HttpStatus.OK)
    public void removeHotdogSauce(@RequestParam Integer hotdogSauceId) {
    	databaseService.removeHotdogSauce(hotdogSauceId);
    }
    
    @RequestMapping("admin/remove-hotdog-sauce-amount-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeHotdogSauceAmountAndPrice(@RequestParam(required=true) Integer hotdogSauceAmountAndPriceId) {
    	databaseService.removeHotdogSauceAmountAndPrice(hotdogSauceAmountAndPriceId);
    }
    
}
