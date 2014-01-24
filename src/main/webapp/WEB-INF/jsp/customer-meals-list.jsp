<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<title><spring:message code="yours.food.service.ingredients" text="Ingredients" /></title>
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
		<jsp:include page="include/header.jsp">
			<jsp:param name="pageName" value="meals-list"/>
		</jsp:include>
		<div class="modal fade" id="foodPurchaseModal" tabindex="-1" role="dialog" aria-labelledby="foodPurchaseModalTitle" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="foodPurchaseModalTitle"><spring:message code="yours.food.service.meals.list.order.modal.buy" text="Buy"/></h4>
					</div>
					<div class="modal-body">
						<div class="logo-image-small"></div>
						<div class="radio">
							<p class="lead"> 
								<spring:message code="yours.food.service.meals.list.order.modal.phone.number.title" text="Please Enter or Choose Phone Number" />
							</p>
							<div class="row">
								<div class="col-md-8">
								<label>
									<input id="customerTelephoneInputRadio" type="radio" name="customerTelephoneNumber">
									<input id="customerTelephoneInput" type="text" class="form-control" disabled>
								</label>
								</div>
							</div>
						</div>
						<div class="radio">
							<div class="row">
								<div class="col-md-8">
									<label>
										<input id="customerTelephoneSelectRadio" type="radio" name="customerTelephoneNumber" checked>
										<select id="customerTelephoneSelect" class="form-control">
											<c:forEach items="${customer.phoneNumbers }" var="phoneNumber">
												<option value="${phoneNumber.phoneNumber }">${phoneNumber.phoneNumber }</option>
											</c:forEach>
										</select>
									</label>
								</div>
							</div>
						</div>
						<div class="radio">
							<p class="lead"> 
								<spring:message code="yours.food.service.meals.list.order.modal.shipment.address.title" text="Please Enter or Choose Shipment Address" />
							</p>
							<div class="row">
								<div class="col-md-8">
								<label>
									<input id="customerShipmentInputRadio" type="radio" name="customerShipmentAddress">
									<input id="customerShipmentInput" type="text" class="form-control" disabled>
								</label>
								</div>
							</div>
						</div>
						<div class="radio">
							<div class="row">
								<div class="col-md-8">
									<label>
										<input id="customerShipmentSelectRadio" type="radio" name="customerShipmentAddress" checked>
										<select id="customerShipmentSelect" class="form-control">
											<c:forEach items="${customer.addresses }" var="address">
												<option value="${address.address }">${address.address }</option>
											</c:forEach>
										</select>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.meals.list.order.modal.cancel" text="Cancel" /></button>
						<button id="mealsOrderButton" type="button" class="btn btn-primary">
							<spring:message text="Buy" code="yours.food.service.meals.list.order.modal.buy" /> <span class="glyphicon glyphicon-shopping-cart"></span>
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<div class="row">
			<!-- Modal -->
			<!-- /.modal -->
			<div class="col-lg-9">
			<div class="logo-image-narrow"></div>
			</div>
			<div class="col-lg-3">
			<div class="btn-group">
				<!-- Button trigger modal -->
				<button class="btn btn-primary" data-toggle="modal" data-target="#foodPurchaseModal">
	  				<spring:message code="yours.food.service.meals.list.buy.button.title" text="" /> <span class="glyphicon glyphicon-shopping-cart"></span>
				</button>
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					<span class="caret"></span> <span class="sr-only"></span>
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
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"> <spring:message code="yours.food.service.meals.list.sandwiches.title" text="Sandwiches" /></a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['sandwiches']}" var="customerSandwich">
									<c:set var="sandwichTotalPrice" value="0"/>
									<div class="alert alert-success" id="sandwichTitle${customerSandwich.id}">
										<spring:message text="Sandwich" code="yours.food.service.meals.list.sandwich" /> - ${customerSandwich.id}
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
											<tr>
										</thead>
										<tbody>
										<tr>
											<c:choose>
												<c:when test="${locale eq 'ka' }">
													<td class="td-50-percent" >${customerSandwich.sandwichBread.nameGeo }</td>
												</c:when>
												<c:when test="${locale eq 'en' }">
													<td class="td-50-percent" >${customerSandwich.sandwichBread.nameEng }</td>
												</c:when>
												<c:when test="${locale eq 'ru' }">
													<td class="td-50-percent" >${customerSandwich.sandwichBread.nameRus }</td>
												</c:when>
											</c:choose>
											<td class="td-50-percent">${customerSandwich.sandwichBreadSizeAndPrice.size }</td>
											<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + customerSandwich.sandwichBreadSizeAndPrice.price}"/>
										</tr>
										</tbody>
									</table>
									<table id="sandwichSausage${customerSandwich.id}" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausage">
											<tr>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent">${sandwichSausage.sandwichSausage.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${sandwichSausage.sandwichSausage.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td> class="td-50-percent"${sandwichSausage.sandwichSausage.nameRus }</td>
													</c:when>
												</c:choose>
												<td class="td-50-percent">${sandwichSausage.amountAndPrice.portion }</td>
												<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + sandwichSausage.amountAndPrice.price}"/>
											</tr>
										</c:forEach>
									</table>
									<table id="sandwichVegetable${customerSandwich.id}" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichVegetables }" var="vegetableWithAmountAndPrice">
											<tr>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent" >${vegetableWithAmountAndPrice.sandwichVegetable.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${vegetableWithAmountAndPrice.sandwichVegetable.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td class="td-50-percent" >${vegetableWithAmountAndPrice.sandwichVegetable.nameRus }</td>
													</c:when>
												</c:choose>
												<td class="td-50-percent">${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.portion }</td>
												<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.price}"/>
											</tr>
										</c:forEach>
									</table>
									<table id="sandwichSauce${customerSandwich.id}" class="table">
										<tr>
											<th><spring:message code="yours.food.ingredient.sauce" text="Sauce" /></th>
											<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										</tr>
										<c:forEach items="${customerSandwich.sandwichSauces }" var="sauceWithAmountAndPrice">
											<tr>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sandwichSauce.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sandwichSauce.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sandwichSauce.nameRus }</td>
													</c:when>
												</c:choose>
												<td class="td-50-percent">${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.portion }</td>
												<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.price}"/>
											</tr>
										</c:forEach>
									</table>
									<table id="sandwichSpice${customerSandwich.id}" class="table">
										<tr>
											<th><spring:message code="yours.food.ingredient.spice" text="Sauce" /></th>
											<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										</tr>
										<c:forEach items="${customerSandwich.sandwichSpices }" var="spiceWithAmountAndPrice">
											<tr>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent">${spiceWithAmountAndPrice.sandwichSpice.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${spiceWithAmountAndPrice.sandwichSpice.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td class="td-50-percent">${spiceWithAmountAndPrice.sandwichSpice.nameRus }</td>
													</c:when>
												</c:choose>
												<td class="td-50-percent">${spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.portion }</td>
												<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.price}"/>
											</tr>
										</c:forEach>
									</table>
									<table class="table">
										<tr>
											<td class="td-50-percent">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
												</c:choose>
											</td>
											<td class="td-50-percent">
												<code>${sandwichTotalPrice } <spring:message code="yours.food.service.currency.gel" /></code>
											</td>
										</tr>
									</table>
									<script type="text/javascript">
										$('#sandwichOrderButtion${customerSandwich.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												$('#orderListSandwichItemDivider${customerSandwich.id}').remove();
												$('#orderListSandwichItem${customerSandwich.id}').remove();
												var elementIndex = foodAndDrinkInCartIds.sandwichIds.indexOf('${customerSandwich.id}');
												foodAndDrinkInCartIds.sandwichIds.splice(elementIndex, 1);
											} else {
												var sandwichName = '<spring:message code="yours.food.service.meals.list.sandwich" text="Sandwich" />';
												$('#customerOrdersList').append(
													$('<li id="orderListSandwichItemDivider${customerSandwich.id}">').addClass('divider')		
												).append(
													$('<li id="orderListSandwichItem${customerSandwich.id}">').append($('<span>').attr('style', 'margin-left:5px;').text(sandwichName + ' - ${customerSandwich.id}'))		
												);
												foodAndDrinkInCartIds.sandwichIds.push('${customerSandwich.id}');
											}
										});
										$("#sandwichRemoveButtion${customerSandwich.id}").click(
											function() {
												alertify.confirm('<spring:message code="yours.food.service.meals.list.alertify.remove.sandwich.message" text="Do you really want to remove this sandwich?" />', function(e) {
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
															alertify.success('<spring:message code="yours.food.service.meals.list.alertify.sandwich.removed.message" text="Sandwich has been removed." />');
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
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"> <spring:message code="yours.food.service.meals.list.salads.title" text="Salads" /> </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['salads']}" var="customerSalad">
									<div class="alert alert-success" id="saladTitle${customerSalad.id}">
										<spring:message code="yours.food.service.meals.list.salad" text="Salad" /> - ${customerSalad.id}
										<button id="saladOrderButtion${customerSalad.id }" type="button" class="btn btn-info" data-toggle="button">
											<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
										</button>
										<div class="pull-right">
											<button id="saladRemoveButtion${customerSalad.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<c:set var="saladTotalPrice" value="0"/>
									<table id="saladIngredients${customerSalad.id }" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.salad.ingredients" text="Salad Ingredients" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											<tr>
										</thead>
										<c:forEach items="${customerSalad.ingredientWithAmountAndPrices }" var="ingredientsWithAmountAndPrices">
											<tr>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td>${ingredientsWithAmountAndPrices.saladIngredient.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td>${ingredientsWithAmountAndPrices.saladIngredient.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td>${ingredientsWithAmountAndPrices.saladIngredient.nameRus }</td>
													</c:when>
												</c:choose>
												<td>${ingredientsWithAmountAndPrices.amountAndPrice.amount }</td>
												<c:set var="saladTotalPrice" value="${saladTotalPrice + ingredientsWithAmountAndPrices.amountAndPrice.price}"/>
											</tr>
										</c:forEach>
									</table>
									<table class="table">
										<tr>
											<td class="td-50-percent">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
												</c:choose>
											</td>
											<td class="td-50-percent">
												<code>${saladTotalPrice } <spring:message code="yours.food.service.currency.gel" /></code>
											</td>
										</tr>
									</table>
									<script type="text/javascript">
										$('#saladOrderButtion${customerSalad.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												$('#orderListSaladItemDivider${customerSalad.id}').remove();
												$('#orderListSaladItem${customerSalad.id}').remove();
												var elementIndex = foodAndDrinkInCartIds.saladIds.indexOf('${customerSalad.id}');
												foodAndDrinkInCartIds.saladIds.splice(elementIndex, 1);
											} else {
												var saladName = '<spring:message code="yours.food.service.meals.list.salad" text="Salad" />';
												$('#customerOrdersList').append(
													$('<li id="orderListSaladItemDivider${customerSalad.id}">').addClass('divider')		
												).append(
													$('<li id="orderListSaladItem${customerSalad.id}">').append($('<span>').attr('style', 'margin-left:5px;').text(saladName + ' - ${customerSalad.id}'))		
												);
												foodAndDrinkInCartIds.saladIds.push('${customerSalad.id }');
											}
										});
										$("#saladRemoveButtion${customerSalad.id}").click(function() {
											alertify.confirm('<spring:message code="yours.food.service.meals.list.alertify.remove.salad.message" text="Do you really want to remove this salad?" />',
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
															alertify.success('<spring:message code="yours.food.service.meals.list.alertify.salad.removed.message" text="Salad has been removed." />');
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
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"> <spring:message code="yours.food.service.meals.list.drinks.title" text="Drinks" /> </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['drinks']}" var="customerDrink">
									<div class="alert alert-success" id="drinkTitle${customerDrink.id}">
										<spring:message code="yours.food.service.meals.list.drink" text="Drink" /> - ${customerDrink.id}
										<button id="drinkOrderButtion${customerDrink.id }" type="button" class="btn btn-info" data-toggle="button">
											<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
										</button>
										<div class="pull-right">
											<button id="drinkRemoveButtion${customerDrink.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<c:set var="drinkTotalPrice" value="0"/>
									<table id="drink${customerDrink.id}" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.drink.name" text="Drink Name" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											<tr>
										</thead>
										<tr>
											<c:choose>
												<c:when test="${locale eq 'ka' }">
													<td>${customerDrink.drinkWithSizeAndPrice.drink.nameGeo }</td>
												</c:when>
												<c:when test="${locale eq 'en' }">
													<td>${customerDrink.drinkWithSizeAndPrice.drink.nameEng }</td>
												</c:when>
												<c:when test="${locale eq 'ru' }">
													<td>${customerDrink.drinkWithSizeAndPrice.drink.nameRus }</td>
												</c:when>
											</c:choose>
											<td>${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.size }</td>
											<c:set var="drinkTotalPrice" value="${drinkTotalPrice + customerDrink.drinkWithSizeAndPrice.sizeAndPrice.price}"/>
										</tr>
									</table>
									<table id="drinkAddon${customerDrink.id}" class="table">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.drink.addon.name" text="Add-on Name" /></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerDrink.addonWithAmountAndPrices }" var="addonWithAmountAndPrice">
											<tr>	
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td>${addonWithAmountAndPrice.drinkAddOn.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td>${addonWithAmountAndPrice.drinkAddOn.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td>${addonWithAmountAndPrice.drinkAddOn.nameRus }</td>
													</c:when>
												</c:choose>
												<td>${addonWithAmountAndPrice.addOnAmountAndPrice.amount }</td>
												<c:set var="drinkTotalPrice" value="${drinkTotalPrice + addonWithAmountAndPrice.addOnAmountAndPrice.price}"/>
											</tr>
										</c:forEach>
									</table>
									<table class="table">
										<tr>
											<td class="td-50-percent">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
												</c:choose>
											</td>
											<td class="td-50-percent">
												<code>${drinkTotalPrice } <spring:message code="yours.food.service.currency.gel" /></code>
											</td>
										</tr>
									</table>
									<script type="text/javascript">
										$('#drinkOrderButtion${customerDrink.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												$('#orderListDrinkItemDivider${customerDrink.id}').remove();
												$('#orderListDrinkItem${customerDrink.id}').remove();
												var elementIndex = foodAndDrinkInCartIds.drinkIds.indexOf('${customerDrink.id}');
												foodAndDrinkInCartIds.drinkIds.splice(elementIndex, 1);
											} else {
												var drinkName = '<spring:message code="yours.food.service.meals.list.drink" text="Drink" />';
												$('#customerOrdersList').append(
													$('<li id="orderListDrinkItemDivider${customerDrink.id}">').addClass('divider')		
												).append(
													$('<li id="orderListDrinkItem${customerDrink.id}">').append($('<span>').attr('style', 'margin-left:5px;').text(drinkName + ' - ${customerDrink.id}'))		
												);
												foodAndDrinkInCartIds.drinkIds.push('${customerDrink.id }');
											}
											
										});
											$("#drinkRemoveButtion${customerDrink.id}").click(function() {
												alertify.confirm('<spring:message code="yours.food.service.meals.list.alertify.remove.drink.message" text="Do you really want to remove this drink?" />', function(e) {
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
																alertify.success('<spring:message code="yours.food.service.meals.list.alertify.drink.removed.message" text="Drink has been removed." />');
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
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"> <spring:message code="yours.food.service.meals.list.hotdogs.title" text="Hotdogs" /> </a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['hotdogs']}" var="customerHotdog">
									<div class="alert alert-success" id="hotdogTitle${customerHotdog.id}">
										<spring:message code="yours.food.service.meals.list.hotdog" text="Hotdog" /> - ${customerHotdog.id}
										<button id="hotdogOrderButtion${customerHotdog.id }" type="button" class="btn btn-info" data-toggle="button">
											<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
										</button>
										<div class="pull-right">
											<button id="hotdogRemoveButtion${customerHotdog.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<c:set var="hotdogTotalPrice" value="0" />
									<table class="table" id="hotdogBread${customerHotdog.id }">
										<thead>
											<tr>
												<th><spring:message code="yours.food.service.ingredients.bread" text="Bread" /></th>
												<th><spring:message code="yours.food.ingredients.size" text="Size" /></th>
												<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
											<tr>
										</thead>
										<tr>
											<c:choose>
												<c:when test="${locale eq 'ka' }">
													<td class="td-50-percent">${customerHotdog.bread.nameGeo }</td>
												</c:when>
												<c:when test="${locale eq 'en' }">
													<td class="td-50-percent">${customerHotdog.bread.nameEng }</td>
												</c:when>
												<c:when test="${locale eq 'ru' }">
													<td class="td-50-percent">${customerHotdog.bread.nameRus }</td>
												</c:when>
											</c:choose>
											<td class="td-50-percent">${customerHotdog.sizeAndPrice.size }</td>
											<td>${customerHotdog.sizeAndPrice.price }</td>
											<c:set var="hotdogTotalPrice" value="${hotdogTotalPrice + customerHotdog.sizeAndPrice.price}"></c:set>
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
											<c:choose>
												<c:when test="${locale eq 'ka' }">
													<td class="td-50-percent">${customerHotdog.sausage.nameGeo }</td>
												</c:when>
												<c:when test="${locale eq 'en' }">
													<td class="td-50-percent">${customerHotdog.sausage.nameEng }</td>
												</c:when>
												<c:when test="${locale eq 'ru' }">
													<td class="td-50-percent">${customerHotdog.sausage.nameRus }</td>
												</c:when>
											</c:choose>
											<td class="td-50-percent">${customerHotdog.amountAndPrice.portion }</td>
											<td>${customerHotdog.amountAndPrice.price }</td>
											<c:set var="hotdogTotalPrice" value="${hotdogTotalPrice + customerHotdog.amountAndPrice.price}"></c:set>
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
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sauce.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sauce.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sauce.nameRus }</td>
													</c:when>
												</c:choose>
												<td class="td-50-percent">${sauceWithAmountAndPrice.amountAndPrice.amount }</td>
												<td>${sauceWithAmountAndPrice.amountAndPrice.price }</td>
												<c:set var="hotdogTotalPrice" value="${hotdogTotalPrice + sauceWithAmountAndPrice.amountAndPrice.price}"></c:set>
											</tr>
										</c:forEach>
									</table>
									<table class="table">
										<tr>
											<td class="td-50-percent">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
												</c:choose>
											</td>
											<td class="td-50-percent">
												<code>${hotdogTotalPrice } <spring:message code="yours.food.service.currency.gel" /></code>
											</td>
										</tr>
									</table>
									<script type="text/javascript">
										$('#hotdogOrderButtion${customerHotdog.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												$('#orderListHotdogItemDivider${customerHotdog.id}').remove();
												$('#orderListHotdogItem${customerHotdog.id}').remove();
												var elementIndex = foodAndDrinkInCartIds.hotdogIds.indexOf('${customerHotdog.id}');
												foodAndDrinkInCartIds.hotdogIds.splice(elementIndex, 1);
											} else {
												var hotdogName = '<spring:message code="yours.food.service.meals.list.hotdog" />';
												$('#customerOrdersList').append(
													$('<li id="orderListHotdogItemDivider${customerHotdog.id}">').addClass('divider')		
												).append(
													$('<li id="orderListHotdogItem${customerHotdog.id}">').append($('<span>').attr('style', 'margin-left:5px;').text(hotdogName + ' - ${customerHotdog.id}'))		
												);
												foodAndDrinkInCartIds.hotdogIds.push('${customerHotdog.id }');
											}
											
										});
										$("#hotdogRemoveButtion${customerHotdog.id}").click(
											function() {
												alertify.confirm('<spring:message code="yours.food.service.meals.list.alertify.remove.hotdog.message" text="Do you really want to remove this hotdog?" />',
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
																alertify.success('<spring:message code="yours.food.service.meals.list.alertify.hotdog.removed.message" text="Hotdog has been removed." />');
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
		<div class="row marketing">
	        <div class="col-lg-12">
	          
	      	</div>
	
	      <div class="footer">
	       	<div class="pull-left">&copy; Company 2013</div>
	        <div class="pull-right">Created by GNG Apps</div>
	      </div>
		</div>
	</div>
	<script>
		$('input[name=customerTelephoneNumber]').change(function(event) {
			if(event.target.id === 'customerTelephoneSelectRadio') {
				$('#customerTelephoneSelect').removeAttr('disabled');
				$('#customerTelephoneInput').attr('disabled', 'disabled');
			} else if(event.target.id === 'customerTelephoneInputRadio') {
				$('#customerTelephoneInput').removeAttr('disabled');
				$('#customerTelephoneSelect').attr('disabled', 'disabled');
			}
		});
		$('input[name=customerShipmentAddress]').change(function(event) {
			if(event.target.id === 'customerShipmentSelectRadio') {
				$('#customerShipmentSelect').removeAttr('disabled');
				$('#customerShipmentInput').attr('disabled', 'disabled');
			} else if(event.target.id === 'customerShipmentInputRadio') {
				$('#customerShipmentInput').removeAttr('disabled');
				$('#customerShipmentSelect').attr('disabled', 'disabled');
			}
		});
		$('#mealsOrderButton').click(function() {
			if(foodAndDrinkInCartIds.sandwichIds.length == 0 &&
				foodAndDrinkInCartIds.sandwichIds.length == 0 &&
				foodAndDrinkInCartIds.drinkIds.length == 0 &&
				foodAndDrinkInCartIds.hotdogIds == 0) {
				alertify.error('<spring:message code="yours.food.service.meals.list.alertify.meal.choose.message" text="Please choose at least one meal" />');
				return;
			}
			var url = 'process-purchase-customer-order';
			var customerPhoneNumber = '';
			var customerShipmentAddress = '';
			if($('input[name=customerTelephoneNumber]:radio:checked').attr('id') === 'customerTelephoneInputRadio') {
				customerPhoneNumber = $('#customerTelephoneInput').val();
			} else if($('input[name=customerTelephoneNumber]:radio:checked').attr('id') === 'customerTelephoneSelectRadio') {
				customerPhoneNumber = $('#customerTelephoneSelect').val();
			}
			if($('input[name=customerShipmentAddress]:radio:checked').attr('id') === 'customerShipmentInputRadio') {
				customerShipmentAddress = $('#customerShipmentInput').val();
			} else if($('input[name=customerShipmentAddress]:radio:checked').attr('id') === 'customerShipmentSelectRadio') {
				customerShipmentAddress = $('#customerShipmentSelect').val();
			}
			if(customerPhoneNumber === '' || customerPhoneNumber === null) {
				alertify.error('<spring:message code="yours.food.service.meals.list.alertify.enter.phone.number.message" text="Please Enter Phone Number" />');
				return;
			}
			var reg = new RegExp('^\\d+$');
			if(!reg.test(customerPhoneNumber)) {
				alertify.error('<spring:message code="yours.food.service.meals.list.alertify.enter.valid.phone.number.message" text="Please enter valid phone number." />');
				return;
			}
			if(customerShipmentAddress === '' || customerShipmentAddress === null) {
				alertify.error('<spring:message code="yours.food.service.meals.list.alertify.enter.shipment.address.message" text="Please Enter Shipment Address" />');
				return;
			}
			$.ajax({
				url: url,
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify({
						sandwichIds: foodAndDrinkInCartIds.sandwichIds, 
						saladIds: foodAndDrinkInCartIds.saladIds,
						drinkIds: foodAndDrinkInCartIds.drinkIds, 
						hotdogIds: foodAndDrinkInCartIds.hotdogIds,
						customerPhoneNumber: customerPhoneNumber, 
						customerShipmentAddress: toUnicode(customerShipmentAddress) 
				})
			}).done(function(response) {
				if(response.errorMessage != undefined) {
					alertify.error(response.errorMessage);
				} else {
					$('#foodPurchaseModal').modal('hide');
					alertify.success('<spring:message code="yours.food.service.meals.list.alertify.order.added.message" text="Your order has been added." />');
				}
			});
		});
		
		function toUnicode(theString) {
			  var unicodeString = '';
			  for (var i=0; i < theString.length; i++) {
			    var theUnicode = theString.charCodeAt(i).toString(10);
			    theUnicode = '&#' + theUnicode + ';';
			    unicodeString += theUnicode;
			  }
			  return unicodeString;
		}
	</script>
</body>
</html>