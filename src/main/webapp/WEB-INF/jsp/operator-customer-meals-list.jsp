<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Food Service" />
<meta name="author" content="GNG Apps" />
<link rel="shortcut icon" href="../resources/ico/yours-sml-logo.gif" />

<title><spring:message code="" text="Customer Meals" /></title>

<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="../resources/css/yours-food-service.css" rel="stylesheet" />
<link href="../resources/css/jumbotron-narrow.css" rel="stylesheet" />
<link href="../resources/css/flat/red.css" rel="stylesheet">
<link href="../resources/css/alertify.core.css" rel="stylesheet" />
<link href="../resources/css/alertify.default.css" rel="stylesheet" />
<link href="../resources/css/alertify.bootstrap.css" rel="stylesheet" />


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
				<li class="active"><a href="customer-meals-page">Customer Meals</a></li>
				<li><a href="../j_spring_security_logout">Logout</a></li>
			</ul>
			<h3 class="text-muted">Yours.ge</h3>
		</div>
		<div class="logo-image-narrow"></div>
		<div class="row">
			<spring:message code="yours.food.service.operator.page.customer.username" text="Customer Username" var="inputPlaceholder" />
			<div class="col-lg-9">
				<input class="form-control input-lg" id="customerUsername" type="text" placeholder="${inputPlaceholder }" />
			</div>
			<div class="col-lg-3">
				<button type="button" id="customerMealsFindButton" class="btn btn-success btn-lg">
  					<spring:message code="yours.food.service.operator.find.button.title" text="Find Meals" /> <span class="glyphicon glyphicon-th-list"></span>
				</button>
			</div>
		</div>
		<div id="mealsContentResult" style="margin-top: 15px">
		</div>
	</div>
	<script src="../resources/js/jquery-2.0.3.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/jquery.icheck.js"></script>
	<script src="../resources/js/alertify.min.js"></script>
	<script>
		$('#customerMealsFindButton').click(function() {
			getCustomerMeals();
		});
		$('#customerUsername').bind('keypress', function(e) {
			var code = e.keyCode || e.which;
			if(code == 13) {
				getCustomerMeals();
			}
		});
		
		function getCustomerMeals() {
			var customerUsername =  $('#customerUsername').val();
			$.get( "find-customer-meals.ajax", { username: customerUsername} )
			.done(function(result) {
				$('#mealsContentResult').empty();
				$('#mealsContentResult').append(result);
			});
		}
	</script>
</body>
</html>