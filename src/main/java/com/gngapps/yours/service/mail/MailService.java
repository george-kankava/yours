package com.gngapps.yours.service.mail;

import java.util.Locale;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

import com.gngapps.yours.entities.Customer;

@Component("mailService")
public class MailService {
	
	private static final Logger logger = LoggerFactory.getLogger(MailService.class);
	
	@Autowired
	private MessageSource messageSource;
	
	boolean mailServerMail = true;
	boolean googleMail = false;

	public void sendCustomerChangePasswordLink(Customer customer, String changePasswordToken, Locale locale) {
		String subject = messageSource.getMessage("yours.food.service.customer.change.password.email.subject", null, locale);
		String passworChangeUrl = messageSource.getMessage("yours.food.service.customer.change.password.url", new Object[] {changePasswordToken}, locale);
		String content = messageSource.getMessage("yours.food.service.customer.change.password.email.content", new Object[] {passworChangeUrl, passworChangeUrl}, locale);
		sendMail(customer.getEmail(), subject, content);
	}
	
	public void sendCustomerRegistrationMail(Customer customer, Locale locale) {
		String subject = messageSource.getMessage("yours.food.service.customer.registration.email.subject", null, locale);
		String content = messageSource.getMessage("yours.food.service.customer.registration.email.content", new Object[] {customer.getFirstname(), customer.getUsername(), customer.getPassword()}, locale);
		sendMail(customer.getEmail(), subject, content);
	}
	
	private void sendMail(String to, String subject, String content) {
		if(mailServerMail) {
			sendMailServerMail(to, subject, content);
		} else if(googleMail) {
			sendGoogleMail(to, subject, content);
		}

	}
	
	
	private void sendMailServerMail(String to, String subject, String content) {

		// Sender's email ID needs to be mentioned
		String from = "george.kankava@gmail.com";

		// Assuming you are sending email from localhost
		String host = "localhost";

		// Get system properties
		Properties properties = System.getProperties();

		// Setup mail server
		properties.setProperty("mail.smtp.host", host);

		// Get the default Session object.
		Session session = Session.getDefaultInstance(properties);

		try {
			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);

			// Set From: header field of the header.
			message.setFrom(new InternetAddress(from));

			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: header field
			message.setSubject(subject, "UTF-8");

			// Send the actual HTML message, as big as you like
			message.setContent(content, "text/html;charset=UTF-8");

			// Send message
			Transport.send(message);
			logger.info("Email sent to user : " + to + " successfully");
		} catch (MessagingException ex) {
			logger.info(ex.getMessage());
		}
	}
	
	private void sendGoogleMail(String to, String subject, String content) {
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");
 
		Session session = Session.getDefaultInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("username","password");
				}
			});
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("from@no-spam.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=UTF-8");
 
			Transport.send(message);
			logger.info("Email sent to user : " + to + " successfully");
		} catch (MessagingException ex) {
			logger.info(ex.getMessage());
		}
	}

}
