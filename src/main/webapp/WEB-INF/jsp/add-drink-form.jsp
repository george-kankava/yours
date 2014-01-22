<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px"><spring:message code="yours.list.heading.drinks" text="Drinks" /></span>
</h5>
<div class="col-md-3">
	<form action="#" name="formSubmit">
		<table class="table table-bordered">
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.type.geo" var="drinkTypeGeo"></spring:message>
				<td><input type="text" class="form-control" id="drinkNameGeo" placeholder="${drinkTypeGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.type.eng" var="drinkTypeEng"></spring:message>
				<td><input type="text" class="form-control" id="drinkNameEng" placeholder="${drinkTypeEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.type.rus" var="drinkTypeRus"></spring:message>
				<td><input type="text" class="form-control" id="drinkNameRus" placeholder="${drinkTypeRus }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.desc.geo" var="drinkDescGeo"></spring:message>
				<td><input type="text" class="form-control" id="drinkDescGeo" placeholder="${drinkDescGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.desc.eng" var="drinkDescEng"></spring:message>
				<td><input type="text" class="form-control" id="drinkDescEng" placeholder="${drinkDescEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.drink.desc.rus" var="drinkDescRus"></spring:message>
				<td><input type="text" class="form-control" id="drinkDescRus" placeholder="${drinkDescRus }" /></td>
			</tr>
			<tr>
				<td>
					<spring:message code="yours.food.service.admin.add.food.components.image" text="Image"></spring:message>
					<input type="file" class="form-control" id="drinkImage" />
				</td>
			</tr>
			
			<tr>
				<td><button type="button" id="drink-add-btn" class="btn btn-default"><spring:message code="yours.food.service.add.button.title"></spring:message></button></td>
			</tr>
		</table>
	</form>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-drinks">
			<thead>
				<tr>
					<th><spring:message code="yours.food.service.admin.drink.type"></spring:message></th>
					<th><spring:message code="yours.food.service.admin.drink.desc"></spring:message></th>
					<th colspan="3"><spring:message code="yours.food.service.admin.size.and.price"></spring:message></th>
					<th><spring:message code="yours.food.service.remove.button.title"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${drinks }" var="drink">
					<tr class="drink-${drink.id }">
						<td>
							<select class="form-control">
								<option>${drink.nameGeo }</option>
								<option>${drink.nameEng }</option>
								<option>${drink.nameRus }</option>
							</select>
						</td>
						<td>
							<select class="form-control">
								<option>${drink.descriptionGeo }</option>
								<option>${drink.descriptionEng }</option>
								<option>${drink.descriptionRus }</option>
							</select>
						</td>
						<td>
							<select id="drink-size-and-price-${drink.id}" class="form-control">
								<c:forEach items="${drink.drinkSizeAndPrices }" var="drinkSizeAndPrice">
									<option value="${drinkSizeAndPrice.id }">${drinkSizeAndPrice.size } - ${drinkSizeAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="drink-size-and-price-select-item-remove-${drink.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${drink.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${drink.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
        								</div>
        									<div class="modal-body">
        											<input type="hidden" id="drinkId-${drink.id}" name="drinkId" value="${drink.id}">
  													<div class="form-group">
    													<label for="drinkSize-${drink.id }"><spring:message code="yours.food.ingredients.size"></spring:message></label>
    													<spring:message var="enterSize"  code="yours.food.service.admin.enter.size.title"></spring:message>
    													<input type="text" class="form-control" id="drinkSize-${drink.id}" placeholder="${enterSize }">
													</div>
  													<div class="form-group">
    													<label for="drinkPrice-${drink.id}"><spring:message code="yours.food.ingredient.price"></spring:message></label>
    													<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
    													<input type="text" class="form-control" id="drinkPrice-${drink.id}" placeholder="${enterPrice }">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
          										<button type="button" id="my-modal-${drink.id}"  class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
        									</div>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="drink-remove-btn-${drink.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#drink-add-btn').click(function() {
		var data = new FormData();
		data.append('nameGeo', toUnicode($('#drinkNameGeo').val()));
		data.append('nameEng', toUnicode($('#drinkNameEng').val()));
		data.append('nameRus', toUnicode($('#drinkNameRus').val()));
		data.append('descriptionGeo', toUnicode($('#drinkDescGeo').val()));
		data.append('descriptionEng', toUnicode($('#drinkDescEng').val()));
		data.append('descriptionRus', toUnicode($('#drinkDescRus').val()));
		data.append('image', document.formSubmit.drinkImage.files[0]);
		var url = 'process-add-drink-form';
		$.ajax({
			url: url,
			type: "POST",
			processData:false,
			contentType: false,
			data: data
		}).done(function(response) {
			$('#drinkNameGeo').val('');
			$('#drinkNameEng').val('');
			$('#drinkNameRus').val('');
			$('#drinkDescGeo').val('');
			$('#drinkDescEng').val('');
			$('#drinkDescRus').val('');
			$('.table-drinks > tbody:last').append(response);
			alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');			
		});
	});
	<c:forEach items="${drinks }" var="drink">
		$('#my-modal-${drink.id}').click(function() {
			var url =  'process-drink-size-and-price';
			$.ajax({
				url: url,
				data: {
					drinkId: $('#drinkId-${drink.id}').val(),
					size: toUnicode($('#drinkSize-${drink.id}').val()),
					price: $('#drinkPrice-${drink.id}').val()
				}
			}).done(function(drinkSizeAndPrice) {
				$('#drink-size-and-price-${drink.id}').append('<option value=' + drinkSizeAndPrice.id + ' selected="selected">' + drinkSizeAndPrice.size + ' - ' + parseFloat(Math.round(drinkSizeAndPrice.price * 100) / 100).toFixed(2) + '</option>');
				$('#myModal-${drink.id}').modal('hide');
				alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
			});
		});
		$('#drink-size-and-price-select-item-remove-${drink.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
				if (e) {
					var url = 'remove-drink-size-and-price';
					$.ajax({
						url: url,
						data: {
							drinkSizeAndPriceId: $('#drink-size-and-price-${drink.id}').val()
						}
					}).done(function() {
						$("#drink-size-and-price-${drink.id} option[value=" + $('#drink-size-and-price-${drink.id}').val() + "]").remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			
				}
			});
		});
		$('#drink-remove-btn-${drink.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
			    if (e) {
			    	var url = 'remove-drink';
					$.ajax({
						url: url,
						data: {drinkId: '${drink.id}'}
					}).done(function() {
						$('.drink-${drink.id }').remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
