<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px">Sauce</span>
</h5>
<div class="col-md-3">
		<table class="table table-bordered">
			<tr>
				<td><input type="text" class="form-control" id="sauceNameGeo" name="nameGeo" placeholder="Sauce Name Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sauceNameEng" name="nameEng" placeholder="Sauce Name Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sauceNameRus" placeholder="Sauce Name Rus" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sauceDescGeo" placeholder="Sauce Desc Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sauceDescEng" placeholder="Sauce Desc Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sauceDescRus" placeholder="Sauce Desc Rus" /></td>
			</tr>
			<tr>
				<td><button type="button" id="hotdog-sauce-add-btn" class="btn btn-default">Add</button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-hotdog-sauces">
			<thead>
				<tr>
					<th>Sauce Name</th>
					<th>Sauce Desc</th>
					<th colspan="3">Amount And Price</th>
					<th>Remove</th>
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
							<button id="hotdog-sauce-amount-and-price-select-item-remove-${hotdogSauce.id }" type="button" class="btn btn-warning">Remove</button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${hotdogSauce.id}" class="btn btn-success">Add</a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${hotdogSauce.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title">Add</h4>
        								</div>
        									<div class="modal-body">
        										<form class="form-inline" role="form">
        											<input type="hidden" id="hotdogSauceId-${hotdogSauce.id}" name="hotdogSauceId" value="${hotdogSauce.id}">
  													<div class="form-group">
    													<label for="hotdogSauceAmount-${hotdogSauce.id }">Amount</label>
    													<input type="text" class="form-control" id="hotdogSauceAmount-${hotdogSauce.id}" name="amount" placeholder="Enter Amount">
													</div>
  													<div class="form-group">
    													<label for="hotdogSaucePrice-${hotdogSauce.id }">Price</label>
    													<input type="text" class="form-control" id="hotdogSaucePrice-${hotdogSauce.id}" name="price" placeholder="Enter Price">
  													</div>
  												</form>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          										<button type="button" id="my-modal-${hotdogSauce.id}"  class="btn btn-primary">Add</button>
        									</div>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="hotdog-sauce-remove-btn-${hotdogSauce.id }" type="button" class="btn btn-danger">Remove</button></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#hotdog-sauce-add-btn').click(function() {
		var url = 'process-add-hotdog-sauce-form';
		$.ajax({
			url: url,
			type: "POST",
			contentType:"application/json; charset=utf-8",
			data: JSON.stringify({
				nameGeo: toUnicode($('#sauceNameGeo').val()),
				nameEng: toUnicode($('#sauceNameEng').val()),
				nameRus: toUnicode($('#sauceNameRus').val()),
				descriptionGeo: toUnicode($('#sauceDescGeo').val()),
				descriptionEng: toUnicode($('#sauceDescEng').val()),
				descriptionRus: toUnicode($('#sauceDescRus').val())
			})
		}).done(function(response) {
			$('#sauceNameGeo').val('');
			$('#sauceNameEng').val('');
			$('#sauceNameRus').val('');
			$('#sauceDescGeo').val('');
			$('#sauceDescEng').val('');
			$('#sauceDescRus').val('');
			$('.table-hotdog-sauces > tbody:last').append(response);
			alertify.success("Data has been saved");			
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
				alertify.success("Data has been saved");
			});
		});
		$('#hotdog-sauce-amount-and-price-select-item-remove-${hotdogSauce.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
				if (e) {
					var url = 'remove-hotdog-sauce-amount-and-price';
					$.ajax({
						url: url,
						data: {
							hotdogSauceAmountAndPriceId: $('#hotdog-sauce-amount-and-price-${hotdogSauce.id}').val()
						}
					}).done(function() {
						$("#hotdog-sauce-amount-and-price-${hotdogSauce.id} option[value=" + $('#hotdog-sauce-amount-and-price-${hotdogSauce.id}').val() + "]").remove();
						alertify.error("Data has been removed");
					});			
				}
			});
		});
		$('#hotdog-sauce-remove-btn-${hotdogSauce.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
			    if (e) {
			    	var url = 'remove-hotdog-sauce';
					$.ajax({
						url: url,
						data: {hotdogSauceId: '${hotdogSauce.id}'}
					}).done(function() {
						$('.hotdog-sauce-${hotdogSauce.id }').remove();
						alertify.error("Data has been removed");
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
