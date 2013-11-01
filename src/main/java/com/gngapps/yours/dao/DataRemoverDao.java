package com.gngapps.yours.dao;

public interface DataRemoverDao {
	void removeSandwichBreadSizeAndPrice(Integer sandwichBreadSizeAndPrice);

	void removeSandwichBread(Integer sandwichBreadId);
}
