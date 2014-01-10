<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Food Service" />
<meta name="author" content="GNG Apps" />
<link rel="shortcut icon" href="../resources/ico/yours-sml-logo.gif" />

<title><spring:message code="yours.food.service.admin.add.food.components.title"></spring:message></title>

<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.css" rel="stylesheet" />
<link href="../resources/css/alertify.core.css" rel="stylesheet" />
<link href="../resources/css/alertify.default.css" rel="stylesheet" />
<link href="../resources/css/alertify.bootstrap.css" rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="../resources/css/yours-food-service.css" rel="stylesheet" />

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
				<li class="active"><a href="#"><spring:message code="yours.food.service.admin.add.food.components.title"></spring:message></a></li>
				<li><a href="../j_spring_security_logout"><spring:message code="yours.food.service.header.logout"></spring:message></a></li>
			</ul>
			<h3 class="text-muted"><spring:message code="yours.food.service.header.text"></spring:message></h3>
			<span><a href="?language=ka"><img src="../resources/ico/georgia_flag_32.png"></a></span>
			<span><a href="?language=en"><img src="../resources/ico/usa_flag_32.png"></a></span>
			<span><a href="?language=ru"><img src="../resources/ico/russia_flag_32.png"></a></span>
		</div>
		<div class="logo-image"></div>
		<div class="row">
			<div class="col-md-3">
				<h4>
					<span style="margin-left: 15px"><spring:message code="yours.list.heading.sandwich" text="Sandwich" /></span>
				</h4>
				<!-- Single button -->
				<div class="btn-group">
  					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><spring:message code="yours.food.ingredient.component"></spring:message> <span class="caret"></span></button>
  					<ul class="dropdown-menu" role="menu">
    					<li><a class="sandwich-ingredients-bread" href="#"><spring:message code="yours.food.service.ingredients.bread"></spring:message></a></li>
    					<li><a class="sandwich-ingredients-sausage" href="#"><spring:message code="yours.food.service.ingredients.hotdog.sausage"></spring:message></a></li>
    					<li><a class="sandwich-ingredients-vegetables" href="#"><spring:message code="yours.food.ingredient.vegetable"></spring:message></a></li>
    					<li><a class="sandwich-ingredients-sauce" href="#"><spring:message code="yours.food.ingredient.sauce"></spring:message></a></li>
    					<li><a class="sandwich-ingredients-spice" href="#"><spring:message code="yours.food.ingredient.spice"></spring:message></a></li>
  					</ul>
				</div>
			</div>
			<div class="col-md-3">
				<h4>
					<span style="margin-left: 20px"><spring:message code="yours.list.heading.salad" text="Salad" /></span>
				</h4>
				<!-- Single button -->
				<div class="btn-group">
  					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><spring:message code="yours.food.ingredient.component"></spring:message><span class="caret"></span></button>
  					<ul class="dropdown-menu" role="menu">
    					<li><a class="salad-ingredient" href="#"><spring:message code="yours.food.service.ingredient"></spring:message></a></li>
  					</ul>
				</div>
			</div>
			<div class="col-md-3">
				<h4>
					<span style="margin-left: 20px"><spring:message code="yours.list.heading.drinks" text="Drinks" /></span>
				</h4>
				<!-- Single button -->
				<div class="btn-group">
  					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><spring:message code="yours.food.ingredient.component"></spring:message> <span class="caret"></span></button>
  					<ul class="dropdown-menu" role="menu">
    					<li><a class="drink" href="#"><spring:message code="yours.food.service.ingredients.drink"></spring:message></a></li>
    					<li><a class="drink-addon" href="#"><spring:message code="yours.food.service.ingredients.drink.addon"></spring:message></a></li>
  					</ul>
				</div>
			</div>
			<div class="col-md-3">
				<h4>
					<span style="margin-left: 15px"><spring:message code="yours.food.service.meals.list.hotdog"></spring:message></span>
				</h4>
				<!-- Single button -->
				<div class="btn-group">
  					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><spring:message code="yours.food.ingredient.component"></spring:message><span class="caret"></span></button>
  					<ul class="dropdown-menu" role="menu">
    					<li><a class="hotdog-ingredient-bread" href="#"><spring:message code="yours.food.service.ingredients.bread"></spring:message></a></li>
    					<li><a class="hotdog-ingredient-sausage" href="#"><spring:message code="yours.food.service.ingredients.hotdog.sausage"></spring:message></a></li>
    					<li><a class="hotdog-ingredient-sauce" href="#"><spring:message code="yours.food.service.ingredients.hotdog.sauce"></spring:message></a></li>
  					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="yours-ingredients-list"></div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../resources/js/jquery-2.0.3.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/alertify.min.js"></script>
	<script>
		$( ".sandwich-ingredients-bread" ).click(function() {
			$.get( "add-sandwich-bread-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".sandwich-ingredients-sausage" ).click(function() {
			$.get( "add-sandwich-sausage-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".sandwich-ingredients-vegetables" ).click(function() {
			$.get( "add-sandwich-vegetables-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".sandwich-ingredients-sauce" ).click(function() {
			$.get( "add-sandwich-sauce-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".sandwich-ingredients-spice" ).click(function() {
			$.get( "add-sandwich-spice-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".salad-ingredient" ).click(function() {
			$.get( "add-salad-ingredient-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".drink" ).click(function() {
			$.get( "add-drink-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".drink-addon" ).click(function() {
			$.get( "add-drink-addon-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".hotdog-ingredient-bread" ).click(function() {
			$.get( "add-hotdog-ingredient-bread-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".hotdog-ingredient-sausage" ).click(function() {
			$.get( "add-hotdog-ingredient-sausage-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".hotdog-ingredient-sauce" ).click(function() {
			$.get( "add-hotdog-ingredient-sauce-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
			});
		});
		$( ".hotdog-ingredient-sauce" ).click(function() {
			$.get( "add-hotdog-ingredient-sauce-form", function( content ) {
				$( ".yours-ingredients-list" ).empty();
				$( ".yours-ingredients-list" ).append( content );
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