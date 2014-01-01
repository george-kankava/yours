<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta name="description" content="Food Service" />
		<meta name="author" content="GNG Apps" />
		<link rel="shortcut icon" href="../resources/ico/yours-sml-logo.gif" />
		
		<title><spring:message code="" text="Customer Meals" /></title>
		
		<!-- Bootstrap core CSS -->
		<link href="../resources/css/bootstrap.css" rel="stylesheet" />
		
		<!-- Custom styles for this template -->
		<link href="../resources/css/yours-food-service.css" rel="stylesheet" />
		<link href="../resources/css/jumbotron-narrow.css" rel="stylesheet" />
		<link href="../resources/css/flat/red.css" rel="stylesheet">
		<link href="../resources/css/alertify.core.css" rel="stylesheet" />
		<link href="../resources/css/alertify.default.css" rel="stylesheet" />
		<link href="../es/css/alertify.bootstrap.css" rel="stylesheet" />
	
	
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			      <script src="resources/assets/js/html5shiv.js"></script>
			      <script src="resources/assets/js/respond.min.js"></script>
		<![endif]-->
	</head>
<body>
	<div class="container">
		<div class="header">
			<h3 class="text-muted">Yours.ge</h3>
		</div>
		<c:if test="${!empty customerSandwiches }">
			<div class="row">
				<div class="col-lg-12 col-lg-offset-5">
					<h4><spring:message code="yours.food.service.meals.list.sandwiches.title" text="Sandwiches" /></h4>
				</div>
			</div>
		</c:if>
		<c:forEach var="customerSandwich" items="${customerSandwiches }">
			<div class="horizontal-line margin-top-15px"></div>
			<div class="row">
				<div class="col-lg-12">
					<h5><spring:message code="yours.food.service.meals.list.sandwich" text="Sandwich" /> - ${customerSandwich.id }</h5>
				</div>
			</div>
			<div class="horizontal-line"></div>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></span></h5>
					
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.size" text="Size" /></span></h5>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
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
				<div class="col-lg-6">
					${customerSandwich.sandwichBreadSizeAndPrice.size }
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.amount" text="Amount" /></span></h5>
				</div>
			</div>
			<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausage">
				<div class="row">
					<div class="col-lg-6">
						<c:choose>
							<c:when test="${locale eq 'ka' }">
								${sandwichSausage.sandwichSausage.nameGeo }									
							</c:when>
							<c:when test="${locale eq 'en' }">
								${sandwichSausage.sandwichSausage.nameEng }
							</c:when>
							<c:when test="${locale eq 'ru' }">
								${sandwichSausage.sandwichSausage.nameRus }
							</c:when>
						</c:choose>
					</div>
					<div class="col-lg-6">
						${sandwichSausage.amountAndPrice.portion }
					</div>
				</div>			
			</c:forEach>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredient.vegetable" text="Vegetable" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.amount" text="Amount" /></span></h5>
				</div>
			</div>
			<c:forEach items="${customerSandwich.sandwichVegetables }" var="sandwichVegetable">
				<div class="row">
					<div class="col-lg-6">
						<c:choose>
							<c:when test="${locale eq 'ka' }">
								${sandwichVegetable.sandwichVegetable.nameGeo }									
							</c:when>
							<c:when test="${locale eq 'en' }">
								${sandwichVegetable.sandwichVegetable.nameEng }
							</c:when>
							<c:when test="${locale eq 'ru' }">
								${sandwichVegetable.sandwichVegetable.nameRus }
							</c:when>
						</c:choose>
					</div>
					<div class="col-lg-6">
						${sandwichVegetable.sandwichVegetableAmountAndPrice.portion }
					</div>
				</div>			
			</c:forEach>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredient.sauce" text="Sauce" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.amount" text="Amount" /></span></h5>
				</div>
			</div>
			<c:forEach items="${customerSandwich.sandwichSauces }" var="sandwichSauce">
				<div class="row">
					<div class="col-lg-6">
						<c:choose>
							<c:when test="${locale eq 'ka' }">
								${sandwichSauce.sandwichSauce.nameGeo }									
							</c:when>
							<c:when test="${locale eq 'en' }">
								${sandwichSauce.sandwichSauce.nameEng }
							</c:when>
							<c:when test="${locale eq 'ru' }">
								${sandwichSauce.sandwichSauce.nameRus }
							</c:when>
						</c:choose>
					</div>
					<div class="col-lg-6">
						${sandwichSauce.sandwichSauceAmountAndPrice.portion }
					</div>
				</div>			
			</c:forEach>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredient.spice" text="Spice" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.amount" text="Amount" /></span></h5>
				</div>
			</div>
			<c:forEach items="${customerSandwich.sandwichSpices }" var="sandwichSpice">
				<div class="row">
					<div class="col-lg-6">
						<c:choose>
							<c:when test="${locale eq 'ka' }">
								${sandwichSpice.sandwichSpice.nameGeo }									
							</c:when>
							<c:when test="${locale eq 'en' }">
								${sandwichSpice.sandwichSpice.nameEng }
							</c:when>
							<c:when test="${locale eq 'ru' }">
								${sandwichSpice.sandwichSpice.nameRus }
							</c:when>
						</c:choose>
					</div>
					<div class="col-lg-6">
						${sandwichSpice.sandwichSpiceAmountAndPrice.portion }
					</div>
				</div>			
			</c:forEach>
		</c:forEach>
		<c:if test="${!empty customerSalads }">
			<div class="row" style="margin-top: 15px">
				<div class="col-lg-12 col-lg-offset-5">
					<h4><spring:message code="yours.food.service.meals.list.salads.title" text="Salads" /></h4>
				</div>
			</div>
		</c:if>
		<c:forEach var="customerSalad" items="${customerSalads }">
			<div class="horizontal-line margin-top-15px"></div>
			<div class="row">
				<div class="col-lg-12">
					<h5><spring:message code="yours.food.service.meals.list.salad" text="Salad" /> - ${customerSalad.id }</h5>
				</div>
			</div>
			<div class="horizontal-line"></div>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.service.ingredient" text="Ingredient" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.amount" text="Amount" /></span></h5>
				</div>
			</div>
			<c:forEach items="${customerSalad.ingredientWithAmountAndPrices }" var="ingredientWithAmountAndPrice">
				<div class="row">
					<div class="col-lg-6">
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
					<div class="col-lg-6">
						${ingredientWithAmountAndPrice.amountAndPrice.amount }
					</div>
				</div>
			</c:forEach>
		</c:forEach>
		<c:if test="${!empty customerDrinks }">
			<div class="row">
				<div class="col-lg-12 col-lg-offset-5" style="margin-top: 15px">
					<h4><spring:message code="yours.list.heading.drinks" text="Drinks" /></h4>
				</div>
			</div>
		</c:if>
		<c:forEach var="customerDrink" items="${customerDrinks }">
			<div class="horizontal-line margin-top-15px"></div>
			<div class="row">
				<div class="col-lg-12">
					<h5><spring:message code="yours.food.service.drink" text="Drink" /> - ${customerDrink.id }</h5>
				</div>
			</div>
			<div class="horizontal-line"></div>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.service.drink" text="Drink" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.size" text="Size" /></span></h5>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
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
				<div class="col-lg-6">
					${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.size }
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.service.drink.addon.name" text="Add-on Name" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.amount" text="Amount" /></span></h5>
				</div>
			</div>
			<c:forEach items="${customerDrink.addonWithAmountAndPrices }" var="addonWithAmountAndPrice">
				<div class="row">
					<div class="col-lg-6">
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
					<div class="col-lg-6">
						${addonWithAmountAndPrice.addOnAmountAndPrice.amount }
					</div>
				</div>
			</c:forEach>
		</c:forEach>
		<c:if test="${!empty customerHotdogs }">
			<div class="row" style="margin-top: 15px">
				<div class="col-lg-12 col-lg-offset-5">
					<h4><spring:message code="yours.food.service.meals.list.hotdogs.title" text="Hotdogs" /></h4>
				</div>
			</div>
		</c:if>
		<c:forEach var="customerHotdog" items="${customerHotdogs }">
			<div class="horizontal-line margin-top-15px"></div>
			<div class="row">
				<div class="col-lg-12">
					<h5><spring:message code="yours.food.service.meals.list.hotdog" text="Hotdog" /> - ${customerHotdog.id }</h5>
				</div>
			</div>
			<div class="horizontal-line"></div>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.size" text="Size" /></span></h5>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
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
				<div class="col-lg-6">
					${customerHotdog.sizeAndPrice.size }
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.service.ingredients.hotdog.sausage" text="Sausage" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.amount" text="Amount" /></span></h5>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
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
				<div class="col-lg-6">
					<h5>${customerHotdog.amountAndPrice.portion }</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.service.ingredients.hotdog.sauce" text="Sauce" /></span></h5>
				</div>
				<div class="col-lg-6">
					<h5><span class="bold"><spring:message code="yours.food.ingredients.amount" text="Amount" /></span></h5>
				</div>
			</div>
			<c:forEach items="${customerHotdog.amountAndPrices }" var="sauceAmountAndPrice">
				<div class="row">
					<div class="col-lg-6">
						<c:choose>
							<c:when test="${locale eq 'ka' }">
								${sauceAmountAndPrice.sauce.nameGeo }										
							</c:when>
							<c:when test="${locale eq 'en' }">
								${sauceAmountAndPrice.sauce.nameEng }
							</c:when>
							<c:when test="${locale eq 'ru' }">
								${sauceAmountAndPrice.sauce.nameRus }
							</c:when>
						</c:choose>
					</div>
					<div class="col-lg-6">
						${sauceAmountAndPrice.amountAndPrice.amount }
					</div>
				</div>
			</c:forEach>
		</c:forEach>
	</div>
	<script src="../resources/js/jquery-2.0.3.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script src="../resources/js/jquery.icheck.js"></script>
	<script src="../resources/js/alertify.min.js"></script>
</body>
</html>