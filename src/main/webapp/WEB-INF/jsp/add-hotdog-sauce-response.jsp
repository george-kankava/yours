<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr class="hotdog-sauce-${hotdogSauce.id }">
	<td>
		<select class="form-control">
			<option>${hotdogSauce.nameGeo }</option>
			<option>${hotdogSauce.nameEng }</option>
			<option>${hotdogSauce.nameRus }</option>
		</select>
	</td>
	<td>
		<select class="form-control">
			<option>${hotdogSauce.descriptionGeo }</option>
			<option>${hotdogSauce.descriptionEng }</option>
			<option>${hotdogSauce.descriptionRus }</option>
		</select>
	</td>
	<td>
		<select id="hotdog-sauce-amount-and-price-${hotdogSauce.id}" class="form-control">
			<c:forEach items="${hotdogSauce.hotdogSauceAmountAndPrice }" var="hotdogSauceAmountAndPrice">
				<option value="${hotdogSauceAmountAndPrice.id }">${hotdogSauceAmountAndPrice.amount } - ${hotdogSauceAmountAndPrice.price }</option>
			</c:forEach>
		</select>
	</td>
	<td>
		<button id="hotdog-sauce-amount-and-price-select-item-remove-${hotdogSauce.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
	</td>
	<td><a data-toggle="modal" href="#myModal-${hotdogSauce.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
		<!-- Modal -->
				<div class="modal fade" id="myModal-${hotdogSauce.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
 								<div class="modal-content">
   								<div class="modal-header">
     									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
     									<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
   								</div>
   									<div class="modal-body">
   										<form class="form-inline" role="form">
   											<input type="hidden" id="hotdogSauceId-${hotdogSauce.id}" name="hotdogSauceId" value="${hotdogSauce.id}">
										<div class="form-group">
												<label for="hotdogSauceAmount-${hotdogSauce.id }"><spring:message code="yours.food.ingredients.amount"></spring:message></label>
												<spring:message var="enterAmount"  code="yours.food.service.admin.enter.amount.title"></spring:message>
												<input type="text" class="form-control" id="hotdogSauceAmount-${hotdogSauce.id}" name="amount" placeholder="${enterAmount }">
								</div>
										<div class="form-group">
												<label for="hotdogSaucePrice-${hotdogSauce.id }"><spring:message code="yours.food.ingredient.price"></spring:message></label>
												<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
												<input type="text" class="form-control" id="hotdogSaucePrice-${hotdogSauce.id}" name="price" placeholder="${enterPrice }">
										</div>
									</form>
   									</div>
   									<div class="modal-footer">
     										<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
     										<button type="button" id="my-modal-${hotdogSauce.id}" class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
   									</div>
 								</div><!-- /.modal-content -->
						</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
	</td>
	<td><button id="hotdog-sauce-remove-btn-${hotdogSauce.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
</tr>
<script>
$('#my-modal-${sandwichSauce.id}').click(function() {
	var url =  'process-sandwich-sauce-amount-and-price';
	$.ajax({
		url: url,
		data: {
			sandwichSauceId: $('#sandwichSauceId-${sandwichSauce.id}').val(),
			amount: toUnicode($('#sandwichSauceAmount-${sandwichSauce.id}').val()),
			price: $('#sandwichSaucePrice-${sandwichSauce.id}').val()
		}
	}).done(function(sandwichSauceAmountAndPrice) {
		$('#sandwich-sauce-amount-and-price-${sandwichSauce.id}').append('<option value=' + sandwichSauceAmountAndPrice.id + ' selected="selected">' + sandwichSauceAmountAndPrice.portion + ' - ' + parseFloat(Math.round(sandwichSauceAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
		$('#myModal-${sandwichSauce.id}').modal('hide');
		alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
	});
});
$('#sandwich-sauce-amount-and-price-select-item-remove-${sandwichSauce.id }').click(function() {
	alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
		if (e) {
			var url = 'remove-sandwich-sauce-amount-and-price';
			$.ajax({
				url: url,
				data: {
					sandwichSauceAmountAndPriceId: $('#sandwich-sauce-amount-and-price-${sandwichSauce.id}').val()
				}
			}).done(function() {
				$("#sandwich-sauce-amount-and-price-${sandwichSauce.id} option[value=" + $('#sandwich-sauce-amount-and-price-${sandwichSauce.id}').val() + "]").remove();
				alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
			});
		}
	});
});
$('#sandwich-sauce-remove-btn-${sandwichSauce.id }').click(function() {
	alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
	    if (e) {
	    	var url = 'remove-sandwich-sauce';
			$.ajax({
				url: url,
				data: {sandwichSauceId: '${sandwichSauce.id}'}
			}).done(function() {
				$('.sandwich-sauce-${sandwichSauce.id }').remove();
				alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
			});
	    }
	});
});
</script>