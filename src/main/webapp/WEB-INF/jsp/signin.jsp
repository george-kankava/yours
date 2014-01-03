<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif">
<title>Yours Signin</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="resources/css/form.css" rel="stylesheet" />
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
			<form commandName="customer" class="form-signin" method="POST" action="j_spring_security_check">
				<c:if test="${!empty message }">
					<span class="lead"><c:out value="${message }" /></span>
				</c:if>
				<h2 class="form-signin-heading"><spring:message code="yours.food.service.signin.title" /></h2>
				<input class="form-control" name="j_username" placeholder="Email address" autofocus />
				<input class="form-control" name="j_password" type="password" placeholder="Password" />
				<label class="checkbox"> 
					<input type="checkbox" value="remember-me"><spring:message code="yours.food.service.signin.page.rememberme.checkbox.title" /></input>
				</label>
				<button class="btn btn-lg btn-primary btn-block" type="submit"><spring:message code="yours.food.service.signin.button.title" /></button>
				<spring:message code="yours.food.service.not.register" /> <a href="register-user"><spring:message code="yours.food.service.register" /></a><br/>
				<spring:message code="yours.food.service.forgot.password" /> <a href="change-password-step-1"><spring:message code="yours.food.service.password.restore" /></a>
			</form>
		</div>
		<!-- /container -->
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
