<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
<link href="resources/css/jumbotron-narrow.css" rel="stylesheet" />
<link href="resources/css/alertify.core.css" rel="stylesheet" />
<link href="resources/css/alertify.default.css" rel="stylesheet" />
<link href="resources/css/alertify.bootstrap.css" rel="stylesheet" />

<script src="resources/js/jquery-2.0.3.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/alertify.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	      <script src="resources/assets/js/html5shiv.js"></script>
	      <script src="resources/assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<div class="container">
		<jsp:include page="include/header.jsp">
			<jsp:param name="pageName" value="customer-info"/>
		</jsp:include>
		<div class="row">
			<div class="logo-image-narrow"></div>
		</div>
		<div class="row margin-top-15px">
			<div class="col-lg-12">
				<code><spring:message code="yours.food.service.customer.info.customer.firstname" text="First Name" />:</code> ${customer.firstname }
			</div>
		</div>
		<div class="row margin-top-15px">
			<div class="col-lg-12">
				<code><spring:message code="yours.food.service.customer.info.customer.lastname" text="Last Name" />:</code> ${customer.lastname }
			</div>
		</div>
		<div class="row margin-top-15px">
			<div class="col-lg-12">
				<code><spring:message code="yours.food.service.customer.info.customer.username" text="Username" />:</code> ${customer.username }
			</div>
		</div>
		<div class="row margin-top-15px">
			<div class="col-lg-12">
				<code><spring:message code="yours.food.service.customer.info.customer.birthday" text="Birthday" />:</code> <fmt:formatDate pattern="dd-MM-yyyy"  value="${customer.birthday }" />
			</div>
		</div>
		<div class="row margin-top-20px">
			<div class="col-lg-7">
				<label for="customerPhoneNumbersSelect"><spring:message code="yours.food.service.customer.info.addres.select.title" text="Customer Addresses"/></label>
			</div>
			<div class="col-lg-6">
				<select id="customerAddressesSelect" class="form-control">
					<c:forEach items="${customer.addresses }" var="address">
						<option value="${address.id }">${address.address }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-lg-2">
				<button id="customerAddressRemoveButton" type="button" class="btn btn-danger"><spring:message text="Remove" code="yours.food.service.customer.info.remove.button.title"/></button>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-7">
				<label for="customerAddressesSelect"><spring:message code="yours.food.service.customer.info.phone.numbers.select.title" text="Phone Numbers"/></label>
			</div>
			<div class="col-lg-6">
				<select id="customerPhoneNumbersSelect" class="form-control">
					<c:forEach items="${customer.phoneNumbers }" var="phoneNumber">
						<option value="${phoneNumber.id }">${phoneNumber.phoneNumber }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-lg-2">
				<button id="customerPhoneRemoveButton" type="button" class="btn btn-danger"><spring:message text="Remove" code="yours.food.service.customer.info.remove.button.title"/></button>
			</div>
		</div>
		<div class="row marketing">
	        <div class="col-lg-12">
	          
	      	</div>
	
	      <div class="footer">
	       	<div class="pull-left">&copy; Yours.ge</div>
	        <div class="pull-right">&copy; Created by GNG Apps</div>
	      </div>
		</div>
	</div>
	<script>
		$('#customerAddressRemoveButton').click(function() {
			var url = 'remove-customer-address';
			if($('#customerAddressesSelect').val() == '' || $('#customerAddressesSelect').val() == null) {
				return;	
			}
			$.ajax({
				url : url,
				data : {
					customerAddressId : $('#customerAddressesSelect').val()
				}
			}).done(function() {
				$("#customerAddressesSelect option[value=" + $('#customerAddressesSelect').val() + "]").remove();
				alertify.success('<spring:message code="yours.food.service.customer.info.alertify.message.address.removed" text="Address Successfully Removed" />');
			});
		});
		$('#customerPhoneRemoveButton').click(function() {
			if($('#customerPhoneNumbersSelect').val() == '' || $('#customerPhoneNumbersSelect').val() == null) {
				return;	
			}
			var url = 'remove-customer-phone';
			$.ajax({
				url : url,
				data : {
					customerPhoneId: $('#customerPhoneNumbersSelect').val()
				}
			}).done(function() {
				$("#customerPhoneNumbersSelect option[value=" + $('#customerPhoneNumbersSelect').val() + "]").remove();
				alertify.success('<spring:message code="yours.food.service.customer.info.alertify.message.phone.number.removed" text="Phone Number Successfully Removed" />');
			});
		});
	</script>
</body>
</html>