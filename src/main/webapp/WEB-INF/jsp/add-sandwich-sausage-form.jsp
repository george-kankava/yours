<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px"><spring:message code="yours.list.heading.sandwich.sublist.sausage" text="Sausage" /></span>
</h5>
<div class="col-md-3">
	<form name="formSubmit" action="#">
		<table class="table table-bordered">
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.sausage.type.geo" var="sausageTypeGeo"></spring:message>
				<td><input type="text" class="form-control" id="sausageTypeGeo" placeholder="${sausageTypeGeo }"></input></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.sausage.type.eng" var="sausageTypeEng"></spring:message>
				<td><input type="text" class="form-control" id="sausageTypeEng" placeholder="${sausageTypeEng }"></input></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.sausage.type.rus" var="sausageTypeRus"></spring:message>
				<td><input type="text" class="form-control" id="sausageTypeRus" placeholder="${sausageTypeRus }"></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.sausage.desc.geo" var="sausageDescGeo"></spring:message>
				<td><input type="text" class="form-control" id="sausageDescGeo" placeholder="${sausageDescGeo }"></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.sausage.desc.eng" var="sausageDescEng"></spring:message>
				<td><input type="text" class="form-control" id="sausageDescEng" placeholder="${sausageDescEng }"></td>
			</tr>
			<tr>
				<spring:message code="yours.food.service.admin.add.food.components.sausage.desc.rus" var="sausageDescRus"></spring:message>
				<td><input type="text" class="form-control" id="sausageDescRus" placeholder="${sausageDescRus }"></td>
			</tr>
			<tr>
				<td>
					<spring:message code="yours.food.service.admin.add.food.components.bread.image" text="Image"></spring:message>
					<input type="file" class="form-control" id="sausageImage" />
				</td>
			</tr>
			<tr>
				<td><button type="button" id="sandwich-sausage-add-btn" class="btn btn-default"><spring:message code="yours.food.service.add.button.title"></spring:message></button></td>
			</tr>
		</table>
	</form>		
</div>
<div class="col-md-9">
		<table class="table table-bordered table-sandwich-sausages">
			<thead>
				<tr>
					<th><spring:message code="yours.food.service.admin.sandwich.sausage.type"></spring:message></th>
					<th><spring:message code="yours.food.service.admin.sandwich.sausage.desc"></spring:message></th>
					<th colspan="3"><spring:message code="yours.food.service.admin.sandwich.amount.and.price"></spring:message></th>
					<th><spring:message code="yours.food.service.remove.button.title"></spring:message></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sandwichSausages }" var="sandwichSausage">
					<tr class="sandwich-sausage-${sandwichSausage.id }">
						<td>
							<select class="form-control">
								<option>${sandwichSausage.nameGeo }</option>
								<option>${sandwichSausage.nameEng }</option>
								<option>${sandwichSausage.nameRus }</option>
							</select>
						</td>
						<td>
							<select class="form-control">
								<option>${sandwichSausage.descriptionGeo }</option>
								<option>${sandwichSausage.descriptionEng }</option>
								<option>${sandwichSausage.descriptionRus }</option>
							</select>
						</td>
						<td>
							<select id="sandwich-sausage-amount-and-price-${sandwichSausage.id }" class="form-control">
								<c:forEach items="${sandwichSausage.sausageAmountAndPrices }" var="sausageAmountAndPrice">
									<option value="${sausageAmountAndPrice.id }">${sausageAmountAndPrice.portion} - ${sausageAmountAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="sandwich-sausage-amount-and-price-select-item-remove-${sandwichSausage.id }" type="button" class="btn btn-warning"><spring:message code="yours.food.service.remove.button.title"></spring:message></button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${sandwichSausage.id }" class="btn btn-success"><spring:message code="yours.food.service.add.button.title"></spring:message></a>
							 <!-- Modal -->
 							 <div class="modal fade" id="myModal-${sandwichSausage.id }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title"><spring:message code="yours.food.service.add.button.title"></spring:message></h4>
        								</div>
        									<div class="modal-body">
        										<input type="hidden" id="sandwichSausageId-${sandwichSausage.id }" name="sandwichSausageId" value="${sandwichSausage.id}">
  												<div class="form-group">
    												<label for="sandwichSausageAmount-${sandwichSausage.id }"><spring:message code="yours.food.ingredients.amount"></spring:message></label>
    												<spring:message var="enterAmount"  code="yours.food.service.admin.enter.amount.title"></spring:message>
    												<input type="text" class="form-control" id="sandwichSausageAmount-${sandwichSausage.id }" placeholder="${enterAmount }">
  												</div>
  												<div class="form-group">
    												<label for="sandwichSausagePrice-${sandwichSausage.id }"><spring:message code="yours.food.ingredient.price"></spring:message></label>
    												<spring:message var="enterPrice" code="yours.food.service.admin.enter.price.title"></spring:message>
    												<input type="text" class="form-control" id="sandwichSausagePrice-${sandwichSausage.id }" placeholder="${enterPrice }">
  												</div>		
        									</div>
        									<div class="modal-footer">	
          										<button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="yours.food.service.close.button.title"></spring:message></button>
          										<button id="my-modal-${sandwichSausage.id}" type="button" class="btn btn-primary"><spring:message code="yours.food.service.add.button.title"></spring:message></button>
        									</div>
								</div><!-- /.modal-content -->
    						</div><!-- /.modal-dialog -->
  						</div><!-- /.modal -->						
						</td>
						<td><button id="sandwich-sausage-remove-btn-${sandwichSausage.id }" type="button" class="btn btn-danger"><spring:message code="yours.food.service.remove.button.title"></spring:message></button></td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
</div>
<script>
	$('#sandwich-sausage-add-btn').click(function() {
		var data = new FormData();
		data.append('nameGeo', toUnicode($('#sausageTypeGeo').val()));
		data.append('nameEng', toUnicode($('#sausageTypeEng').val()));
		data.append('nameRus', toUnicode($('#sausageTypeRus').val()));
		data.append('descriptionGeo', toUnicode($('#sausageDescGeo').val()));
		data.append('descriptionEng', toUnicode($('#sausageDescEng').val()));
		data.append('descriptionRus', toUnicode($('#sausageDescRus').val()));
		data.append('image', document.formSubmit.sausageImage.files[0]);
		var url = 'process-add-sandwich-sausage-form';
		$.ajax({
			url: url,
			type: "POST",
			processData:false,
			contentType: false,
			data: data
		}).done(function(response) {
			$('#sausageTypeGeo').val('');
			$('#sausageTypeEng').val('');
			$('#sausageTypeRus').val('');
			$('#sausageDescGeo').val('');
			$('#sausageDescEng').val('');
			$('#sausageDescRus').val('');
			$('.table-sandwich-sausages > tbody:last').append(response);
			alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');			
		});
	});
	<c:forEach items="${sandwichSausages }" var="sandwichSausage">
		$('#my-modal-${sandwichSausage.id}').click(function() {
			var url =  'process-sandwich-sausage-amount-and-price';
			$.ajax({
				url: url,
				data: {
					sandwichSausageId: $('#sandwichSausageId-${sandwichSausage.id}').val(),
					amount: toUnicode($('#sandwichSausageAmount-${sandwichSausage.id}').val()),
					price: $('#sandwichSausagePrice-${sandwichSausage.id}').val()
				}
			}).done(function(sandwichSausageAmountAndPrice) {
				$('#sandwich-sausage-amount-and-price-${sandwichSausage.id}').append('<option value=' + sandwichSausageAmountAndPrice.id + ' selected="selected">' + sandwichSausageAmountAndPrice.portion + ' - ' + parseFloat(Math.round(sandwichSausageAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
				$('#myModal-${sandwichSausage.id}').modal('hide');
				alertify.success('<spring:message code="yours.food.service.admin.data.saved.message" />');
			});
		});
		$('#sandwich-sausage-amount-and-price-select-item-remove-${sandwichSausage.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
				if (e) {
					var url = 'remove-sandwich-sausage-amount-and-price';
					$.ajax({
						url: url,
						data: {
							sandwichSausageAmountAndPriceId: $('#sandwich-sausage-amount-and-price-${sandwichSausage.id}').val()
						}
					}).done(function() {
						$("#sandwich-sausage-amount-and-price-${sandwichSausage.id} option[value=" + $('#sandwich-sausage-amount-and-price-${sandwichSausage.id}').val() + "]").remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			
				}
			});
		});
		$('#sandwich-sausage-remove-btn-${sandwichSausage.id }').click(function() {
			alertify.confirm('<spring:message code="yours.food.service.admin.remove.entry.message" />', function (e) {
			    if (e) {
			    	var url = 'remove-sandwich-sausage';
					$.ajax({
						url: url,
						data: {sandwichSausageId: '${sandwichSausage.id}'}
					}).done(function() {
						$('.sandwich-sausage-${sandwichSausage.id }').remove();
						alertify.error('<spring:message code="yours.food.service.admin.data.removed.message" />');
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
