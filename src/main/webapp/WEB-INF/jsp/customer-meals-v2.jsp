<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Food Service" />
<meta name="author" content="GNG Apps" />
<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif" />

<title><spring:message code="" text="Customer Meals" /></title>
<script src="resources/js/jquery-2.0.3.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.fs.selecter.min.js"></script>
<script src="resources/js/yours.js"></script>
<script src="resources/js/alertify.min.js"></script>
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="resources/css/yours-food-service.css" rel="stylesheet" />
<link href="resources/css/jquery.fs.selecter.css" rel="stylesheet" />
<link href="resources/css/jumbotron-narrow.css" rel="stylesheet" />
<link href="resources/css/blue.css" rel="stylesheet" />
<link href="resources/css/alertify.core.css" rel="stylesheet" />
<link href="resources/css/alertify.default.css" rel="stylesheet" />
<link href="resources/css/alertify.bootstrap.css" rel="stylesheet" />

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
				<li><a href="food-components-list"><spring:message code="yours.food.service.ingredients" text="Ingredient"/></a></li>
				<li class="active"><a href="#"><spring:message code="yours.food.service.meals" text="Meals" /></a></li>
				<li><a href="j_spring_security_logout">Logout</a></li>
			</ul>
			<h3 class="text-muted">Project name</h3>
		</div>
		<div class="logo-image-narrow"></div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne"> Sandwiches </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['sandwiches']}" var="customerSandwich">
									<table class="table table-bordered" id="customerSandwich${customerSandwich.id }">
											<thead>
												<tr class="danger">
												<th colspan="2"><strong>Sandwich - ${customerSandwich.id}</strong></th>
												<th><button id="sandwichRemoveButtion${customerSandwich.id}" type="button" class="close" aria-hidden="true">&times;</button></th>
												<tr>
											</thead>
											<tr class="active">
												<td><strong><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.size" text="Size"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
										<tr>
											<td>${customerSandwich.sandwichBread.nameGeo }</td>
											<td>${customerSandwich.sandwichBreadSizeAndPrice.size }</td>
											<td>${customerSandwich.sandwichBreadSizeAndPrice.price }</td>
										</tr>
											<tr class="active">
												<td><strong><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
										<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausage"> 
											<tr>
												<td>${sandwichSausage.sandwichSausage.nameGeo }</td>
												<td>${sandwichSausage.amountAndPrice.portion }</td>
												<td>${sandwichSausage.amountAndPrice.price }</td>
											</tr>										
										</c:forEach>
											<tr class="active">
												<td><strong><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
										<c:forEach items="${customerSandwich.sandwichVegetables }" var="vegetableWithAmountAndPrice"> 
											<tr>
												<td>${vegetableWithAmountAndPrice.sandwichVegetable.nameGeo }</td>
												<td>${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.portion }</td>
												<td>${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.price }</td>
											</tr>										
										</c:forEach>
											<tr class="active">
												<td><strong><spring:message code="yours.food.ingredient.sauce" text="Sauce"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
										<c:forEach items="${customerSandwich.sandwichSauce }" var="sauceWithAmountAndPrice"> 
											<tr>
												<td>${sauceWithAmountAndPrice.sandwichSauce.nameGeo }</td>
												<td>${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.portion }</td>
												<td>${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.price }</td>
											</tr>										
										</c:forEach>
											<tr class="active">
												<td><strong><spring:message code="yours.food.ingredient.spice" text="Sauce"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
										<c:forEach items="${customerSandwich.sandwichSpices }" var="spiceWithAmountAndPrice"> 
											<tr>
												<td>${spiceWithAmountAndPrice.sandwichSpice.nameGeo }</td>
												<td>${spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.portion }</td>
												<td>${spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.price }</td>
											</tr>										
										</c:forEach>
									</table>
									<script type="text/javascript">
										$( "#sandwichRemoveButtion${customerSandwich.id}" ).click(function() {
											alertify.confirm("Do you really want to remove this sandwich?", function (e) {
												if (e) {
													var url = 'remove-customer-sandwich';
													$.ajax({
														url: url,
														data: {
															customerSandwichId: '${customerSandwich.id}'
														}
													}).done(function() {
														$('#customerSandwich${customerSandwich.id }').remove();
														alertify.success("Sandwich has been removed");
													});			
												}
											});
										});
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseTwo"> Salads </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
							<c:forEach items="${meals['salads']}" var="customerSalad">
									<table class="table table-bordered" id="customerSalad${customerSalad.id }">
											<thead>
												<tr class="success">
												<th colspan="2"><strong><spring:message code="yours.food.service.ingredients.salad" text="Salad" /> - ${customerSalad.id}</strong></th>
												<th><button id="saladRemoveButtion${customerSalad.id}" type="button" class="close" aria-hidden="true">&times;</button></th>
												<tr>
											</thead>
											<tr class="active">
												<td><strong><spring:message code="yours.food.service.salad.ingredients" text="Salad Ingredients"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
											<c:forEach items="${customerSalad.ingredientWithAmountAndPrices }" var="ingredientsWithAmountAndPrices">
												<tr>
													<td>${ingredientsWithAmountAndPrices.saladIngredient.nameGeo }</td>
													<td>${ingredientsWithAmountAndPrices.amountAndPrice.amount }</td>
													<td>${ingredientsWithAmountAndPrices.amountAndPrice.price }</td>
												</tr>
											</c:forEach>
									</table>
									<script type="text/javascript">
										$( "#saladRemoveButtion${customerSalad.id}" ).click(function() {
											alertify.confirm("Do you really want to remove this salad?", function (e) {
												if (e) {
													var url = 'remove-customer-salad';
													$.ajax({
														url: url,
														data: {
															customerSaladId: '${customerSalad.id}'
														}
													}).done(function() {
														$('#customerSalad${customerSalad.id }').remove();
														alertify.success("Salad has been removed");
													});			
												}
											});
										});
									</script>
								</c:forEach>
								</div>
						</div>
					</div>
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseThree"> Drinks </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['drinks']}" var="customerDrink">
									<table class="table table-bordered" id="customerDrink${customerDrink.id }">
											<thead>
												<tr class="warning">
												<th colspan="2"><strong><spring:message code="yours.food.service.ingredients.drink" text="Drink" /> - ${customerDrink.id}</strong></th>
												<th><button id="drinkRemoveButtion${customerDrink.id}" type="button" class="close" aria-hidden="true">&times;</button></th>
												<tr>
											</thead>
											<tr class="active">
												<td><strong><spring:message code="yours.food.service.drink.name" text="Drink Name"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
											<tr>
												<td>${customerDrink.drinkWithSizeAndPrice.drink.nameGeo }</td>
												<td>${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.size }</td>
												<td>${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.price }</td>
											</tr>
											<tr class="active">
												<td><strong><spring:message code="yours.food.service.drink.addon.name" text="Add-on Name"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
											<c:forEach items="${customerDrink.addonWithAmountAndPrices }" var="addonWithAmountAndPrice">
												<tr>
													<td>${addonWithAmountAndPrice.drinkAddOn.nameGeo }</td>
													<td>${addonWithAmountAndPrice.addOnAmountAndPrice.amount }</td>
													<td>${addonWithAmountAndPrice.addOnAmountAndPrice.price }</td>
												</tr>
											</c:forEach>
									</table>
									<script type="text/javascript">
										$( "#drinkRemoveButtion${customerDrink.id}" ).click(function() {
											alertify.confirm("Do you really want to remove this drink?", function (e) {
												if (e) {
													var url = 'remove-customer-drink';
													$.ajax({
														url: url,
														data: {
															customerDrinkId: '${customerDrink.id}'
														}
													}).done(function() {
														$('#customerDrink${customerDrink.id }').remove();
														alertify.success("Drink has been removed");
													});			
												}
											});
										});
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseFour"> Hotdogs </a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['hotdogs']}" var="customerHotdog">
									<table class="table table-bordered" id="customerHotdog${customerHotdog.id }">
											<thead>
												<tr class="danger">
												<th colspan="2"><strong><spring:message code="yours.food.service.ingredients.hotdog" text="Hotdog" /> - ${customerHotdog.id}</strong></th>
												<th><button id="hotdogRemoveButtion${customerHotdog.id}" type="button" class="close" aria-hidden="true">&times;</button></th>
												<tr>
											</thead>
											<tr class="active">
												<td><strong><spring:message code="yours.food.service.ingredients.bread" text="Bread"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.size" text="Size"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
											<tr>
												<td>${customerHotdog.bread.nameGeo }</td>
												<td>${customerHotdog.sizeAndPrice.size }</td>
												<td>${customerHotdog.sizeAndPrice.price }</td>
											</tr>
											<tr class="active">
												<td><strong><spring:message code="yours.food.service.ingredients.hotdog.sausage" text="Sausage"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
											<tr>
												<td>${customerHotdog.sausage.nameGeo }</td>
												<td>${addonWithAmountAndPrice.amountAndPrice.portion }</td>
												<td>${addonWithAmountAndPrice.amountAndPrice.price }</td>
											</tr>
											<tr class="active">
												<td><strong><spring:message code="yours.food.service.ingredients.hotdog.sauce" text="Sauce"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
											<c:forEach items="${customerHotdog.amountAndPrices }" var="sauceWithAmountAndPrice">
												<tr>
													<td>${sauceWithAmountAndPrice.sauce.nameGeo }</td>
													<td>${sauceWithAmountAndPrice.amountAndPrice.amount }</td>
													<td>${sauceWithAmountAndPrice.amountAndPrice.price }</td>
												</tr>
											</c:forEach>
									</table>
									<script type="text/javascript">
										$( "#hotdogRemoveButtion${customerHotdog.id}" ).click(function() {
											alertify.confirm("Do you really want to remove this hotdog?", function (e) {
												if (e) {
													var url = 'remove-customer-hotdog';
													$.ajax({
														url: url,
														data: {
															customerHotdogId: '${customerHotdog.id}'
														}
													}).done(function() {
														$('#customerHotdog${customerHotdog.id }').remove();
														alertify.success("Hotdog has been removed");
													});			
												}
											});
										});
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>