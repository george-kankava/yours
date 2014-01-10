<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.bread" text="Bread" /></span>
</h5>
<div class="col-md-3">
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
				<td><button type="button" id="sandwich-bread-add-btn" class="btn btn-default"><spring:message code="yours.food.service.add.button.title"></spring:message></button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-sandwich-breads">
			<thead>
				<tr>
					<th><spring:message code="yours.food.service.admin.bread.type"></spring:message></th>
					<th><spring:message code="yours.food.service.admin.bread.desc"></spring:message></th>
					<th colspan="3"><spring:message code="yours.food.service.admin.size.and.price"></spring:message></th>
					<th><spring:message code="yours.food.service.remove.button.title"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sandwichBreads }" var="sandwichBread">
					<tr class="sandwich-bread-${sandwichBread.id }">
						<td>
							<select class="form-control">
								<option>${sandwichBread.nameGeo }</option>
								<option>${sandwichBread.nameEng }</option>
								<option>${sandwichBread.nameRus }</option>
							</select>
						</td>
						<td>
							<select class="form-control">
								<option>${sandwichBread.descriptionGeo }</option>
								<option>${sandwichBread.descriptionEng }</option>
								<option>${sandwichBread.descriptionRus }</option>
							</select>
						</td>
						<td>
							<select id="sandwich-bread-size-and-price-${sandwichBread.id}" class="form-control">
								<c:forEach items="${sandwichBread.sandwichBreadSizeAndPrices }" var="sandwichBreadSizeAndPrice">
									<option value="${sandwichBreadSizeAndPrice.id }">${sandwichBreadSizeAndPrice.size } - ${sandwichBreadSizeAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="sandwich-bread-size-and-price-select-item-remove-${sandwichBread.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${sandwichBread.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${sandwichBread.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
        								</div>
        									<div class="modal-body">
        											<input type="hidden" id="sandwichBreadId-${sandwichBread.id}" name="sandwichBreadId" value="${sandwichBread.id}">
  													<div class="form-group">
    													<label for="sandwichBreadSize-${sandwichBread.id}"><spring:message code="yours.food.ingredients.size"></spring:message></label>
    													<spring:message var="enterSize"  code="yours.food.service.admin.enter.size.title"></spring:message>
    													<input type="text" class="form-control" id="sandwichBreadSize-${sandwichBread.id}" name="size" placeholder="${enterSize }">
													</div>
  													<div class="form-group">
    													<label for="sandwichBreadPrice-${sandwichBread.id}"><spring:message code="yours.food.ingredient.price"></spring:message></label>
    													<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
    													<input type="text" class="form-control" id="sandwichBreadPrice-${sandwichBread.id}" name="price" placeholder="${enterPrice }">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
          										<button type="button" id="my-modal-${sandwichBread.id}"  class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
        									</div>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="sandwich-bread-remove-btn-${sandwichBread.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#sandwich-bread-add-btn').click(function() {
		var url = 'process-add-sandwich-bread-form';
		$.ajax({
			url: url,
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify({
				nameGeo: toUnicode($('#breadTypeGeo').val()),
				nameEng: toUnicode($('#breadTypeEng').val()),
				nameRus: toUnicode($('#breadTypeRus').val()),
				descriptionGeo: toUnicode($('#breadDescGeo').val()),
				descriptionEng: toUnicode($('#breadDescEng').val()),
				descriptionRus: toUnicode($('#breadDescRus').val())
			})
		}).done(function(response) {
			$('#breadTypeGeo').val('');
			$('#breadTypeEng').val('');
			$('#breadTypeRus').val('');
			$('#breadDescGeo').val('');
			$('#breadDescEng').val('');
			$('#breadDescRus').val('');
			$('.table-sandwich-breads > tbody:last').append(response);
			alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');			
		});
	});
	<c:forEach items="${sandwichBreads }" var="sandwichBread">
		$('#my-modal-${sandwichBread.id}').click(function() {
			var url =  'process-sandwich-bread-size-and-price';
			$.ajax({
				url: url,
				data: {
					sandwichBreadId: $('#sandwichBreadId-${sandwichBread.id}').val(),
					size: toUnicode($('#sandwichBreadSize-${sandwichBread.id}').val()),
					price: $('#sandwichBreadPrice-${sandwichBread.id}').val()
				}
			}).done(function(sandwichBreadSizeAndPrice) {
				$('#sandwich-bread-size-and-price-${sandwichBread.id}').append('<option value=' + sandwichBreadSizeAndPrice.id + ' selected="selected">' + sandwichBreadSizeAndPrice.size + ' - ' + parseFloat(Math.round(sandwichBreadSizeAndPrice.price * 100) / 100).toFixed(2) + '</option>');
				$('#myModal-${sandwichBread.id}').modal('hide');
				alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
			});
		});
		$('#sandwich-bread-size-and-price-select-item-remove-${sandwichBread.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
				if (e) {
					var url = 'remove-sandwich-bread-size-and-price';
					$.ajax({
						url: url,
						data: {
							sandwichBreadSizeAndPriceId: $('#sandwich-bread-size-and-price-${sandwichBread.id}').val()
						}
					}).done(function() {
						$("#sandwich-bread-size-and-price-${sandwichBread.id} option[value=" + $('#sandwich-bread-size-and-price-${sandwichBread.id}').val() + "]").remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			
				}
			});
		});
		$('#sandwich-bread-remove-btn-${sandwichBread.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
			    if (e) {
			    	var url = 'remove-sandwich-bread';
					$.ajax({
						url: url,
						data: {sandwichBreadId: '${sandwichBread.id}'}
					}).done(function() {
						$('.sandwich-bread-${sandwichBread.id }').remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
