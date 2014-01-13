<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
	<div class="col-lg-12">
		<c:choose>
			<c:when test="${!empty meals }">
				<div class="panel panel-success">
					<div class="panel-body">
						<div class="alert alert-success"><spring:message code="yours.food.service.meals.list.sandwiches.title"></spring:message></div>
						<c:forEach items="${meals['sandwiches']}" var="customerSandwich">
							<blockquote>
								<div class="row">
									<div class="col-lg-1">
										<span class="glyphicon glyphicon-cutlery"></span>
									</div>
									<div class="col-lg-10">
										<p><spring:message code="yours.food.service.ingredients.sandwich"></spring:message> - ${customerSandwich.id}</p>
									</div>
									<div class="col-lg-1">
										<input type="checkbox" name="sandwiches" id="${customerSandwich.id}"/>
									</div>
								</div>
							</blockquote>
						</c:forEach>
						<div class="alert alert-info"><spring:message code="yours.food.service.meals.list.salads.title" /></div>
						<c:forEach items="${meals['salads']}" var="customerSalad">
							<blockquote>
								<div class="row">
									<div class="col-lg-1">
										<span class="glyphicon glyphicon-cutlery"></span>
									</div>
									<div class="col-lg-10">
										<p><spring:message code="yours.food.service.meals.list.salad"></spring:message> - ${customerSalad.id}</p>
									</div>
									<div class="col-lg-1">
										<input type="checkbox" name="salads" id="${customerSalad.id}"/>
									</div>
								</div>
							</blockquote>
							<script type="text/javascript">
								$( "#saladRemoveButtion${customerSalad.id}" ).click(function() {
									alertify.confirm('<spring:message code="yours.food.service.meals.list.alertify.remove.salad.message" />', function (e) {
										if (e) {
											var url = 'remove-customer-salad';
											$.ajax({
												url: url,
												data: {
													customerSaladId: '${customerSalad.id}'
												}
											}).done(function() {
												$('#customerSalad${customerSalad.id }').remove();
												alertify.success('<spring:message code="yours.food.service.meals.list.alertify.salad.removed.message" />');
											});			
										}
									});
								});
							</script>
						</c:forEach>
						<div class="alert alert-warning"><spring:message code="yours.food.service.meals.list.drinks.title"></spring:message></div>
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
						</c:forEach>
						<div class="alert alert-danger"><spring:message code="yours.food.service.meals.list.hotdogs.title"></spring:message></div>
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

	});
</script>
