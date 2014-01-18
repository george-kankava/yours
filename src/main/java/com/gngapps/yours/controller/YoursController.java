package com.gngapps.yours.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

import com.gngapps.yours.AppConstants;
import com.gngapps.yours.databinding.json.request.CustoemrOrderJson;
import com.gngapps.yours.databinding.json.request.CustomerMealsJson;
import com.gngapps.yours.entities.ChangePasswordToken;
import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.entities.CustomerOrder;
import com.gngapps.yours.entities.CustomerSalad;
import com.gngapps.yours.entities.CustomerSandwich;
import com.gngapps.yours.entities.Drink;
import com.gngapps.yours.entities.DrinkAddOn;
import com.gngapps.yours.entities.FoodComponentImage;
import com.gngapps.yours.entities.HotDogBread;
import com.gngapps.yours.entities.HotDogSauce;
import com.gngapps.yours.entities.HotDogSausage;
import com.gngapps.yours.entities.SaladIngredient;
import com.gngapps.yours.entities.SandwichBread;
import com.gngapps.yours.entities.SandwichSauce;
import com.gngapps.yours.entities.SandwichSausage;
import com.gngapps.yours.entities.SandwichSpice;
import com.gngapps.yours.entities.SandwichVegetable;
import com.gngapps.yours.exceptions.PhoneAlreadyInUseException;
import com.gngapps.yours.forms.CustomerChangePasswordEmail;
import com.gngapps.yours.forms.CustomerChangePasswordPasswordsForm;
import com.gngapps.yours.service.DatabaseService;
import com.gngapps.yours.service.impl.YoursHelper;
import com.gngapps.yours.service.mail.MailService;

@Controller
public class YoursController {
	
	@Autowired
	private DatabaseService databaseService;

	@Autowired
	private LocaleResolver localeResolver;
	
	@Autowired
	private ObjectMapper mapper;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private YoursHelper helper;
	
	@Autowired
	private ServletContext servletContext;
	
	private static final Logger logger = LoggerFactory.getLogger(YoursController.class);
	
	@Autowired
	private MessageSource messageSource;

	@ResponseBody
	@RequestMapping(value = "/process-food-component-image")
	public synchronized void processFoodComponentImage(HttpServletResponse response, @RequestParam(value = "imageId", required = false) Integer foodComponentImageId) {
		try {
			System.out.println("YoursController.processFoodComponentImage()");
			if(foodComponentImageId == null) {
				response.sendRedirect(AppConstants.NO_IMAGE_IMAGE_RELATIVE_LOCATION);
			}
			FoodComponentImage image = databaseService.findFoodComponentImage(foodComponentImageId);
			if(image != null) {
				StringBuilder imagePathAndFileName = new StringBuilder();
				imagePathAndFileName.append(AppConstants.FOOD_COMPONENT_IMAGES_RELATIVE_LOCATION).append(image.getImageFileName());
				response.sendRedirect(imagePathAndFileName.toString());
			}
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}
	
	@RequestMapping(value = "/get-drink-addons.ajax")
	public ModelAndView getDrinkAddons(HttpServletRequest request, @RequestParam Integer drinkId, ModelAndView mav) {
		try {
			mav.setViewName("food-components-list-drink-addons-ajax");
			Drink drink = databaseService.findDrinkById(drinkId);
			List<DrinkAddOn> drinkAddOns = drink.getDrinkAddOns();
			mav.addObject("drinkAddOns", drinkAddOns);
			Locale locale = localeResolver.resolveLocale(request);
	    	mav.addObject("locale", locale.getLanguage());
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
		return mav;
	}
	
	@RequestMapping(value = "/operator/operator-process-customer-meals-desk-order", method = RequestMethod.GET)
	public ModelAndView processCustomerMealsDeskOrder(HttpServletRequest request, HttpServletResponse response, @RequestParam String customerMealsJson, ModelAndView mav) {
		try {
			mav.setViewName("operator-customer-order-list");
			CustomerMealsJson meals = mapper.readValue(customerMealsJson, CustomerMealsJson.class);
			List<Integer> sandwichIds = meals.getSandwichIds();
			List<CustomerSandwich> customerSandwiches = databaseService.getSandwichesByIds(sandwichIds);
			List<Integer> saladIds = meals.getSaladIds();
			List<CustomerSalad> customerSalads = databaseService.getSaladsByIds(saladIds);
			List<Integer> drinkIds = meals.getDrinkIds();
			List<CustomerSalad> customerDrinks = databaseService.getDrinksByIds(drinkIds);
			List<Integer> hotdogIds = meals.getHotdogIds();
			List<CustomerSalad> customerHotdog = databaseService.getHotdogByIds(hotdogIds);
			Locale locale = localeResolver.resolveLocale(request);
	    	mav.addObject("locale", locale.getLanguage());
			mav.addObject("customerSandwiches", customerSandwiches);
			mav.addObject("customerSalads", customerSalads);
			mav.addObject("customerDrinks", customerDrinks);
			mav.addObject("customerHotdogs", customerHotdog);
			return mav;
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			mav.setViewName("customer-error-page");
			return mav;
		}
	}
	
	@RequestMapping("/operator/operator-customer-order-pagination.ajax")
	public ModelAndView customerOrdersList(HttpServletRequest request, ModelAndView mav, @RequestParam Integer pageNumber) {
		try {
			Locale locale = localeResolver.resolveLocale(request);
			mav.setViewName("operator-customer-active-orders-ajax-response");
			mav.addObject("locale", locale);
			List<CustomerOrder> customerOrders = databaseService.getCustomerOrderListByPageNumber(pageNumber);
			Integer paginationIndex = pageNumber / AppConstants.CUSTOMER_ORDER_PAGES_PER_PAGE;
			databaseService.countAndAssemblePaginationBar(mav, paginationIndex);
			mav.addObject("pageNumber", pageNumber);
			mav.addObject("customerOrders", customerOrders);
			mav.addObject("paginationPagesAmount", AppConstants.CUSTOMER_ORDER_PAGES_PER_PAGE);
		}catch(Exception ex) {
			logger.info(ex.getMessage());
			mav.setViewName("customer-error-page");
		}
		return mav;
	}
	
	@RequestMapping("/denied")
	public ModelAndView accessDenied(ModelAndView mav) {
		try {
			mav.setViewName("access-denied");
		}catch(Exception ex) {
			logger.info(ex.getMessage());
			mav.setViewName("customer-error-page");
		}
		return mav;
	}
	
	@RequestMapping("/failure")
	public ModelAndView fail(ModelAndView mav) {
		try {
			mav.setViewName("failure");
		}catch(Exception ex) {
			logger.info(ex.getMessage());
			mav.setViewName("customer-error-page");
		}
		return mav;
	}

	@RequestMapping("operator/operator-customer-active-orders")
	public ModelAndView customerActiveOrders(HttpServletRequest request, Principal principal, ModelAndView mav) {
		try {
			Locale locale = localeResolver.resolveLocale(request);
			mav.setViewName("operator-customer-active-orders");
			List<CustomerOrder> activeOrders = databaseService.getCustomerActiveOrders(AppConstants.ACTIVE_ORDERS_PAGING_START_POSITION, AppConstants.ACTIVE_ORDERS_AMOUNT_PER_PAGE);
			Long pagesCount = databaseService.getActiveOrdersPagesCount();
			mav.addObject("startIndex", AppConstants.ACTIVE_ORDERS_INITIAL_START_INDEX);
			mav.addObject("locale", locale);
			if(pagesCount > AppConstants.CUSTOMER_ORDER_PAGES_PER_PAGE) {
				mav.addObject("endIndex", AppConstants.CUSTOMER_ORDER_PAGES_PER_PAGE);
			} else {
				mav.addObject("endIndex", pagesCount);
				mav.addObject("lastPage", Boolean.TRUE);
			}
			mav.addObject("customerOrders", activeOrders);
			mav.addObject("pageNumber", AppConstants.ACTIVE_ORDERS_INITIAL_PAGE_NUMBER);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			mav.setViewName("customer-error-page");
		}
		return mav;
	}
	
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@RequestMapping("operator/customer-order-delivered")
	public void customerOrderDelivered(Principal principal, @RequestParam Integer customerOrderId) {
		try {
			databaseService.changeCustomerOrderActiveStatus(customerOrderId, false);
			databaseService.trackOrderDeliveryTime(principal.getName(), customerOrderId);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}
	
	@RequestMapping("remove-customer-phone")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void removeCustomerPhone(@RequestParam Integer customerPhoneId, ModelAndView mav) {
		try {
			databaseService.removeCustomerPhone(customerPhoneId);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}
	
	@RequestMapping("remove-customer-address")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void removeCustomerAddress(@RequestParam Integer customerAddressId, ModelAndView mav) {
		try {
			databaseService.removeCustomerAddress(customerAddressId);
		} catch(Exception ex) {
			logger.info(ex.getMessage());
		}
	}
	
	@RequestMapping("customer-info")
	public ModelAndView customerPersonalInfo(Principal principal, ModelAndView mav) {
		try {
			mav.setViewName("customer-info");
			String username = principal.getName();
			Customer customer = databaseService.findCustomerByEmail(username);
			mav.addObject(customer);
			return mav;
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			mav.setViewName("customer-error-page");
			return mav;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/process-purchase-customer-order", consumes = "application/json", produces = {"application/json;charset=UTF-8"}, method = RequestMethod.POST)
	public String processPurchaseCustomerOrder(HttpServletRequest request, Principal principal, @RequestBody CustoemrOrderJson customerFoodsAndDrinks) {
		try {
			databaseService.createCustomerOrder(principal.getName(), customerFoodsAndDrinks);
			return helper.emptyJson();
		} catch(PhoneAlreadyInUseException ex) {
			logger.info(ex.getMessage());
			Locale locale = localeResolver.resolveLocale(request);
			String errorMessage = messageSource.getMessage("yours.food.service.phone.already.in.use.exception.message", null, locale);
			return "{\"errorMessage\" : \"" + errorMessage + "\"}";
		} catch(Exception ex) {
			logger.info(ex.getMessage());
			Locale locale = localeResolver.resolveLocale(request);
			String errorMessage = messageSource.getMessage("yours.food.service.customer.meal.order.exception.message", null, locale);
			return "{\"errorMessage\" : \"" + errorMessage + "\"}";
		}
	}

	@RequestMapping("operator/operator-customer-meals")
	public ModelAndView customerMeals(Principal principal, ModelAndView mav) {
		mav.setViewName("operator-customer-meals-list");
		return mav;
	}
	
	@RequestMapping("operator/find-customer-meals.ajax")
	public ModelAndView findCustomerMeals(Principal principal, @RequestParam String username, ModelAndView mav) {
		try {
			if(username == null) {
				throw new IllegalArgumentException("username is null");
			}
			mav.setViewName("operator-customer-meal-list-ajax");
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

	@RequestMapping("/customer-meals-list")
	public ModelAndView mealsList(HttpServletRequest request, Principal principal, ModelAndView mav) {
		try {
			Map<String, Object> customerMeals = databaseService.getCustomerMeals(principal.getName());
			Customer customer = databaseService.findCustomerByEmail(principal.getName());
			Locale locale = localeResolver.resolveLocale(request);
	    	mav.addObject("locale", locale.getLanguage());
			mav.addObject("meals", customerMeals);
			mav.addObject("customer", customer);
			mav.setViewName("customer-meals-list");
			return mav;
		} catch(Exception ex) {
			mav.setViewName("customer-error-page");
			logger.info(ex.getMessage());
			return mav;
		}
	}
	
    @RequestMapping(value = "/food-components-list")
	public ModelAndView foodComponentsList(HttpServletRequest request, ModelAndView mav) {
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
    	Locale locale = localeResolver.resolveLocale(request);
    	mav.addObject("locale", locale.getLanguage());
    	mav.addObject("hotdogSauces", hotdogSauces);
    	mav.setViewName("food-components-list");
    	return mav;
	}
    
    @RequestMapping("/index.html")
	public String indexPage() {
    	return "redirect:/customer-meals-list";
	}
    
    
    @RequestMapping(value = "/signin")
	public String signin() {
    	return "signin";
	}
    
    @RequestMapping("/change-password-step-1")
	public String changePasswordStep1(@ModelAttribute("customerChangePassword") Customer customer) {
    	return "change-password-email-form";
	}
    

    @RequestMapping("/change-password-step-2")
    public ModelAndView changePasswordStep2(HttpServletRequest request,  @ModelAttribute("customerChangePassword") @Valid CustomerChangePasswordEmail customerResetPasswordForm, ModelAndView mav, BindingResult result) {
    	try {
    		if(result.hasErrors()) {
        		String errorMessageCode = result.getFieldError("email").getDefaultMessage();
            	Locale locale = localeResolver.resolveLocale(request);
        		String errorMessage = messageSource.getMessage(errorMessageCode, null, locale);
        		mav.setViewName("change-password-email-form");
        		mav.addObject("errorMessage", errorMessage);
        		return mav;
        	}
    		Locale locale = localeResolver.resolveLocale(request);
    		Customer customer = databaseService.findCustomerByEmail(customerResetPasswordForm.getEmail());
    		if(customer == null) {
    			String customerNotFoundMessage = messageSource.getMessage("yours.food.service.customer.not.found.message", null, locale);
    			mav.setViewName("change-password-email-form");
    			mav.addObject("errorMessage", customerNotFoundMessage);
    		}
    		String changePasswordToken = helper.generateCustomerPasswordChangeToken(customer);
    		while(databaseService.getPasswordChangeToken(changePasswordToken) != null) {
    			changePasswordToken = helper.generateCustomerPasswordChangeToken(customer);
    		}
    		databaseService.saveChangePasswordToken(customer, changePasswordToken, new Date());
    		mailService.sendCustomerChangePasswordLink(customer, changePasswordToken, locale);
    		String message = messageSource.getMessage("yours.food.service.change.password.mail.sent.message", null, locale);
    		mav.addObject("message", message);
    		mav.setViewName("signin");
    		return mav;
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("customer-error-page");
    		return mav;
    	}
    }
    
    @RequestMapping("/change-password-step-3/{changePasswordToken}")
	public ModelAndView changePasswordStep3(HttpServletRequest request, @PathVariable String changePasswordToken, ModelAndView mav, 
			@ModelAttribute("customerChangePasswordPasswordsForm") CustomerChangePasswordPasswordsForm passwordsForm, 
			@ModelAttribute("customerChangePassword") CustomerChangePasswordEmail customerResetPasswordForm) {
    	try {
    		Locale locale = localeResolver.resolveLocale(request);
    		mav.setViewName("signin");
    		ChangePasswordToken token = databaseService.getPasswordChangeToken(changePasswordToken);
    		if(token == null) {
    			String errorMessage = messageSource.getMessage("yours.food.service.change.password.token.not.found", null, locale);
    			mav.setViewName("change-password-email-form");
    			mav.addObject("errorMessage", errorMessage);
    			return mav;
    		}
    		long tokenValidityPeriodInMillies = token.getTimestamp().getTime() + AppConstants.ONE_HOUR_IN_MILLIES;
    		long currentTimeInMillies = System.currentTimeMillis();
    		if(tokenValidityPeriodInMillies > currentTimeInMillies) {
    			passwordsForm.setToken(token.getToken());
    			mav.setViewName("change-password-passwords-form");
    			return mav;
    		} else {
    			databaseService.removeCustomerPasswordChangeToken(token);
	    		String errorMessage = messageSource.getMessage("yours.food.service.change.password.time.expired", null, locale);
	    		mav.setViewName("change-password-email-form");
	    		mav.addObject("errorMessage", errorMessage);
	        	return mav;
    		}
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("customer-error-page");
    		return mav;
    	}
	}
    
    @RequestMapping(value = "/change-password-step-4", method = RequestMethod.POST)
    public ModelAndView changePasswordStep4(HttpServletRequest request, ModelAndView mav, @ModelAttribute("customerChangePasswordPasswordsForm") CustomerChangePasswordPasswordsForm passwordsForm, BindingResult result) {
    	try {
    		if(passwordsForm.getToken() == null || passwordsForm.getToken().equals("")) {
    			throw new IllegalArgumentException("password change token is null");
    		}
    		Locale locale = localeResolver.resolveLocale(request);
    		if(!StringUtils.equals(passwordsForm.getPassword(), passwordsForm.getConfirmPassword())) {
    			passwordsForm.setPassword("");
    			passwordsForm.setConfirmPassword("");
    			String errorMessage = messageSource.getMessage("yours.food.service.change.password.password.not.match.message", null, locale);
    			mav.addObject("errorMessage", errorMessage);
    			mav.setViewName("change-password-passwords-form");
    			return mav;
    		}
    		databaseService.changeCustomerPasswordAndRemovePasswordChangeToken(passwordsForm.getToken(), passwordsForm.getPassword());
    		String message = messageSource.getMessage("yours.food.service.customer.change.password.has.changed.message", null, locale);
    		mav.addObject("message", message);
    		mav.setViewName("signin");
    		return mav;
    	} catch(Exception ex) {
    		logger.info(ex.getMessage());
    		mav.setViewName("customer-error-page");
    		return mav;
    	}
    }
    
    @RequestMapping(value = "/register-user")
	public String register(@ModelAttribute("customer") Customer customer, BindingResult result) {
    	return "register-user";
	}
    
    @RequestMapping(value = "/process-register-user", method = RequestMethod.POST)
	public ModelAndView processRegister(HttpServletRequest request, HttpSession session, @ModelAttribute @Valid Customer customer, ModelAndView mav, BindingResult result) {
    	Locale locale = localeResolver.resolveLocale(request);
    	if(result.hasErrors()) {
    		String errorMessageCode = result.getFieldError().getDefaultMessage();
    		String errorMessage = messageSource.getMessage(errorMessageCode, null, locale);
    		mav.setViewName("register-user");
    		mav.addObject(errorMessage);
    		return mav;
    	}
    	databaseService.registerCustomer(customer);
    	mailService.sendCustomerRegistrationMail(customer, locale);
    	mav.setViewName("signin");
    	return mav;
	}
    
    @RequestMapping(value = "admin/add-food-components")
	public ModelAndView addFoodComponents(ModelAndView mav) {
    	mav.setViewName("add-food-components");
    	return mav;
	}
    
    @RequestMapping(value = "customer-error-page")
	public ModelAndView customerErrorPage(ModelAndView mav) {
    	mav.setViewName("customer-error-page");
    	return mav;
	}
    
}
