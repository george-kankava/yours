<?xml version="1.0" encoding="UTF-8" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif">
<title><spring:message code="yours.food.service.customer.change.password.title" text="Change Password" /></title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/form.css" rel="stylesheet">
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
			<div class="row">
				<div class="col-lg-6 col-lg-offset-3">
					<h2 class="form-signin-heading"><spring:message code="yours.food.service.enter.email.title" text="Please Enter Your Email" /></h2>
				</div>
			</div>
			<form:form commandName="customerChangePasswordPasswordsForm" class="form-signin" method="post" action="change-password-step-4">
				<c:if test="${!empty message }">
					<span class="lead"><c:out value="${message }" /></span>
				</c:if>
				<c:if test="${!empty errorMessage }">
					<span class="lead"><code><c:out value="${errorMessage }" /></code></span>
				</c:if>
				<spring:message code="yours.food.service.customer.info.customer.password" text="Password" var="passwordPlaceholderText"/>
				<form:input name="password" path="password" type="password" class="form-control" placeholder="${passwordPlaceholderText }"/>
				<spring:message code="yours.food.service.customer.info.customer.confirm.password" text="Confirm Password" var="confirmPasswordPlaceholderText"/>
				<form:input name="password" path="password" type="password" class="form-control" placeholder="${confirmPasswordPlaceholderText }"/>
				<button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="yours.food.service.submit.button.title" text="Submit" /></button>
				<spring:message code="yours.food.service.signin.question.title" text="Not Signed in?" /> <a href="signin"><spring:message code="yours.food.service.signin.title" text="Sign in"/></a>
			</form:form>
		</div>
	</div>
	<!-- /container -->
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery-2.0.3.min.js"></script>
</body>
</html>
