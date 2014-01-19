<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Food Service" />
	<meta name="author" content="GNG Apps" />
	<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif" />
	
	<title><spring:message code="yours.food.service.food.components.list.title" text="Food Components" /></title>
	
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
	<script src="resources/js/bootstrap.min.js"></script>
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
								<th></th>
								<th><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
								<th></th>
								<th><spring:message code="yours.food.ingredient.price" text="Price" />: <span class="badge" id="sandwichPrice">0.00</span></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichBreads }" var="sandwichBread">
							<tr>
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="sandwichBreadPopover${sandwichBread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichBread.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="sandwichBreadPopover${sandwichBread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichBread.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="sandwichBreadPopover${sandwichBread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichBread.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
									<c:choose>
										<c:when test="${sandwichBread.foodComponentImage ne null }">
											<button id="sandwichBreadImage${sandwichBread.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${sandwichBread.foodComponentImage.imageFileName }' />" data-original-title="" title="">
												<span class="glyphicon glyphicon-film"></span>
								    		</button>	
										</c:when>
										<c:otherwise>
											<button id="sandwichBreadImage${sandwichBread.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
												<span class="glyphicon glyphicon-film"></span>
								    		</button>
										</c:otherwise>
									</c:choose>
									
						    		<script>
						    			$('#sandwichBreadImage${sandwichBread.id }').popover();
						    		</script>
								</td>
								<td class="td-50-percent">
									<select disabled class="form-control" id="sandwichBreadSizeAndPrice${sandwichBread.id }">
										<c:forEach items="${sandwichBread.sandwichBreadSizeAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
								$('#sandwichBreadPopover${sandwichBread.id}').popover();
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
								<th></th>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichSausages }" var="sandwichSausage">
							<tr>
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="sandwichSausagePopover${sandwichSausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSausage.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="sandwichSausagePopover${sandwichSausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSausage.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="sandwichSausagePopover${sandwichSausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSausage.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
								<td class="td-50-percent">
									<select disabled class="form-control" id="sandwichSausageAmountAndPrice${sandwichSausage.id }">
										<c:forEach items="${sandwichSausage.sausageAmountAndPrices }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
								$('#sandwichSausagePopover${sandwichSausage.id}').popover();
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
								<th></th>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichVegetables }" var="sandwichVegetable">
							<tr>
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="sandwichVegetablePopover${sandwichVegetable.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichVegetable.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="sandwichVegetablePopover${sandwichVegetable.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichVegetable.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="sandwichVegetablePopover${sandwichVegetable.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichVegetable.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
								<td class="td-50-percent">
									<select disabled class="form-control" id="sandwichVegetableAmountAndPrice${sandwichVegetable.id }">
										<c:forEach items="${sandwichVegetable.vegetableAmountAndPrices }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							$('#sandwichVegetablePopover${sandwichVegetable.id}').popover();
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
								<th></th>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sauce" text="Sauce" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichSauces }" var="sandwichSauce">
							<tr>
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="sandwichSaucePopover${sandwichSauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSauce.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="sandwichSaucePopover${sandwichSauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSauce.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="sandwichSaucePopover${sandwichSauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSauce.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
								<td class="td-50-percent">
									<select disabled class="form-control" id="sandwichSauceAmountAndPrice${sandwichSauce.id }">
										<c:forEach items="${sandwichSauce.sauceAmountAndPrices}" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							$('#sandwichSaucePopover${sandwichSauce.id}').popover();
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
								<th></th>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.spice" text="Spice" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichSpices }" var="sandwichSpice">
							<tr>
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="sandwichSpicePopover${sandwichSpice.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSpice.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="sandwichSpicePopover${sandwichSpice.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSpice.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="sandwichSpicePopover${sandwichSpice.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSpice.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
								<td class="td-50-percent">
									<select disabled class="form-control" id="sandwichSpiceAmountAndPrice${sandwichSpice.id }">
										<c:forEach items="${sandwichSpice.spiceAmountAndPrice}" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							$('#sandwichSpicePopover${sandwichSpice.id}').popover();
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
								<th></th>
								<th><spring:message code="yours.food.service.salad.ingredients" text="Salad Ingredients" /></th>
								<th><spring:message code="yours.food.ingredient.price" text="Price" />: <span class="badge" id="saladPrice">0.00</span></th>
							</tr>
						</thead>
						<c:forEach items="${saladIngredients }" var="saladIngredient">
							<tr>
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="saladIngredientPopover${saladIngredient.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${saladIngredient.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="saladIngredientPopover${saladIngredient.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${saladIngredient.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="saladIngredientPopover${saladIngredient.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${saladIngredient.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
								<td class="td-50-percent">
									<select disabled class="form-control" id="saladIngredientAmountAndPrice${saladIngredient.id }">
										<c:forEach items="${saladIngredient.saladIngredientAmountAndPrices }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.amount}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							$('#saladIngredientPopover${saladIngredient.id}').popover();
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
								<th></th>
								<th><spring:message code="yours.list.heading.drinks" text="Drinks" /></th>
								<th><spring:message code="yours.food.ingredient.price" text="Price" />: <span class="badge" id="drinkPrice">0.00</span></th>
							</tr>
						</thead>
						<c:forEach items="${drinks }" var="drink">
							<tr>	
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="drinkPopover${drink.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${drink.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="drinkPopover${drink.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${drink.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="drinkPopover${drink.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${drink.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
								<td class="td-50-percent">
									<select disabled class="form-control" id="drinkSizeAndPrices${drink.id }">
										<c:forEach items="${drink.drinkSizeAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							$('#drinkPopover${drink.id}').popover();
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
					<table id="drink-addon-table" class="table table-bordered table-striped">
					</table>
					<div class="col-md-offset-5" style="margin-top:14px;">
						<button id="drinkSaveButton" type="button" class="btn btn-success"><spring:message code="yours.food.service.food.componenet.list.hotdog.save.button" text="Save" /></button>
					</div>
			</div>
			<div class="tab-pane" id="hotdog">
				<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th></th>
								<th><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
								<th><spring:message code="yours.food.ingredient.price" text="Price" />: <span class="badge" id="hotdogPrice">0.00</span></th>
							</tr>
						</thead>
						<c:forEach items="${hotdogBreads}" var="hotdogBread">
							<tr>
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="hotdogBreadPopover${hotdogBread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${hotdogBread.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="hotdogBreadPopover${hotdogBread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${hotdogBread.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="hotdogBreadPopover${hotdogBread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${hotdogBread.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
								<td class="td-50-percent">
									<select disabled class="form-control" id="hotdogBreadSizeAndPrices${hotdogBread.id }">
										<c:forEach items="${hotdogBread.hotdogBreadSizeAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							$('#hotdogBreadPopover${hotdogBread.id}').popover();
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
								<th></th>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
							</tr>
						</thead>
						<c:forEach items="${hotdogSausages}" var="hotdogSausage">
							<tr>
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="hotdogSausagePopover${hotdogSausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${hotdogSausage.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="hotdogSausagePopover${hotdogSausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${hotdogSausage.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="hotdogSausagePopover${hotdogSausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${hotdogSausage.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
								<td class="td-50-percent">
									<select disabled class="form-control" id="hotDogSausageAmountAndPrice${hotdogSausage.id }">
										<c:forEach items="${hotdogSausage.hotDogSausageAmountAndPrice }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							$('#hotdogSausagePopover${hotdogSausage.id}').popover();
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
								<th></th>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sauce" text="Sauce" /></th>
							</tr>
						</thead>
						<c:forEach items="${hotdogSauces}" var="hotdogSauce">
							<tr>
								<td>
									<c:choose>
										<c:when test="${locale eq 'ka' }">
											<button id="hotdogSaucePopover${hotdogSauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${hotdogSauce.descriptionGeo }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
										    </button>										
										</c:when>
										<c:when test="${locale eq 'en' }">
											<button id="hotdogSaucePopover${hotdogSauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${hotdogSauce.descriptionEng }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
										<c:when test="${locale eq 'ru' }">
											<button id="hotdogSaucePopover${hotdogSauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${hotdogSauce.descriptionRus }" data-original-title="" title="">
												<span class="glyphicon glyphicon-info-sign"></span>
								    		</button>
										</c:when>
									</c:choose>
								</td>
								<td class="td-50-percent">
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
								<td class="td-50-percent">
									<select disabled class="form-control" id="hotdogSauceAmountAndPrice${hotdogSauce.id }">
										<c:forEach items="${hotdogSauce.hotdogSauceAmountAndPrice}" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.amount}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<script>
							$('#hotdogSaucePopover${hotdogSauce.id}').popover();
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
       	<div class="pull-left">&copy; Company 2013</div>
        <div class="pull-right">Created by GNG Apps</div>
      </div>
	  </div>
    </div> <!-- /container -->
	<script src="resources/js/sandwich.js"></script>
	<script src="resources/js/salad.js"></script>
	<script src="resources/js/drinks.js"></script>
	<script src="resources/js/hotdog.js"></script>
	<script src="resources/js/alertify.min.js"></script>
	<script src="resources/js/jquery.icheck.js"></script>
	<script src="resources/js/yours.js"></script>
</body>
</html>
