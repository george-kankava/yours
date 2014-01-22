<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></span>
</h5>
<div class="col-md-3">
	<form action="#" name="formSubmit">
		<table class="table table-bordered">
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.bread.type.geo" var="breadTypeGeo"></spring:message>
				<td><input type="text" class="form-control" id="breadTypeGeo" placeholder="${breadTypeGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.bread.type.eng" var="breadTypeEng"></spring:message>
				<td><input type="text" class="form-control" id="breadTypeEng" placeholder="${breadTypeEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.bread.type.rus" var="breadTypeRus"></spring:message>
				<td><input type="text" class="form-control" id="breadTypeRus" placeholder="${breadTypeRus }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.bread.desc.geo" var="breadDescGeo"></spring:message>
				<td><input type="text" class="form-control" id="breadDescGeo" placeholder="${breadDescGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.bread.desc.eng" var="breadDescEng"></spring:message>
				<td><input type="text" class="form-control" id="breadDescEng" placeholder="${breadDescEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.bread.desc.rus" var="breadDescRus"></spring:message>
				<td><input type="text" class="form-control" id="breadDescRus" placeholder="${breadDescRus }" /></td>
			</tr>
			<tr>
				<td>
					<spring:message code="yours.food.service.admin.add.food.components.image" text="Image"></spring:message>
					<input type="file" class="form-control" id="breadImage" />
				</td>
			</tr>
			<tr>
				<td><button type="button" id="hotdog-bread-add-btn" class="btn btn-default"><spring:message code="yours.food.service.add.button.title"></spring:message></button></td>
			</tr>
		</table>
	</form>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-hotdog-breads">
			<thead>
				<tr>
					<th><spring:message code="yours.food.service.admin.bread.type"></spring:message></th>
					<th><spring:message code="yours.food.service.admin.bread.desc"></spring:message></th>
					<th colspan="3"><spring:message code="yours.food.service.admin.size.and.price"></spring:message></th>
					<th><spring:message code="yours.food.service.remove.button.title"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${hotdogBreads }" var="hotdogBread">
					<tr class="hotdog-bread-${hotdogBread.id }">
						<td>
							<select class="form-control">
								<option>${hotdogBread.nameGeo }</option>
								<option>${hotdogBread.nameEng }</option>
								<option>${hotdogBread.nameRus }</option>
							</select>
						</td>
						<td>
							<select class="form-control">
								<option>${hotdogBread.descriptionGeo }</option>
								<option>${hotdogBread.descriptionEng }</option>
								<option>${hotdogBread.descriptionRus }</option>
							</select>
						</td>
						<td>
							<select id="hotdog-bread-size-and-price-${hotdogBread.id}" class="form-control">
								<c:forEach items="${hotdogBread.hotdogBreadSizeAndPrices }" var="hotdogBreadSizeAndPrice">
									<option value="${hotdogBreadSizeAndPrice.id }">${hotdogBreadSizeAndPrice.size } - ${hotdogBreadSizeAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="hotdog-bread-size-and-price-select-item-remove-${hotdogBread.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${hotdogBread.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${hotdogBread.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
        								</div>
        								<form class="form-inline" role="form">
        									<div class="modal-body">
												<input type="hidden" id="hotdogBreadId-${hotdogBread.id}" name="hotdogBreadId" value="${hotdogBread.id}">
  												<div class="form-group">
    												<label for="hotdogBreadSize-${hotdogBread.id }"><spring:message code="yours.food.ingredients.size"></spring:message></label>
    												<spring:message var="enterSize"  code="yours.food.service.admin.enter.size.title"></spring:message>
    												<input type="text" class="form-control" id="hotdogBreadSize-${hotdogBread.id}" name="size" placeholder="${enterSize }">
												</div>
  												<div class="form-group">
    												<label for="hotdogBreadPrice-${hotdogBread.id }"><spring:message code="yours.food.ingredient.price"></spring:message></label>
    												<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
    												<input type="text" class="form-control" id="hotdogBreadPrice-${hotdogBread.id}" name="price" placeholder="${enterPrice }">
  												</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
          										<button type="button" id="my-modal-${hotdogBread.id}"  class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
        									</div>
        								</form>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="hotdog-bread-remove-btn-${hotdogBread.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#hotdog-bread-add-btn').click(function() {
		var data = new FormData();
		data.append('nameGeo', toUnicode($('#breadTypeGeo').val()));
		data.append('nameEng', toUnicode($('#breadTypeEng').val()));
		data.append('nameRus', toUnicode($('#breadTypeRus').val()));
		data.append('descriptionGeo', toUnicode($('#breadDescGeo').val()));
		data.append('descriptionEng', toUnicode($('#breadDescEng').val()));
		data.append('descriptionRus', toUnicode($('#breadDescRus').val()));
		data.append('image', document.formSubmit.breadImage.files[0]);
		var url = 'process-add-hotdog-bread-form';
		$.ajax({
			url: url,
			type: "POST",
			processData:false,
			contentType: false,
			data: data
		}).done(function(response) {
			$('#breadTypeGeo').val('');
			$('#breadTypeEng').val('');
			$('#breadTypeRus').val('');
			$('#breadDescGeo').val('');
			$('#breadDescEng').val('');
			$('#breadDescRus').val('');
			$('.table-hotdog-breads > tbody:last').append(response);
			alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');			
		});
	});
	<c:forEach items="${hotdogBreads }" var="hotdogBread">
		$('#my-modal-${hotdogBread.id}').click(function() {
			var url =  'process-hotdog-bread-size-and-price';
			$.ajax({
				url: url,
				data: {
					hotdogBreadId: $('#hotdogBreadId-${hotdogBread.id}').val(),
					size: toUnicode($('#hotdogBreadSize-${hotdogBread.id}').val()),
					price: $('#hotdogBreadPrice-${hotdogBread.id}').val()
				}
			}).done(function(hotdogBreadSizeAndPrice) {
				$('#hotdog-bread-size-and-price-${hotdogBread.id}').append('<option value=' + hotdogBreadSizeAndPrice.id + ' selected="selected">' + hotdogBreadSizeAndPrice.size + ' - ' + parseFloat(Math.round(hotdogBreadSizeAndPrice.price * 100) / 100).toFixed(2) + '</option>');
				$('#myModal-${hotdogBread.id}').modal('hide');
				alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
			});
		});
		$('#hotdog-bread-size-and-price-select-item-remove-${hotdogBread.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
				if (e) {
					var url = 'remove-hotdog-bread-size-and-price';
					$.ajax({
						url: url,
						data: {
							hotdogBreadSizeAndPriceId: $('#hotdog-bread-size-and-price-${hotdogBread.id}').val()
						}
					}).done(function() {
						$("#hotdog-bread-size-and-price-${hotdogBread.id} option[value=" + $('#hotdog-bread-size-and-price-${hotdogBread.id}').val() + "]").remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			
				}
			});
		});
		$('#hotdog-bread-remove-btn-${hotdogBread.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
			    if (e) {
			    	var url = 'remove-hotdog-bread';
					$.ajax({
						url: url,
						data: {hotdogBreadId: '${hotdogBread.id}'}
					}).done(function() {
						$('.hotdog-bread-${hotdogBread.id }').remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
