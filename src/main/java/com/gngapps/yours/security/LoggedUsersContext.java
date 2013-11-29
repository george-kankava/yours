package com.gngapps.yours.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

public class LoggedUsersContext {
	public static String getCurrentUserUsername() {
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	User currUser = (User)authentication.getPrincipal();
    	return currUser.getUsername();
    }
}
