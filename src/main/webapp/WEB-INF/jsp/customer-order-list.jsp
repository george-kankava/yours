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
<link href="../es/css/alertify.bootstrap.css" rel="stylesheet" />


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	      <script src="resources/assets/js/html5shiv.js"></script>
	      <script src="resources/assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<div class="container">
		<div class="header">
			<h3 class="text-muted">Yours.ge</h3>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="alert alert-success">Sandwiches</div>
			</div>
		</div>
		<c:forEach var="customerSandwich" items="${customerSandwiches }">
			<div class="row">
				<div class="col-lg-12">
					<h5>Sandwich - ${customerSandwich.id }</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<h5>Bread Name</h5>
				</div>
				<div class="col-lg-6">
					<h5>Bread Size</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					${customerSandwich.sandwichBread.nameGeo }
				</div>
				<div class="col-lg-6">
					${customerSandwich.sandwichBreadSizeAndPrice.size }
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<h5>Sausage Name</h5>
				</div>
				<div class="col-lg-6">
					<h5>Sausage Amount</h5>
				</div>
			</div>
			<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausage">
				<div class="row">
					<div class="col-lg-6">
						${sandwichSausage.sandwichSausage.nameGeo }
					</div>
					<div class="col-lg-6">
						${sandwichSausage.amountAndPrice.price }
					</div>
				</div>			
			</c:forEach>
			<div class="row">
				<div class="col-lg-6">
					<h5>Vegetable Name</h5>
				</div>
				<div class="col-lg-6">
					<h5>Vegetable Amount</h5>
				</div>
			</div>
			<c:forEach items="${customerSandwich.sandwichVegetables }" var="sandwichVegetable">
				<div class="row">
					<div class="col-lg-6">
						${sandwichVegetable.sandwichVegetable.nameGeo }
					</div>
					<div class="col-lg-6">
						${sandwichVegetable.sandwichVegetableAmountAndPrice.portion }
					</div>
				</div>			
			</c:forEach>
			<div class="row">
				<div class="col-lg-6">
					<h5>Sauce Name</h5>
				</div>
				<div class="col-lg-6">
					<h5>Sauce Amount</h5>
				</div>
			</div>
			<c:forEach items="${customerSandwich.sandwichSauces }" var="sandwichSauce">
				<div class="row">
					<div class="col-lg-6">
						${sandwichSauce.sandwichSauce.nameGeo }
					</div>
					<div class="col-lg-6">
						${sandwichSauce.sandwichSauceAmountAndPrice.portion }
					</div>
				</div>			
			</c:forEach>
			<div class="row">
				<div class="col-lg-6">
					<h5>Spice Name</h5>
				</div>
				<div class="col-lg-6">
					<h5>Sauce Amount</h5>
				</div>
			</div>
			<c:forEach items="${customerSandwich.sandwichSpices }" var="sandwichSpice">
				<div class="row">
					<div class="col-lg-6">
						${sandwichSpice.sandwichSpice.nameGeo }
					</div>
					<div class="col-lg-6">
						${sandwichSpice.sandwichSpiceAmountAndPrice.portion }
					</div>
				</div>			
			</c:forEach>
		</c:forEach>
		<div id="mealsContentResult" style="margin-top: 15px">
		</div>
	</div>
	<script src="../resources/js/jquery-2.0.3.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/jquery.icheck.js"></script>
	<script src="../resources/js/alertify.min.js"></script>
</body>
</html>