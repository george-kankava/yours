<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Food Service" />
<meta name="author" content="GNG Apps" />
<link rel="shortcut icon" href="/yours-food-service/resources/ico/yours-sml-logo.gif" />

<title>
	<spring:message code="yours.food.service.access.denied.title" text="Access Denied"/>
</title>

<!-- Bootstrap core CSS -->
<link href="/yours-food-service/resources/css/bootstrap.css" rel="stylesheet" />


<!-- Custom styles for this template -->
<link href="/yours-food-service/resources/css/yours-food-service.css" rel="stylesheet" />
<link href="/yours-food-service/resources/css/jumbotron-narrow.css" rel="stylesheet" />

<script src="/yours-food-service/resources/js/jquery-2.0.3.min.js"></script>
<script src="/yours-food-service/resources/js/bootstrap.min.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	      <script src="resources/assets/js/html5shiv.js"></script>
	      <script src="resources/assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<div class="container">
		<div class="header">
			<ul class="nav nav-pills pull-right">
				<li><a href="/yours-food-service/j_spring_security_logout">Logout</a></li>
			</ul>
			<h3 class="text-muted">Yours.ge</h3>
		</div>
		<div class="logo-image-narrow"></div>
		<div class="row">
			<div class="col-lg-12">
				<div class="jumbotron">
					<h1><spring:message code="yours.food.service.access.denied.title" text="Access Denied"/></h1>
					<p><spring:message text="Access Denied on this page" code="yours.food.service.access.denied.text"/></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>