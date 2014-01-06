<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px">Drink Add-On</span>
</h5>
<div class="col-md-3">
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
				<td><input type="text" class="form-control" id="addonNameGeo" placeholder="Add-On Name Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="addonNameEng" placeholder="Add-On Name Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="addonNameRus" placeholder="Add-On Name Rus" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="addonDescGeo" placeholder="Add-On Desc Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="addonDescEng" placeholder="Add-On Desc Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="addonDescRus" placeholder="Add-On Desc Rus" /></td>
			</tr>
			<tr>
				<td><button type="submit" id="drink-add-on-add-btn" class="btn btn-default">Add</button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-drink-add-ons">
			<thead>
				<tr>
					<th><spring:message code="yours.food.service.admin.add.drink.addon.drink.name" text="Drink Name" /></th>
					<th>Add-On Name</th>
					<th>Add-On Desc</th>
					<th colspan="3">Amount And Price</th>
					<th>Remove</th>
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
							<button id="drink-add-on-amount-and-price-select-item-remove-${drinkAddOn.id }" type="button" class="btn btn-warning">Remove</button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${drinkAddOn.id}" class="btn btn-success">Add</a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${drinkAddOn.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title">Add</h4>
        								</div>
        								<form class="form-inline" role="form">
        									<div class="modal-body">
        											<input type="hidden" id="drinkAddOnId-${drinkAddOn.id}" value="${drinkAddOn.id}">
  													<div class="form-group">
    													<label for="drinkAddOnAmount-${drinkAddOn.id }">Amount</label>
    													<input type="text" class="form-control" id="drinkAddOnAmount-${drinkAddOn.id}" placeholder="Enter Amount">
													</div>
  													<div class="form-group">
    													<label for="drinkAddOnPrice-${drinkAddOn.id }">Price</label>
    													<input type="text" class="form-control" id="drinkAddOnPrice-${drinkAddOn.id}" placeholder="Enter Price">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          										<button type="button" id="my-modal-${drinkAddOn.id}"  class="btn btn-primary">Add</button>
        									</div>
        								</form>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="drink-add-on-remove-btn-${drinkAddOn.id }" type="button" class="btn btn-danger">Remove</button></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#drink-add-on-add-btn').click(function() {
		var url = 'process-add-drink-add-on-form';
		$.ajax({
			url: url,
			type: "POST",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({
				nameGeo: toUnicode($('#addonNameGeo').val()),
				nameEng: toUnicode($('#addonNameEng').val()),
				nameRus: toUnicode($('#addonNameRus').val()),
				descriptionGeo: toUnicode($('#addonDescGeo').val()),
				descriptionEng: toUnicode($('#addonDescEng').val()),
				descriptionRus: toUnicode($('#addonDescRus').val()),
				drinkId: $('#drinkId').val()
			})
		}).done(function(response) {
			$('#addonNameGeo').val('');
			$('#addonNameEng').val('');
			$('#addonNameRus').val('');
			$('#addonDescGeo').val('');
			$('#addonDescEng').val('');
			$('#addonDescRus').val('');
			$('.table-drink-add-ons > tbody:last').append(response);
			alertify.success("Data has been saved");			
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
			});
		});
		$('#drink-add-on-amount-and-price-select-item-remove-${drinkAddOn.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
				if (e) {
					var url = 'remove-drink-add-on-amount-and-price';
					$.ajax({
						url: url,
						data: {
							drinkAddOnAmountAndPriceId: $('#drink-add-on-amount-and-price-${drinkAddOn.id}').val()
						}
					}).done(function() {
						$("#drink-add-on-amount-and-price-${drinkAddOn.id} option[value=" + $('#drink-add-on-amount-and-price-${drinkAddOn.id}').val() + "]").remove();
						alertify.error("Data has been removed");
					});			
				}
			});
		});
		$('#drink-add-on-remove-btn-${drinkAddOn.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
			    if (e) {
			    	var url = 'remove-drink-add-on';
					$.ajax({
						url: url,
						data: {drinkAddOnId: '${drinkAddOn.id}'}
					}).done(function() {
						$('.drink-add-on-${drinkAddOn.id }').remove();
						alertify.error("Data has been removed");
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
