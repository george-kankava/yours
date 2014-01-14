<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="shortcut icon" href="../resources/ico/yours-sml-logo.gif" />

<title>
	<spring:message code="yours.food.service.active.orders.title" text="Active Orders" />
</title>

<!-- Bootstrap core CSS -->
<link href="../resources/css/bootstrap.css" rel="stylesheet" />
<link href="../resources/css/alertify.core.css" rel="stylesheet" />
<link href="../resources/css/alertify.default.css" rel="stylesheet" />
<link href="../resources/css/alertify.bootstrap.css" rel="stylesheet" />


<!-- Custom styles for this template -->
<link href="../resources/css/yours-food-service.css" rel="stylesheet" />
<link href="../resources/css/jumbotron-narrow.css" rel="stylesheet" />

<script src="../resources/js/jquery-2.0.3.min.js"></script>
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/alertify.min.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
	      <script src="resources/assets/js/html5shiv.js"></script>
	      <script src="resources/assets/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
	<div class="container">
		<div class="header">
			<ul class="nav nav-pills pull-right">
				<li class="active"><a href="#"><spring:message code="yours.food.service.active.orders.title"></spring:message></a></li>
				<li><a href="../j_spring_security_logout"><spring:message code="yours.food.service.header.logout"></spring:message></a></li>
			</ul>
			<h3 class="text-muted">Yours.ge</h3>
			<span><a href="?language=ka"><img src="${contextPath }/resources/ico/georgia_flag_32.png"></a></span>
			<span><a href="?language=en"><img src="${contextPath }/resources/ico/usa_flag_32.png"></a></span>
			<span><a href="?language=ru"><img src="${contextPath }/resources/ico/russia_flag_32.png"></a></span>
		</div>
		<div class="logo-image-narrow"></div>
		<div id="customerOrdersList">
			<div class="row">
				<c:forEach items="${customerOrders }" var="customerOrder">
					<div class="col-md-12"> 
						<div id="customerOrdersListItem${customerOrder.id }" class="alert alert-success">
							#${customerOrder.id } - ${customerOrder.customer.username } - <fmt:formatDate type="time" value="${customerOrder.date}" /> - ${customerOrder.shipmentAddress } - ${customerOrder.phoneNumber } <a data-toggle="modal" data-target="#customerOrderModal${customerOrder.id}" href="#"><spring:message code="yours.food.service.view.order"></spring:message></a>  
						</div>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="customerOrderModal${customerOrder.id}" tabindex="-1" role="dialog" aria-labelledby="customerOrderModalLabel${customerOrder.id}" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="customerOrderModalLabel${customerOrder.id}"><spring:message code="yours.food.service.order.ingredients" /></h4>
								</div>
								<div class="modal-body">
									<c:forEach items="${customerOrder.customerSandwichs }" var="customerSandwich">
											<div class="row">
												<div class="col-lg-12">
													<p class="lead"><spring:message code="yours.food.service.ingredients.sandwich"></spring:message> - ${customerSandwich.id }</p>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-7">
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															${customerSandwich.sandwichBread.nameGeo }
														</c:when>
														<c:when test="${locale eq 'en' }">
															${customerSandwich.sandwichBread.nameEng }
														</c:when>
														<c:when test="${locale eq 'ru' }">
															${customerSandwich.sandwichBread.nameRus }
														</c:when>
													</c:choose>
												</div>
												<div class="col-lg-5">
													${customerSandwich.sandwichBreadSizeAndPrice.size }
												</div>
											</div>
											<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausageWithAmountAndPrice">
												<div class="row">
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<div class="col-lg-7"> ${sandwichSausageWithAmountAndPrice.sandwichSausage.nameGeo }</div>
														</c:when>
														<c:when test="${locale eq 'en' }">
															<div class="col-lg-7"> ${sandwichSausageWithAmountAndPrice.sandwichSausage.nameEng }</div>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<div class="col-lg-7"> ${sandwichSausageWithAmountAndPrice.sandwichSausage.nameRus }</div>
														</c:when>
													</c:choose>
													<div class="col-lg-5"> ${sandwichSausageWithAmountAndPrice.amountAndPrice.portion }</div>
												</div>
											</c:forEach>
											<c:forEach items="${customerSandwich.sandwichVegetables }" var="sandwichVegetableWithAmountAndPrice">
												<div class="row">
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<div class="col-lg-7"> ${sandwichVegetableWithAmountAndPrice.sandwichVegetable.nameGeo }</div>
														</c:when>
														<c:when test="${locale eq 'en' }">
															<div class="col-lg-7"> ${sandwichVegetableWithAmountAndPrice.sandwichVegetable.nameEng }</div>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<div class="col-lg-7"> ${sandwichVegetableWithAmountAndPrice.sandwichVegetable.nameRus }</div>
														</c:when>
													</c:choose>
													<div class="col-lg-5"> ${sandwichVegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.portion }</div>
												</div>
											</c:forEach>
											<c:forEach items="${customerSandwich.sandwichSauces }" var="sandwichSauceWithAmountAndPrice">
												<div class="row">
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<div class="col-lg-7"> ${sandwichSauceWithAmountAndPrice.sandwichSauce.nameGeo }</div>
														</c:when>
														<c:when test="${locale eq 'en' }">
															<div class="col-lg-7"> ${sandwichSauceWithAmountAndPrice.sandwichSauce.nameEng }</div>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<div class="col-lg-7"> ${sandwichSauceWithAmountAndPrice.sandwichSauce.nameRus }</div>
														</c:when>
													</c:choose>
													<div class="col-lg-5"> ${sandwichSauceWithAmountAndPrice.sandwichSauceAmountAndPrice.portion }</div>
												</div>
											</c:forEach>
											<c:forEach items="${customerSandwich.sandwichSpices }" var="sandwichSpicesWithAmountAndPrice">
												<div class="row">
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<div class="col-lg-7"> ${sandwichSpicesWithAmountAndPrice.sandwichSpice.nameGeo }</div>
														</c:when>
														<c:when test="${locale eq 'en' }">
															<div class="col-lg-7"> ${sandwichSpicesWithAmountAndPrice.sandwichSpice.nameEng }</div>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<div class="col-lg-7"> ${sandwichSpicesWithAmountAndPrice.sandwichSpice.nameRus }</div>
														</c:when>
													</c:choose>
													<div class="col-lg-5"> ${sandwichSpicesWithAmountAndPrice.sandwichSpiceAmountAndPrice.portion }</div>
												</div>
											</c:forEach>
									</c:forEach>
									<c:forEach items="${customerOrder.customerSalads }" var="customerSalad">
										<div class="row">
											<div class="col-lg-12">
												<p class="lead"><spring:message code="yours.list.heading.salad"></spring:message> - ${customerSalad.id }</p>
											</div>
										</div>
										<c:forEach items="${customerSalad.ingredientWithAmountAndPrices }" var="ingredientWithAmountAndPrice">
											<div class="row">
												<div class="col-lg-7">
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															${ingredientWithAmountAndPrice.saladIngredient.nameGeo }
														</c:when>
														<c:when test="${locale eq 'en' }">
															${ingredientWithAmountAndPrice.saladIngredient.nameEng }
														</c:when>
														<c:when test="${locale eq 'ru' }">
															${ingredientWithAmountAndPrice.saladIngredient.nameRus }
														</c:when>
													</c:choose>
												</div>
												<div class="col-lg-5">
													${ingredientWithAmountAndPrice.amountAndPrice.amount }
												</div>
											</div>
										</c:forEach>
									</c:forEach>
									<c:forEach items="${customerOrder.customerDrinks }" var="customerDrink">
										<div class="row">
											<div class="col-lg-12">
												<p class="lead">Drinks - ${customerDrink.id } <span class="glyphicon glyphicon-glass"></span></p>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-7">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														${customerDrink.drinkWithSizeAndPrice.drink.nameGeo }
													</c:when>
													<c:when test="${locale eq 'en' }">
														${customerDrink.drinkWithSizeAndPrice.drink.nameEng }
													</c:when>
													<c:when test="${locale eq 'ru' }">
														${customerDrink.drinkWithSizeAndPrice.drink.nameRus }
													</c:when>
												</c:choose>
											</div>
											<div class="col-lg-5">
												${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.size }
											</div>
										</div>
										<code>add-ons</code>
										<c:forEach items="${customerDrink.addonWithAmountAndPrices }" var="addonWithAmountAndPrice">
											<div class="row">
												<div class="col-lg-7">
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															${addonWithAmountAndPrice.drinkAddOn.nameGeo }
														</c:when>
														<c:when test="${locale eq 'en' }">
															${addonWithAmountAndPrice.drinkAddOn.nameEng }
														</c:when>
														<c:when test="${locale eq 'ru' }">
															${addonWithAmountAndPrice.drinkAddOn.nameRus }
														</c:when>
													</c:choose>
												</div>
												<div class="col-lg-5">
													${addonWithAmountAndPrice.addOnAmountAndPrice.amount }
												</div>
											</div>
										</c:forEach>
									</c:forEach>
									<c:forEach items="${customerOrder.customerHotdogs }" var="customerHotdog">
										<div class="row">
											<div class="col-lg-12">
												<p class="lead">Hotdog - ${customerHotdog.id }</p>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-7">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														${customerHotdog.bread.nameGeo }
													</c:when>
													<c:when test="${locale eq 'en' }">
														${customerHotdog.bread.nameEng }
													</c:when>
													<c:when test="${locale eq 'ru' }">
														${customerHotdog.bread.nameRus }
													</c:when>
												</c:choose>
											</div>
											<div class="col-lg-5">
												${customerHotdog.sizeAndPrice.size }
											</div>
										</div>
										<div class="row">
											<div class="col-lg-7">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														${customerHotdog.sausage.nameGeo }
													</c:when>
													<c:when test="${locale eq 'en' }">
														${customerHotdog.sausage.nameEng }
													</c:when>
													<c:when test="${locale eq 'ru' }">
														${customerHotdog.sausage.nameRus }
													</c:when>
												</c:choose>
											</div>
											<div class="col-lg-5">
												${customerHotdog.amountAndPrice.portion }
											</div>
										</div>
										<c:forEach items="${customerHotdog.amountAndPrices }" var="hotDogSauceWithAmountAndPrice">
											<div class="row">
												<div class="col-lg-7">
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															${hotDogSauceWithAmountAndPrice.sauce.nameGeo }
														</c:when>
														<c:when test="${locale eq 'en' }">
															${hotDogSauceWithAmountAndPrice.sauce.nameEng }
														</c:when>
														<c:when test="${locale eq 'ru' }">
															${hotDogSauceWithAmountAndPrice.sauce.nameRus }
														</c:when>
													</c:choose>
												</div>
												<div class="col-lg-5">
													${hotDogSauceWithAmountAndPrice.amountAndPrice.amount }
												</div>
											</div>
										</c:forEach>
									</c:forEach>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
									<button id="orederDeliveredButton${customerOrder.id }" type="button" class="btn btn-primary"><spring:message code="yours.food.service.operator.customer.order.delivered.button" text="Delivered"/></button>
									<script>
										$('#orederDeliveredButton${customerOrder.id }').click(function() {
											alertify.confirm('<spring:message code="yours.food.service.are.you.sure.message" />', function (e) {
												if (e) {											
													var url = 'customer-order-delivered';
													$.ajax({
														url: url,
													data: {
														customerOrderId: '${customerOrder.id }'
														}
													}).done(function() {
														$('#customerOrdersListItem${customerOrder.id }').remove();
														$('#customerOrderModal${customerOrder.id }').modal('hide');
													});
												}
											});
										});
									</script>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</c:forEach>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<ul class="pagination">
						<c:choose>
							<c:when test="${startIndex ge paginationPagesAmount  }">
								<li><a id="customerOrdersPaginationPrevious" href="#">&laquo;</a></li>
								<script>
									$('#customerOrdersPaginationPrevious').click(function() {
										$.get( "operator-customer-order-pagination.ajax", { pageNumber: '${startIndex - 1}'} )
										.done(function(result) {
											$('#customerOrdersList').empty();
											$('#customerOrdersList').append(result);
										});
									});
								</script>
							</c:when>
							<c:otherwise>
								<li class="disabled"><a href="#">&laquo;</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${startIndex }" end="${endIndex - 1}" varStatus="loop">
							<c:choose>
								<c:when test="${pageNumber eq loop.index }">
									<li class="active"><a id="customerOrdersPagination${loop.index }" href="#">${loop.index }</a></li>
								</c:when>
								<c:otherwise>
									<li><a id="customerOrdersPagination${loop.index }" href="#">${loop.index }</a></li>
								</c:otherwise> 
							</c:choose>
							<script>
								$('#customerOrdersPagination${loop.index}').click(function() {
									$.get( "operator-customer-order-pagination.ajax", { pageNumber: '${loop.index}'} )
									.done(function(result) {
										$('#customerOrdersList').empty();
										$('#customerOrdersList').append(result);
									});	
								});
							</script>	
						</c:forEach>
						<c:choose>
							<c:when test="${lastPage}">
								<c:choose>
									<c:when test="${pageNumber eq endIndex }">
										<li class="active"><a id="customerOrdersPagination${endIndex }" href="#">${endIndex }</a></li>
										<li class="disabled"><a href="#">&raquo;</a></li>
										<script>
											$('#customerOrdersPagination${endIndex }').click(function() {
												$.get( "operator-customer-order-pagination.ajax", { pageNumber: '${endIndex}'} )
												.done(function(result) {
													$('#customerOrdersList').empty();
													$('#customerOrdersList').append(result);
												});	
											});
										</script>
									</c:when>
									<c:otherwise>
										<li><a id="customerOrdersPagination${endIndex }" href="#">${endIndex }</a></li>
										<li class="disabled" ><a href="#">&raquo;</a></li>
										<script>
											$('#customerOrdersPagination${endIndex }').click(function() {
												$.get( "operator-customer-order-pagination.ajax", { pageNumber: '${endIndex}'} )
												.done(function(result) {
													$('#customerOrdersList').empty();
													$('#customerOrdersList').append(result);
												});	
											});
										</script>						
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<li><a id="customerOrdersPaginationNext" href="#">&raquo;</a></li>		
								<script>
									$('#customerOrdersPaginationNext').click(function() {
										$.get( "operator-customer-order-pagination.ajax", { pageNumber: '${endIndex}'} )
										.done(function(result) {
											$('#customerOrdersList').empty();
											$('#customerOrdersList').append(result);
										});
									});
								</script>		
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
			<script>
				$('#customerOrdersPagination${endIndex }').click(function() {
					$.get( "operator-customer-order-pagination.ajax", { pageNumber: '${endIndex }'} )
					.done(function(result) {
						$('#customerOrdersList').empty();
						$('#customerOrdersList').append(result);
					});	
				});
			</script>
		</div>
	</div>
</body>
</html>