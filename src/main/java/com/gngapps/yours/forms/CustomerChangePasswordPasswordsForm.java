package com.gngapps.yours.forms;

public class CustomerChangePasswordPasswordsForm {

	private String password;
	private String confirmPassword;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	@Override
	public String toString() {
		return "CustomerChangePasswordPasswordsForm [password=" + password + ", confirmPassword=" + confirmPassword + "]";
	}
	
}
