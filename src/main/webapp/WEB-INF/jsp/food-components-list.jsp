<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<link href="resources/css/jumbotron-narrow.css" rel="stylesheet" />
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
		<div class="row marketing">
			<div class="col-lg-3">
				<h4>
					<span style="margin-left: 15px"><spring:message code="yours.list.heading.sandwich" text="Sandwich" /></span>
				</h4>

				<h5>
					<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></span>
				</h5>

				<blockquote>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Toasted</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Yeast bread</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Buckwheat</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Flatbread</span>
					</div>
				</blockquote>

				<h5>
					<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></span>
				</h5>

				<blockquote>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Swojska</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Krajanska</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Wurst</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Szynkowa</span>
					</div>
				</blockquote>

				<h5>
					<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables" /></span>
				</h5>

				<blockquote>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Tomato</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Cucumber</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Salad List</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Onion</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Garlic</span>
					</div>
				</blockquote>

				<h5>
					<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.sauce" text="Sauce" /></span>
				</h5>

				<blockquote>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Hollandaise</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Mustard</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Ketchup</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Gremolata</span>
					</div>
				</blockquote>

				<h5>
					<span style="margin-left: 35px"><spring:message
							code="yours.list.heading.sandwich.sublist.spice" text="Spice" /></span>
				</h5>

				<blockquote>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Barberry</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Carob</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Cinnamon</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Fennel</span>
					</div>
				</blockquote>
			</div>

			<div class="col-lg-3">
				<h4>
					<span style="margin-left: 20px"><spring:message code="yours.list.heading.salad" text="Salad" /></span>
				</h4>
				<div style="margin-top: 30px"></div>
				<blockquote>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Pomegran</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Caesar</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Roquefort</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Rice</span>
					</div>
				</blockquote>
			</div>
			<div class="col-lg-3">
				<h4>
					<span style="margin-left: 20px"><spring:message code="yours.list.heading.drinks" text="Drinks" /></span>
				</h4>
				<div style="margin-top: 30px"></div>
				<blockquote>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Tea</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Coffee</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Cappuccino</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Americano</span>
					</div>
				</blockquote>
				<blockquote>
					<p class="text-muted">Add-ons</p>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Red Bull</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Vodka</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Sugar</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Chocolate</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Whiskey</span>
					</div>
				</blockquote>
			</div>

			<div class="col-lg-3">
				<h4>
					<span style="margin-left: 15px">Hot Dog</span>
				</h4>

				<h5>
					<span style="margin-left: 35px"><spring:message
							code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></span>
				</h5>

				<blockquote>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Regular</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Sesame</span>
					</div>
				</blockquote>
				<div style="margin-top: 50px"></div>
				<h5>
					<span style="margin-left: 35px"><spring:message
							code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></span>
				</h5>
				<blockquote>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Italian</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Knockwurst</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Krakowska</span>
					</div>
					<div class="input-group">
						<span> <input type="radio"></span><span
							style="margin-left: 10px">Chorizo</span>
					</div>
				</blockquote>
				
				<h5>
					<span style="margin-left: 35px"><spring:message
							code="yours.list.heading.sandwich.sublist.sauce" text="Sauce" /></span>
				</h5>

				<blockquote>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Hollandaise</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Mustard</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Ketchup</span>
					</div>
					<div class="input-group">
						<span> <input type="checkbox"></span><span
							style="margin-left: 10px">Gremolata</span>
					</div>
				</blockquote>
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
