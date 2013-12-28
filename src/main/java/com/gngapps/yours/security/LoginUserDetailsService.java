package com.gngapps.yours.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.gngapps.yours.AppConstants;
import com.gngapps.yours.entities.Customer;
import com.gngapps.yours.service.DatabaseService;

public class LoginUserDetailsService implements UserDetailsService {
	
	@Autowired
	private DatabaseService service;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Customer customer = service.findCustomerByUsername(username);
		Collection<? extends GrantedAuthority> roles = getAuthorities(customer.getRole().getRole());
		User user = new User(customer.getUsername(), customer.getPassword(), roles);
		return user;
	}

	/**
	 * Retrieves a collection of {@link GrantedAuthority} based on a numerical role
	 * @param role the numerical role
	 * @return a collection of {@link GrantedAuthority
	 */
	public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}
	
	/**
	 * Converts a numerical role to an equivalent list of roles
	 * @param role the numerical role
	 * @return list of roles as as a list of {@link String}
	 */
	public List<String> getRoles(Integer role) {
		List<String> roles = new ArrayList<String>();
		
		if (role.intValue() == 1) {
			roles.add(AppConstants.ROLE_ADMIN);
			roles.add(AppConstants.ROLE_DESK_ORDERS_OPERATOR);
			roles.add(AppConstants.ROLE_ONLINE_ORDERS_OPERATOR);
			roles.add(AppConstants.ROLE_CUSTOMER);
			
		} else if (role.intValue() == 2) {
			roles.add(AppConstants.ROLE_DESK_ORDERS_OPERATOR);
		} else if (role.intValue() == 3) {
			roles.add(AppConstants.ROLE_ONLINE_ORDERS_OPERATOR);
		} else if (role.intValue() == 4) {
			roles.add(AppConstants.ROLE_CUSTOMER);
		}
		
		return roles;
	}
	
	/**
	 * Wraps {@link String} roles to {@link SimpleGrantedAuthority} objects
	 * @param roles {@link String} of roles
	 * @return list of granted authorities
	 */
	public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}
}
