package com.gngapps.yours.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.gngapps.yours.AppConstants;

public class AuthenticationSucessHandlerImpl implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		List<String> authoritiesCollection = new ArrayList<String>();
		for(GrantedAuthority authority : authorities) {
			authoritiesCollection.add(authority.getAuthority());
		}
		if(authoritiesCollection.contains(AppConstants.ROLE_ADMIN)) {
			response.sendRedirect(AppConstants.ADMIN_LANDING_PAGE);
		} else if(authoritiesCollection.contains(AppConstants.ROLE_DESK_ORDERS_OPERATOR)) {
			response.sendRedirect(AppConstants.DESK_ORDERS_OPERATOR_LANDING_PAGE);
		} else if(authoritiesCollection.contains(AppConstants.ROLE_ONLINE_ORDERS_OPERATOR)) {
			response.sendRedirect(AppConstants.ONILE_ORDERS_OPERATOR_LANDING_PAGE);
		} else if(authoritiesCollection.contains(AppConstants.ROLE_CUSTOMER)) {
			response.sendRedirect(AppConstants.CUSTOMER_LANDING_PAGE);
		}
	}

}
