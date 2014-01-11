<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr class="hotdog-sausage-${hotdogSausage.id }">
	<td>
		<select class="form-control">
			<option>${hotdogSausage.nameGeo }</option>
			<option>${hotdogSausage.nameEng }</option>
			<option>${hotdogSausage.nameRus }</option>
		</select>
	</td>
	<td>
		<select class="form-control">
			<option>${hotdogSausage.descriptionGeo }</option>
			<option>${hotdogSausage.descriptionEng }</option>
			<option>${hotdogSausage.descriptionRus }</option>
		</select>
	</td>
	<td>
		<select id="hotdog-sausage-amount-and-price-${hotdogSausage.id}" class="form-control">
			<c:forEach items="${hotdogSausage.hotDogSausageAmountAndPrice }" var="hotdogSausageAmountAndPrice">
				<option value="${hotdogSausageAmountAndPrice.id }">${hotdogSausageAmountAndPrice.portion } - ${hotdogSausageAmountAndPrice.price }</option>
			</c:forEach>
		</select>
	</td>
	<td>
		<button id="hotdog-sausage-amount-and-price-select-item-remove-${hotdogSausage.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
	</td>
	<td><a data-toggle="modal" href="#myModal-${hotdogSausage.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
		<!-- Modal -->
				<div class="modal fade" id="myModal-${hotdogSausage.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
 								<div class="modal-content">
   								<div class="modal-header">
     									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
     									<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
   								</div>
   								<form class="form-inline" role="form">
   									<div class="modal-body">
   											<input type="hidden" id="hotdogSausageId-${hotdogSausage.id}" name="hotdogSausageId" value="${hotdogSausage.id}">
										<div class="form-group">
												<label for="hotdogSausageAmount-${hotdogSausage.id }"><spring:message code="yours.food.ingredients.amount"></spring:message></label>
												<spring:message var="enterAmount"  code="yours.food.service.admin.enter.amount.title"></spring:message>
												<input type="text" class="form-control" id="hotdogSausageAmount-${hotdogSausage.id}" name="amount" placeholder="${enterAmount }">
								</div>
										<div class="form-group">
												<label for="hotdogSausagePrice-${hotdogSausage.id }"><spring:message code="yours.food.ingredient.price"></spring:message></label>
												<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
												<input type="text" class="form-control" id="hotdogSausagePrice-${hotdogSausage.id}" name="price" placeholder="${enterPrice }">
										</div>
   									</div>
   									<div class="modal-footer">
     										<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
     										<button type="button" id="my-modal-${hotdogSausage.id}"  class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
   									</div>
   								</form>
 								</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
	</td>
	<td><button id="hotdog-sausage-remove-btn-${hotdogSausage.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
</tr>
<script>
$('#my-modal-${hotdogSausage.id}').click(function() {
	var url =  'process-hotdog-sausage-amount-and-price';
	$.ajax({
		url: url,
		data: {
			hotdogSausageId: $('#hotdogSausageId-${hotdogSausage.id}').val(),
			amount: toUnicode($('#hotdogSausageAmount-${hotdogSausage.id}').val()),
			price: $('#hotdogSausagePrice-${hotdogSausage.id}').val()
		}
	}).done(function(hotdogSausageAmountAndPrice) {
		$('#hotdog-sausage-amount-and-price-${hotdogSausage.id}').append('<option value=' + hotdogSausageAmountAndPrice.id + ' selected="selected">' + hotdogSausageAmountAndPrice.portion + ' - ' + parseFloat(Math.round(hotdogSausageAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
		$('#myModal-${hotdogSausage.id}').modal('hide');
		alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
	});
});
$('#hotdog-sausage-amount-and-price-select-item-remove-${hotdogSausage.id }').click(function() {
	alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
		if (e) {
			var url = 'remove-hotdog-sausage-amount-and-price';
			$.ajax({
				url: url,
				data: {
					hotdogSausageAmountAndPriceId: $('#hotdog-sausage-amount-and-price-${hotdogSausage.id}').val()
				}
			}).done(function() {
				$("#hotdog-sausage-amount-and-price-${hotdogSausage.id} option[value=" + $('#hotdog-sausage-amount-and-price-${hotdogSausage.id}').val() + "]").remove();
				alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
			});			
		}
	});
});
$('#hotdog-sausage-remove-btn-${hotdogSausage.id }').click(function() {
	alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
	    if (e) {
	    	var url = 'remove-hotdog-sausage';
			$.ajax({
				url: url,
				data: {hotdogSausageId: '${hotdogSausage.id}'}
			}).done(function() {
				$('.hotdog-sausage-${hotdogSausage.id }').remove();
				alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
			});			    	
	    } 
	});
});
</script>