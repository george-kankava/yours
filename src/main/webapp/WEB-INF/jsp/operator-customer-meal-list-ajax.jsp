<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-lg-12">
		<c:choose>
			<c:when test="${!empty meals }">
				<div class="panel panel-success">
					<div class="panel-body">
						<div class="alert alert-success">Sandwiches</div>
						<c:forEach items="${meals['sandwiches']}" var="customerSandwich">
							<blockquote>
								<div class="row">
									<div class="col-lg-1">
										<span class="glyphicon glyphicon-cutlery"></span>
									</div>
									<div class="col-lg-10">
										<p>Sandwich - ${customerSandwich.id}</p>
									</div>
									<div class="col-lg-1">
										<input type="checkbox" name="sandwiches" id="${customerSandwich.id}"/>
									</div>
								</div>
							</blockquote>
							<%-- <table class="table">
								<thead>
									<tr>
										<th><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></th>
										<th><spring:message code="yours.food.ingredients.size" text="Size" /></th>
										<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
									<tr>
								</thead>
								<tr>
									<td>${customerSandwich.sandwichBread.nameGeo }</td>
									<td>${customerSandwich.sandwichBreadSizeAndPrice.size }</td>
									<td>${customerSandwich.sandwichBreadSizeAndPrice.price }</td>
								</tr>
							</table>
							<table class="table">
								<thead>
									<tr>
										<th><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></th>
										<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
									</tr>
								</thead>
								<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausage">
									<tr>
										<td>${sandwichSausage.sandwichSausage.nameGeo }</td>
										<td>${sandwichSausage.amountAndPrice.portion }</td>
										<td>${sandwichSausage.amountAndPrice.price }</td>
									</tr>
								</c:forEach>
							</table>
							<table class="table">
								<thead>
									<tr>
										<th><spring:message code="yours.list.heading.sandwich.sublist.vegetables" text="Vegetables" /></th>
										<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
									</tr>
								</thead>
								<c:forEach items="${customerSandwich.sandwichVegetables }" var="vegetableWithAmountAndPrice">
									<tr>
										<td>${vegetableWithAmountAndPrice.sandwichVegetable.nameGeo }</td>
										<td>${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.portion }</td>
										<td>${vegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.price }</td>
									</tr>
								</c:forEach>
							</table>
							<table class="table">
								<tr>
									<th><spring:message code="yours.food.ingredient.sauce" text="Sauce" /></th>
									<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
									<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
								</tr>
								<c:forEach items="${customerSandwich.sandwichSauces }" var="sauceWithAmountAndPrice">
									<tr>
										<td>${sauceWithAmountAndPrice.sandwichSauce.nameGeo }</td>
										<td>${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.portion }</td>
										<td>${sauceWithAmountAndPrice.sandwichSauceAmountAndPrice.price }</td>
									</tr>
								</c:forEach>
							</table>
							<table class="table">
								<tr>
									<th><spring:message code="yours.food.ingredient.spice" text="Sauce" /></th>
									<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
									<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
								</tr>
								<c:forEach items="${customerSandwich.sandwichSpices }" var="spiceWithAmountAndPrice">
									<tr>
										<td>${spiceWithAmountAndPrice.sandwichSpice.nameGeo }</td>
										<td>${spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.portion }</td>
										<td>${spiceWithAmountAndPrice.sandwichSpiceAmountAndPrice.price }</td>
									</tr>
								</c:forEach>
							</table> --%>
						</c:forEach>
						<div class="alert alert-info">Salads</div>
						<c:forEach items="${meals['salads']}" var="customerSalad">
							<blockquote>
								<div class="row">
									<div class="col-lg-1">
										<span class="glyphicon glyphicon-cutlery"></span>
									</div>
									<div class="col-lg-10">
										<p>Salad - ${customerSalad.id}</p>
									</div>
									<div class="col-lg-1">
										<input type="checkbox" name="salads" id="${customerSalad.id}"/>
									</div>
								</div>
							</blockquote>
									<%-- <table class="table" id="customerSalad${customerSalad.id }">
											<thead>
												<tr class="success">
												<th colspan="2"><strong><spring:message code="yours.food.service.ingredients.salad" text="Salad" /> - ${customerSalad.id}</strong></th>
												<th><button id="saladRemoveButtion${customerSalad.id}" type="button" class="close" aria-hidden="true">&times;</button></th>
												<tr>
											</thead>
											<tr class="active">
												<td><strong><spring:message code="yours.food.service.salad.ingredients" text="Salad Ingredients"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredients.amount" text="Amount"/></strong></td>
												<td><strong><spring:message code="yours.food.ingredient.price" text="Price"/></strong></td>
											</tr>
											<c:forEach items="${customerSalad.ingredientWithAmountAndPrices }" var="ingredientsWithAmountAndPrices">
												<tr>
													<td>${ingredientsWithAmountAndPrices.saladIngredient.nameGeo }</td>
													<td>${ingredientsWithAmountAndPrices.amountAndPrice.amount }</td>
													<td>${ingredientsWithAmountAndPrices.amountAndPrice.price }</td>
												</tr>
											</c:forEach>
									</table> --%>
									<script type="text/javascript">
										$( "#saladRemoveButtion${customerSalad.id}" ).click(function() {
											alertify.confirm("Do you really want to remove this salad?", function (e) {
												if (e) {
													var url = 'remove-customer-salad';
													$.ajax({
														url: url,
														data: {
															customerSaladId: '${customerSalad.id}'
														}
													}).done(function() {
														$('#customerSalad${customerSalad.id }').remove();
														alertify.success("Salad has been removed");
													});			
												}
											});
										});
									</script>
								</c:forEach>
						<div class="alert alert-warning">Drinks</div>
						<c:forEach items="${meals['drinks']}" var="customerDrink">
							<blockquote>
								<div class="row">
									<div class="col-lg-1">
										<span class="glyphicon glyphicon-glass"></span>
									</div>
									<div class="col-lg-10">
										<p><spring:message code="yours.food.service.ingredients.drink" text="Drink" /> - ${customerDrink.id}</p>
									</div>
									<div class="col-lg-1">
										<input type="checkbox" name="drinks" id="${customerDrink.id}"/>
									</div>
								</div>
							</blockquote>
							<%-- <table class="table">
								<thead>
									<tr>
										<th><spring:message code="yours.food.service.drink.name" text="Drink Name" /></th>
										<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
									<tr>
								</thead>
								<tr>
									<td>${customerDrink.drinkWithSizeAndPrice.drink.nameGeo }</td>
									<td>${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.size }</td>
									<td>${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.price }</td>
								</tr>
							</table>
							<table class="table">
								<thead>
									<tr>
										<th><spring:message code="yours.food.service.drink.addon.name" text="Add-on Name" /></th>
										<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
									</tr>
								</thead>
								<c:forEach items="${customerDrink.addonWithAmountAndPrices }" var="addonWithAmountAndPrice">
									<tr>
										<td>${addonWithAmountAndPrice.drinkAddOn.nameGeo }</td>
										<td>${addonWithAmountAndPrice.addOnAmountAndPrice.amount }</td>
										<td>${addonWithAmountAndPrice.addOnAmountAndPrice.price }</td>
									</tr>
								</c:forEach>
							</table> --%>
						</c:forEach>
						<div class="alert alert-danger">Hotdogs</div>
						<c:forEach items="${meals['hotdogs']}" var="customerHotdog">
							<blockquote>
								<div class="row">
									<div class="col-lg-1">
										<span class="glyphicon glyphicon-cutlery"></span>
									</div>
									<div class="col-lg-10">
										<p><spring:message code="yours.food.service.ingredients.hotdog" text="Hotdog" /> - ${customerHotdog.id}</p>
									</div>
									<div class="col-lg-1">
										<input type="checkbox" name="hotdogs" id="${customerHotdog.id}"/>
									</div>
								</div>
							</blockquote>
							<%-- <table class="table" id="customerHotdog${customerHotdog.id }">
								<thead>
									<tr>
										<th><spring:message code="yours.food.service.ingredients.bread" text="Bread" /></th>
										<th><spring:message code="yours.food.ingredients.size" text="Size" /></th>
										<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
									<tr>
								</thead>
								<tr>
									<td>${customerHotdog.bread.nameGeo }</td>
									<td>${customerHotdog.sizeAndPrice.size }</td>
									<td>${customerHotdog.sizeAndPrice.price }</td>
								</tr>
							</table>
							<table class="table">
								<thead>
									<tr>
										<th><spring:message code="yours.food.service.ingredients.hotdog.sausage" text="Sausage" /></th>
										<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
									</tr>
								</thead>
								<tr>
									<td>${customerHotdog.sausage.nameGeo }</td>
									<td>${addonWithAmountAndPrice.amountAndPrice.portion }</td>
									<td>${addonWithAmountAndPrice.amountAndPrice.price }</td>
								</tr>
							</table>
							<table class="table">
								<thead>
									<tr>
										<th><spring:message code="yours.food.service.ingredients.hotdog.sauce" text="Sauce" /></th>
										<th><spring:message code="yours.food.ingredients.amount" text="Amount" /></th>
										<th><spring:message code="yours.food.ingredient.price" text="Price" /></th>
									</tr>
								</thead>
								<c:forEach items="${customerHotdog.amountAndPrices }" var="sauceWithAmountAndPrice">
									<tr>
										<td>${sauceWithAmountAndPrice.sauce.nameGeo }</td>
										<td>${sauceWithAmountAndPrice.amountAndPrice.amount }</td>
										<td>${sauceWithAmountAndPrice.amountAndPrice.price }</td>
									</tr>
								</c:forEach>
							</table> --%>
						</c:forEach>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-lg-offset-5">
						<a id="customerMealsOrderButton" target="_blank" class="btn btn-warning"><spring:message code="yours.food.service.customer.meal.list.ajax.order.button.text" text="Order" /> <span class="glyphicon glyphicon-ok-circle"></span></a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="alert alert-danger">
					<spring:message code="yours.food.service.operator.result.not.found" text="Result was not found. Please enter correct username." />
				</div>
			</c:otherwise>
		</c:choose>

	</div>
</div>
<script>
	$(document).ready(function(){
	  $('input').iCheck({
	    checkboxClass: 'icheckbox_flat-red',
	    radioClass: 'iradio_flat-red'
	  });
	});
	$('#customerMealsOrderButton').click(function() {
		var sandwiches = new Array();
		$.each($('input[name=sandwiches]:checkbox:checked'), function(index, value) {
			var sandwichId =  value.id;
			sandwiches.push(sandwichId);
		});
		
		var salads = new Array();
		$.each($('input[name=salads]:checkbox:checked'), function(index, value) {
			var saladId =  value.id;
			salads.push(saladId);
		});
		
		var drinks = new Array();
		$.each($('input[name=drinks]:checkbox:checked'), function(index, value) {
			var drinkId =  value.id;
			drinks.push(drinkId);
		});
		
		var hotdogs = new Array();
		$.each($('input[name=hotdogs]:checkbox:checked'), function(index, value) {
			var hotdogId =  value.id;
			hotdogs.push(hotdogId);
		});
		var dataJson = JSON.stringify(
				{	sandwichIds: sandwiches,
					saladIds: salads,
					drinkIds: drinks,
					hotdogIds: hotdogs,
				}
		);
 		var url = 'operator-process-customer-meals-desk-order';
		window.open(url + "?customerMealsJson=" + dataJson, '_blank');
		/* $.ajax({
			url: url,
			type: "POST",
			contentType: "application/json;charset=UTF-8",
			data:
				JSON.stringify(
					{	sandwichIds: sandwiches,
						saladIds: salads,
						drinkIds: drinks,
						hotdogIds: hotdogs,
					}
				)
		}).done(function(response) {
			
		}); */
	});
</script>
