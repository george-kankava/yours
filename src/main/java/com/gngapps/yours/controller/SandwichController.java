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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.gngapps.yours.databinding.json.request.SandwichJson;
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

@Controller
public class SandwichController {
		
	@Autowired
	private DatabaseService databaseService;

	private static final Logger logger = LoggerFactory.getLogger(SandwichController.class);

	@ResponseStatus(HttpStatus.OK)
	@RequestMapping(value = "/process-add-sandwich", consumes = "application/json", method = RequestMethod.POST)
	public void processAddSandwich(Principal principal, @RequestBody SandwichJson sandwich) {
		String username = principal.getName();
		databaseService.saveCustomerSandwich(sandwich, username);
	}
	
	@RequestMapping("/remove-customer-sandwich")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeCustomerSandwich(@RequestParam Integer customerSandwichId) {
		databaseService.removeCustomerSandwich(customerSandwichId);
    }
	
	@RequestMapping(value = "admin/add-sandwich-bread-form")
	public ModelAndView addSandwichBreadForm(ModelAndView mav) {
    	List<SandwichBread> sandwichBreads = databaseService.getSandwichBreads();
    	mav.addObject("sandwichBreads", sandwichBreads);
    	mav.setViewName("add-sandwich-bread-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-sandwich-bread-form", method = RequestMethod.POST, consumes = {"application/json"})
	public ModelAndView processAddSandwichBreadForm(ModelAndView mav, @RequestBody SandwichBread sandwichBread) {
    	databaseService.addNewSandwichBreadType(sandwichBread);
    	mav.addObject("sandwichBread", sandwichBread);
    	mav.setViewName("add-sandwich-bread-response");
    	return mav;
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-sandwich-bread-size-and-price", produces={"application/json"})
	public SandwichBreadSizeAndPrice processAddSandwichBreadSizeAndPrice(@RequestParam Integer sandwichBreadId, @RequestParam String size, @RequestParam BigDecimal price) {
    	SandwichBreadSizeAndPrice sandwichBreadSizeAndPrice = databaseService.addNewSandwichBreadSizeAndPrice(sandwichBreadId, size, price);
    	return sandwichBreadSizeAndPrice;
    	
	}
    
    @RequestMapping("admin/remove-sandwich-bread")
    @ResponseStatus(HttpStatus.OK)
    public void removeSandwichBread(@RequestParam Integer sandwichBreadId) {
    	databaseService.removeSandwichBread(sandwichBreadId);
    }
    
    @RequestMapping("admin/remove-sandwich-bread-size-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeSandwichBreadSizeAndPrice(@RequestParam(required=true) Integer sandwichBreadSizeAndPriceId) {
    	databaseService.removeSandwichBreadSizeAndPrice(sandwichBreadSizeAndPriceId);
    }
    
    @RequestMapping(value = "admin/add-sandwich-sausage-form")
	public ModelAndView addSandwichSausageForm(ModelAndView mav) {
    	List<SandwichSausage> sandwichSausages = databaseService.getSandwichSausages();
    	mav.addObject("sandwichSausages", sandwichSausages);
    	mav.setViewName("add-sandwich-sausage-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-sandwich-sausage-form", method = RequestMethod.POST, consumes = {"application/json"})
	public ModelAndView processAddSandwichSausageForm(ModelAndView mav, @RequestBody SandwichSausage sandwichSausage) {
    	databaseService.addNewSandwichSausage(sandwichSausage);
    	mav.addObject("sandwichSausage", sandwichSausage);
    	mav.setViewName("add-sandwich-sausage-response");
    	return mav;
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-sandwich-sausage-amount-and-price", produces={"application/json"})
   	public SandwichSausageAmountAndPrice processAddSandwichSausageSizeAndPrice(@RequestParam Integer sandwichSausageId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	SandwichSausageAmountAndPrice sandwichSausageAmountAndPrice = databaseService.addNewSandwichSausageAmountAndPrice(sandwichSausageId, amount, price);
       	return sandwichSausageAmountAndPrice;
       	
   	}
    
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping("admin/remove-sandwich-sausage")
    public void removeSandwichSausage(@RequestParam Integer sandwichSausageId) {
    	databaseService.removeSandwichSausage(sandwichSausageId);
    }
    
    @RequestMapping("admin/remove-sandwich-sausage-amount-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeSandwichSausageAmountAndPrice(@RequestParam(required=true) Integer sandwichSausageAmountAndPriceId) {
    	databaseService.removeSandwichSausageAmountAndPrice(sandwichSausageAmountAndPriceId);
    }
    
    @RequestMapping(value = "admin/add-sandwich-vegetables-form")
	public ModelAndView addSandwichVegetablesForm(ModelAndView mav) {
    	List<SandwichVegetable> sandwichVegetables = databaseService.getSandwichVegetables();
    	mav.addObject("sandwichVegetables", sandwichVegetables);
    	mav.setViewName("add-sandwich-vegetables-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-sandwich-vegetable-form", method = RequestMethod.POST, consumes = {"application/json"})
	public ModelAndView processSandwichVegetablesForm(ModelAndView mav, @RequestBody SandwichVegetable sandwichVegetable, BindingResult result) {
    	databaseService.addSandwichVegetable(sandwichVegetable);
    	mav.addObject("sandwichVegetable", sandwichVegetable);
    	mav.setViewName("add-sandwich-vegetable-response");
    	return mav;
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-sandwich-vegetable-amount-and-price") 
    public SandwichVegetableAmountAndPrice processSandwichVegetableAmountAndPrice(@RequestParam Integer sandwichVegetableId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	SandwichVegetableAmountAndPrice sandwichVegetableAmountAndPrice = databaseService.addNewSandwichVegetableAmountAndPrice(sandwichVegetableId, amount, price);
    	return sandwichVegetableAmountAndPrice;
    }
    
    @RequestMapping("admin/remove-sandwich-vegetable")
    @ResponseStatus(HttpStatus.OK)
    public void removeSandwichVegetable(@RequestParam Integer sandwichVegetableId) {
    	databaseService.removeSandwichVegetable(sandwichVegetableId);
    }
    
    @RequestMapping("admin/remove-sandwich-vegetable-amount-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeSandwichVegetableAmountAndPrice(@RequestParam(required=true) Integer sandwichVegetableAmountAndPriceId) {
    	databaseService.removeSandwichVegetableAmountAndPrice(sandwichVegetableAmountAndPriceId);
    }
    
    @RequestMapping(value = "admin/add-sandwich-sauce-form")
	public ModelAndView addSandwichSauceForm(ModelAndView mav, @ModelAttribute("sandwichSauce") SandwichSauce sandwichSauce) {
    	List<SandwichSauce> sandwichSauces = databaseService.getSandwichSauces();
    	mav.addObject("sandwichSauces", sandwichSauces);
    	mav.setViewName("add-sandwich-sauce-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-sandwich-sauce-form", method = RequestMethod.POST, consumes = {"application/json"})
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddSandwichSauceForm(ModelAndView mav, @RequestBody SandwichSauce sandwichSauce, BindingResult result) {
    	databaseService.addNewSandwichSauce(sandwichSauce);
    	mav.addObject("sandwichBread", sandwichSauce);
    	mav.setViewName("add-sandwich-sauce-response");
    	return mav;
	}
    
    @RequestMapping("admin/remove-sandwich-sauce")
    @ResponseStatus(HttpStatus.OK)
    public void removeSandwichSauce(@RequestParam Integer sandwichSauceId) {
    	databaseService.removeSandwichSauce(sandwichSauceId);
    }
    
    @RequestMapping("admin/remove-sandwich-sauce-amount-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeSandwichSauceAmountAndPrice(@RequestParam(required=true) Integer sandwichSauceAmountAndPriceId) {
    	databaseService.removeSandwichSauceAmountAndPrice(sandwichSauceAmountAndPriceId);
    }
    
    @ResponseBody
    @RequestMapping(value = "admin/process-sandwich-sauce-amount-and-price", produces = {"application/json"})
    public SandwichSauceAmountAndPrice processSandwichSauceAmountAndPrice(ModelAndView mav, @RequestParam Integer sandwichSauceId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	SandwichSauceAmountAndPrice amountAndPrice = databaseService.addNewSandwichSauceAmountAndPrice(sandwichSauceId, amount, price);
    	return amountAndPrice;
    }
    
    @RequestMapping(value = "admin/add-sandwich-spice-form")
	public ModelAndView addSandwichSpiceForm(ModelAndView mav) {
    	List<SandwichSpice> sandwichSpices = databaseService.getsandwichSpices();
    	mav.addObject("sandwichSpices", sandwichSpices);
    	mav.setViewName("add-sandwich-spice-form");
    	return mav;
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-add-sandwich-spice-form", method = RequestMethod.POST, consumes = {"application/json"})
	public ModelAndView processAddSandwichSpiceForm(ModelAndView mav, @RequestBody SandwichSpice sandwichSpice, BindingResult result) {
    	databaseService.addNewSandwichSpice(sandwichSpice);
    	mav.addObject("sandwichSpice", sandwichSpice);
    	mav.setViewName("add-sandwich-spice-response");
    	return mav;
	}
    
    @ResponseBody
    @RequestMapping("admin/process-sandwich-spice-amount-and-price")
    public SandwichSpiceAmountAndPrice processSandwichSpiceAmountAndPrice(@RequestParam Integer sandwichSpiceId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	SandwichSpiceAmountAndPrice sandwichSpiceAmountAndPrice = databaseService.addNewSandwichSpiceAmountAndPrice(sandwichSpiceId, amount, price);
    	return sandwichSpiceAmountAndPrice;
    }
    
    @RequestMapping("admin/remove-sandwich-spice")
    @ResponseStatus(HttpStatus.OK)
    public void removeSandwichSpice(@RequestParam Integer sandwichSpiceId) {
    	databaseService.removeSandwichSpice(sandwichSpiceId);
    }
    
    @RequestMapping("admin/remove-sandwich-spice-amount-and-price")
    @ResponseStatus(HttpStatus.OK)
    public void removeSandwichSpiceAmountAndPrice(@RequestParam(required=true) Integer sandwichSpiceAmountAndPriceId) {
    	databaseService.removeSandwichSpiceAmountAndPrice(sandwichSpiceAmountAndPriceId);
    }

}
