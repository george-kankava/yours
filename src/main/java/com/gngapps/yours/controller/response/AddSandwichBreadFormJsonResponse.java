package com.gngapps.yours.controller.response;

import java.util.List;

public class AddSandwichBreadFormJsonResponse {
	private String responseStatus;
	private String message;
	private List<String> errorMessages;
	
	public String getResponseStatus() {
		return responseStatus;
	}
	public void setResponseStatus(String responseStatus) {
		this.responseStatus = responseStatus;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public List<String> getErrorMessages() {
		return errorMessages;
	}
	public void setErrorMessages(List<String> errorMessages) {
		this.errorMessages = errorMessages;
	}
	@Override
	public String toString() {
		return "AddSandwichBreadFormJsonResponse [responseStatus=" + responseStatus + ", message=" + message + ", errorMessages=" + errorMessages + "]";
	}
	
}
