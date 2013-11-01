<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif">
<title>Yours Login</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/signin.css" rel="stylesheet">
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
				<h2 class="form-signin-heading">Please Register</h2>
				<form:errors path="username" element="div" class="error" />
				<form:input name="username" path="username" class="form-control" placeholder="Email"></form:input>
				<form:errors path="firstname" element="div" class="error" />
				<form:input name="firstname" path="firstname" class="form-control" placeholder="First Name"/>
				<form:errors path="lastname" class="error" />
				<form:input name="lastname" path="lastname" class="form-control" placeholder="Last Name"/>
				<form:input name="birthday" path="birthday" class="form-control datepicker" placeholder="Birthday"/>
				<form:input name="password" path="password" type="password" class="form-control" placeholder="Password"/>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
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
