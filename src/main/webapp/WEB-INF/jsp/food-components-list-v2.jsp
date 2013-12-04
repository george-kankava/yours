<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
	<link href="resources/css/jquery.fs.selecter.css" rel="stylesheet" />
	<link href="resources/css/jumbotron-narrow.css" rel="stylesheet" />
	<link href="resources/css/line/blue.css" rel="stylesheet">
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
          <li class="active"><a href="#">Ingredients</a></li>
          <li><a href="customer-meals-page"><spring:message code="yours.food.service.meals" text="Meals" /></a></li>
          <li><a href="j_spring_security_logout">Logout</a></li>
        </ul>
        <h3 class="text-muted">Yours.ge</h3>
      </div>
      
      <div class="logo-image-narrow"></div>

		<ul class="nav nav-tabs" id="foodComponentsTab">
			<li class="active"><a href="#sandwich" data-toggle="tab">Sandwich</a></li>
			<li><a href="#salad" data-toggle="tab">Salad</a></li>
			<li><a href="#drinks" data-toggle="tab">Drinks</a></li>
			<li><a href="#hotdog" data-toggle="tab">Hotdog</a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="sandwich">
				<table class="table table-bordered">
						<thead>
							<tr>
								<th><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
								<th>Price: <span class="badge" id="priceLi">0.00</span></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichBreads }" var="sandwichBread">
							<tr>
								<td>
									<input type="radio" name="sandwichBread" id="${sandwichBread.id }"/>
									<label>${sandwichBread.nameGeo }</label>
								</td>
								<td>
									<select disabled class="form-control" id="sandwichBreadSizeAndPrice${sandwichBread.id }">
										<c:forEach items="${sandwichBread.sandwichBreadSizeAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
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
										<label>${sandwichSausage.nameGeo }</label>
								</td>
								<td>
									<select disabled class="form-control" id="sandwichSausageAmountAndPrice${sandwichSausage.id }">
										<c:forEach items="${sandwichSausage.sausageAmountAndPrices }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
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
									<label>${sandwichVegetable.nameGeo }</label>
								</td>
								<td>
									<select disabled class="form-control" id="sandwichVegetableAmountAndPrice${sandwichVegetable.id }">
										<c:forEach items="${sandwichVegetable.vegetableAmountAndPrices }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
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
									<label>${sandwichSauce.nameGeo }</label>
								</td>
								<td>
									<select disabled class="form-control" id="sandwichSauceAmountAndPrice${sandwichSauce.id }">
										<c:forEach items="${sandwichSauce.sauceAmountAndPrices}" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
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
									<label>${sandwichSpice.nameGeo }</label>
								</td>
								<td>
									<select disabled class="form-control" id="sandwichSpiceAmountAndPrice${sandwichSpice.id }">
										<c:forEach items="${sandwichSpice.spiceAmountAndPrice}" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="col-md-offset-5" style="margin-top:14px;">
							<button id="sandwichSaveButton" type="button" class="btn btn-success">Save</button>
					</div>
			</div>
			<div class="tab-pane" id="salad">
				<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>Salad Ingredients</th>
								<th>Price:  <span id="saladPrice" class="label label-success" style="font-size:14px">0.00</span></th>
							</tr>
						</thead>
						<c:forEach items="${saladIngredients }" var="saladIngredient">
							<tr>
								<td>
									<input type="checkbox" name="saladIngredient" id="${saladIngredient.id }"/>
									<label>${saladIngredient.nameGeo }</label>
								</td>
								<td>
									<select disabled class="form-control" id="saladIngredientAmountAndPrice${saladIngredient.id }">
										<c:forEach items="${saladIngredient.saladIngredientAmountAndPrices }" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.amount}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="col-md-offset-5" style="margin-top:14px;">
						<button id="saladSaveButton" type="button" class="btn btn-success">Save</button>
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
									<label>${drink.nameGeo }</label>
								</td>
								<td>
									<select disabled class="form-control" id="drinkSizeAndPrices${drink.id }">
										<c:forEach items="${drink.drinkSizeAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:forEach>
					</table>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th colspan="2">Drink Add-ons</th>
							</tr>
						</thead>
						<c:forEach items="${drinkAddOns }" var="drinkAddOn">
							<tr>
								<td>
									<div>
										<input name="drinkAddOn" type="checkbox" id="${drinkAddOn.id }">
										<label>${drinkAddOn.nameGeo }</label>
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
						</c:forEach>
					</table>
					<div class="col-md-offset-5" style="margin-top:14px;">
						<button id="drinkSaveButton" type="button" class="btn btn-success">Save</button>
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
									<label>${hotdogBread.nameGeo }</label>
								</td>
								<td>
									<select disabled class="form-control" id="hotdogBreadSizeAndPrices${hotdogBread.id }">
										<c:forEach items="${hotdogBread.hotdogBreadSizeAndPrices }" var="sizeAndPrice">
											<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
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
										<label>${hotdogSausage.nameGeo }</label>
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
									<label>${hotdogSauce.nameGeo }</label>
								</td>
								<td>
									<select disabled class="form-control" id="hotdogSauceAmountAndPrice${hotdogSauce.id }">
										<c:forEach items="${hotdogSauce.hotdogSauceAmountAndPrice}" var="amountAndPrice">
											<option ingredient-price="${amountAndPrice.price }" value="${amountAndPrice.id}">${amountAndPrice.amount}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="col-md-offset-5" style="margin-top:14px;">
						<button id="hotdogSaveButton" type="button" class="btn btn-success">Save</button>
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
    <script src="resources/js/jquery-2.0.3.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/sandwich.js"></script>
	<script src="resources/js/salad.js"></script>
	<script src="resources/js/drinks.js"></script>
	<script src="resources/js/hotdog.js"></script>
	<script src="resources/js/alertify.min.js"></script>
	<script src="resources/js//jquery.icheck.js"></script>
	<script src="resources/js/yours.js"></script>
	<script>
		var sandwichPrice = 0;
		var saladPrice = 0;
		var drinkPrice = 0;
		var hotdogPrice = 0;
		$('input').on('ifChecked', function(event){
			var ingredientName = $(event.target.outerHTML).attr('name');
			if(ingredientName === 'sandwichBread') {
				var selectElement = $('#' + ingredientName + 'SizeAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'SizeAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSausage') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichVegetable') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSauce') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSpice') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice += parseFloat(price);
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'saladIngredient') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).removeAttr('disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				saladPrice += parseFloat(price);
				$('#saladPrice').text(parseFloat(Math.round(saladPrice * 100) / 100).toFixed(2) + ' Lari');
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
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSausage') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice -= parseFloat(price);
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichVegetable') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice -= parseFloat(price);
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSauce') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice -= parseFloat(price);
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'sandwichSpice') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				sandwichPrice -= parseFloat(price);
				$('#priceLi').text(parseFloat(Math.round(sandwichPrice * 100) / 100).toFixed(2));
			} else if(ingredientName === 'saladIngredient') {
				var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
				$(selectElement).attr('disabled', 'disabled');
				var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
				saladPrice -= parseFloat(price);
				$('#saladPrice').text(parseFloat(Math.round(saladPrice * 100) / 100).toFixed(2) + ' Lari');
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
