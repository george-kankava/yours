<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Food Service" />
<meta name="author" content="GNG Apps" />
<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif" />

<title>Add Components</title>

<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.css" rel="stylesheet" />

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
				<li class="active"><a href="#">Home</a></li>
				<li><a href="#">About</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
			<h3 class="text-muted">Yours.ge - Online Food Service</h3>
		</div>
		<div class="logo-image"></div>
		<h4>
					<span style="margin-left: 15px"><spring:message code="yours.list.heading.sandwich" text="Sandwich" /></span>
		</h4>
		<div class="row marketing">
		<!-- Single button -->
				<div class="btn-group">
  					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Component <span class="caret"></span></button>
  					<ul class="dropdown-menu" role="menu">
    					<li><a class="sandwich-ingredients-bread" href="#">Bread</a></li>
    					<li><a class="sandwich-ingredients-sausage" href="#">Sausage</a></li>
    					<li><a class="sandwich-ingredients-vegetables" href="#">Vegetables</a></li>
    					<li><a class="sandwich-ingredients-sauce" href="#">Sauce</a></li>
    					<li><a class="sandwich-ingredients-spice" href="#">Spice</a></li>
  					</ul>
				</div>
				<div class="sandwich-ingredients-list"></div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../resources/js/jquery-2.0.3.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script>
		$( ".sandwich-ingredients-bread" ).click(function() {
			$.get( "add-sandwich-bread-form", function( content ) {
				$( ".sandwich-ingredients-list" ).empty();
				$( ".sandwich-ingredients-list" ).append( content );
			});
		});
		$( ".sandwich-ingredients-sausage" ).click(function() {
			$.get( "add-sandwich-sausage-form", function( content ) {
				$( ".sandwich-ingredients-list" ).empty();
				$( ".sandwich-ingredients-list" ).append( content );
			});
		});
		$( ".sandwich-ingredients-vegetables" ).click(function() {
			$.get( "add-sandwich-vegetables-form", function( content ) {
				$( ".sandwich-ingredients-list" ).empty();
				$( ".sandwich-ingredients-list" ).append( content );
			});
		});
		$( ".sandwich-ingredients-sauce" ).click(function() {
			$.get( "add-sandwich-sauce-form", function( content ) {
				$( ".sandwich-ingredients-list" ).empty();
				$( ".sandwich-ingredients-list" ).append( content );
			});
		});
		$( ".sandwich-ingredients-spice" ).click(function() {
			$.get( "add-sandwich-spice-form", function( content ) {
				$( ".sandwich-ingredients-list" ).empty();
				$( ".sandwich-ingredients-list" ).append( content );
			});
		});
		$( ".salad-ingredient" ).click(function() {
			$.get( "add-salad-ingredient-form", function( content ) {
				$( ".salad-ingredients-list" ).empty();
				$( ".salad-ingredients-list" ).append( content );
			});
		});
		$( ".drink" ).click(function() {
			$.get( "add-drink-form", function( content ) {
				$( ".drink-list" ).empty();
				$( ".drink-list" ).append( content );
			});
		});
		$( ".drink-addon" ).click(function() {
			$.get( "add-drink-addon-form", function( content ) {
				$( ".drink-list" ).empty();
				$( ".drink-list" ).append( content );
			});
		});
		$( ".hotdog-ingredient-bread" ).click(function() {
			$.get( "add-hotdog-ingredient-bread-form", function( content ) {
				$( ".hotdog-ingredients-list" ).empty();
				$( ".hotdog-ingredients-list" ).append( content );
			});
		});
		$( ".hotdog-ingredient-sausage" ).click(function() {
			$.get( "add-hotdog-ingredient-sausage-form", function( content ) {
				$( ".hotdog-ingredients-list" ).empty();
				$( ".hotdog-ingredients-list" ).append( content );
			});
		});
		$( ".hotdog-ingredient-sauce" ).click(function() {
			$.get( "add-hotdog-ingredient-sauce-form", function( content ) {
				$( ".hotdog-ingredients-list" ).empty();
				$( ".hotdog-ingredients-list" ).append( content );
			});
		});
		$( ".hotdog-ingredient-sauce" ).click(function() {
			$.get( "add-hotdog-ingredient-sauce-form", function( content ) {
				$( ".hotdog-ingredients-list" ).empty();
				$( ".hotdog-ingredients-list" ).append( content );
			});
		});
	</script>
</body>
</html>