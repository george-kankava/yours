<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
<c:forEach items="${customerOrders }" var="customerOrder">
	<div class="col-md-12">
		<div id="customerOrdersListItem${customerOrder.id }" class="alert alert-success">#${customerOrder.id } - ${customerOrder.customer.username } -
			<fmt:formatDate type="time" value="${customerOrder.date}" /> - ${customerOrder.shipmentAddress } - ${customerOrder.phoneNumber } 
				<a data-toggle="modal" data-target="#customerOrderModal${customerOrder.id}" href="#">View Order</a>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="customerOrderModal${customerOrder.id}" tabindex="-1" role="dialog" aria-labelledby="customerOrderModalLabel${customerOrder.id}" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="customerOrderModalLabel${customerOrder.id}">Order Ingredients</h4>
				</div>
				<div class="modal-body">
					<c:forEach items="${customerOrder.customerSandwichs }" var="customerSandwich">
						<div class="row">
							<div class="col-lg-12">
								<p class="lead">Sandwich - ${customerSandwich.id }</p>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-7"> ${customerSandwich.sandwichBread.nameGeo }</div>
							<div class="col-lg-5"> ${customerSandwich.sandwichBreadSizeAndPrice.size }</div>
						</div>
						<c:forEach items="${customerSandwich.sandwichSausages }" var="sandwichSausageWithAmountAndPrice">
							<div class="row">
								<div class="col-lg-7"> ${sandwichSausageWithAmountAndPrice.sandwichSausage.nameGeo }</div>
								<div class="col-lg-5"> ${sandwichSausageWithAmountAndPrice.amountAndPrice.portion }</div>
							</div>
						</c:forEach>
						<c:forEach items="${customerSandwich.sandwichVegetables }" var="sandwichVegetableWithAmountAndPrice">
							<div class="row">
								<div class="col-lg-7"> ${sandwichVegetableWithAmountAndPrice.sandwichVegetable.nameGeo }</div>
								<div class="col-lg-5"> ${sandwichVegetableWithAmountAndPrice.sandwichVegetableAmountAndPrice.portion }</div>
							</div>
						</c:forEach>
						<c:forEach items="${customerSandwich.sandwichSauces }" var="sandwichSauceWithAmountAndPrice">
							<div class="row">
								<div class="col-lg-7"> ${sandwichSauceWithAmountAndPrice.sandwichSauce.nameGeo }</div>
								<div class="col-lg-5"> ${sandwichSauceWithAmountAndPrice.sandwichSauceAmountAndPrice.portion }</div>
							</div>
						</c:forEach>
						<c:forEach items="${customerSandwich.sandwichSpices }" var="sandwichSpicesWithAmountAndPrice">
							<div class="row">
								<div class="col-lg-7"> ${sandwichSpicesWithAmountAndPrice.sandwichSpice.nameGeo }</div>
								<div class="col-lg-5"> ${sandwichSpicesWithAmountAndPrice.sandwichSpiceAmountAndPrice.portion }</div>
							</div>
						</c:forEach>
					</c:forEach>
					<c:forEach items="${customerOrder.customerSalads }" var="customerSalad">
						<div class="row">
							<div class="col-lg-12">
								<p class="lead">Salad - ${customerSalad.id }</p>
							</div>
						</div>
						<c:forEach items="${customerSalad.ingredientWithAmountAndPrices }" var="ingredientWithAmountAndPrice">
							<div class="row">
								<div class="col-lg-7"> ${ingredientWithAmountAndPrice.saladIngredient.nameGeo }</div>
								<div class="col-lg-5"> ${ingredientWithAmountAndPrice.amountAndPrice.amount }</div>
							</div>
						</c:forEach>
					</c:forEach>
					<c:forEach items="${customerOrder.customerDrinks }"
						var="customerDrink">
						<div class="row">
							<div class="col-lg-12">
								<p class="lead">
									Drinks - ${customerDrink.id } <span class="glyphicon glyphicon-glass"></span>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-7"> ${customerDrink.drinkWithSizeAndPrice.drink.nameGeo }</div>
							<div class="col-lg-5"> ${customerDrink.drinkWithSizeAndPrice.sizeAndPrice.size }</div>
						</div>
						<code>add-ons</code>
						<c:forEach items="${customerDrink.addonWithAmountAndPrices }" var="addonWithAmountAndPrice">
							<div class="row">
								<div class="col-lg-7"> ${addonWithAmountAndPrice.drinkAddOn.nameGeo }</div>
								<div class="col-lg-5"> ${addonWithAmountAndPrice.addOnAmountAndPrice.amount }</div>
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
							<div class="col-lg-7">${customerHotdog.bread.nameGeo }</div>
							<div class="col-lg-5">${customerHotdog.sizeAndPrice.size }
							</div>
						</div>
						<div class="row">
							<div class="col-lg-7">${customerHotdog.sausage.nameGeo }</div>
							<div class="col-lg-5">${customerHotdog.amountAndPrice.portion }</div>
						</div>
						<c:forEach items="${customerHotdog.amountAndPrices }" var="hotDogSauceWithAmountAndPrice">
							<div class="row">
								<div class="col-lg-7"> ${hotDogSauceWithAmountAndPrice.sauce.nameGeo }</div>
								<div class="col-lg-5"> ${hotDogSauceWithAmountAndPrice.amountAndPrice.amount }</div>
							</div>
						</c:forEach>
					</c:forEach>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button id="orederDeliveredButton${customerOrder.id }" type="button" class="btn btn-primary">
						<spring:message code="yours.food.service.operator.customer.order.delivered.button" text="Delivered" />
					</button>
					<script>
						$('#orederDeliveredButton${customerOrder.id }').click(function() {
							alertify.confirm("Are you sure?", function (e) {
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
							$.get( "customer-order-pagination.ajax", { pageNumber: '${startIndex - 1}'} )
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
						$.get( "customer-order-pagination.ajax", { pageNumber: '${loop.index}'} )
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
									$.get( "customer-order-pagination.ajax", { pageNumber: '${endIndex}'} )
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
									$.get( "customer-order-pagination.ajax", { pageNumber: '${endIndex}'} )
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
							$.get( "customer-order-pagination.ajax", { pageNumber: '${endIndex}'} )
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