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
}
