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
				<li><a href="j_spring_security_logout">Logout</a></li>
			</ul>
			<h3 class="text-muted">Project name</h3>
		</div>
		<div class="logo-image-narrow"></div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseOne"> Sandwiches </a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<c:forEach items="${meals['sandwiches']}" var="customerSandwich">
									<div class="panel panel-default">
  										<!-- Default panel contents -->
  										<div class="panel-heading"><p class="lead">Sandwich - ${customerSandwich.id}</p></div>
									<table class="table table-hover">
										<thead>
											<tr>
												<th><p class="text-left"><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread"/></p></th>
												<th><p class="text-center"><spring:message code="yours.food.ingredients.size" text="Size"/></p></th>
												<th><p class="text-right"><spring:message code="yours.food.ingredient.price" text="Price"/></p></th>
											</tr>
										</thead>
										<tr>
											<td><p class="text-left">${customerSandwich.sandwichBread.nameGeo }</td>
											<td><p class="text-center">${customerSandwich.sandwichBreadSizeAndPrice.size }</p></td>
											<td><p class="text-right">${customerSandwich.sandwichBreadSizeAndPrice.price }</td>
										</tr>
									</table>
									<table class="table table-hover">
										<thead>
											<tr>
												<th><p class="text-left"><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage"/></p></th>
												<th><p class="text-center"><spring:message code="yours.food.ingredients.amount" text="Amount"/></p></th>
												<th><p class="text-right"><spring:message code="yours.food.ingredient.price" text="Price"/></p></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausage"> 
											<tr>
												<td><p class="text-left">${sandwichSausage.sandwichSausage.nameGeo }</p></td>
												<td><p class="text-center">${sandwichSausage.amountAndPrice.portion }</p></td>
												<td><p class="text-right">${sandwichSausage.amountAndPrice.price }</p></td>
											</tr>										
										</c:forEach>
									</table>
									<table class="table table-hover">
										<thead>
											<tr>
												<th><p class="text-left"><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables"/></p></th>
												<th><p class="text-center"><spring:message code="yours.food.ingredients.amount" text="Amount"/></p></th>
												<th><p class="text-right"><spring:message code="yours.food.ingredient.price" text="Price"/></p></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichVegetables }" var="vegetableWithAmountAndPrice"> 
											<tr>
												<td><p class="text-left"><p class="text-left">${vegetableWithAmountAndPrice.sandwichVegetable.nameGeo }</p></td>
												<td><p class="text-center">${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.portion }</p></td>
												<td><p class="text-right">${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.price }</p></td>
											</tr>										
										</c:forEach>
									</table>
									<table class="table table-hover">
										<thead>
											<tr>
												<th><p class="text-left"><spring:message code="yours.food.ingredient.sauce" text="Sauce"/></p></th>
												<th><p class="text-center"><spring:message code="yours.food.ingredients.amount" text="Amount"/></p></th>
												<th><p class="text-right"><spring:message code="yours.food.ingredient.price" text="Price"/></p></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichSauce }" var="sauceWithAmountAndPrice"> 
											<tr>
												<td><p class="text-left">${sauceWithAmountAndPrice.sandwichSauce.nameGeo }</p></td>
												<td><p class="text-center">${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.portion }</p></td>
												<td><p class="text-right">${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.price }</p></td>
											</tr>										
										</c:forEach>
									</table>
									<table class="table table-hover">
										<thead>
											<tr>
												<th><p class="text-left"><spring:message code="yours.food.ingredient.spice" text="Sauce"/></p></th>
												<th><p class="text-center"><spring:message code="yours.food.ingredients.amount" text="Amount"/></p></th>
												<th><p class="text-right"><spring:message code="yours.food.ingredient.price" text="Price"/></p></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichSpices }" var="spiceWithAmountAndPrice"> 
											<tr>
												<td><p class="text-left">${spiceWithAmountAndPrice.sandwichSpice.nameGeo }</p></td>
												<td><p class="text-center">${spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.portion }</p></td>
												<td><p class="text-right">${spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.price }</p></td>
											</tr>										
										</c:forEach>
									</table>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseTwo"> Salads </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseThree"> Drinks </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapseThree"> Hotdogs </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">Anim pariatur cliche reprehenderit,
								enim eiusmod high life accusamus terry richardson ad squid. 3
								wolf moon officia aute, non cupidatat skateboard dolor brunch.
								Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
								tempor, sunt aliqua put a bird on it squid single-origin coffee
								nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
								craft beer labore wes anderson cred nesciunt sapiente ea
								proident. Ad vegan excepteur butcher vice lomo. Leggings
								occaecat craft beer farm-to-table, raw denim aesthetic synth
								nesciunt you probably haven't heard of them accusamus labore
								sustainable VHS.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="resources/js/jquery-2.0.3.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.fs.selecter.min.js"></script>
	<script src="resources/js/yours.js"></script>
</body>
</html>