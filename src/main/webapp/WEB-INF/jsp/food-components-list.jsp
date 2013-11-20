<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

<title>Yours Food Service</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="resources/css/yours-food-service.css" rel="stylesheet" />

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
			<h3 class="text-muted">Yours.ge - Online Food Service</h3>
		</div>
		<div class="logo-image"></div>
		<div class="row">
			<div class="col-lg-3" style="margin-top:30px">
				<div class="panel panel-warning">
					<div class="panel-heading">
          				<h3 class="panel-title"><spring:message code="yours.list.heading.sandwich" text="Sandwich" /></h3>
        			</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichBreads }" var="sandwichBread">
							<tr>
								<td><input type="radio" name="sandwichBreads"><span class="label label-info" style="margin-left: 10px">${sandwichBread.nameGeo }</span></td>
								<td>
									<div class="btn-group">
 	 									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									    	Size <span class="caret"></span>
									 	 </button>
									  <ul class="dropdown-menu" role="menu">
									  <c:forEach items="${sandwichBread.sandwichBreadSizeAndPrices}" var="sizeAndPrice">
											<li><a href="#"><c:out value="${sizeAndPrice.size}" escapeXml="false"/></a></li>
										</c:forEach>
									  </ul>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichSausages }" var="sandwichSausage">
							<tr>
								<td><input name="sandwichSausages" type="radio"><span class="label label-info" style="margin-left: 10px"><c:out value="${sandwichSausage.nameGeo }" escapeXml="false"/></span></td>
								<td>
									<div class="btn-group">
 	 									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									    	Size <span class="caret"></span>
									 	 </button>
									  <ul class="dropdown-menu" role="menu">
									  <c:forEach items="${sandwichSausage.sausageAmountAndPrices}" var="sizeAndPrice">
											<li><a href="#"><c:out value="${sizeAndPrice.portion}" escapeXml="false"/></a></li>
										</c:forEach>
									  </ul>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichVegetables }" var="sandwichVegetable">
							<tr>
								<td><input type="radio"><span class="label label-info" style="margin-left: 10px"><c:out value="${sandwichVegetable.nameGeo }" escapeXml="false"/></span></td>
								<td>
									<div class="btn-group">
 	 									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									    	Size <span class="caret"></span>
									 	 </button>
									  <ul class="dropdown-menu" role="menu">
									  <c:forEach items="${sandwichVegetable.vegetableAmountAndPrices}" var="amountAndPrices">
											<li><a href="#"><c:out value="${amountAndPrices.portion}" escapeXml="false"/></a></li>
										</c:forEach>
									  </ul>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.sauce" text="Sauce" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichSauces }" var="sandwichSauce">
							<tr>
								<td><input type="radio"><span class="label label-info" style="margin-left: 10px"><c:out value="${sandwichSauce.nameGeo }" escapeXml="false"/></span></td>
								<td>
									<div class="btn-group">
 	 									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Size<span class="caret"></span>
									 	 </button>
									  <ul class="dropdown-menu" role="menu">
									  <c:forEach items="${sandwichSauce.sauceAmountAndPrices}" var="amountAndPrice">
											<li><a href="#"><c:out value="${amountAndPrice.portion}" escapeXml="false"/></a></li>
										</c:forEach>
									  </ul>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>

					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="2"><spring:message code="yours.list.heading.sandwich.sublist.spice" text="Spice" /></th>
							</tr>
						</thead>
						<c:forEach items="${sandwichSpices }" var="sandwichSpice">
							<tr>
								<td><input type="radio"><span class="label label-info" style="margin-left: 10px"><c:out value="${sandwichSpice.nameGeo }" escapeXml="false"/></span></td>
								<td>
									<div class="btn-group">
 	 									<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Size<span class="caret"></span>
									 	 </button>
									  <ul class="dropdown-menu" role="menu">
									  <c:forEach items="${sandwichSpice.spiceAmountAndPrice}" var="amountAndPrice">
											<li><a href="#"><c:out value="${amountAndPrice.portion}" escapeXml="false"/></a></li>
										</c:forEach>
									  </ul>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="col-md-offset-4" style="margin-top:14px;padding-bottom: 10px;">
						<button type="button" class="btn btn-success">Save</button>
					</div>
				</div>
			</div>

			<div class="col-lg-3" style="margin-top:30px">
				<div class="panel panel-warning">
					<div class="panel-heading">
          				<h3 class="panel-title"><spring:message code="yours.list.heading.salad" text="Salad" /></h3>
        			</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Ingredients</th>
							</tr>
						</thead>
						<c:forEach items="${saladIngredients }" var="saladIngredient">
							<tr>
								<td><input type="radio"><span style="margin-left: 10px">${saladIngredient.nameGeo }</span></td>
							</tr>
						</c:forEach>
					</table>
					<div class="col-md-offset-4" style="margin-top:14px;padding-bottom: 10px;">
						<button type="button" class="btn btn-success">Save</button>
					</div>
				</div>
			</div>
			<div class="col-lg-3" style="margin-top:30px">
				<div class="panel panel-warning">
					<div class="panel-heading">
          				<h3 class="panel-title"><spring:message code="yours.list.heading.drinks" text="Drinks" /></h3>
        			</div>
					<table class="table table-striped">
						<c:forEach items="${drinks}" var="drink">
							<tr>
								<td><input type="radio"><span style="margin-left: 10px">${drink.nameGeo }</span></td>
							</tr>
						</c:forEach>
					</table>
				<table class="table table-striped">
						<thead>
							<tr>
								<th>Add ons</th>
							</tr>
						</thead>
						<c:forEach items="${drinkAddOns}" var="drinkAddOn">
							<tr>
								<td><input type="radio"><span style="margin-left: 10px">${drinkAddOn.nameGeo }</span></td>
							</tr>
						</c:forEach>
				</table>
				<div class="col-md-offset-4" style="margin-top:14px;padding-bottom: 10px;">
						<button type="button" class="btn btn-success">Save</button>
					</div>
					</div>
			</div>
			<div class="col-lg-3" style="margin-top:30px">
			<div class="panel panel-warning">
					<div class="panel-heading">
          				<h3 class="panel-title">Hot Dog</h3>
        			</div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>
									<spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" />
								</th>
							</tr>
						</thead>
						<c:forEach items="${hotdogBreads}" var="hotdogBread">
							<tr>
								<td><input type="radio"><span style="margin-left: 10px">${hotdogBread.nameGeo }</span></td>
							</tr>
						</c:forEach>
					</table>
				<table class="table table-striped">
						<thead>
							<tr>
								<th><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
							</tr>
						</thead>
						<c:forEach items="${hotdogSausages}" var="hotdogSausage">
							<tr>
								<td><input type="radio"><span style="margin-left: 10px">${hotdogSausage.nameGeo }</span></td>
							</tr>
						</c:forEach>
				</table>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>
									<spring:message code="yours.list.heading.sandwich.sublist.sauce" text="Sauce" />
								</th>
							</tr>
						</thead>
						<c:forEach items="${hotdogSauces}" var="hotdogSauce">
							<tr>
								<td><input type="radio"><span style="margin-left: 10px">${hotdogSauce.nameGeo }</span></td>
							</tr>
						</c:forEach>
					</table>
				<div class="col-md-offset-4" style="margin-top:14px;padding-bottom: 10px;">
						<button type="button" class="btn btn-success">Save</button>
					</div>
					</div>
			</div>
		</div>
		<div class="footer">
			<p>&copy; Yours 2013<span class="pull-right">Developed by GNG Apps</span></p>
		</div>

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="resources/js/jquery-2.0.3.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
