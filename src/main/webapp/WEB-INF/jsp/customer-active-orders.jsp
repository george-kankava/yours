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
						#${customerOrder.id } - ${customerOrder.customer.username } - <fmt:formatDate type="time" value="${customerOrder.date}" /> - ${customerOrder.shipmentAddress } - ${customerOrder.phoneNumber } <a data-toggle="modal" data-target="#myModal${customerOrder.id}" href="#">View Order</a>  
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade" id="myModal${customerOrder.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Order Ingredients</h4>
							</div>
							<div class="modal-body">
								<c:forEach items="${customerOrder.customerSandwichs }" var="customerSandwich">
										<div class="row">
											<div class="col-lg-12">
												<p class="lead">Sandwich - ${customerSandwich.id }</p>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-7">
												${customerSandwich.sandwichBread.nameGeo }
											</div>
											<div class="col-lg-5">
												${customerSandwich.sandwichBreadSizeAndPrice.size }
											</div>
										</div>
										<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausageWithAmountAndPrice">
											<div class="row">
												<div class="col-lg-7"> ${sandwichSausageWithAmountAndPrice.sandwichSausage.nameGeo }</div>
												<div class="col-lg-5"> ${sandwichSausageWithAmountAndPrice.amountAndPrice.portion }</div>
											</div>
										</c:forEach>
										<c:forEach items="${customerSandwich.sandwichVegetables }" var="sandwichVegetableWithAmountAndPrice">
											<div class="row">
												<div class="col-lg-7"> ${sandwichVegetableWithAmountAndPrice.sandwichVegetable.nameGeo }</div>
												<div class="col-lg-5"> ${sandwichVegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.portion }</div>
											</div>
										</c:forEach>
										<c:forEach items="${customerSandwich.sandwichSauces }" var="sandwichSauceWithAmountAndPrice">
											<div class="row">
												<div class="col-lg-7"> ${sandwichSauceWithAmountAndPrice.sandwichSauce.nameGeo }</div>
												<div class="col-lg-5"> ${sandwichSauceWithAmountAndPrice.sandwichSauceAmountAndPrice.portion }</div>
											</div>
										</c:forEach>
										<c:forEach items="${customerSandwich.sandwichSpices }" var="sandwichSpicesWithAmountAndPrice">
											<div class="row">
												<div class="col-lg-7"> ${sandwichSpicesWithAmountAndPrice.sandwichSpice.nameGeo }</div>
												<div class="col-lg-5"> ${sandwichSpicesWithAmountAndPrice.sandwichSpiceAmountAndPrice.portion }</div>
											</div>
										</c:forEach>
								</c:forEach>
								<c:forEach items="${customerOrder.customerSalads }" var="customerSalad">
									<div class="row">
										<div class="col-lg-12">
											<p class="lead">Salad - ${customerSalad.id }</p>
										</div>
									</div>
									<c:forEach items="${customerSalad.ingredientWithAmountAndPrices }" var="ingredientWithAmountAndPrice">
										<div class="row">
											<div class="col-lg-7">
												${ingredientWithAmountAndPrice.saladIngredient.nameGeo }
											</div>
											<div class="col-lg-5">
												${ingredientWithAmountAndPrice.amountAndPrice.amount }
											</div>
										</div>
									</c:forEach>
								</c:forEach>
								<c:forEach items="${customerOrder.customerDrinks }" var="customerDrink">
									<div class="row">
										<div class="col-lg-12">
											<p class="lead">Drinks - ${customerDrink.id } <span class="glyphicon glyphicon-glass"></span></p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-7">
											${customerDrink.drinkWithSizeAndPrice.drink.nameGeo }
										</div>
										<div class="col-lg-5">
											${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.size }
										</div>
									</div>
									<code>add-ons</code>
									<c:forEach items="${customerDrink.addonWithAmountAndPrices }" var="addonWithAmountAndPrice">
										<div class="row">
											<div class="col-lg-7">
												${addonWithAmountAndPrice.drinkAddOn.nameGeo }
											</div>
											<div class="col-lg-5">
												${addonWithAmountAndPrice.addOnAmountAndPrice.amount }
											</div>
										</div>
									</c:forEach>
								</c:forEach>
								<c:forEach items="${customerOrder.customerHotdogs }" var="customerHotdog">
									<div class="row">
										<div class="col-lg-12">
											<p class="lead">Hotdog - ${customerHotdog.id }</p>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-7">
											${customerHotdog.bread.nameGeo }
										</div>
										<div class="col-lg-5">
											${customerHotdog.sizeAndPrice.size }
										</div>
									</div>
									<div class="row">
										<div class="col-lg-7">
											${customerHotdog.sausage.nameGeo }
										</div>
										<div class="col-lg-5">
											${customerHotdog.amountAndPrice.portion }
										</div>
									</div>
									<c:forEach items="${customerHotdog.amountAndPrices }" var="hotDogSauceWithAmountAndPrice">
										<div class="row">
											<div class="col-lg-7">
												${hotDogSauceWithAmountAndPrice.sauce.nameGeo }
											</div>
											<div class="col-lg-5">
												${hotDogSauceWithAmountAndPrice.amountAndPrice.amount }
											</div>
										</div>
									</c:forEach>
								</c:forEach>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
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