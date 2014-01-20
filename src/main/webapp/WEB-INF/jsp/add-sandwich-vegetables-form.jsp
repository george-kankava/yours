<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.vegetables" /></span>
</h5>
<div class="col-md-3">
		<table class="table table-bordered">
			<tr>
				<spring:message code="yours.food.service.admin.vegetable.type.geo" var="vegetableGeo"></spring:message>
				<td><input type="text" class="form-control" id="vegetableGeo" placeholder="${vegetableGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.vegetable.type.eng" var="vegetableEng"></spring:message>
				<td><input type="text" class="form-control" id="vegetableEng" placeholder="${vegetableEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.vegetable.type.rus" var="vegetableRus"></spring:message>
				<td><input type="text" class="form-control" id="vegetableRus" placeholder="${vegetableRus }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.vegetable.desc.geo" var="vegetableDescGeo"></spring:message>
				<td><input type="text" class="form-control" id="vegetableDescGeo" placeholder="${vegetableDescGeo }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.vegetable.desc.eng" var="vegetableDescEng"></spring:message>
				<td><input type="text" class="form-control" id="vegetableDescEng" placeholder="${vegetableDescEng }" /></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.vegetable.desc.rus" var="vegetableDescRus"></spring:message>
				<td><input type="text" class="form-control" id="vegetableDescRus" placeholder="${vegetableDescRus }" /></td>
			</tr>
			
			<tr>
				<td>
					<spring:message code="yours.food.service.admin.add.food.components.image" text="Image"></spring:message>
					<input type="file" class="form-control" id="vegetableImage" />
				</td>
			</tr>
			<tr>
				<td><button type="button" id="sandwich-vegetable-add-btn" class="btn btn-default"><spring:message code="yours.food.service.add.button.title"></spring:message></button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
		<table class="table table-bordered table-sandwich-vegetables">
			<thead>
				<tr>
					<th><spring:message code="yours.food.ingredient.vegetable" /></th>
					<th><spring:message code="yours.food.ingredient.vegetable.desc"></spring:message></th>
					<th colspan="3"><spring:message code="yours.food.service.admin.sandwich.amount.and.price" /></th>
					<th><spring:message code="yours.food.service.remove.button.title"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sandwichVegetables }" var="sandwichVegetable">
					<tr class="sandwich-vegetable-${sandwichVegetable.id }">
						<td>
							<select class="form-control">
								<option>${sandwichVegetable.nameGeo }</option>
								<option>${sandwichVegetable.nameEng }</option>
								<option>${sandwichVegetable.nameRus }</option>
							</select>
						</td>
						<td>
							<select class="form-control">
								<option>${sandwichVegetable.descriptionGeo }</option>
								<option>${sandwichVegetable.descriptionEng }</option>
								<option>${sandwichVegetable.descriptionRus }</option>
							</select>
						</td>
						<td>
							<select id="sandwich-vegetable-amount-and-price-${sandwichVegetable.id }" class="form-control">
								<c:forEach items="${sandwichVegetable.vegetableAmountAndPrices }" var="vegetableAmountAndPrice">
									<option value="${vegetableAmountAndPrice.id }">${vegetableAmountAndPrice.portion} - ${vegetableAmountAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="sandwich-vegetable-amount-and-price-select-item-remove-${sandwichVegetable.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${sandwichVegetable.id}" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${sandwichVegetable.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
        								</div>
        									<div class="modal-body">
        											<input type="hidden" id="sandwichVegetableId-${sandwichVegetable.id }" name="sandwichVegetableId" value="${sandwichVegetable.id}">
  													<div class="form-group">
    													<label for="sandwichVegetableAmount-${sandwichVegetable.id }"><spring:message code="yours.food.ingredients.amount"></spring:message></label>
    													<spring:message var="enterAmount"  code="yours.food.service.admin.enter.amount.title"></spring:message>
    													<input type="text" class="form-control" id="sandwichVegetableAmount-${sandwichVegetable.id }" name="amount" placeholder="${enterAmount }">
													</div>
  													<div class="form-group">
    													<label for="sandwichVegetablePrice-${sandwichVegetable.id }"><spring:message code="yours.food.ingredient.price"></spring:message></label>
    													<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
    													<input type="text" class="form-control" id="sandwichVegetablePrice-${sandwichVegetable.id }" name="price" placeholder="${enterPrice }">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
          										<button id="my-modal-${sandwichVegetable.id }" type="submit" class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
        									</div>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="sandwich-vegetable-remove-btn-${sandwichVegetable.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
</div>
<script>
	$('#sandwich-vegetable-add-btn').click(function() {
		var data = new FormData();
		data.append('nameGeo', toUnicode($('#vegetableGeo').val()));
		data.append('nameEng', toUnicode($('#vegetableEng').val()));
		data.append('nameRus', toUnicode($('#vegetableRus').val()));
		data.append('descriptionGeo', toUnicode($('#vegetableDescGeo').val()));
		data.append('descriptionEng', toUnicode($('#vegetableDescEng').val()));
		data.append('descriptionRus', toUnicode($('#vegetableDescRus').val()));
		data.append('image', document.formSubmit.vegetableImage.files[0]);
		var url = 'process-add-sandwich-vegetable-form';
		$.ajax({
			url: url,
			type: "POST",
			processData:false,
			contentType: false,
			data: data
		}).done(function(response) {
			$('#vegetableGeo').val('');
			$('#vegetableEng').val('');
			$('#vegetableRus').val('');
			$('#vegetableDescGeo').val('');
			$('#vegetableDescEng').val('');
			$('#vegetableDescRus').val('');
			$('.table-sandwich-vegetables > tbody:last').append(response);
			alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
		});
	});
	<c:forEach items="${sandwichVegetables }" var="sandwichVegetable">
		$('#my-modal-${sandwichVegetable.id}').click(function() {
			var url =  'process-sandwich-vegetable-amount-and-price';
			$.ajax({
				url: url,
				data: {
					sandwichVegetableId: $('#sandwichVegetableId-${sandwichVegetable.id}').val(),
					amount: toUnicode($('#sandwichVegetableAmount-${sandwichVegetable.id}').val()),
					price: $('#sandwichVegetablePrice-${sandwichVegetable.id}').val()
				}
			}).done(function(sandwichVegetableAmountAndPrice) {
				$('#sandwich-vegetable-amount-and-price-${sandwichVegetable.id}').append('<option value=' + sandwichVegetableAmountAndPrice.id + ' selected="selected">' + sandwichVegetableAmountAndPrice.portion + ' - ' + parseFloat(Math.round(sandwichVegetableAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
				$('#myModal-${sandwichVegetable.id}').modal('hide');
				alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
			});
		});
		$('#sandwich-vegetable-amount-and-price-select-item-remove-${sandwichVegetable.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
				if (e) {
					var url = 'remove-sandwich-vegetable-amount-and-price';
					$.ajax({
						url: url,
						data: {
							sandwichVegetableAmountAndPriceId: $('#sandwich-vegetable-amount-and-price-${sandwichVegetable.id}').val()
						}
					}).done(function() {
						$("#sandwich-vegetable-amount-and-price-${sandwichVegetable.id} option[value=" + $('#sandwich-vegetable-amount-and-price-${sandwichVegetable.id}').val() + "]").remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});
				}
			});
		});
		$('#sandwich-vegetable-remove-btn-${sandwichVegetable.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
			    if (e) {
			    	var url = 'remove-sandwich-vegetable';
					$.ajax({
						url: url,
						data: {sandwichVegetableId: '${sandwichVegetable.id}'}
					}).done(function() {
						$('.sandwich-vegetable-${sandwichVegetable.id }').remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
