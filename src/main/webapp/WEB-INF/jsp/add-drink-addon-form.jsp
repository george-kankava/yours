<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px">Drink Add-On</span>
</h5>
<div class="col-md-3">
	<form action="#" name="formSubmit">
		<table class="table table-bordered">
			<tr>
				<td>
					<select class="form-control" id="drinkId">
						<c:forEach items="${drinks }" var="drink">
							<option value="${drink.id }">${drink.nameGeo }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.addon.type.geo" var="drinkAddonTypeGeo"></spring:message>
				<td><input type="text" class="form-control" id="addonNameGeo" placeholder="${drinkAddonTypeGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.addon.type.eng" var="drinkAddonTypeEng"></spring:message>
				<td><input type="text" class="form-control" id="addonNameEng" placeholder="${drinkAddonTypeEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.addon.type.rus" var="drinkAddonTypeRus"></spring:message>
				<td><input type="text" class="form-control" id="addonNameRus" placeholder="${drinkAddonTypeRus }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.addon.desc.geo" var="drinkAddonDescGeo"></spring:message>
				<td><input type="text" class="form-control" id="addonDescGeo" placeholder="${drinkAddonDescGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.addon.desc.eng" var="drinkAddonDescEng"></spring:message>
				<td><input type="text" class="form-control" id="addonDescEng" placeholder="${drinkAddonDescEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.addon.desc.rus" var="drinkAddonDescRus"></spring:message>
				<td><input type="text" class="form-control" id="addonDescRus" placeholder="${drinkAddonDescRus }" /></td>
			</tr>
			<tr>
				<td>
					<spring:message code="yours.food.service.admin.add.food.components.image" text="Image"></spring:message>
					<input type="file" class="form-control" id="drinkAddonImage" />
				</td>
			</tr>
			<tr>
				<td><button type="submit" id="drink-add-on-add-btn" class="btn btn-default"><spring:message code="yours.food.service.add.button.title"></spring:message></button></td>
			</tr>
		</table>
	</form>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-drink-add-ons">
			<thead>
				<tr>
					<th><spring:message code="yours.food.service.admin.drink.type"></spring:message></th>
					<th><spring:message code="yours.food.service.admin.drink.addon.type"></spring:message></th>
					<th><spring:message code="yours.food.service.admin.drink.addon.desc"></spring:message></th>
					<th colspan="3"><spring:message code="yours.food.service.remove.button.title"></spring:message></th>
					<th><spring:message code="yours.food.service.remove.button.title"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${drinkAddOns }" var="drinkAddOn">
					<tr class="drink-add-on-${drinkAddOn.id }">
						<td>
							<code>${drinkAddOn.drink.nameGeo }</code>
						</td>
						<td>
							<select class="form-control">
								<option>${drinkAddOn.nameGeo }</option>
								<option>${drinkAddOn.nameEng }</option>
								<option>${drinkAddOn.nameRus }</option>
							</select>
						</td>
						<td>
							<select class="form-control">
								<option>${drinkAddOn.descriptionGeo }</option>
								<option>${drinkAddOn.descriptionEng }</option>
								<option>${drinkAddOn.descriptionRus }</option>
							</select>
						</td>
						<td>
							<select id="drink-add-on-amount-and-price-${drinkAddOn.id}" class="form-control">
								<c:forEach items="${drinkAddOn.drinkAddOnAmountAndPrices }" var="drinkAddOnAmountAndPrice">
									<option value="${drinkAddOnAmountAndPrice.id }">${drinkAddOnAmountAndPrice.amount } - ${drinkAddOnAmountAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="drink-add-on-amount-and-price-select-item-remove-${drinkAddOn.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${drinkAddOn.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${drinkAddOn.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
        								</div>
        								<form class="form-inline" role="form">
        									<div class="modal-body">
        											<input type="hidden" id="drinkAddOnId-${drinkAddOn.id}" value="${drinkAddOn.id}">
  													<div class="form-group">
    													<label for="drinkAddOnAmount-${drinkAddOn.id }"><spring:message code="yours.food.ingredients.amount"></spring:message></label>
    													<spring:message var="enterAmount"  code="yours.food.service.admin.enter.amount.title"></spring:message>
    													<input type="text" class="form-control" id="drinkAddOnAmount-${drinkAddOn.id}" placeholder="${enterAmount }">
													</div>
  													<div class="form-group">
    													<label for="drinkAddOnPrice-${drinkAddOn.id }"><spring:message code="yours.food.ingredient.price"></spring:message></label>
    													<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
    													<input type="text" class="form-control" id="drinkAddOnPrice-${drinkAddOn.id}" placeholder="${enterPrice }">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          										<button type="button" id="my-modal-${drinkAddOn.id}"  class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
        									</div>
        								</form>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="drink-add-on-remove-btn-${drinkAddOn.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#drink-add-on-add-btn').click(function() {
		var data = new FormData();
		data.append('nameGeo', toUnicode($('#addonNameGeo').val()));
		data.append('nameEng', toUnicode($('#addonNameEng').val()));
		data.append('nameRus', toUnicode($('#addonNameRus').val()));
		data.append('descriptionGeo', toUnicode($('#addonDescGeo').val()));
		data.append('descriptionEng', toUnicode($('#addonDescEng').val()));
		data.append('descriptionRus', toUnicode($('#addonDescRus').val()));
		data.append('drinkId', $('#drinkId').val());
		data.append('image', document.formSubmit.drinkAddonImage.files[0]);
		var url = 'process-add-drink-add-on-form';
		$.ajax({
			url: url,
			type: "POST",
			processData:false,
			contentType: false,
			data: data
		}).done(function(response) {
			$('#addonNameGeo').val('');
			$('#addonNameEng').val('');
			$('#addonNameRus').val('');
			$('#addonDescGeo').val('');
			$('#addonDescEng').val('');
			$('#addonDescRus').val('');
			$('.table-drink-add-ons > tbody:last').append(response);
			alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');			
		});
	});
	<c:forEach items="${drinkAddOns }" var="drinkAddOn">
		$('#my-modal-${drinkAddOn.id}').click(function() {
			var url =  'process-drink-add-on-amount-and-price';
			$.ajax({
				url: url,
				data: {
					drinkAddOnId: $('#drinkAddOnId-${drinkAddOn.id}').val(),
					amount: toUnicode($('#drinkAddOnAmount-${drinkAddOn.id}').val()),
					price: $('#drinkAddOnPrice-${drinkAddOn.id}').val()
				}
			}).done(function(drinkAddOnAmountAndPrice) {
				$('#drink-add-on-amount-and-price-${drinkAddOn.id}').append('<option value=' + drinkAddOnAmountAndPrice.id + ' selected="selected" >' + drinkAddOnAmountAndPrice.amount + ' - ' + parseFloat(Math.round(drinkAddOnAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
				$('#myModal-${drinkAddOn.id}').modal('hide');
				'<spring:message code="yours.food.service.admin.data.saved.message" />'
			});
		});
		$('#drink-add-on-amount-and-price-select-item-remove-${drinkAddOn.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
				if (e) {
					var url = 'remove-drink-add-on-amount-and-price';
					$.ajax({
						url: url,
						data: {
							drinkAddOnAmountAndPriceId: $('#drink-add-on-amount-and-price-${drinkAddOn.id}').val()
						}
					}).done(function() {
						$("#drink-add-on-amount-and-price-${drinkAddOn.id} option[value=" + $('#drink-add-on-amount-and-price-${drinkAddOn.id}').val() + "]").remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			
				}
			});
		});
		$('#drink-add-on-remove-btn-${drinkAddOn.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
			    if (e) {
			    	var url = 'remove-drink-add-on';
					$.ajax({
						url: url,
						data: {drinkAddOnId: '${drinkAddOn.id}'}
					}).done(function() {
						$('.drink-add-on-${drinkAddOn.id }').remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
