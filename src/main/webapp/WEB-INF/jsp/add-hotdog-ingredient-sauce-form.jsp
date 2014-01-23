<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px"><spring:message code="yours.food.service.ingredients.hotdog.sauce" /></span>
</h5>
<div class="col-md-3">
	<form action="#" name="formSubmit">
		<table class="table table-bordered">
			<tr>
				<spring:message code="yours.food.service.admin.sauce.geo" var="sauceNameGeo"></spring:message>
				<td><input type="text" class="form-control" id="sauceNameGeo" name="nameGeo" placeholder="${sauceNameGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.sauce.eng" var="sauceNameEng"></spring:message>
				<td><input type="text" class="form-control" id="sauceNameEng" name="nameEng" placeholder="${sauceNameEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.sauce.rus" var="sauceNameRus"></spring:message>
				<td><input type="text" class="form-control" id="sauceNameRus" placeholder="${sauceNameRus }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.sauce.desc.geo" var="sauceDescGeo"></spring:message>
				<td><input id="sauceDescGeo" type="text" class="form-control" placeholder="${sauceDescGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.sauce.desc.eng" var="sauceDescEng"></spring:message>
				<td><input id="sauceDescEng" type="text" class="form-control" placeholder="${sauceDescEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.sauce.desc.rus" var="sauceDescRus"></spring:message>
				<td><input id="sauceDescRus" type="text" class="form-control" placeholder="${sauceDescRus }" /></td>
			</tr>
			<tr>
				<td>
					<spring:message code="yours.food.service.admin.add.food.components.image" text="Image"></spring:message>
					<input type="file" class="form-control" id="sauceImage" />
				</td>
			</tr>
			
			<tr>
				<td><button type="button" id="hotdog-sauce-add-btn" class="btn btn-default"><spring:message code="yours.food.service.add.button.title"></spring:message></button></td>
			</tr>
		</table>
	</form>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-hotdog-sauces">
			<thead>
				<tr>
					<th><spring:message code="yours.food.service.admin.sauce.name.title"></spring:message></th>
					<th><spring:message code="yours.food.service.admin.sauce.desc.title"></spring:message></th>
					<th colspan="3"><spring:message code="yours.food.service.admin.sandwich.amount.and.price"></spring:message></th>
					<th><spring:message code="yours.food.service.remove.button.title"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${hotdogSauces }" var="hotdogSauce">
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
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#hotdog-sauce-add-btn').click(function() {
		var data = new FormData();
		data.append('nameGeo', toUnicode($('#sauceNameGeo').val()));
		data.append('nameEng', toUnicode($('#sauceNameEng').val()));
		data.append('nameRus', toUnicode($('#sauceNameRus').val()));
		data.append('descriptionGeo', toUnicode($('#sauceDescGeo').val()));
		data.append('descriptionEng', toUnicode($('#sauceDescEng').val()));
		data.append('descriptionRus', toUnicode($('#sauceDescRus').val()));
		data.append('image', document.formSubmit.sauceImage.files[0]);
		var url = 'process-add-hotdog-sauce-form';
		$.ajax({
			url: url,
			type: "POST",
			processData:false,
			contentType: false,
			data: data
		}).done(function(response) {
			$('#sauceNameGeo').val('');
			$('#sauceNameEng').val('');
			$('#sauceNameRus').val('');
			$('#sauceDescGeo').val('');
			$('#sauceDescEng').val('');
			$('#sauceDescRus').val('');
			$('.table-hotdog-sauces > tbody:last').append(response);
			alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');			
		});
	});
	<c:forEach items="${hotdogSauces }" var="hotdogSauce">
		$('#my-modal-${hotdogSauce.id}').click(function() {
			var url =  'process-hotdog-sauce-amount-and-price';
			$.ajax({
				url: url,
				data: {
					hotdogSauceId: $('#hotdogSauceId-${hotdogSauce.id}').val(),
					amount: toUnicode($('#hotdogSauceAmount-${hotdogSauce.id}').val()),
					price: $('#hotdogSaucePrice-${hotdogSauce.id}').val()
				}
			}).done(function(hotdogSauceAmountAndPrice) {
				$('#hotdog-sauce-amount-and-price-${hotdogSauce.id}').append('<option value=' + hotdogSauceAmountAndPrice.id + ' selected="selected">' + hotdogSauceAmountAndPrice.amount + ' - ' + parseFloat(Math.round(hotdogSauceAmountAndPrice.price * 100) / 100).toFixed(2)  + '</option>');
				$('#myModal-${hotdogSauce.id}').modal('hide');
				alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
			});
		});
		$('#hotdog-sauce-amount-and-price-select-item-remove-${hotdogSauce.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
				if (e) {
					var url = 'remove-hotdog-sauce-amount-and-price';
					$.ajax({
						url: url,
						data: {
							hotdogSauceAmountAndPriceId: $('#hotdog-sauce-amount-and-price-${hotdogSauce.id}').val()
						}
					}).done(function() {
						$("#hotdog-sauce-amount-and-price-${hotdogSauce.id} option[value=" + $('#hotdog-sauce-amount-and-price-${hotdogSauce.id}').val() + "]").remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			
				}
			});
		});
		$('#hotdog-sauce-remove-btn-${hotdogSauce.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
			    if (e) {
			    	var url = 'remove-hotdog-sauce';
					$.ajax({
						url: url,
						data: {hotdogSauceId: '${hotdogSauce.id}'}
					}).done(function() {
						$('.hotdog-sauce-${hotdogSauce.id }').remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
