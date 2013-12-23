<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<style>
  		.selecter {
  		
  		}
  	</style>
  	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Food Service" />
	<meta name="author" content="GNG Apps" />
	<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif" />
	
	<title>Yours Food Service</title>
	
	<!-- Bootstrap core CSS -->
	<link href="resources/css/bootstrap.css" rel="stylesheet" />
	
	<!-- Custom styles for this template -->
	<link href="resources/css/yours-food-service.css" rel="stylesheet" />
	<link href="resources/css/jumbotron-narrow.css" rel="stylesheet" />
	<link href="resources/css/line/blue.css" rel="stylesheet">
	<link href="resources/css/alertify.core.css" rel="stylesheet" />
	<link href="resources/css/alertify.default.css" rel="stylesheet" />
	<link href="resources/css/alertify.bootstrap.css" rel="stylesheet" />
	<script src="resources/js/jquery-2.0.3.min.js"></script>
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	      <script src="resources/assets/js/html5shiv.js"></script>
	      <script src="resources/assets/js/respond.min.js"></script>
	<![endif]-->
  </head>

  <body>
  	<script>
  		var sandwichPrice = 0;
		var saladPrice = 0;
		var drinkPrice = 0;
		var hotdogPrice = 0;
  	</script>

    <div class="container">
		<jsp:include page="include/header.jsp">
			<jsp:param name="pageName" value="food-components-list"/>
		</jsp:include>
      
      <div class="logo-image-narrow"></div>

		<ul class="nav nav-tabs" id="foodComponentsTab">
			<li class="active"><a href="#sandwich" data-toggle="tab"><spring:message code="yours.food.service.food.componenet.list.sandwich.tab.title" text="Sandwich"/></a></li>
			<li><a href="#salad" data-toggle="tab"><spring:message code="yours.food.service.food.componenet.list.salad.tab.title" text="Salad"/></a></li>
			<li><a href="#drinks" data-toggle="tab"><spring:message code="yours.food.service.food.componenet.list.drink.tab.title" text="Drink"/></a></li>
			<li><a href="#hotdog" data-toggle="tab"><spring:message code="yours.food.service.food.componenet.list.hotdog.tab.title" text="hotdog"/></a></li>
		</ul>
		
		<div class="tab-content">
			<div class="tab-pane active" id="sandwich">
				<table class="table table-bordered">
						<thead>
							<tr>
								<th><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
								<th><spring:message code="yours.food.ingredient.price" text="Price" />: <span class="badge" id="sandwichPrice">0.00</span></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichBreads }" var="sandwichBread">
							<tr>
								<td>
									<input type="radio" name="sandwichBread" id="${sandwichBread.id }"/>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<label>${sandwichBread.nameGeo }</label>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<label>${sandwichBread.nameEng }</label>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<label>${sandwichBread.nameRus }</label>
										</c:when>
									</c:choose>
								</td>
								<td>
									<select disabled class="form-control" id="sandwichBreadSizeAndPrice${sandwichBread.id }">
										<c:forEach items="${sandwichBread.sandwichBreadSizeAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#sandwichBreadSizeAndPrice${sandwichBread.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
									sandwichPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									sandwichPrice += parseFloat(price);
									$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
						    	});
							})();
						</script>
						</c:forEach>
					</table>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichSausages }" var="sandwichSausage">
							<tr>
								<td>
										<input name="sandwichSausage" type="checkbox" id="${sandwichSausage.id }">
										<c:choose>
											<c:when test="${locale eq 'ka' }">
												<label>${sandwichSausage.nameGeo }</label>										
											</c:when>
											<c:when test="${locale eq 'en' }">
												<label>${sandwichSausage.nameEng }</label>
											</c:when>
											<c:when test="${locale eq 'ru' }">
												<label>${sandwichSausage.nameRus }</label>
											</c:when>
										</c:choose>
										
								</td>
								<td>
									<select disabled class="form-control" id="sandwichSausageAmountAndPrice${sandwichSausage.id }">
										<c:forEach items="${sandwichSausage.sausageAmountAndPrices }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#sandwichSausageAmountAndPrice${sandwichSausage.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
									sandwichPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									sandwichPrice += parseFloat(price);
									$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
						    	});
							})();
						</script>
						</c:forEach>
					</table>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichVegetables }" var="sandwichVegetable">
							<tr>
								<td>
									<input name="sandwichVegetable"  id="${sandwichVegetable.id }" type="checkbox">
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<label>${sandwichVegetable.nameGeo }</label>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<label>${sandwichVegetable.nameEng }</label>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<label>${sandwichVegetable.nameRus }</label>
										</c:when>
									</c:choose>
								</td>
								<td>
									<select disabled class="form-control" id="sandwichVegetableAmountAndPrice${sandwichVegetable.id }">
										<c:forEach items="${sandwichVegetable.vegetableAmountAndPrices }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#sandwichVegetableAmountAndPrice${sandwichVegetable.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
									sandwichPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									sandwichPrice += parseFloat(price);
									$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
						    	});
							})();
							</script>
						</c:forEach>
					</table>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sauce" text="Sauce" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichSauces }" var="sandwichSauce">
							<tr>
								<td>
									<input name="sandwichSauce"  id="${sandwichSauce.id }" type="checkbox">
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<label>${sandwichSauce.nameGeo }</label>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<label>${sandwichSauce.nameEng }</label>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<label>${sandwichSauce.nameRus }</label>
										</c:when>
									</c:choose>
								</td>
								<td>
									<select disabled class="form-control" id="sandwichSauceAmountAndPrice${sandwichSauce.id }">
										<c:forEach items="${sandwichSauce.sauceAmountAndPrices}" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#sandwichSauceAmountAndPrice${sandwichSauce.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
									sandwichPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									sandwichPrice += parseFloat(price);
									$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
						    	});
							})();
							</script>
						</c:forEach>
					</table>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.spice" text="Spice" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichSpices }" var="sandwichSpice">
							<tr>
								<td>
									<input name="sandwichSpice" type="checkbox" id="${sandwichSpice.id }">
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<label>${sandwichSpice.nameGeo }</label>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<label>${sandwichSpice.nameEng }</label>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<label>${sandwichSpice.nameRus }</label>
										</c:when>
									</c:choose>
								</td>
								<td>
									<select disabled class="form-control" id="sandwichSpiceAmountAndPrice${sandwichSpice.id }">
										<c:forEach items="${sandwichSpice.spiceAmountAndPrice}" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#sandwichSpiceAmountAndPrice${sandwichSpice.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
									sandwichPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									sandwichPrice += parseFloat(price);
									$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
						    	});
							})();
							</script>
						</c:forEach>
					</table>
					<div class="col-md-offset-5" style="margin-top:14px;">
							<button id="sandwichSaveButton" type="button" class="btn btn-success"><spring:message code="yours.food.service.food.componenet.list.hotdog.save.button" text="Save" /></button>
					</div>
			</div>
			<div class="tab-pane" id="salad">
				<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th><spring:message code="yours.food.service.salad.ingredients" text="Salad Ingredients" /></th>
								<th>Price:  <span id="saladPrice" class="label label-success" style="font-size:14px">0.00</span></th>
							</tr>
						</thead>
						<c:forEach items="${saladIngredients }" var="saladIngredient">
							<tr>
								<td>
									<input type="checkbox" name="saladIngredient" id="${saladIngredient.id }"/>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<label>${saladIngredient.nameGeo }</label>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<label>${saladIngredient.nameEng }</label>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<label>${saladIngredient.nameRus }</label>
										</c:when>
									</c:choose>
								</td>
								<td>
									<select disabled class="form-control" id="saladIngredientAmountAndPrice${saladIngredient.id }">
										<c:forEach items="${saladIngredient.saladIngredientAmountAndPrices }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.amount}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#saladIngredientAmountAndPrice${saladIngredient.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
									saladPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									saladPrice += parseFloat(price);
									$('#saladPrice').text(parseFloat(Math.round(saladPrice * 100) / 100).toFixed(2));
						    	});
							})();
							</script>
						</c:forEach>
					</table>
					<div class="col-md-offset-5" style="margin-top:14px;">
						<button id="saladSaveButton" type="button" class="btn btn-success"><spring:message code="yours.food.service.food.componenet.list.hotdog.save.button" text="Save" /></button>
					</div>
			</div>
			<div class="tab-pane" id="drinks">
				<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th><spring:message code="yours.list.heading.drinks" text="Drinks" /></th>
								<th>Price: <span id="drinkPrice" class="label label-primary" style="font-size: 14px" >0.00</span></th>
							</tr>
						</thead>
						<c:forEach items="${drinks }" var="drink">
							<tr>
								<td>
									<input type="radio" name="drink" id="${drink.id }"/>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<label>${drink.nameGeo }</label>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<label>${drink.nameEng }</label>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<label>${drink.nameRus }</label>
										</c:when>
									</c:choose>
								</td>
								<td>
									<select disabled class="form-control" id="drinkSizeAndPrices${drink.id }">
										<c:forEach items="${drink.drinkSizeAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#drinkSizeAndPrices${drink.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
						    		drinkPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									drinkPrice += parseFloat(price);
									$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
						    	});
							})();
							</script>
						</c:forEach>
					</table>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.food.service.food.components.list.drink.addon.title" text="Drink Addon"/></th>
							</tr>
						</thead>
						<c:forEach items="${drinkAddOns }" var="drinkAddOn">
							<tr>
								<td>
									<div>
										<input name="drinkAddOn" type="checkbox" id="${drinkAddOn.id }">
										<c:choose>
											<c:when test="${locale eq 'ka' }">
												<label>${drinkAddOn.nameGeo }</label>										
											</c:when>
											<c:when test="${locale eq 'en' }">
												<label>${drinkAddOn.nameEng }</label>
											</c:when>
											<c:when test="${locale eq 'ru' }">
												<label>${drinkAddOn.nameRus }</label>
											</c:when>
										</c:choose>
									</div>
								</td>
								<td>
									<select disabled class="form-control" id="drinkAddOnAmountAndPrices${drinkAddOn.id }">
										<c:forEach items="${drinkAddOn.drinkAddOnAmountAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.amount}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#drinkAddOnAmountAndPrices${drinkAddOn.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
						    		drinkPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									drinkPrice += parseFloat(price);
									$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
						    	});
							})();
							</script>
						</c:forEach>
					</table>
					<div class="col-md-offset-5" style="margin-top:14px;">
						<button id="drinkSaveButton" type="button" class="btn btn-success"><spring:message code="yours.food.service.food.componenet.list.hotdog.save.button" text="Save" /></button>
					</div>
			</div>
			<div class="tab-pane" id="hotdog">
				<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
								<th>Price: <span id="hotdogPrice" class="label label-primary" style="font-size: 14px">0.00</span> </th>
							</tr>
						</thead>
						<c:forEach items="${hotdogBreads}" var="hotdogBread">
							<tr>
								<td>
									<input type="radio" name="hotdogBread" id="${hotdogBread.id }"/>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<label>${hotdogBread.nameGeo }</label>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<label>${hotdogBread.nameEng }</label>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<label>${hotdogBread.nameRus }</label>
										</c:when>
									</c:choose>
								</td>
								<td>
									<select disabled class="form-control" id="hotdogBreadSizeAndPrices${hotdogBread.id }">
										<c:forEach items="${hotdogBread.hotdogBreadSizeAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#hotdogBreadSizeAndPrices${hotdogBread.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
						    		hotdogPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									hotdogPrice += parseFloat(price);
									$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
						    	});
							})();
							</script>
						</c:forEach>
					</table>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
							</tr>
						</thead>
						<c:forEach items="${hotdogSausages}" var="hotdogSausage">
							<tr>
								<td>
									<div>
										<input name="hotdogSausages" type="radio" id="${hotdogSausage.id }">
										<c:choose>
											<c:when test="${locale eq 'ka' }">
												<label>${hotdogSausage.nameGeo }</label>										
											</c:when>
											<c:when test="${locale eq 'en' }">
												<label>${hotdogSausage.nameEng }</label>
											</c:when>
											<c:when test="${locale eq 'ru' }">
												<label>${hotdogSausage.nameRus }</label>
											</c:when>
										</c:choose>
									</div>
								</td>
								<td>
									<select disabled class="form-control" id="hotDogSausageAmountAndPrice${hotdogSausage.id }">
										<c:forEach items="${hotdogSausage.hotDogSausageAmountAndPrice }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#hotDogSausageAmountAndPrice${hotdogSausage.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
						    		hotdogPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									hotdogPrice += parseFloat(price);
									$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
						    	});
							})();
							</script>
						</c:forEach>
					</table>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sauce" text="Sauce" /></th>
							</tr>
						</thead>
						<c:forEach items="${hotdogSauces}" var="hotdogSauce">
							<tr>
								<td>
									<input name="hotdogSauces"  id="${hotdogSauce.id }" type="checkbox">
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<label>${hotdogSauce.nameGeo }</label>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<label>${hotdogSauce.nameEng }</label>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<label>${hotdogSauce.nameRus }</label>
										</c:when>
									</c:choose>
								</td>
								<td>
									<select disabled class="form-control" id="hotdogSauceAmountAndPrice${hotdogSauce.id }">
										<c:forEach items="${hotdogSauce.hotdogSauceAmountAndPrice}" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.amount}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							(function () {
						    	var previousPrice = null;

						    	$("#hotdogSauceAmountAndPrice${hotdogSauce.id }").mousedown(function () {
						    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
						    	}).change(function() {
						    		hotdogPrice -= parseFloat(previousPrice);
									var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
									hotdogPrice += parseFloat(price);
									$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
						    	});
							})();
							</script>
						</c:forEach>
					</table>
					<div class="col-md-offset-5" style="margin-top:14px;">
						<button id="hotdogSaveButton" type="button" class="btn btn-success"><spring:message code="yours.food.service.food.componenet.list.hotdog.save.button" text="Save" /></button>
					</div>
			</div>
		</div>

      <div class="row marketing">
        <div class="col-lg-12">
          
      </div>

      <div class="footer">
        <p>&copy; Company 2013</p>
      </div>
	  </div>
    </div> <!-- /container -->
	

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/sandwich.js"></script>
	<script src="resources/js/salad.js"></script>
	<script src="resources/js/drinks.js"></script>
	<script src="resources/js/hotdog.js"></script>
	<script src="resources/js/alertify.min.js"></script>
	<script src="resources/js//jquery.icheck.js"></script>
	<script src="resources/js/yours.js"></script>
	<script>
		$('input').on('ifChecked', function(event){
			var ingredientName = $(event.target.outerHTML).attr('name');
			if(ingredientName === 'sandwichBread') {
				var selectElement = $('#' + ingredientName + 'SizeAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'SizeAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSausage') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichVegetable') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSauce') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSpice') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'saladIngredient') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				saladPrice += parseFloat(price);
				$('#saladPrice').text(parseFloat(Math.round(saladPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'drink') {
				var selectElement = $('#' + ingredientName + 'SizeAndPrices' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'SizeAndPrices' + event.target.id + " :selected").attr('ingredient-price');
				drinkPrice += parseFloat(price);
				$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'drinkAddOn') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrices' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrices' + event.target.id + " :selected").attr('ingredient-price');
				drinkPrice += parseFloat(price);
				$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'hotdogBread') {
				var selectElement = $('#hotdogBreadSizeAndPrices' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#hotdogBreadSizeAndPrices' + event.target.id + " :selected").attr('ingredient-price');
				hotdogPrice += parseFloat(price);
				$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
			} if(ingredientName === 'hotdogSausages') {
				var selectElement = $('#hotDogSausageAmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#hotDogSausageAmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				hotdogPrice += parseFloat(price);
				$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
			} if(ingredientName === 'hotdogSauces') {
				var selectElement = $('#hotdogSauceAmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#hotdogSauceAmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				hotdogPrice += parseFloat(price);
				$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
			}
		});
		$('input').on('ifUnchecked', function(event){
			var ingredientName = $(event.target.outerHTML).attr('name');
			if(ingredientName === 'sandwichBread') {
				var selectElement = $('#' + ingredientName + 'SizeAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'SizeAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice -= parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSausage') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice -= parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichVegetable') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice -= parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSauce') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice -= parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSpice') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice -= parseFloat(price);
				$('#sandwichPrice').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'saladIngredient') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				saladPrice -= parseFloat(price);
				$('#saladPrice').text(parseFloat(Math.round(saladPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'drink') {
				var selectElement = $('#' + ingredientName + 'SizeAndPrices' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'SizeAndPrices' + event.target.id + " :selected").attr('ingredient-price');
				drinkPrice -= parseFloat(price);
				$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'drinkAddOn') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrices' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrices' + event.target.id + " :selected").attr('ingredient-price');
				drinkPrice -= parseFloat(price);
				$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
			} if(ingredientName === 'hotdogBread') {
				var selectElement = $('#hotdogBreadSizeAndPrices' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#hotdogBreadSizeAndPrices' + event.target.id + " :selected").attr('ingredient-price');
				hotdogPrice -= parseFloat(price);
				$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
			} if(ingredientName === 'hotdogSausages') {
				var selectElement = $('#hotDogSausageAmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#hotDogSausageAmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				hotdogPrice -= parseFloat(price);
				$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
			} if(ingredientName === 'hotdogSauces') {
				var selectElement = $('#hotdogSauceAmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#hotdogSauceAmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				hotdogPrice -= parseFloat(price);
				$('#hotdogPrice').text(parseFloat(Math.round(hotdogPrice * 100) / 100).toFixed(2));
			}
		});
	</script>
</body>
</html>
