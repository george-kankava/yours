package com.gngapps.yours.controller;

import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.gngapps.yours.databinding.json.request.DrinkAddonRequestJson;
import com.gngapps.yours.databinding.json.request.DrinksJson;
import com.gngapps.yours.databinding.json.request.HotdogJson;
import com.gngapps.yours.databinding.json.request.SaladJson;
import com.gngapps.yours.databinding.json.request.SandwichJson;
import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.Drink;
import com.gngapps.yours.entities.DrinkAddOn;
import com.gngapps.yours.entities.DrinkAddOnAmountAndPrice;
import com.gngapps.yours.entities.DrinkSizeAndPrice;
import com.gngapps.yours.entities.HotDogBread;
import com.gngapps.yours.entities.HotDogSauce;
import com.gngapps.yours.entities.HotDogSausage;
import com.gngapps.yours.entities.HotDogSausageAmountAndPrice;
import com.gngapps.yours.entities.HotdogBreadSizeAndPrice;
import com.gngapps.yours.entities.HotdogSauceAmountAndPrice;
import com.gngapps.yours.entities.SaladIngredient;
import com.gngapps.yours.entities.SaladIngredientAmountAndPrice;
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
    	mav.setViewName("food-components-list-v2");
    	return mav;
	}
    
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/process-add-sandwich", consumes = "application/json", method = RequestMethod.POST)
	public void processAddSandwich(@RequestBody SandwichJson sandwich) {
    	databaseService.saveCustomerSandwich(sandwich);
    }
    
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/process-add-salad", consumes = "application/json", method = RequestMethod.POST)
	public void processAddSandwich(@RequestBody SaladJson salad) {
    	databaseService.saveCustomerSalad(salad);
    }
    
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/process-add-drink", consumes = "application/json", method = RequestMethod.POST)
	public void processAddDrinks(@RequestBody DrinksJson drink) {
    	databaseService.saveCustomerDrink(drink);
    }
    
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(value = "/process-add-hotdog", consumes = "application/json", method = RequestMethod.POST)
	public void processAddDrinks(@RequestBody HotdogJson hotdog) {
    	databaseService.saveCustomerHotdog(hotdog);
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
