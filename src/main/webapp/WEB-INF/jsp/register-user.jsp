<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif">
<title>Registration</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/form.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/jquery-ui.css" />
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<div class="container">
		<div class="jumbotron">
			<div class="row">
				<div class="col-md-4 col-md-offset-5">
					<h1>Yours</h1>
					<p>Food Service for your.</p>
				</div>
			</div>
			<form:form commandName="customer" class="form-signin" method="post" action="process-register-user">
				<h2 class="form-signin-heading"><spring:message code="yours.food.service.registration.title" text="Please Register"></spring:message></h2>
				<form:errors path="email" element="div" class="error" />
				<spring:message code="yours.food.service.email.title" text="Email" var="emailPlaceholderText"/>
				<form:input name="email" path="email" class="form-control" placeholder="${emailPlaceholderText }"></form:input>
				<spring:message code="yours.food.service.customer.info.customer.firstname" text="First Name" var="firstnamePlaceholderText"/>
				<form:errors path="firstname" element="div" class="error" />
				<form:input name="firstname" path="firstname" class="form-control" placeholder="${firstnamePlaceholderText }"/>
				<form:errors path="lastname" class="error" />
				<spring:message code="yours.food.service.customer.info.customer.lastname" text="Last Name" var="lastnamePlaceholderText"/>
				<form:input name="lastname" path="lastname" class="form-control" placeholder="${lastnamePlaceholderText }"/>
				<spring:message code="yours.food.service.customer.info.customer.birthday" text="Birthday" var="birthdayPlaceholderText"/>
				<form:input name="birthday" path="birthday" class="form-control datepicker" placeholder="${birthdayPlaceholderText }"/>
				<spring:message code="yours.food.service.customer.info.customer.password" text="Password" var="passwordPlaceholderText"/>
				<form:input name="password" path="password" type="password" class="form-control" placeholder="${passwordPlaceholderText }"/>
				<button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="yours.food.service.register.button.title"></spring:message></button>
				<spring:message code="yours.food.service.signin.question.title" text="Not Signed in?" /> <a href="signin"><spring:message code="yours.food.service.signin.title" text="Sign in"/></a>
			</form:form>
		</div>
	</div>
	<!-- /container -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery-2.0.3.min.js"></script>
	<script src="resources/js/jquery-ui.js"></script>
	 <script>
  	$(function() {
    	$( ".datepicker" ).datepicker({
      		changeMonth: true,
      		changeYear: true,
      		dateFormat: 'dd/mm/yy',
      		defaultDate: '01/01/1995'
    	});
  	});
  </script>
</body>
</html>
