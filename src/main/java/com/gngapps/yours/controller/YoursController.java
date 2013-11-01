package com.gngapps.yours.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichBreadSizeAndPrice;
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
    
	private Pattern pattern = Pattern.compile("([a-zA-Z0-9._-]*[\\s]*)*");
	
    /**
     * Selects the home page and populates the model with a message
     */
	
    @RequestMapping(value = "/food-components-list")
	public ModelAndView foodComponentsList(ModelAndView mav) {
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
    
    @RequestMapping(value = "/process-register-user")
	public String processRegister(ModelAndView mav, HttpServletRequest request, HttpSession session, @ModelAttribute @Valid Customer customer, BindingResult result) {
    	if(result.hasErrors()) {
    		return "register-user";
    	}
    	databaseService.registerCustomer(customer);
    	return "register-user";
	}
    
    @RequestMapping(value = "admin/add-food-components")
	public ModelAndView addFoodComponents(ModelAndView mav) {
    	mav.setViewName("add-food-components");
    	return mav;
	}
    
    @RequestMapping(value = "admin/add-food-components-sandwich")
	public ModelAndView addFoodComponentsSandwich(ModelAndView mav) {
    	List<SandwichVegetable> sandwichVegetables = databaseService.getSandwichVegetables();
    	mav.addObject("sandwichVegetables", sandwichVegetables);
    	List<SandwichSauce> sandwichSauces = databaseService.getSandwichSauces();
    	mav.addObject("sandwichSauces", sandwichSauces);
    	List<SandwichSpice> sandwichSpices = databaseService.getsandwichSpices();
    	mav.addObject("sandwichSpices", sandwichSpices);
    	mav.setViewName("add-food-components-sandwich");
    	return mav;
	}
    
    @RequestMapping(value = "admin/add-sandwich-bread-form")
	public ModelAndView addSandwichBreadForm(ModelAndView mav, @ModelAttribute("sandwichBread") SandwichBread sandwichBread, BindingResult result) {
    	List<SandwichBread> sandwichBreads = databaseService.getSandwichBreads();
    	mav.addObject("sandwichBreads", sandwichBreads);
    	mav.setViewName("add-sandwich-bread-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-sandwich-bread-form")
	public ModelAndView processAddSandwichBreadForm(ModelAndView mav, @ModelAttribute SandwichBread sandwichBread) {
    	databaseService.addNewSandwichBreadType(sandwichBread);
    	mav.addObject("sandwichBread", sandwichBread);
    	mav.setViewName("add-sandwich-bread-response");
    	return mav;
	}
    
    @ResponseBody
    @RequestMapping(value = "admin/process-sandwich-bread-price-and-size", produces={"application/json"})
	public SandwichBreadSizeAndPrice processAddSandwichBreadSizeAndPrice(@RequestParam Integer sandwichBreadId, @RequestParam Integer size, @RequestParam Integer price) {
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
    
    @RequestMapping(value = "admin/process-sandwich-sausage-amount-and-price", produces={"application/json"})
   	public ModelAndView processAddSandwichSausageSizeAndPrice(ModelAndView mav, @RequestParam Integer sandwichSausageId, @RequestParam Integer sandwichSausageAmount, @RequestParam Integer sandwichSausagePrice) {
       	databaseService.addNewSandwichSausageSizeAndPrice(sandwichSausageId, sandwichSausageAmount, sandwichSausagePrice);
       	mav.setViewName("add-food-components-sandwich");
       	return mav;
       	
   	}

    
    @RequestMapping(value = "admin/add-sandwich-vegetables-form")
	public ModelAndView addSandwichVegetablesForm(ModelAndView mav, @ModelAttribute("sandwichVegetable") SandwichVegetable sandwichVegetable) {
    	List<SandwichVegetable> sandwichVegetables = databaseService.getSandwichVegetables();
    	mav.addObject("sandwichVegetables", sandwichVegetables);
    	mav.setViewName("add-sandwich-vegetables-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-sandwich-vegetable-form")
	public ModelAndView processSandwichVegetablesForm(ModelAndView mav, @ModelAttribute("sandwichVegetable") SandwichVegetable sandwichVegetable, BindingResult result) {
    	databaseService.addSandwichVegetable(sandwichVegetable);
    	mav.setViewName("add-food-components-sandwich");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-sandwich-vegetable-amount-and-price") 
    public ModelAndView processSandwichVegetableAmountAndPrice(ModelAndView mav, @RequestParam Integer sandwichVegetableId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	databaseService.addNewSandwichVegetableAmountAndPrice(sandwichVegetableId, amount, price);
    	mav.setViewName("add-food-components-sandwich");
    	return mav;
    }
    
    @RequestMapping(value = "admin/add-sandwich-sauce-form")
	public ModelAndView addSandwichSauceForm(ModelAndView mav, @ModelAttribute("sandwichSauce") SandwichSauce sandwichSauce) {
    	List<SandwichSauce> sandwichSauces = databaseService.getSandwichSauces();
    	mav.addObject("sandwichSauces", sandwichSauces);
    	mav.setViewName("add-sandwich-sauce-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-sandwich-sauce-form")
	public ModelAndView processAddSandwichSauceForm(ModelAndView mav, @ModelAttribute("sandwichSauce") SandwichSauce sandwichSauce, BindingResult result) {
    	databaseService.addNewSandwichSauce(sandwichSauce);
    	mav.setViewName("add-food-components-sandwich");
    	return mav;
	}
    
    @RequestMapping("admin/process-sandwich-sauce-amount-and-price")
    public ModelAndView processSandwichSauceAmountAndPrice(ModelAndView mav, @RequestParam Integer sandwichSauceId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	databaseService.addNewSandwichSauceAmountAndPrice(sandwichSauceId, amount, price);
    	mav.setViewName("add-food-components-sandwich");
    	return mav;
    }
    
    @RequestMapping(value = "admin/add-sandwich-spice-form")
	public ModelAndView addSandwichSpiceForm(ModelAndView mav, @ModelAttribute("sandwichSpice") SandwichSpice sandwichSpice) {
    	List<SandwichSpice> sandwichSpices = databaseService.getsandwichSpices();
    	mav.addObject("sandwichSpices", sandwichSpices);
    	mav.setViewName("add-sandwich-spice-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-sandwich-spice-form")
	public ModelAndView processAddSandwichSauceForm(ModelAndView mav, @ModelAttribute("sandwichSpice") SandwichSpice sandwichSpice, BindingResult result) {
    	databaseService.addNewSandwichSpice(sandwichSpice);
    	mav.setViewName("add-food-components-sandwich");
    	return mav;
	}
    
    @RequestMapping("admin/process-sandwich-spice-amount-and-price")
    public ModelAndView processSandwichSpiceAmountAndPrice(ModelAndView mav, @RequestParam Integer sandwichSpiceId, @RequestParam String amount, @RequestParam BigDecimal price) {
    	databaseService.addNewSandwichSpiceAmountAndPrice(sandwichSpiceId, amount, price);
    	mav.setViewName("add-food-components-sandwich");
    	return mav;
    }
	
    @RequestMapping(value = "admin/add-salad-ingredient-form")
	public ModelAndView addSaladIngredientForm(ModelAndView mav) {
    	mav.setViewName("add-salad-ingredient-form");
    	return mav;
	}

    @RequestMapping(value = "admin/add-drink-form")
	public ModelAndView addDrinkForm(ModelAndView mav) {
    	mav.setViewName("add-drink-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/add-drink-addon-form")
	public ModelAndView addDrinkAddonForm(ModelAndView mav) {
    	mav.setViewName("add-drink-addon-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/add-hotdog-ingredient-bread-form")
	public ModelAndView addHotDogIngredientBreadForm(ModelAndView mav) {
    	mav.setViewName("add-hotdog-ingredient-bread-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/add-hotdog-ingredient-sausage-form")
   	public ModelAndView addHotDogIngredientSausageForm(ModelAndView mav) {
       	mav.setViewName("add-hotdog-ingredient-sausage-form");
       	return mav;
   	}
    
    @RequestMapping(value = "admin/add-hotdog-ingredient-sauce-form")
   	public ModelAndView addHotDogIngredientSauceForm(ModelAndView mav) {
       	mav.setViewName("add-hotdog-ingredient-sauce-form");
       	return mav;
   	}
}
