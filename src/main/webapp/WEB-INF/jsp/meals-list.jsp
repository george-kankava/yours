<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Food Service" />
<meta name="author" content="GNG Apps" />
<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif" />

<title><spring:message code="" text="Customer Meals" /></title>
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="resources/css/yours-food-service.css" rel="stylesheet" />
<link href="resources/css/jumbotron-narrow.css" rel="stylesheet" />
<link href="resources/css/alertify.core.css" rel="stylesheet" />
<link href="resources/css/alertify.default.css" rel="stylesheet" />
<link href="resources/css/alertify.bootstrap.css" rel="stylesheet" />

<script src="resources/js/jquery-2.0.3.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/alertify.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	      <script src="resources/assets/js/html5shiv.js"></script>
	      <script src="resources/assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<script>
		var foodAndDrinkInCartIds = new Object();
		foodAndDrinkInCartIds.sandwichIds = new Array();
		foodAndDrinkInCartIds.saladIds = new Array();
		foodAndDrinkInCartIds.drinkIds = new Array();
		foodAndDrinkInCartIds.hotdogIds = new Array();
	</script>
	<div class="container">
		<div class="header">
			<ul class="nav nav-pills pull-right">
				<li><a href="food-components-list"><spring:message code="yours.food.service.ingredients" text="Ingredient" /></a></li>
				<li class="active"><a href="#"><spring:message code="yours.food.service.meals" text="Meals" /></a></li>
				<li><a href="j_spring_security_logout">Logout</a></li>
			</ul>
			<h3 class="text-muted">Yours.ge</h3>
		</div>
		<div class="row">
			<div class="col-lg-9">
			<div class="logo-image-narrow"></div>
			</div>
			<div class="col-lg-3">
			<div class="btn-group">
				<button id="mealsOrderButton" type="button" class="btn btn-primary">Buy <span class="glyphicon glyphicon-shopping-cart"></span></button>
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					<span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
				</button>
				<ul id="customerOrdersList" class="dropdown-menu" role="menu">
				</ul>
			</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> Sandwiches </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['sandwiches']}" var="customerSandwich">
									<div class="alert alert-success" id="sandwichTitle${customerSandwich.id}">
										Sandwich - ${customerSandwich.id}
										<button style="margin-left: 5px" id="sandwichOrderButtion${customerSandwich.id }" type="button" class="btn btn-info" data-toggle="button">
											<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
										</button>
										<div class="pull-right">
											<button id="sandwichRemoveButtion${customerSandwich.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<table id="sandwichBread${customerSandwich.id}" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
												<th><spring:message code="yours.food.ingredients.size" text="Size" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											<tr>
										</thead>
										<tr>
											<td>${customerSandwich.sandwichBread.nameGeo }</td>
											<td>${customerSandwich.sandwichBreadSizeAndPrice.size }</td>
											<td>${customerSandwich.sandwichBreadSizeAndPrice.price }</td>
										</tr>
									</table>
									<table id="sandwichSausage${customerSandwich.id}" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausage">
											<tr>
												<td>${sandwichSausage.sandwichSausage.nameGeo }</td>
												<td>${sandwichSausage.amountAndPrice.portion }</td>
												<td>${sandwichSausage.amountAndPrice.price }</td>
											</tr>
										</c:forEach>
									</table>
									<table id="sandwichVegetable${customerSandwich.id}" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichVegetables }" var="vegetableWithAmountAndPrice">
											<tr>
												<td>${vegetableWithAmountAndPrice.sandwichVegetable.nameGeo }</td>
												<td>${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.portion }</td>
												<td>${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.price }</td>
											</tr>
										</c:forEach>
									</table>
									<table id="sandwichSauce${customerSandwich.id}" class="table">
										<tr>
											<th><spring:message code="yours.food.ingredient.sauce" text="Sauce" /></th>
											<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
										</tr>
										<c:forEach items="${customerSandwich.sandwichSauce }" var="sauceWithAmountAndPrice">
											<tr>
												<td>${sauceWithAmountAndPrice.sandwichSauce.nameGeo }</td>
												<td>${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.portion }</td>
												<td>${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.price }</td>
											</tr>
										</c:forEach>
									</table>
									<table id="sandwichSpice${customerSandwich.id}" class="table">
										<tr>
											<th><spring:message code="yours.food.ingredient.spice" text="Sauce" /></th>
											<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
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
										$('#sandwichOrderButtion${customerSandwich.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												$('#orderListSandwichItemDivider${customerSandwich.id}').remove();
												$('#orderListSandwichItem${customerSandwich.id}').remove();
												var elementIndex = foodAndDrinkInCartIds.sandwichIds.indexOf('${customerSandwich.id}');
												foodAndDrinkInCartIds.sandwichIds.splice(elementIndex, 1);
											} else {
												$('#customerOrdersList').append(
													$('<li id="orderListSandwichItemDivider${customerSandwich.id}">').addClass('divider')		
												).append(
													$('<li id="orderListSandwichItem${customerSandwich.id}">').append($('<span>').attr('style', 'margin-left:5px;').text('Sandwich - ${customerSandwich.id}'))		
												);
												foodAndDrinkInCartIds.sandwichIds.push('${customerSandwich.id}');
											}
										});
										$("#sandwichRemoveButtion${customerSandwich.id}").click(
											function() {
												alertify.confirm("Do you really want to remove this sandwich?", function(e) {
													if (e) {
														var url = 'remove-customer-sandwich';
														$.ajax({
															url : url,
															data : {
																customerSandwichId : '${customerSandwich.id}'
															}
														}).done(function() {
															$('#sandwichTitle${customerSandwich.id }').remove();
															$('#sandwichBread${customerSandwich.id }').remove();
															$('#sandwichSausage${customerSandwich.id }').remove();
															$('#sandwichVegetable${customerSandwich.id }').remove();
															$('#sandwichSauce${customerSandwich.id }').remove();
															$('#sandwichSpice${customerSandwich.id }').remove();
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
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"> Salads </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['salads']}" var="customerSalad">
									<div class="alert alert-success" id="saladTitle${customerSalad.id}">
										<spring:message code="yours.food.service.ingredients.salad" text="Salad" /> - ${customerSalad.id}
										<button id="saladOrderButtion${customerSalad.id }" type="button" class="btn btn-info" data-toggle="button">
											<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
										</button>
										<div class="pull-right">
											<button id="saladRemoveButtion${customerSalad.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<table id="saladIngredients${customerSalad.id }" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.salad.ingredients" text="Salad Ingredients" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											<tr>
										</thead>
										<c:forEach items="${customerSalad.ingredientWithAmountAndPrices }" var="ingredientsWithAmountAndPrices">
											<tr>
												<td>${ingredientsWithAmountAndPrices.saladIngredient.nameGeo }</td>
												<td>${ingredientsWithAmountAndPrices.amountAndPrice.amount }</td>
												<td>${ingredientsWithAmountAndPrices.amountAndPrice.price }</td>
											</tr>
										</c:forEach>
									</table>
									<script type="text/javascript">
										$('#saladOrderButtion${customerSalad.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												$('#orderListSaladItemDivider${customerSalad.id}').remove();
												$('#orderListSaladItem${customerSalad.id}').remove();
												var elementIndex = foodAndDrinkInCartIds.saladIds.indexOf('${customerSalad.id}');
												foodAndDrinkInCartIds.saladIds.splice(elementIndex, 1);
											} else {
												$('#customerOrdersList').append(
													$('<li id="orderListSaladItemDivider${customerSalad.id}">').addClass('divider')		
												).append(
													$('<li id="orderListSaladItem${customerSalad.id}">').append($('<span>').attr('style', 'margin-left:5px;').text('Salad - ${customerSalad.id}'))		
												);
												foodAndDrinkInCartIds.saladIds.push('${customerSalad.id }');
											}
										});
										$("#saladRemoveButtion${customerSalad.id}").click(function() {
											alertify.confirm("Do you really want to remove this salad?",
											function(e) {
												if (e) {
													var url = 'remove-customer-salad';
													$.ajax({
														url : url,
														data : {
															customerSaladId : '${customerSalad.id}'
														}
														}).done(function() {
															$('#saladTitle${customerSalad.id }').remove();
															$('#saladIngredients${customerSalad.id }').remove();
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
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"> Drinks </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['drinks']}" var="customerDrink">
									<div class="alert alert-success" id="drinkTitle${customerDrink.id}">
										<spring:message code="yours.food.service.ingredients.drink" text="Drink" /> - ${customerDrink.id}
										<button id="drinkOrderButtion${customerDrink.id }" type="button" class="btn btn-info" data-toggle="button">
											<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
										</button>
										<div class="pull-right">
											<button id="drinkRemoveButtion${customerDrink.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<table id="drink${customerDrink.id}" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.drink.name" text="Drink Name" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											<tr>
										</thead>
										<tr>
											<td>${customerDrink.drinkWithSizeAndPrice.drink.nameGeo }</td>
											<td>${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.size }</td>
											<td>${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.price }</td>
										</tr>
									</table>
									<table id="drinkAddon${customerDrink.id}" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.drink.addon.name" text="Add-on Name" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerDrink.addonWithAmountAndPrices }" var="addonWithAmountAndPrice">
											<tr>
												<td>${addonWithAmountAndPrice.drinkAddOn.nameGeo }</td>
												<td>${addonWithAmountAndPrice.addOnAmountAndPrice.amount }</td>
												<td>${addonWithAmountAndPrice.addOnAmountAndPrice.price }</td>
											</tr>
										</c:forEach>
									</table>
									<script type="text/javascript">
									$('#drinkOrderButtion${customerDrink.id }').click(function(event) {
										if(event.currentTarget.className.indexOf('active') != -1) {
											$('#orderListDrinkItemDivider${customerDrink.id}').remove();
											$('#orderListDrinkItem${customerDrink.id}').remove();
											var elementIndex = foodAndDrinkInCartIds.drinkIds.indexOf('${customerDrink.id}');
											foodAndDrinkInCartIds.drinkIds.splice(elementIndex, 1);
										} else {
											$('#customerOrdersList').append(
												$('<li id="orderListDrinkItemDivider${customerDrink.id}">').addClass('divider')		
											).append(
												$('<li id="orderListDrinkItem${customerDrink.id}">').append($('<span>').attr('style', 'margin-left:5px;').text('Drink - ${customerDrink.id}'))		
											);
											foodAndDrinkInCartIds.drinkIds.push('${customerDrink.id }');
										}
										
									});
										$("#drinkRemoveButtion${customerDrink.id}").click(function() {
											alertify.confirm("Do you really want to remove this drink?", function(e) {
												if (e) {
													var url = 'remove-customer-drink';
													$.ajax({
														url : url,
														data : {
															customerDrinkId : '${customerDrink.id}'
														}
													}).done(
														function() {
															$('#drinkTitle${customerDrink.id }').remove();
															$('#drink${customerDrink.id }').remove();
															$('#drinkAddon${customerDrink.id }').remove();
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
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"> Hotdogs </a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['hotdogs']}" var="customerHotdog">
									<div class="alert alert-success" id="hotdogTitle${customerHotdog.id}">
										<spring:message code="yours.food.service.ingredients.hotdog" text="Hotdog" /> - ${customerHotdog.id}
										<button id="hotdogOrderButtion${customerHotdog.id }" type="button" class="btn btn-info" data-toggle="button">
											<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
										</button>
										<div class="pull-right">
											<button id="hotdogRemoveButtion${customerHotdog.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<table class="table" id="hotdogBread${customerHotdog.id }">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.ingredients.bread" text="Bread" /></th>
												<th><spring:message code="yours.food.ingredients.size" text="Size" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											<tr>
										</thead>
										<tr>
											<td>${customerHotdog.bread.nameGeo }</td>
											<td>${customerHotdog.sizeAndPrice.size }</td>
											<td>${customerHotdog.sizeAndPrice.price }</td>
										</tr>
									</table>
									<table class="table" id="hotdogSausage${customerHotdog.id }">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.ingredients.hotdog.sausage" text="Sausage" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											</tr>
										</thead>
										<tr>
											<td>${customerHotdog.sausage.nameGeo }</td>
											<td>${addonWithAmountAndPrice.amountAndPrice.portion }</td>
											<td>${addonWithAmountAndPrice.amountAndPrice.price }</td>
										</tr>
									</table>
									<table class="table" id="hotdogSauce${customerHotdog.id }">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.ingredients.hotdog.sauce" text="Sauce" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerHotdog.amountAndPrices }" var="sauceWithAmountAndPrice">
											<tr>
												<td>${sauceWithAmountAndPrice.sauce.nameGeo }</td>
												<td>${sauceWithAmountAndPrice.amountAndPrice.amount }</td>
												<td>${sauceWithAmountAndPrice.amountAndPrice.price }</td>
											</tr>
										</c:forEach>
									</table>
									<script type="text/javascript">
									$('#hotdogOrderButtion${customerHotdog.id }').click(function(event) {
										if(event.currentTarget.className.indexOf('active') != -1) {
											$('#orderListHotdogItemDivider${customerHotdog.id}').remove();
											$('#orderListHotdogItem${customerHotdog.id}').remove();
											var elementIndex = foodAndDrinkInCartIds.hotdogIds.indexOf('${customerHotdog.id}');
											foodAndDrinkInCartIds.hotdogIds.splice(elementIndex, 1);
										} else {
											$('#customerOrdersList').append(
												$('<li id="orderListHotdogItemDivider${customerHotdog.id}">').addClass('divider')		
											).append(
												$('<li id="orderListHotdogItem${customerHotdog.id}">').append($('<span>').attr('style', 'margin-left:5px;').text('Hotdog - ${customerHotdog.id}'))		
											);
											foodAndDrinkInCartIds.hotdogIds.push('${customerHotdog.id }');
										}
										
									});
									$("#hotdogRemoveButtion${customerHotdog.id}").click(
										function() {
											alertify.confirm("Do you really want to remove this hotdog?",
												function(e) {
													if (e) {
														var url = 'remove-customer-hotdog';
														$.ajax({
															url : url,
															data : {
																customerHotdogId : '${customerHotdog.id}'
														}}).done(function() {
															$('#hotdogTitle${customerHotdog.id }').remove();
															$('#hotdogBread${customerHotdog.id }').remove();
															$('#hotdogSausage${customerHotdog.id }').remove();
															$('#hotdogSauce${customerHotdog.id }').remove();
															alertify.success("Hotdog has been removed");
												});
											}
										});
									});
									$('#mealsOrderButton').click(function() {
										if(foodAndDrinkInCartIds.sandwichIds.length == 0 &&
											foodAndDrinkInCartIds.sandwichIds.length == 0 &&
											foodAndDrinkInCartIds.drinkIds.length == 0 &&
											foodAndDrinkInCartIds.hotdogIds == 0) {
											alertify.error('Please choose at least one meal');
											return;
										}
										var url = 'process-purchase-customer-order';
										$.ajax({
											url: url,
											type: "POST",
											contentType: "application/json",
											data: JSON.stringify({
												 
													sandwichIds: foodAndDrinkInCartIds.sandwichIds, saladIds: foodAndDrinkInCartIds.saladIds,
													drinkIds: foodAndDrinkInCartIds.drinkIds, hotdogIds: foodAndDrinkInCartIds.hotdogIds
															
											})
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