package com.gngapps.yours;

public interface AppConstants {
	// active orders per page
	Integer ACTIVE_ORDERS_AMOUNT_PER_PAGE = 10;
	// active orders pages number per page
	Integer CUSTOMER_ORDER_PAGES_PER_PAGE = 10;
	// initial index of orders to be passed in setFirstResult or Query object
	Integer ACTIVE_ORDERS_PAGING_START_POSITION = 0;
	// initial index for active orders pagination
	Integer ACTIVE_ORDERS_INITIAL_START_INDEX = 1;
	// active orders initial page number
	Integer ACTIVE_ORDERS_INITIAL_PAGE_NUMBER = 1;
	// value that needs to be added to paginationIndex when dividing page number on CUSTOMER_ORDER_PAGES_PER_PAGE to calculate end value/number of the pagination 
	Integer ACTIVE_ORDERS_PAGINATION_INDEX_ADDITIONAL_ONE = 1;

	// application roles
	String ROLE_ADMIN = "ROLE_ADMIN";
	String ROLE_CUSTOMER = "ROLE_CUSTOMER";
	String ROLE_DESK_ORDERS_OPERATOR = "ROLE_DESK_ORDERS_OPERATOR";
	String ROLE_ONLINE_ORDERS_OPERATOR = "ROLE_ONLINE_ORDERS_OPERATOR";
	// Landing pages
	String ADMIN_LANDING_PAGE = "admin/add-food-components";
	String ONILE_ORDERS_OPERATOR_LANDING_PAGE = "operator/operator-customer-active-orders";
	String DESK_ORDERS_OPERATOR_LANDING_PAGE = "operator/operator-customer-meals";
	String CUSTOMER_LANDING_PAGE = "customer-meals-list";
	Integer CUSTOMER_GENERATOR_MAX_NUMBER = 100000;
	String FOUR_ZEROS = "0000";
	String THREE_ZEROS = "000";
	String TWO_ZEROS = "00";
	String ONE_ZERO = "0";
	long ONE_HOUR_IN_MILLIES = 60 * 60 * 1000;
	String DIGEST_ALGORITHM_SHA = "SHA";
	String FOOD_COMPONENT_IMAGES_RELATIVE_LOCATION = "food-component-images/";
	String NO_IMAGE_IMAGE_RELATIVE_LOCATION = "resources/img/NoPhotoAvailable.jpg";
}
