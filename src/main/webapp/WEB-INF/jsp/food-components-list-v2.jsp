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
          <li class="active"><a href="#">Home</a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
        <h3 class="text-muted">Project name</h3>
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
				<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichBreads }" var="sandwichBread">
							<tr>
								<td>
									<input type="radio" name="sandwichBread" id="${sandwichBread.id }"/>
									<label>${sandwichBread.nameGeo }</label>
								</td>
								<td>
									<select class="form-control" id="sandwichBreadSizeAndPrice${sandwichBread.id }">
										<c:forEach items="${sandwichBread.sandwichBreadSizeAndPrices }" var="sizeAndPrice">
											<option value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
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
						<c:forEach items="${sandwichSausages }" var="sandwichSausage">
							<tr>
								<td>
									<div>
										<input name="sandwichSausages" type="checkbox" id="${sandwichSausage.id }">
										<label>${sandwichSausage.nameGeo }</label>
									</div>
								</td>
								<td>
									<select class="form-control" id="sandwichSausageAmountAndPrice${sandwichSausage.id }">
										<c:forEach items="${sandwichSausage.sausageAmountAndPrices }" var="sizeAndPrice">
											<option value="${sizeAndPrice.id}">${sizeAndPrice.portion}</option>
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
									<select class="form-control" id="sandwichVegetableAmountAndPrice${sandwichVegetable.id }">
										<c:forEach items="${sandwichVegetable.vegetableAmountAndPrices }" var="amountAndPrices">
											<option value="${amountAndPrices.id}">${amountAndPrices.portion}</option>
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
									<select class="form-control" id="sandwichSauceAmountAndPrice${sandwichSauce.id }">
										<c:forEach items="${sandwichSauce.sauceAmountAndPrices}" var="amountAndPrice">
											<option value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
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
									<select class="form-control" id="sandwichSpiceAmountAndPrice${sandwichSpice.id }">
										<c:forEach items="${sandwichSpice.spiceAmountAndPrice}" var="amountAndPrice">
											<option value="${amountAndPrice.id}">${amountAndPrice.portion}</option>
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
								<th colspan="2">Salad Ingredients</th>
							</tr>
						</thead>
						<c:forEach items="${saladIngredients }" var="saladIngredient">
							<tr>
								<td>
									<input type="checkbox" name="saladIngredient" id="${saladIngredient.id }"/>
									<label>${saladIngredient.nameGeo }</label>
								</td>
								<td>
									<select class="form-control" id="saladIngredientSizeAndPrice${saladIngredient.id }">
										<c:forEach items="${saladIngredient.saladIngredientAmountAndPrices }" var="amountAndPrice">
											<option value="${amountAndPrice.id}">${amountAndPrice.amount}</option>
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
			<div class="tab-pane active" id="drinks">
				<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.drinks" text="Drinks" /></th>
							</tr>
						</thead>
						<c:forEach items="${drinks }" var="drink">
							<tr>
								<td>
									<input type="radio" name="drink" id="${drink.id }"/>
									<label>${drink.nameGeo }</label>
								</td>
								<td>
									<select class="form-control" id="drinkSizeAndPrices${drink.id }">
										<c:forEach items="${drink.drinkSizeAndPrices }" var="sizeAndPrice">
											<option value="${sizeAndPrice.id}">${sizeAndPrice.size}</option>
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
									<select class="form-control" id="drinkAddOnAmountAndPrices${drinkAddOn.id }">
										<c:forEach items="${drinkAddOn.drinkAddOnAmountAndPrices }" var="sizeAndPrice">
											<option value="${sizeAndPrice.id}">${sizeAndPrice.amount}</option>
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
			<div class="tab-pane" id="hotdog">..as.</div>
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
	<script src="resources/js/jquery.fs.selecter.min.js"></script>
	<script src="resources/js/yours.js"></script>
	<script src="resources/js/jquery.icheck.js"></script>\
	<script src="resources/js/alertify.min.js"></script>
  </body>
</html>
