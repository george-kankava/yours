<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tr class="sandwich-sauce-${sandwichSauce.id }">
	<td>
		<select class="form-control">
			<option>${sandwichSauce.nameGeo }</option>
			<option>${sandwichSauce.nameEng }</option>
			<option>${sandwichSauce.nameRus }</option>
		</select>
	</td>
	<td>
		<select class="form-control">
			<option>${sandwichSauce.descriptionGeo }</option>
			<option>${sandwichSauce.descriptionEng }</option>
			<option>${sandwichSauce.descriptionRus }</option>
		</select>
	</td>
	<td>
		<select id="sandwich-sauce-amount-and-price-${sandwichSauce.id}" class="form-control">
			<c:forEach items="${sandwichSauce.sauceAmountAndPrices }" var="sauceAmountAndPrice">
				<option value="${sauceAmountAndPrice.id }">${sauceAmountAndPrice.portion} - ${sauceAmountAndPrice.price }</option>
			</c:forEach>
		</select>
	</td>
	<td>
		<button id="sandwich-sauce-amount-and-price-select-item-remove-${sandwichSauce.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
	</td>
	<td><a data-toggle="modal" href="#myModal-${sandwichSauce.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
		<!-- Modal -->
		<div class="modal fade" id="myModal-${sandwichSauce.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
					</div>
					<div class="modal-body">
						<input type="hidden" id="sandwichSauceId-${sandwichSauce.id }" value="${sandwichSauce.id}">
					<div class="form-group">
						<label for="sandwichSauceAmount-${sandwichSauce.id }"><spring:message code="yours.food.ingredients.amount"></spring:message></label>
						<spring:message var="enterAmount"  code="yours.food.service.admin.enter.amount.title"></spring:message>
						<input id="sandwichSauceAmount-${sandwichSauce.id }" type="text" class="form-control" name="amount" placeholder="${enterAmount }">
					</div>
					<div class="form-group">
						<label for="sandwichSaucePrice-${sandwichSauce.id }"><spring:message code="yours.food.ingredient.price"></spring:message></label>
						<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
						<input id="sandwichSaucePrice-${sandwichSauce.id }"  type="text" class="form-control" name="price" placeholder="${enterPrice }">
					</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
						<button id="my-modal-${sandwichSauce.id }" type="submit" class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</td>
	<td><button id="sandwich-sauce-remove-btn-${sandwichSauce.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
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