package com.gngapps.yours.exceptions;

public class PhoneAlreadyInUseException extends Exception {

	private static final long serialVersionUID = 1L;

	public PhoneAlreadyInUseException(String message) {
		super(message);
	}
}
