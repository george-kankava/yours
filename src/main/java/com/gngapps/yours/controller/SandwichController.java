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
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.gngapps.yours.databinding.json.request.SandwichJson;
import com.gngapps.yours.entities.CustomerSandwich;
import com.gngapps.yours.entities.FoodComponentImage;
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
import com.gngapps.yours.service.impl.YoursHelper;

@Controller
public class SandwichController {
		
	@Autowired
	private DatabaseService databaseService;
	
	@Autowired
	private LocaleResolver localeResolver;
	
	@Autowired
	private MessageSource messageSource;

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private YoursHelper helper;
	
	private static final Logger logger = LoggerFactory.getLogger(SandwichController.class);

	@ResponseBody
	@RequestMapping(value = "/add-customer-sandwich-to-session", produces = "application/json")
	public String addSandwichToClientSession(HttpSession session, @RequestParam Integer sandwichId) {
		try {
			CustomerSandwich sandwich = databaseService.findSandwichById(sandwichId);
			if(sandwich == null) {
				throw new IllegalArgumentException("sandwich with id not found : " + sandwichId);
			}
			@SuppressWarnings("unchecked")
			Map<Integer, CustomerSandwich> customerSandwiches = (Map<Integer, CustomerSandwich>)session.getAttribute(AppConstants.CUSTOMER_SANDWICH_SESSION_TOKEN);
			if(customerSandwiches == null) {
				customerSandwiches = new LinkedHashMap<Integer, CustomerSandwich>();
				customerSandwiches.put(sandwich.getId(), sandwich);
				session.setAttribute(AppConstants.CUSTOMER_SANDWICH_SESSION_TOKEN, customerSandwiches);
			} else {
				customerSandwiches.put(sandwich.getId(), sandwich);
			}
			return "{\"sandwichId\" : \"" + sandwich.getId() + "\"}";
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			return helper.emptyJson();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/remove-customer-sandwich-from-session", produces = "application/json")
	public String removeSandwichFromClientSession(HttpSession session, @RequestParam Integer sandwichId) {
		try {
			CustomerSandwich sandwich = databaseService.findSandwichById(sandwichId);
			if(sandwich == null) {
				throw new IllegalArgumentException("sandwich with id not found : " + sandwichId);
			}
			@SuppressWarnings("unchecked")
			Map<Integer, CustomerSandwich> customerSandwiches = (Map<Integer, CustomerSandwich>)session.getAttribute(AppConstants.CUSTOMER_SANDWICH_SESSION_TOKEN);
			customerSandwiches.remove(sandwichId);
			return "{\"sandwichId\" : \"" + sandwich.getId() + "\"}";
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			return helper.emptyJson();
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/process-add-sandwich", consumes = "application/json", produces = {"application/json;charset=UTF-8"}, method = RequestMethod.POST)
	public String processAddSandwich(HttpServletRequest request, Principal principal, @RequestBody @Valid SandwichJson sandwich, BindingResult result) {
		try {
			Locale locale = localeResolver.resolveLocale(request);
			if(result.hasErrors()) {
				String messageCode = result.getFieldError().getDefaultMessage();
				String errMessage = messageSource.getMessage(messageCode, null, locale);
				return "{\"sandwichErrorMessage\" : \"" + errMessage + "\"}";
			}
			String username = principal.getName();
			databaseService.saveCustomerSandwich(sandwich, username);
			String sandwichSavedMessage = messageSource.getMessage("yours.food.service.food.componenet.list.sandwich.saved", null, locale);
			return "{\"sandwichSavedMessage\" : \"" + sandwichSavedMessage + "\"}";
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			Locale locale = localeResolver.resolveLocale(request);
			String serverError = messageSource.getMessage("yours.food.service.ajax.server.error", null, locale);
			return "{\"sandwichSavedMessage\" : \"" + serverError + "\"}";
		}
		
	}
	
	@RequestMapping("/remove-customer-sandwich")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeCustomerSandwich(@RequestParam Integer customerSandwichId) {
		try {
			databaseService.removeCustomerSandwich(customerSandwichId);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
    }
	
	@RequestMapping(value = "admin/add-sandwich-bread-form")
	public ModelAndView addSandwichBreadForm(ModelAndView mav) {
    	List<SandwichBread> sandwichBreads = databaseService.getSandwichBreads();
    	mav.addObject("sandwichBreads", sandwichBreads);
    	mav.setViewName("add-sandwich-bread-form");
    	return mav;
	}
    
    @RequestMapping(value = "admin/process-add-sandwich-bread-form", method = RequestMethod.POST)
	public ModelAndView processAddSandwichBreadForm(ModelAndView mav, @RequestParam String nameGeo, @RequestParam String nameEng, @RequestParam String nameRus, @RequestParam String descriptionGeo, @RequestParam  String descriptionEng, @RequestParam String descriptionRus, @RequestParam(value="image", required = false) MultipartFile image) {
    	try {
	    	SandwichBread sandwichBread = new SandwichBread();
	    	sandwichBread.setNameGeo(nameGeo);
	    	sandwichBread.setNameEng(nameEng);
	    	sandwichBread.setNameRus(nameRus);
	    	sandwichBread.setDescriptionGeo(descriptionGeo);
	    	sandwichBread.setDescriptionEng(descriptionEng);
	    	sandwichBread.setDescriptionRus(descriptionRus);
	    	if(!image.isEmpty()) {
	    		FoodComponentImage foodComponentImage = helper.writeFoodComponentImage(image, servletContext);
	    		databaseService.saveFoodComponentImage(foodComponentImage);
	    		sandwichBread.setFoodComponentImage(foodComponentImage);
    		}
	    	databaseService.addNewSandwichBreadType(sandwichBread);
	    	mav.addObject("sandwichBread", sandwichBread);
	    	mav.setViewName("add-sandwich-bread-response");
	    	return mav;
    	} catch (Exception ex) {
			logger.info(ex.getMessage());
	    	mav.setViewName("add-sandwich-bread-response");
	    	return mav;
		}
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
    
    @RequestMapping(value = "admin/process-add-sandwich-sausage-form", method = RequestMethod.POST)
	public ModelAndView processAddSandwichSausageForm(ModelAndView mav, @RequestParam String nameGeo, @RequestParam String nameEng, @RequestParam String nameRus, @RequestParam String descriptionGeo, @RequestParam  String descriptionEng, @RequestParam String descriptionRus, @RequestParam(value="image", required = false) MultipartFile image) {
    	try {
	    	SandwichSausage sandwichSausage = new SandwichSausage();
	    	sandwichSausage.setNameEng(nameEng);
	    	sandwichSausage.setNameGeo(nameGeo);
	    	sandwichSausage.setNameRus(nameRus);
	    	sandwichSausage.setDescriptionEng(descriptionEng);
	    	sandwichSausage.setDescriptionGeo(descriptionGeo);
	    	sandwichSausage.setDescriptionRus(descriptionRus);
	    	if(!image.isEmpty()) {
	    		FoodComponentImage foodComponentImage = helper.writeFoodComponentImage(image, servletContext);
	    		databaseService.saveFoodComponentImage(foodComponentImage);
	    		sandwichSausage.setFoodComponentImage(foodComponentImage);
	    	}
	    	databaseService.addNewSandwichSausage(sandwichSausage);
	    	mav.addObject("sandwichSausage", sandwichSausage);
	    	mav.setViewName("add-sandwich-sausage-response");
	    	return mav;
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("add-sandwich-sausage-response");
	    	return mav;
    	}
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
    
    @RequestMapping(value = "admin/process-add-sandwich-vegetable-form", method = RequestMethod.POST)
	public ModelAndView processSandwichVegetablesForm(ModelAndView mav, @RequestParam String nameGeo, @RequestParam String nameEng, @RequestParam String nameRus,@RequestParam String descriptionGeo, @RequestParam  String descriptionEng, @RequestParam String descriptionRus, @RequestParam(value="image", required = false) MultipartFile image) {
    	try {
	    	SandwichVegetable sandwichVegetable = new SandwichVegetable();
	    	sandwichVegetable.setNameEng(nameEng);
	    	sandwichVegetable.setNameGeo(nameGeo);
	    	sandwichVegetable.setNameRus(nameRus);
	    	sandwichVegetable.setDescriptionEng(descriptionEng);
	    	sandwichVegetable.setDescriptionGeo(descriptionGeo);
	    	sandwichVegetable.setDescriptionRus(descriptionRus);
	    	if(!image.isEmpty()) {
	    		FoodComponentImage foodComponentImage = helper.writeFoodComponentImage(image, servletContext);
	    		databaseService.saveFoodComponentImage(foodComponentImage);
	    		sandwichVegetable.setFoodComponentImage(foodComponentImage);
	    	}
	    	databaseService.addSandwichVegetable(sandwichVegetable);
	    	mav.addObject("sandwichVegetable", sandwichVegetable);
	    	mav.setViewName("add-sandwich-vegetable-response");
	    	return mav;
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("add-sandwich-vegetable-response");
    		return mav;
    	}
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
    
    @RequestMapping(value = "admin/process-add-sandwich-sauce-form", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.OK)
	public ModelAndView processAddSandwichSauceForm(ModelAndView mav, @RequestParam String nameGeo, @RequestParam String nameEng, @RequestParam String nameRus,@RequestParam String descriptionGeo, @RequestParam  String descriptionEng, @RequestParam String descriptionRus, @RequestParam(value="image", required = false) MultipartFile image) {
    	try {
	    	SandwichSauce sandwichSauce = new SandwichSauce();
	    	sandwichSauce.setNameEng(nameEng);
	    	sandwichSauce.setNameGeo(nameGeo);
	    	sandwichSauce.setNameRus(nameRus);
	    	sandwichSauce.setDescriptionEng(descriptionEng);
	    	sandwichSauce.setDescriptionGeo(descriptionGeo);
	    	sandwichSauce.setDescriptionRus(descriptionRus);
	    	if(!image.isEmpty()) {
	    		FoodComponentImage foodComponentImage = helper.writeFoodComponentImage(image, servletContext);
	    		databaseService.saveFoodComponentImage(foodComponentImage);
	    		sandwichSauce.setFoodComponentImage(foodComponentImage);
	    	}
	    	databaseService.addNewSandwichSauce(sandwichSauce);
	    	mav.addObject("sandwichSauce", sandwichSauce);
	    	mav.setViewName("add-sandwich-sauce-response");
	    	return mav;
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("add-sandwich-sauce-response");
        	return mav;
    	}
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
    @RequestMapping(value = "admin/process-add-sandwich-spice-form", method = RequestMethod.POST)
	public ModelAndView processAddSandwichSpiceForm(ModelAndView mav, @RequestParam String nameGeo, @RequestParam String nameEng, @RequestParam String nameRus,@RequestParam String descriptionGeo, @RequestParam  String descriptionEng, @RequestParam String descriptionRus, @RequestParam(value="image", required = false) MultipartFile image) {
    	try {
	    	SandwichSpice sandwichSpice = new SandwichSpice();
	    	sandwichSpice.setNameEng(nameEng);
	    	sandwichSpice.setNameGeo(nameGeo);
	    	sandwichSpice.setNameRus(nameRus);
	    	sandwichSpice.setDescriptionEng(descriptionEng);
	    	sandwichSpice.setDescriptionGeo(descriptionGeo);
	    	sandwichSpice.setDescriptionRus(descriptionRus);
	    	if(!image.isEmpty()) {
	    		FoodComponentImage foodComponentImage = helper.writeFoodComponentImage(image, servletContext);
	    		databaseService.saveFoodComponentImage(foodComponentImage);
	    		sandwichSpice.setFoodComponentImage(foodComponentImage);
	    	}
	    	databaseService.addNewSandwichSpice(sandwichSpice);
	    	mav.addObject("sandwichSpice", sandwichSpice);
	    	mav.setViewName("add-sandwich-spice-response");
	    	return mav;
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("add-sandwich-spice-response");
        	return mav;
    	}
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
