package com.gngapps.yours.forms;

import javax.validation.constraints.Pattern;

public class CustomerChangePasswordEmail {
	
	@Pattern(regexp = "[a-zA-Z0-9,.-_]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}", message = "yours.food.service.enter.valid.email.message")
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "CustomerPasswordResetForm [email=" + email + "]";
	}
	
}
