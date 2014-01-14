<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Food Service" />
<meta name="author" content="GNG Apps" />
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<link rel="shortcut icon" href="${contextPath }/resources/ico/yours-sml-logo.gif" />

<title>
	<spring:message code="yours.food.service.error.page.title" text="Error Page" />
</title>

<!-- Bootstrap core CSS -->
<link href="${contextPath }/resources/css/bootstrap.css" rel="stylesheet" />


<!-- Custom styles for this template -->
<link href="${contextPath }/resources/css/yours-food-service.css" rel="stylesheet" />
<link href="${contextPath }/resources/css/jumbotron-narrow.css" rel="stylesheet" />

<script src="${contextPath }/resources/js/jquery-2.0.3.min.js"></script>
<script src="${contextPath }/resources/js/bootstrap.min.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	      <script src="resources/assets/js/html5shiv.js"></script>
	      <script src="resources/assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<div class="container">
		<security:authorize var="loggedIn" access="isAuthenticated()" />
		<c:choose>
		    <c:when test="${loggedIn}">
		        <div class="header">
					<ul class="nav nav-pills pull-right">
						<li class="active"><a href="#"><spring:message code="yours.food.service.ingredients"></spring:message></a></li>
						<li><a href="customer-meals-page"><spring:message code="yours.food.service.meals" text="Meals" /></a></li>
						<li><a href="j_spring_security_logout"><spring:message code="yours.food.service.header.logout" text="Logout" /></a></li>
					</ul>
					<h3 class="text-muted">Yours.ge</h3>
				</div>
				<div class="logo-image-narrow"></div>
				<div class="row">
					<div class="col-lg-12">
						<div class="jumbotron">
							<h1><spring:message code="" text="Error on Page" /></h1>
							<p><spring:message code="" text="Sorry Error on Page has occured. Please try again or use navigation to go to other page"/></p>
						</div>
					</div>
				</div>
		    </c:when>
		    <c:otherwise>
		        <div class="header">
					<h3 class="text-muted">Yours.ge</h3>
				</div>
				<div class="logo-image-narrow"></div>
				<div class="row">
					<div class="col-lg-12">
						<div class="jumbotron">
							<h1><spring:message code="" text="Error on Page" /></h1>
							<p><spring:message code="" text="Sorry Error on Page has occured. Please try again"/></p>
							<spring:message code="yours.food.service.signin.question.title" text="Not Signed in?" /> <a href="${contextPath }/signin"><spring:message code="yours.food.service.signin.title" text="Sign in"/></a>
						</div>
					</div>
				</div>
		    </c:otherwise>
		</c:choose>
	</div>
</body>
</html>