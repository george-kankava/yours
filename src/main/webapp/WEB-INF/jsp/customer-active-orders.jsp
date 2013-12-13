<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<link rel="shortcut icon" href="../resources/ico/yours-sml-logo.gif" />

<title>
	<spring:message code="yours.food.service.active.orders.title" text="Active Orders" />
</title>

<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="../resources/css/yours-food-service.css" rel="stylesheet" />
<link href="../resources/css/jumbotron-narrow.css" rel="stylesheet" />

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
				<li class="active"><a href="#">Ingredients</a></li>
				<li><a href="customer-meals-page"><spring:message code="yours.food.service.meals" text="Meals" /></a></li>
				<li><a href="j_spring_security_logout">Logout</a></li>
			</ul>
			<h3 class="text-muted">Yours.ge</h3>
		</div>
		<div class="logo-image-narrow"></div>
		<div class="row">
			<c:forEach items="${customerOrders }" var="customerOrder">
				<div class="col-md-12"> 
					<div class="alert alert-success">
						#${customerOrder.id } - ${customerOrder.customer.username } - <fmt:formatDate type="time" value="${customerOrder.date}" /> - ${customerOrder.shipmentAddress } - ${customerOrder.phoneNumber } <a href="#">View Order</a>  
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<script src="../resources/js/jquery-2.0.3.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
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