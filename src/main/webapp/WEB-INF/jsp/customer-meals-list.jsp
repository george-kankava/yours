<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="Food Service" />
<meta name="author" content="GNG Apps" />
<link rel="shortcut icon" href="resources/ico/yours-sml-logo.gif" />

<title><spring:message code="yours.food.service.meals" text="Meals" /></title>
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
	<script>
		var foodAndDrinkInCartIds = new Object();
		foodAndDrinkInCartIds.sandwichIds = new Array();
		foodAndDrinkInCartIds.saladIds = new Array();
		foodAndDrinkInCartIds.drinkIds = new Array();
		foodAndDrinkInCartIds.hotdogIds = new Array();
	</script>
	<div class="container">
		<jsp:include page="include/header.jsp">
			<jsp:param name="pageName" value="meals-list"/>
		</jsp:include>
		<div class="modal fade" id="foodPurchaseModal" tabindex="-1" role="dialog" aria-labelledby="foodPurchaseModalTitle" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="foodPurchaseModalTitle"><spring:message code="yours.food.service.meals.list.order.modal.buy" text="Buy"/></h4>
					</div>
					<div class="modal-body">
						<div class="logo-image-small"></div>
						<div class="radio">
							<p class="lead"> 
								<spring:message code="yours.food.service.meals.list.order.modal.phone.number.title" text="Please Enter or Choose Phone Number" />
							</p>
							<div class="row">
								<div class="col-md-8">
								<label>
									<input id="customerTelephoneInputRadio" type="radio" name="customerTelephoneNumber">
									<input id="customerTelephoneInput" type="text" class="form-control" disabled>
								</label>
								</div>
							</div>
						</div>
						<div class="radio">
							<div class="row">
								<div class="col-md-8">
									<label>
										<input id="customerTelephoneSelectRadio" type="radio" name="customerTelephoneNumber" checked>
										<select id="customerTelephoneSelect" class="form-control">
											<c:forEach items="${customer.phoneNumbers }" var="phoneNumber">
												<option value="${phoneNumber.phoneNumber }">${phoneNumber.phoneNumber }</option>
											</c:forEach>
										</select>
									</label>
								</div>
							</div>
						</div>
						<div class="radio">
							<p class="lead"> 
								<spring:message code="yours.food.service.meals.list.order.modal.shipment.address.title" text="Please Enter or Choose Shipment Address" />
							</p>
							<div class="row">
								<div class="col-md-8">
								<label>
									<input id="customerShipmentInputRadio" type="radio" name="customerShipmentAddress">
									<input id="customerShipmentInput" type="text" class="form-control" disabled>
								</label>
								</div>
							</div>
						</div>
						<div class="radio">
							<div class="row">
								<div class="col-md-8">
									<label>
										<input id="customerShipmentSelectRadio" type="radio" name="customerShipmentAddress" checked>
										<select id="customerShipmentSelect" class="form-control">
											<c:forEach items="${customer.addresses }" var="address">
												<option value="${address.address }">${address.address }</option>
											</c:forEach>
										</select>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.meals.list.order.modal.cancel" text="Cancel" /></button>
						<button id="mealsOrderButton" type="button" class="btn btn-primary">
							<spring:message text="Buy" code="yours.food.service.meals.list.order.modal.buy" /> <span class="glyphicon glyphicon-shopping-cart"></span>
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<div class="row">
			<!-- Modal -->
			<!-- /.modal -->
			<div class="col-lg-9">
			<div class="logo-image-narrow"></div>
			</div>
			<div class="col-lg-3">
			<div class="btn-group">
				<!-- Button trigger modal -->
				<button class="btn btn-primary" data-toggle="modal" data-target="#foodPurchaseModal">
	  				<spring:message code="yours.food.service.meals.list.buy.button.title" text="" /> <span class="glyphicon glyphicon-shopping-cart"></span>
				</button>
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					<span class="caret"></span> <span class="sr-only"></span>
				</button>
				<ul id="customerOrdersList" class="dropdown-menu" role="menu">
					<c:forEach items="${customerSessionSandwiches }" var="customerSandwich">
						<li id="orderListSandwichItem${customerSandwich.id}">
							<span style="margin-left:10px">
								<spring:message code="yours.food.service.meals.list.sandwich" text="Sandwich" /> - ${customerSandwich.id}
							</span>
						</li>
						<li id="orderListSandwichItemDivider${customerSandwich.id}" class="divider">
					</c:forEach>
					<c:forEach items="${customerSessionSalads }" var="customerSalad">
						<li id="orderListSaladItem${customerSalad.id}">
							<span style="margin-left:10px">
								<spring:message code="yours.food.service.meals.list.salad" text="Salad" /> - ${customerSalad.id}
							</span>
						</li>
						<li id="orderListSaladItemDivider${customerSalad.id}" class="divider">
					</c:forEach>
					<c:forEach items="${customerSessionDrinks }" var="customerDrink">
						<li id="orderListDrinkItem${customerDrink.id}">
							<span style="margin-left:10px">
								<spring:message code="yours.food.service.meals.list.drink" text="Drink" /> - ${customerDrink.id}
							</span>
						</li>
						<li id="orderListDrinkItemDivider${customerDrink.id}" class="divider">
					</c:forEach>
					<c:forEach items="${customerSessionHotdogs }" var="customerHotdog">
						<li id="orderListHotdogItem${customerHotdog.id}">
							<span style="margin-left:10px">
								<spring:message code="yours.food.service.meals.list.hotdog" text="Hotdog" /> - ${customerHotdog.id}
							</span>
						</li>
						<li id="orderListHotdogItemDivider${customerHotdog.id}" class="divider">
					</c:forEach>
					<li id="total-price">
						<code>
							<span class="margin-left-10px"><spring:message code="yours.food.service.total" text="Total Price" />: </span>
							<c:choose>
								<c:when test="${!empty customerOrdersTotalPrice }">
									<span id="total-price-value">${customerOrdersTotalPrice }</span>								
								</c:when>
								<c:otherwise>
									<span id="total-price-value">0.00</span>
								</c:otherwise>
							</c:choose>
							<span><spring:message code="yours.food.service.currency.gel" /></span>
						</code>
					</li>
				</ul>
			</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel-group" id="accordion">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
									<spring:message code="yours.food.service.meals.list.sandwiches.title" text="Sandwiches" />
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['sandwiches']}" var="customerSandwich">
									<c:set var="sandwichTotalPrice" value="0"/>
									<div class="alert alert-success" id="sandwichTitle${customerSandwich.id}">
										<spring:message text="Sandwich" code="yours.food.service.meals.list.sandwich" /> - ${customerSandwich.id}
										<span style="margin-left: 10px"></span>
										<c:set var="isCustomerSandwichInCart" value="false" />
										<c:forEach items="${customerSessionSandwiches }" var="inCartCustomerSandwich">
											<c:if test="${customerSandwich.id eq inCartCustomerSandwich.id}">
												<c:set var="isCustomerSandwichInCart" value="true" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${isCustomerSandwichInCart }">
												<button style="margin-left: 5px" id="sandwichOrderButtion${customerSandwich.id }" type="button" class="btn btn-warning active" data-toggle="button">
													<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
												</button>
											</c:when>
											<c:otherwise>
												<button style="margin-left: 5px" id="sandwichOrderButtion${customerSandwich.id }" type="button" class="btn btn-warning" data-toggle="button">
													<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
												</button>
											</c:otherwise>
										</c:choose>
										<div class="pull-right">
											<button id="sandwichRemoveButtion${customerSandwich.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<table id="sandwichBread${customerSandwich.id}" class="table">
										<thead>
											<tr>
												<th></th>
												<th><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
												<th></th>
												<th><spring:message code="yours.food.ingredients.size" text="Size" /></th>
											<tr>
										</thead>
										<tbody>
										<tr>
											<td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<button id="sandwichBreadPopover${customerSandwich.sandwichBread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerSandwich.sandwichBread.descriptionGeo }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
													    </button>										
													</c:when>
													<c:when test="${locale eq 'en' }">
														<button id="sandwichBreadPopover${customerSandwich.sandwichBread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerSandwich.sandwichBread.descriptionEng }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
											    		</button>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<button id="sandwichBreadPopover${customerSandwich.sandwichBread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerSandwich.sandwichBread.descriptionRus }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
											    		</button>
													</c:when>
												</c:choose>
											</td>
											<c:choose>
												<c:when test="${locale eq 'ka' }">
													<td class="td-50-percent" >${customerSandwich.sandwichBread.nameGeo }</td>
												</c:when>
												<c:when test="${locale eq 'en' }">
													<td class="td-50-percent" >${customerSandwich.sandwichBread.nameEng }</td>
												</c:when>
												<c:when test="${locale eq 'ru' }">
													<td class="td-50-percent" >${customerSandwich.sandwichBread.nameRus }</td>
												</c:when>
											</c:choose>
											<td>
												<c:choose>
													<c:when test="${customerSandwich.sandwichBread.foodComponentImage ne null }">
														<button id="sandwichBreadImage${customerSandwich.sandwichBread.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${customerSandwich.sandwichBread.foodComponentImage.imageFileName }' />" data-original-title="" title="">
															<span class="glyphicon glyphicon-film"></span>
											    		</button>	
													</c:when>
													<c:otherwise>
														<button id="sandwichBreadImage${customerSandwich.sandwichBread.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
															<span class="glyphicon glyphicon-film"></span>
											    		</button>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="td-50-percent">${customerSandwich.sandwichBreadSizeAndPrice.size }</td>
											<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + customerSandwich.sandwichBreadSizeAndPrice.price}"/>
										</tr>
										</tbody>
									</table>
									<script>
										$('#sandwichBreadImage${customerSandwich.sandwichBread.id }').popover();
										$('#sandwichBreadPopover${customerSandwich.sandwichBread.id}').popover();
									</script>
									<table id="sandwichSausage${customerSandwich.id}" class="table">
										<thead>
											<tr>
												<th></th>
												<th><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
												<th></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausage">
											<tr>
												<td>
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<button id="sandwichSausagePopover${sandwichSausage.sandwichSausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSausage.sandwichSausage.descriptionGeo }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
														    </button>										
														</c:when>
														<c:when test="${locale eq 'en' }">
															<button id="sandwichSausagePopover${sandwichSausage.sandwichSausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSausage.sandwichSausage.descriptionEng }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<button id="sandwichSausagePopover${sandwichSausage.sandwichSausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sandwichSausage.sandwichSausage.descriptionRus }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
													</c:choose>
												</td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent">${sandwichSausage.sandwichSausage.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${sandwichSausage.sandwichSausage.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td class="td-50-percent">${sandwichSausage.sandwichSausage.nameRus }</td>
													</c:when>
												</c:choose>
												<td>
													<c:choose>
														<c:when test="${sandwichSausage.sandwichSausage.foodComponentImage ne null }">
															<button id="sandwichSausageImage${sandwichSausage.sandwichSausage.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${sandwichSausage.sandwichSausage.foodComponentImage.imageFileName }' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>	
														</c:when>
														<c:otherwise>
															<button id="sandwichSausageImage${sandwichSausage.sandwichSausage.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="td-50-percent">${sandwichSausage.amountAndPrice.portion }</td>
												<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + sandwichSausage.amountAndPrice.price}"/>
											</tr>
											<script>
												$('#sandwichSausageImage${sandwichSausage.sandwichSausage.id }').popover();
												$('#sandwichSausagePopover${sandwichSausage.sandwichSausage.id}').popover();
											</script>
										</c:forEach>
									</table>
									<table id="sandwichVegetable${customerSandwich.id}" class="table">
										<thead>
											<tr>
												<th></th>
												<th><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables" /></th>
												<th></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerSandwich.sandwichVegetables }" var="vegetableWithAmountAndPrice">
											<tr>
												<td>
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<button id="sandwichVegetablePopover${vegetableWithAmountAndPrice.sandwichVegetable.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${vegetableWithAmountAndPrice.sandwichVegetable.descriptionGeo }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
														    </button>										
														</c:when>
														<c:when test="${locale eq 'en' }">
															<button id="sandwichVegetablePopover${vegetableWithAmountAndPrice.sandwichVegetable.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${vegetableWithAmountAndPrice.sandwichVegetable.descriptionEng }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<button id="sandwichVegetablePopover${vegetableWithAmountAndPrice.sandwichVegetable.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${vegetableWithAmountAndPrice.sandwichVegetable.descriptionRus }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
													</c:choose>
												</td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent" >${vegetableWithAmountAndPrice.sandwichVegetable.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${vegetableWithAmountAndPrice.sandwichVegetable.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td class="td-50-percent" >${vegetableWithAmountAndPrice.sandwichVegetable.nameRus }</td>
													</c:when>
												</c:choose>
												<td>
													<c:choose>
														<c:when test="${vegetableWithAmountAndPrice.sandwichVegetable.foodComponentImage ne null }">
															<button id="sandwichVegetableImage${vegetableWithAmountAndPrice.sandwichVegetable.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${vegetableWithAmountAndPrice.sandwichVegetable.foodComponentImage.imageFileName }' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>	
														</c:when>
														<c:otherwise>
															<button id="sandwichVegetableImage${vegetableWithAmountAndPrice.sandwichVegetable.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="td-50-percent">${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.portion }</td>
												<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.price}"/>
											</tr>
											<script>
								    			$('#sandwichVegetableImage${vegetableWithAmountAndPrice.sandwichVegetable.id }').popover();
								    			$('#sandwichVegetablePopover${vegetableWithAmountAndPrice.sandwichVegetable.id}').popover();
								    		</script>
										</c:forEach>
									</table>
									<table id="sandwichSauce${customerSandwich.id}" class="table">
										<tr>
											<th></th>
											<th><spring:message code="yours.food.ingredient.sauce" text="Sauce" /></th>
											<th></th>
											<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										</tr>
										<c:forEach items="${customerSandwich.sandwichSauces }" var="sauceWithAmountAndPrice">
											<tr>
												<td>
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<button id="sandwichSaucePopover${sauceWithAmountAndPrice.sandwichSauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sauceWithAmountAndPrice.sandwichSauce.descriptionGeo }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
														    </button>										
														</c:when>
														<c:when test="${locale eq 'en' }">
															<button id="sandwichSaucePopover${sauceWithAmountAndPrice.sandwichSauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sauceWithAmountAndPrice.sandwichSauce.descriptionEng }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<button id="sandwichSaucePopover${sauceWithAmountAndPrice.sandwichSauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sauceWithAmountAndPrice.sandwichSauce.descriptionRus }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
													</c:choose>
												</td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sandwichSauce.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sandwichSauce.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sandwichSauce.nameRus }</td>
													</c:when>
												</c:choose>
												<td>
													<c:choose>
														<c:when test="${sauceWithAmountAndPrice.sandwichSauce.foodComponentImage ne null }">
															<button id="sandwichSauceImage${sauceWithAmountAndPrice.sandwichSauce.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${sauceWithAmountAndPrice.sandwichSauce.foodComponentImage.imageFileName }' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>	
														</c:when>
														<c:otherwise>
															<button id="sandwichSauceImage${sauceWithAmountAndPrice.sandwichSauce.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>
														</c:otherwise>
													</c:choose>
									    		</td>
												<td class="td-50-percent">${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.portion }</td>
												<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.price}"/>
											</tr>
											<script>
												$('#sandwichSaucePopover${sauceWithAmountAndPrice.sandwichSauce.id}').popover();
												$('#sandwichSauceImage${sauceWithAmountAndPrice.sandwichSauce.id }').popover();
											</script>
										</c:forEach>
									</table>
									<table id="sandwichSpice${customerSandwich.id}" class="table">
										<tr>
											<th></th>
											<th><spring:message code="yours.food.ingredient.spice" text="Sauce" /></th>
											<th></th>
											<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										</tr>
										<c:forEach items="${customerSandwich.sandwichSpices }" var="spiceWithAmountAndPrice">
											<tr>
												<td>
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<button id="sandwichSpicePopover${spiceWithAmountAndPrice.sandwichSpice.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${spiceWithAmountAndPrice.sandwichSpice.descriptionGeo }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
														    </button>										
														</c:when>
														<c:when test="${locale eq 'en' }">
															<button id="sandwichSpicePopover${spiceWithAmountAndPrice.sandwichSpice.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${spiceWithAmountAndPrice.sandwichSpice.descriptionEng }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<button id="sandwichSpicePopover${spiceWithAmountAndPrice.sandwichSpice.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${spiceWithAmountAndPrice.sandwichSpice.descriptionRus }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
													</c:choose>
												</td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent">${spiceWithAmountAndPrice.sandwichSpice.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${spiceWithAmountAndPrice.sandwichSpice.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td class="td-50-percent">${spiceWithAmountAndPrice.sandwichSpice.nameRus }</td>
													</c:when>
												</c:choose>
												<td>
													<c:choose>
														<c:when test="${spiceWithAmountAndPrice.sandwichSpice.foodComponentImage ne null }">
															<button id="sandwichSpiceImage${spiceWithAmountAndPrice.sandwichSpice.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${spiceWithAmountAndPrice.sandwichSpice.foodComponentImage.imageFileName }' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>	
														</c:when>
														<c:otherwise>
															<button id="sandwichspiceImage${spiceWithAmountAndPrice.sandwichSpice.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>
														</c:otherwise>
													</c:choose>
									    		</td>
												<td class="td-50-percent">${spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.portion }</td>
												<c:set var="sandwichTotalPrice" value="${sandwichTotalPrice + spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.price}"/>
											</tr>
											<script>
												$('#sandwichSpicePopover${spiceWithAmountAndPrice.sandwichSpice.id}').popover();
												$('#sandwichSpiceImage${spiceWithAmountAndPrice.sandwichSpice.id}').popover();
											</script>
										</c:forEach>
									</table>
									<table class="table">
										<tr>
											<td class="td-50-percent">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
												</c:choose>
											</td>
											<td class="td-50-percent">
												<code>${sandwichTotalPrice } <spring:message code="yours.food.service.currency.gel" /></code>
											</td>
										</tr>
									</table>
									<script type="text/javascript">
										$('#sandwichOrderButtion${customerSandwich.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												var url = "remove-customer-sandwich-from-session";
												$.ajax({
													url: url,
													data: {
														sandwichId: '${customerSandwich.id}',
													}
												}).done(function(responseJson) {
													$('#orderListSandwichItemDivider${customerSandwich.id}').remove();
													$('#orderListSandwichItem${customerSandwich.id}').remove();
													var elementIndex = foodAndDrinkInCartIds.sandwichIds.indexOf('${customerSandwich.id}');
													foodAndDrinkInCartIds.sandwichIds.splice(elementIndex, 1);
													var totalPriceValue = parseFloat($('#total-price-value').text());
													totalPriceValue -= parseFloat('<c:out value="${sandwichTotalPrice }" />');
													$('#total-price-value').text(parseFloat(Math.round(totalPriceValue * 100) / 100).toFixed(2));
												});
											} else {
												var url = "add-customer-sandwich-to-session";
												$.ajax({
													url: url,
													data: {
														sandwichId: '${customerSandwich.id}',
													}
												}).done(function(responseJson) {
													var sandwichName = '<spring:message code="yours.food.service.meals.list.sandwich" text="Sandwich" />';
													$('#customerOrdersList').prepend(
														$('<li id="orderListSandwichItemDivider${customerSandwich.id}">').addClass('divider')		
													).prepend(
														$('<li id="orderListSandwichItem${customerSandwich.id}">').append($('<span>').attr('style', 'margin-left:10px;').text(sandwichName + ' - ${customerSandwich.id}'))
													);
													var totalPriceValue = parseFloat($('#total-price-value').text());
													totalPriceValue += parseFloat('<c:out value="${sandwichTotalPrice }" />');
													$('#total-price-value').text(parseFloat(Math.round(totalPriceValue * 100) / 100).toFixed(2));
													foodAndDrinkInCartIds.sandwichIds.push('${customerSandwich.id}');
												});
											}
										});
										$("#sandwichRemoveButtion${customerSandwich.id}").click(
											function() {
												alertify.confirm('<spring:message code="yours.food.service.meals.list.alertify.remove.sandwich.message" text="Do you really want to remove this sandwich?" />', function(e) {
													if (e) {
														var url = 'remove-customer-sandwich';
														$.ajax({
															url : url,
															data : {
																customerSandwichId : '${customerSandwich.id}'
															}
														}).done(function() {
															$('#sandwichTitle${customerSandwich.id }').remove();
															$('#sandwichBread${customerSandwich.id }').remove();
															$('#sandwichSausage${customerSandwich.id }').remove();
															$('#sandwichVegetable${customerSandwich.id }').remove();
															$('#sandwichSauce${customerSandwich.id }').remove();
															$('#sandwichSpice${customerSandwich.id }').remove();
															alertify.success('<spring:message code="yours.food.service.meals.list.alertify.sandwich.removed.message" text="Sandwich has been removed." />');
														});
													}
												});
											});
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"> <spring:message code="yours.food.service.meals.list.salads.title" text="Salads" /> </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['salads']}" var="customerSalad">
									<div class="alert alert-success" id="saladTitle${customerSalad.id}">
										<spring:message code="yours.food.service.meals.list.salad" text="Salad" /> - ${customerSalad.id}
										<span style="margin-left: 10px"></span>
										<c:set var="isCustomerSaladInCart" value="false" />
										<c:forEach items="${customerSessionSalads }" var="inCartCustomerSalad">
											<c:if test="${customerSalad.id eq inCartCustomerSalad.id}">
												<c:set var="isCustomerSaladInCart" value="true" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${isCustomerSaladInCart }">
												<button id="saladOrderButtion${customerSalad.id }" type="button" class="btn btn-danger active" data-toggle="button">
													<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
												</button>
											</c:when>
											<c:otherwise>
												<button id="saladOrderButtion${customerSalad.id }" type="button" class="btn btn-danger" data-toggle="button">
													<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
												</button>
											</c:otherwise>
										</c:choose>
										<div class="pull-right">
											<button id="saladRemoveButtion${customerSalad.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<c:set var="saladTotalPrice" value="0"/>
									<table id="saladIngredients${customerSalad.id }" class="table">
										<thead>
											<tr>
												<th></th>
												<th><spring:message code="yours.food.service.salad.ingredients" text="Salad Ingredients" /></th>
												<th></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											<tr>
										</thead>
										<c:forEach items="${customerSalad.ingredientWithAmountAndPrices }" var="ingredientsWithAmountAndPrices">
											<tr>
												<td>
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<button id="saladIngredientPopover${ingredientsWithAmountAndPrices.saladIngredient.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${ingredientsWithAmountAndPrices.saladIngredient.descriptionGeo }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
														    </button>										
														</c:when>
														<c:when test="${locale eq 'en' }">
															<button id="saladIngredientPopover${ingredientsWithAmountAndPrices.saladIngredient.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${ingredientsWithAmountAndPrices.saladIngredient.descriptionEng }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<button id="saladIngredientPopover${ingredientsWithAmountAndPrices.saladIngredient.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${ingredientsWithAmountAndPrices.saladIngredient.descriptionRus }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
													</c:choose>
												</td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td>${ingredientsWithAmountAndPrices.saladIngredient.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td>${ingredientsWithAmountAndPrices.saladIngredient.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td>${ingredientsWithAmountAndPrices.saladIngredient.nameRus }</td>
													</c:when>
												</c:choose>
												<td>
													<c:choose>
														<c:when test="${ingredientsWithAmountAndPrices.saladIngredient.foodComponentImage ne null }">
															<button id="saladIngredientImage${ingredientsWithAmountAndPrices.saladIngredient.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${ingredientsWithAmountAndPrices.saladIngredient.foodComponentImage.imageFileName }' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>	
														</c:when>
														<c:otherwise>
															<button id="saladIngredientImage${ingredientsWithAmountAndPrices.saladIngredient.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>
														</c:otherwise>
													</c:choose>
												</td>
												<td>${ingredientsWithAmountAndPrices.amountAndPrice.amount }</td>
												<c:set var="saladTotalPrice" value="${saladTotalPrice + ingredientsWithAmountAndPrices.amountAndPrice.price}"/>
											</tr>
											<script>
												$('#saladIngredientPopover${ingredientsWithAmountAndPrices.saladIngredient.id }').popover();
												$('#saladIngredientImage${ingredientsWithAmountAndPrices.saladIngredient.id }').popover();
											</script>
										</c:forEach>
									</table>
									<table class="table">
										<tr>
											<td class="td-50-percent">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
												</c:choose>
											</td>
											<td class="td-50-percent">
												<code>${saladTotalPrice } <spring:message code="yours.food.service.currency.gel" /></code>
											</td>
										</tr>
									</table>
									<script type="text/javascript">
										$('#saladOrderButtion${customerSalad.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												var url = "remove-customer-salad-from-session";
												$.ajax({
													url: url,
													data: {
														saladId: '${customerSalad.id}',
													}
												}).done(function(responseJson) {
													$('#orderListSaladItemDivider${customerSalad.id}').remove();
													$('#orderListSaladItem${customerSalad.id}').remove();
													var elementIndex = foodAndDrinkInCartIds.saladIds.indexOf('${customerSalad.id}');
													foodAndDrinkInCartIds.saladIds.splice(elementIndex, 1);
													var totalPriceValue = parseFloat($('#total-price-value').text());
													totalPriceValue -= parseFloat('<c:out value="${saladTotalPrice }" />');
													$('#total-price-value').text(parseFloat(Math.round(totalPriceValue * 100) / 100).toFixed(2));
												});
											} else {
												var url = "add-customer-salad-to-session";
												$.ajax({
													url: url,
													data: {
														saladId: '${customerSalad.id}',
													}
												}).done(function(responseJson) {
													var saladName = '<spring:message code="yours.food.service.meals.list.salad" text="Salad" />';
													$('#customerOrdersList').prepend(
														$('<li id="orderListSaladItemDivider${customerSalad.id}">').addClass('divider')		
													).prepend(
														$('<li id="orderListSaladItem${customerSalad.id}">').append($('<span>').attr('style', 'margin-left:10px;').text(saladName + ' - ${customerSalad.id}'))		
													);
													var totalPriceValue = parseFloat($('#total-price-value').text());
													totalPriceValue += parseFloat('<c:out value="${saladTotalPrice }" />');
													$('#total-price-value').text(parseFloat(Math.round(totalPriceValue * 100) / 100).toFixed(2));
													foodAndDrinkInCartIds.saladIds.push('${customerSalad.id }');
												});
											}
										});
										$("#saladRemoveButtion${customerSalad.id}").click(function() {
											alertify.confirm('<spring:message code="yours.food.service.meals.list.alertify.remove.salad.message" text="Do you really want to remove this salad?" />',
											function(e) {
												if (e) {
													var url = 'remove-customer-salad';
													$.ajax({
														url : url,
														data : {
															customerSaladId : '${customerSalad.id}'
														}
														}).done(function() {
															$('#saladTitle${customerSalad.id }').remove();
															$('#saladIngredients${customerSalad.id }').remove();
															alertify.success('<spring:message code="yours.food.service.meals.list.alertify.salad.removed.message" text="Salad has been removed." />');
														});
													}
												});
											});
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"> <spring:message code="yours.food.service.meals.list.drinks.title" text="Drinks" /> </a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['drinks']}" var="customerDrink">
									<div class="alert alert-success" id="drinkTitle${customerDrink.id}">
										<spring:message code="yours.food.service.meals.list.drink" text="Drink" /> - ${customerDrink.id}
										<span style="margin-left: 10px"></span>
										<c:set var="isCustomerDrinkInCart" value="false" />
										<c:forEach items="${customerSessionDrinks }" var="inCartCustomerDrink">
											<c:if test="${customerDrink.id eq inCartCustomerDrink.id}">
												<c:set var="isCustomerDrinkInCart" value="true" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${isCustomerDrinkInCart }">
												<button id="drinkOrderButtion${customerDrink.id }" type="button" class="btn btn-warning active" data-toggle="button">
													<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
												</button>
											</c:when>
											<c:otherwise>
												<button id="drinkOrderButtion${customerDrink.id }" type="button" class="btn btn-warning" data-toggle="button">
													<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
												</button>
											</c:otherwise>
										</c:choose>
										<div class="pull-right">
											<button id="drinkRemoveButtion${customerDrink.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<c:set var="drinkTotalPrice" value="0"/>
									<table id="drink${customerDrink.id}" class="table">
										<thead>
											<tr>
												<th></th>
												<th><spring:message code="yours.food.service.drink.name" text="Drink Name" /></th>
												<th></th>
												<th><spring:message code="yours.food.ingredients.size" text="Size" /></th>
											<tr>
										</thead>
										<tr>
											<td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<button id="drinkPopover${customerDrink.drinkWithSizeAndPrice.drink.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerDrink.drinkWithSizeAndPrice.drink.descriptionGeo }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
													    </button>										
													</c:when>
													<c:when test="${locale eq 'en' }">
														<button id="drinkPopover${drink.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerDrink.drinkWithSizeAndPrice.drink.descriptionEng }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
											    		</button>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<button id="drinkPopover${customerDrink.drinkWithSizeAndPrice.drink.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerDrink.drinkWithSizeAndPrice.drink.descriptionRus }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
											    		</button>
													</c:when>
												</c:choose>
											</td>
											<c:choose>
												<c:when test="${locale eq 'ka' }">
													<td>${customerDrink.drinkWithSizeAndPrice.drink.nameGeo }</td>
												</c:when>
												<c:when test="${locale eq 'en' }">
													<td>${customerDrink.drinkWithSizeAndPrice.drink.nameEng }</td>
												</c:when>
												<c:when test="${locale eq 'ru' }">
													<td>${customerDrink.drinkWithSizeAndPrice.drink.nameRus }</td>
												</c:when>
											</c:choose>
											<td>
												<c:choose>
													<c:when test="${customerDrink.drinkWithSizeAndPrice.drink.foodComponentImage ne null }">
														<button id="drinkImage${customerDrink.drinkWithSizeAndPrice.drink.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${customerDrink.drinkWithSizeAndPrice.drink.foodComponentImage.imageFileName }' />" data-original-title="" title="">
															<span class="glyphicon glyphicon-film"></span>
											    		</button>	
													</c:when>
													<c:otherwise>
														<button id="drinkImage${customerDrink.drinkWithSizeAndPrice.drink.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
															<span class="glyphicon glyphicon-film"></span>
											    		</button>
													</c:otherwise>
												</c:choose>
											</td>
											<td>${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.size }</td>
											<c:set var="drinkTotalPrice" value="${drinkTotalPrice + customerDrink.drinkWithSizeAndPrice.sizeAndPrice.price}"/>
										</tr>
									</table>
									<script>
										$('#drinkPopover${customerDrink.drinkWithSizeAndPrice.drink.id }').popover();	
						    			$('#drinkImage${customerDrink.drinkWithSizeAndPrice.drink.id }').popover();
						    		</script>
									<table id="drinkAddon${customerDrink.id}" class="table">
										<thead>
											<tr>
												<th></th>
												<th><spring:message code="yours.food.service.drink.addon.name" text="Add-on Name" /></th>
												<th></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerDrink.addonWithAmountAndPrices }" var="addonWithAmountAndPrice">
											<tr>
												<td>
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<button id="drinkAddOnPopover${addonWithAmountAndPrice.drinkAddOn.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${addonWithAmountAndPrice.drinkAddOn.descriptionGeo }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
														    </button>										
														</c:when>
														<c:when test="${locale eq 'en' }">
															<button id="drinkAddOnPopover${addonWithAmountAndPrice.drinkAddOn.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${addonWithAmountAndPrice.drinkAddOn.descriptionEng }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<button id="drinkAddOnPopover${addonWithAmountAndPrice.drinkAddOn.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${addonWithAmountAndPrice.drinkAddOn.descriptionRus }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
													</c:choose>
												</td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td>${addonWithAmountAndPrice.drinkAddOn.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td>${addonWithAmountAndPrice.drinkAddOn.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td>${addonWithAmountAndPrice.drinkAddOn.nameRus }</td>
													</c:when>
												</c:choose>
												<td>
													<c:choose>
														<c:when test="${addonWithAmountAndPrice.drinkAddOn.foodComponentImage ne null }">
															<button id="drinkAddOnImage${addonWithAmountAndPrice.drinkAddOn.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${addonWithAmountAndPrice.drinkAddOn.foodComponentImage.imageFileName }' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>	
														</c:when>
														<c:otherwise>
															<button id="drinkAddOnImage${addonWithAmountAndPrice.drinkAddOn.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>
														</c:otherwise>
													</c:choose>
												</td>
												<td>${addonWithAmountAndPrice.addOnAmountAndPrice.amount }</td>
												<c:set var="drinkTotalPrice" value="${drinkTotalPrice + addonWithAmountAndPrice.addOnAmountAndPrice.price}"/>
											</tr>
								    		<script>
								    			$('#drinkAddOnPopover${addonWithAmountAndPrice.drinkAddOn.id }').popover();
								    			$('#drinkAddOnImage${addonWithAmountAndPrice.drinkAddOn.id }').popover();
								    		</script>
										</c:forEach>
									</table>
									<table class="table">
										<tr>
											<td class="td-50-percent">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
												</c:choose>
											</td>
											<td class="td-50-percent">
												<code>${drinkTotalPrice } <spring:message code="yours.food.service.currency.gel" /></code>
											</td>
										</tr>
									</table>
									<script type="text/javascript">
										$('#drinkOrderButtion${customerDrink.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												var url = "remove-customer-drink-from-session";
												$.ajax({
													url: url,
													data: {
														drinkId: '${customerDrink.id}',
													}
												}).done(function(responseJson) {
													$('#orderListDrinkItemDivider${customerDrink.id}').remove();
													$('#orderListDrinkItem${customerDrink.id}').remove();
													var elementIndex = foodAndDrinkInCartIds.drinkIds.indexOf('${customerDrink.id}');
													foodAndDrinkInCartIds.drinkIds.splice(elementIndex, 1);
													var totalPriceValue = parseFloat($('#total-price-value').text());
													totalPriceValue -= parseFloat('<c:out value="${drinkTotalPrice }" />');
													$('#total-price-value').text(parseFloat(Math.round(totalPriceValue * 100) / 100).toFixed(2));
												});
											} else {
												var url = "add-customer-drink-to-session";
												$.ajax({
													url: url,
													data: {
														drinkId: '${customerDrink.id}',
													}
												}).done(function(responseJson) {
													var drinkName = '<spring:message code="yours.food.service.meals.list.drink" text="Drink" />';
													$('#customerOrdersList').prepend(
														$('<li id="orderListDrinkItemDivider${customerDrink.id}">').addClass('divider')		
													).prepend(
														$('<li id="orderListDrinkItem${customerDrink.id}">').append($('<span>').attr('style', 'margin-left:10px;').text(drinkName + ' - ${customerDrink.id}'))		
													);
													var totalPriceValue = parseFloat($('#total-price-value').text());
													totalPriceValue += parseFloat('<c:out value="${drinkTotalPrice }" />');
													$('#total-price-value').text(parseFloat(Math.round(totalPriceValue * 100) / 100).toFixed(2));
													foodAndDrinkInCartIds.drinkIds.push('${customerDrink.id }');
												});
											}
											
										});
											$("#drinkRemoveButtion${customerDrink.id}").click(function() {
												alertify.confirm('<spring:message code="yours.food.service.meals.list.alertify.remove.drink.message" text="Do you really want to remove this drink?" />', function(e) {
													if (e) {
														var url = 'remove-customer-drink';
														$.ajax({
															url : url,
															data : {
																customerDrinkId : '${customerDrink.id}'
															}
														}).done(
															function() {
																$('#drinkTitle${customerDrink.id }').remove();
																$('#drink${customerDrink.id }').remove();
																$('#drinkAddon${customerDrink.id }').remove();
																alertify.success('<spring:message code="yours.food.service.meals.list.alertify.drink.removed.message" text="Drink has been removed." />');
															});
														}
													});
												});
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"> <spring:message code="yours.food.service.meals.list.hotdogs.title" text="Hotdogs" /> </a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse">
							<div class="panel-body">
								<c:forEach items="${meals['hotdogs']}" var="customerHotdog">
									<div class="alert alert-success" id="hotdogTitle${customerHotdog.id}">
										<spring:message code="yours.food.service.meals.list.hotdog" text="Hotdog" /> - ${customerHotdog.id}
										<span style="margin-left: 10px"></span>
										<c:set var="isCustomerHotdogInCart" value="false" />
										<c:forEach items="${customerSessionHotdogs }" var="inCartCustomerHotdog">
											<c:if test="${customerHotdog.id eq inCartCustomerHotdog.id}">
												<c:set var="isCustomerHotdogInCart" value="true" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${isCustomerHotdogInCart }">
												<button id="hotdogOrderButtion${customerHotdog.id }" type="button" class="btn btn-danger active" data-toggle="button">
													<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
												</button>
											</c:when>
											<c:otherwise>
												<button id="hotdogOrderButtion${customerHotdog.id }" type="button" class="btn btn-danger" data-toggle="button">
													<spring:message code="yours.food.service.customer.meals.order" text="Add to Cart" />
												</button>
											</c:otherwise>
										</c:choose>
										<div class="pull-right">
											<button id="hotdogRemoveButtion${customerHotdog.id}" type="button" class="close" aria-hidden="true">&times;</button>
										</div>
									</div>
									<c:set var="hotdogTotalPrice" value="0" />
									<table class="table" id="hotdogBread${customerHotdog.id }">
										<thead>
											<tr>
												<th></th>
												<th><spring:message code="yours.food.service.ingredients.bread" text="Bread" /></th>
												<th></th>
												<th><spring:message code="yours.food.ingredients.size" text="Size" /></th>
											<tr>
										</thead>
										<tr>
											<td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<button id="hotdogBreadPopover${customerHotdog.bread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerHotdog.bread.descriptionGeo }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
													    </button>										
													</c:when>
													<c:when test="${locale eq 'en' }">
														<button id="hotdogBreadPopover${customerHotdog.bread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerHotdog.bread.descriptionEng }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
											    		</button>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<button id="hotdogBreadPopover${customerHotdog.bread.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerHotdog.bread.descriptionRus }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
											    		</button>
													</c:when>
												</c:choose>
											</td>
											<c:choose>
												<c:when test="${locale eq 'ka' }">
													<td class="td-50-percent">${customerHotdog.bread.nameGeo }</td>
												</c:when>
												<c:when test="${locale eq 'en' }">
													<td class="td-50-percent">${customerHotdog.bread.nameEng }</td>
												</c:when>
												<c:when test="${locale eq 'ru' }">
													<td class="td-50-percent">${customerHotdog.bread.nameRus }</td>
												</c:when>
											</c:choose>
											<td>
												<c:choose>
													<c:when test="${customerHotdog.bread.foodComponentImage ne null }">
														<button id="hotdogBreadImage${customerHotdog.bread.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${customerHotdog.bread.foodComponentImage.imageFileName }' />" data-original-title="" title="">
															<span class="glyphicon glyphicon-film"></span>
											    		</button>	
													</c:when>
													<c:otherwise>
														<button id="hotdogBreadImage${customerHotdog.bread.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
															<span class="glyphicon glyphicon-film"></span>
											    		</button>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="td-50-percent">${customerHotdog.sizeAndPrice.size }</td>
											<c:set var="hotdogTotalPrice" value="${hotdogTotalPrice + customerHotdog.sizeAndPrice.price}"></c:set>
										</tr>
							    		<script>
							    			$('#hotdogBreadPopover${customerHotdog.bread.id }').popover();
							    			$('#hotdogBreadImage${customerHotdog.bread.id }').popover();
							    		</script>
									</table>
									<table class="table" id="hotdogSausage${customerHotdog.id }">
										<thead>
											<tr>
												<th></th>
												<th><spring:message code="yours.food.service.ingredients.hotdog.sausage" text="Sausage" /></th>
												<th></th>
												<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
											</tr>
										</thead>
										<tr>
											<td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<button id="hotdogSausagePopover${customerHotdog.sausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerHotdog.sausage.descriptionGeo }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
													    </button>										
													</c:when>
													<c:when test="${locale eq 'en' }">
														<button id="hotdogSausagePopover${customerHotdog.sausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerHotdog.sausage.descriptionEng }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
											    		</button>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<button id="hotdogSausagePopover${customerHotdog.sausage.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${customerHotdog.sausage.descriptionRus }" data-original-title="" title="">
															<span class="glyphicon glyphicon-info-sign"></span>
											    		</button>
													</c:when>
												</c:choose>
											</td>
											<c:choose>
												<c:when test="${locale eq 'ka' }">
													<td class="td-50-percent">${customerHotdog.sausage.nameGeo }</td>
												</c:when>
												<c:when test="${locale eq 'en' }">
													<td class="td-50-percent">${customerHotdog.sausage.nameEng }</td>
												</c:when>
												<c:when test="${locale eq 'ru' }">
													<td class="td-50-percent">${customerHotdog.sausage.nameRus }</td>
												</c:when>
											</c:choose>
											<td>
												<c:choose>
													<c:when test="${customerHotdog.sausage.foodComponentImage ne null }">
														<button id="hotdogSausageImage${customerHotdog.sausage.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${customerHotdog.sausage.foodComponentImage.imageFileName }' />" data-original-title="" title="">
															<span class="glyphicon glyphicon-film"></span>
											    		</button>	
													</c:when>
													<c:otherwise>
														<button id="hotdogSausageImage${customerHotdog.sausage.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
															<span class="glyphicon glyphicon-film"></span>
											    		</button>
													</c:otherwise>
												</c:choose>
											</td>
											<td class="td-50-percent">${customerHotdog.amountAndPrice.portion }</td>
											<c:set var="hotdogTotalPrice" value="${hotdogTotalPrice + customerHotdog.amountAndPrice.price}"></c:set>
										</tr>
							    		<script>
							    			$('#hotdogSausagePopover${customerHotdog.sausage.id }').popover();
							    			$('#hotdogSausageImage${customerHotdog.sausage.id }').popover();
							    		</script>
									</table>
									<table class="table" id="hotdogSauce${customerHotdog.id }">
										<thead>
											<tr>
												<th></th>
												<th><spring:message code="yours.food.service.ingredients.hotdog.sauce" text="Sauce" /></th>
												<th></th>
												<th><spring:message code="yours.food.ingredients.size" text="Size" /></th>
											</tr>
										</thead>
										<c:forEach items="${customerHotdog.amountAndPrices }" var="sauceWithAmountAndPrice">
											<tr>
												<td>
													<c:choose>
														<c:when test="${locale eq 'ka' }">
															<button id="hotdogSaucePopover${sauceWithAmountAndPrice.sauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sauceWithAmountAndPrice.sauce.descriptionGeo }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
														    </button>										
														</c:when>
														<c:when test="${locale eq 'en' }">
															<button id="hotdogSaucePopover${sauceWithAmountAndPrice.sauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sauceWithAmountAndPrice.sauce.descriptionEng }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
														<c:when test="${locale eq 'ru' }">
															<button id="hotdogSaucePopover${sauceWithAmountAndPrice.sauce.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${sauceWithAmountAndPrice.sauce.descriptionRus }" data-original-title="" title="">
																<span class="glyphicon glyphicon-info-sign"></span>
												    		</button>
														</c:when>
													</c:choose>
												</td>
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sauce.nameGeo }</td>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sauce.nameEng }</td>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<td class="td-50-percent">${sauceWithAmountAndPrice.sauce.nameRus }</td>
													</c:when>
												</c:choose>
												<td>
													<c:choose>
														<c:when test="${sauceWithAmountAndPrice.sauce.foodComponentImage ne null }">
															<button id="hotdogSauceImage${sauceWithAmountAndPrice.sauce.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${sauceWithAmountAndPrice.sauce.foodComponentImage.imageFileName }' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>	
														</c:when>
														<c:otherwise>
															<button id="hotdogSauceImage${sauceWithAmountAndPrice.sauce.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
																<span class="glyphicon glyphicon-film"></span>
												    		</button>
														</c:otherwise>
													</c:choose>
												</td>
												<td class="td-50-percent">${sauceWithAmountAndPrice.amountAndPrice.amount }</td>
												<c:set var="hotdogTotalPrice" value="${hotdogTotalPrice + sauceWithAmountAndPrice.amountAndPrice.price}"></c:set>
											</tr>
								    		<script>
								    			$('#hotdogSaucePopover${sauceWithAmountAndPrice.sauce.id }').popover();
								    			$('#hotdogSauceImage${sauceWithAmountAndPrice.sauce.id }').popover();
								    		</script>
										</c:forEach>
									</table>
									<table class="table">
										<tr>
											<td class="td-50-percent">
												<c:choose>
													<c:when test="${locale eq 'ka' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'en' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
													<c:when test="${locale eq 'ru' }">
														<strong><spring:message code="yours.food.service.total.price" /></strong>
													</c:when>
												</c:choose>
											</td>
											<td class="td-50-percent">
												<code>${hotdogTotalPrice } <spring:message code="yours.food.service.currency.gel" /></code>
											</td>
										</tr>
									</table>
									<script type="text/javascript">
										$('#hotdogOrderButtion${customerHotdog.id }').click(function(event) {
											if(event.currentTarget.className.indexOf('active') != -1) {
												var url = "remove-customer-hotdog-from-session";
												$.ajax({
													url: url,
													data: {
														hotdogId: '${customerHotdog.id}',
													}
												}).done(function(responseJson) {
													$('#orderListHotdogItemDivider${customerHotdog.id}').remove();
													$('#orderListHotdogItem${customerHotdog.id}').remove();
													var elementIndex = foodAndDrinkInCartIds.hotdogIds.indexOf('${customerHotdog.id}');
													foodAndDrinkInCartIds.hotdogIds.splice(elementIndex, 1);
													var totalPriceValue = parseFloat($('#total-price-value').text());
													totalPriceValue -= parseFloat('<c:out value="${hotdogTotalPrice }" />');
													$('#total-price-value').text(parseFloat(Math.round(totalPriceValue * 100) / 100).toFixed(2));
												});
											} else {
												var url = "add-customer-hotdog-to-session";
												$.ajax({
													url: url,
													data: {
														hotdogId: '${customerHotdog.id}',
													}
												}).done(function(responseJson) {
													var hotdogName = '<spring:message code="yours.food.service.meals.list.hotdog" />';
													$('#customerOrdersList').prepend(
														$('<li id="orderListHotdogItemDivider${customerHotdog.id}">').addClass('divider')		
													).prepend(
														$('<li id="orderListHotdogItem${customerHotdog.id}">').append($('<span>').attr('style', 'margin-left:10px;').text(hotdogName + ' - ${customerHotdog.id}'))		
													);
													var totalPriceValue = parseFloat($('#total-price-value').text());
													totalPriceValue += parseFloat('<c:out value="${hotdogTotalPrice }" />');
													$('#total-price-value').text(parseFloat(Math.round(totalPriceValue * 100) / 100).toFixed(2));
													foodAndDrinkInCartIds.hotdogIds.push('${customerHotdog.id }');
												});
											}
											
										});
										$("#hotdogRemoveButtion${customerHotdog.id}").click(
											function() {
												alertify.confirm('<spring:message code="yours.food.service.meals.list.alertify.remove.hotdog.message" text="Do you really want to remove this hotdog?" />',
													function(e) {
														if (e) {
															var url = 'remove-customer-hotdog';
															$.ajax({
																url : url,
																data : {
																	customerHotdogId : '${customerHotdog.id}'
															}}).done(function() {
																$('#hotdogTitle${customerHotdog.id }').remove();
																$('#hotdogBread${customerHotdog.id }').remove();
																$('#hotdogSausage${customerHotdog.id }').remove();
																$('#hotdogSauce${customerHotdog.id }').remove();
																alertify.success('<spring:message code="yours.food.service.meals.list.alertify.hotdog.removed.message" text="Hotdog has been removed." />');
															});
														}
													});
											});
									</script>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
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
		$('input[name=customerTelephoneNumber]').change(function(event) {
			if(event.target.id === 'customerTelephoneSelectRadio') {
				$('#customerTelephoneSelect').removeAttr('disabled');
				$('#customerTelephoneInput').attr('disabled', 'disabled');
			} else if(event.target.id === 'customerTelephoneInputRadio') {
				$('#customerTelephoneInput').removeAttr('disabled');
				$('#customerTelephoneSelect').attr('disabled', 'disabled');
			}
		});
		$('input[name=customerShipmentAddress]').change(function(event) {
			if(event.target.id === 'customerShipmentSelectRadio') {
				$('#customerShipmentSelect').removeAttr('disabled');
				$('#customerShipmentInput').attr('disabled', 'disabled');
			} else if(event.target.id === 'customerShipmentInputRadio') {
				$('#customerShipmentInput').removeAttr('disabled');
				$('#customerShipmentSelect').attr('disabled', 'disabled');
			}
		});
		$('#mealsOrderButton').click(function() {
			if(foodAndDrinkInCartIds.sandwichIds.length == 0 &&
				foodAndDrinkInCartIds.sandwichIds.length == 0 &&
				foodAndDrinkInCartIds.drinkIds.length == 0 &&
				foodAndDrinkInCartIds.hotdogIds == 0) {
				alertify.error('<spring:message code="yours.food.service.meals.list.alertify.meal.choose.message" text="Please choose at least one meal" />');
				return;
			}
			var url = 'process-purchase-customer-order';
			var customerPhoneNumber = '';
			var customerShipmentAddress = '';
			if($('input[name=customerTelephoneNumber]:radio:checked').attr('id') === 'customerTelephoneInputRadio') {
				customerPhoneNumber = $('#customerTelephoneInput').val();
			} else if($('input[name=customerTelephoneNumber]:radio:checked').attr('id') === 'customerTelephoneSelectRadio') {
				customerPhoneNumber = $('#customerTelephoneSelect').val();
			}
			if($('input[name=customerShipmentAddress]:radio:checked').attr('id') === 'customerShipmentInputRadio') {
				customerShipmentAddress = $('#customerShipmentInput').val();
			} else if($('input[name=customerShipmentAddress]:radio:checked').attr('id') === 'customerShipmentSelectRadio') {
				customerShipmentAddress = $('#customerShipmentSelect').val();
			}
			if(customerPhoneNumber === '' || customerPhoneNumber === null) {
				alertify.error('<spring:message code="yours.food.service.meals.list.alertify.enter.phone.number.message" text="Please Enter Phone Number" />');
				return;
			}
			var reg = new RegExp('^\\d+$');
			if(!reg.test(customerPhoneNumber)) {
				alertify.error('<spring:message code="yours.food.service.meals.list.alertify.enter.valid.phone.number.message" text="Please enter valid phone number." />');
				return;
			}
			if(customerShipmentAddress === '' || customerShipmentAddress === null) {
				alertify.error('<spring:message code="yours.food.service.meals.list.alertify.enter.shipment.address.message" text="Please Enter Shipment Address" />');
				return;
			}
			$.ajax({
				url: url,
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify({
						sandwichIds: foodAndDrinkInCartIds.sandwichIds, 
						saladIds: foodAndDrinkInCartIds.saladIds,
						drinkIds: foodAndDrinkInCartIds.drinkIds, 
						hotdogIds: foodAndDrinkInCartIds.hotdogIds,
						customerPhoneNumber: customerPhoneNumber, 
						customerShipmentAddress: toUnicode(customerShipmentAddress) 
				})
			}).done(function(response) {
				if(response.errorMessage != undefined) {
					alertify.error(response.errorMessage);
				} else {
					$('#foodPurchaseModal').modal('hide');
					alertify.success('<spring:message code="yours.food.service.meals.list.alertify.order.added.message" text="Your order has been added." />');
				}
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