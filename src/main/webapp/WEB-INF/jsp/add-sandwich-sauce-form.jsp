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
				<td><input id="sauceNameGeo" type="text" class="form-control" placeholder="Sauce Geo" /></td>
			</tr>
			<tr>
				<td><input id="sauceNameEng" type="text" class="form-control" placeholder="Sauce Eng" /></td>
			</tr>
			<tr>
				<td><input id="sauceNameRus" type="text" class="form-control" placeholder="Sauce Rus" /></td>
			</tr>
			<tr>
				<td><input id="sauceDescGeo" type="text" class="form-control" placeholder="Sauce Desc Geo" /></td>
			</tr>
			<tr>
				<td><input id="sauceDescEng" type="text" class="form-control" placeholder="Sauce Desc Eng" /></td>
			</tr>
			<tr>
				<td><input id="sauceDescRus" type="text" class="form-control" placeholder="Sauce Desc Rus" /></td>
			</tr>
			<tr>
				<td><button type="button" id="sandwich-sauce-add-btn" class="btn btn-default">Add</button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
		<table class="table table-bordered table-sandwich-sauces">
			<thead>
				<tr>
					<th>Sauce Name</th>
					<th>Sauce Desc</th>
					<th colspan="3">Amount And Price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sandwichSauces }" var="sandwichSauce">
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
							<button id="sandwich-sauce-amount-and-price-select-item-remove-${sandwichSauce.id }" type="button" class="btn btn-warning">Remove</button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${sandwichSauce.id}" class="btn btn-success">Add</a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${sandwichSauce.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title">Add</h4>
        								</div>
        									<div class="modal-body">
        											<input type="hidden" id="sandwichSauceId-${sandwichSauce.id }" value="${sandwichSauce.id}">
  													<div class="form-group">
    													<label for="sandwichSauceAmount-${sandwichSauce.id }">Amount</label>
    													<input id="sandwichSauceAmount-${sandwichSauce.id }" type="text" class="form-control" name="amount" placeholder="Enter Amount">
													</div>
  													<div class="form-group">
    													<label for="sandwichSaucePrice-${sandwichSauce.id }">Price</label>
    													<input id="sandwichSaucePrice-${sandwichSauce.id }"  type="text" class="form-control" name="price" placeholder="Enter Price">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          										<button id="my-modal-${sandwichSauce.id }" type="submit" class="btn btn-primary">Add</button>
        									</div>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="sandwich-sauce-remove-btn-${sandwichSauce.id }" type="button" class="btn btn-danger">Remove</button></td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
</div>
<script>
	$('#sandwich-sauce-add-btn').click(function() {
		var url = 'process-add-sandwich-sauce-form';
		$.ajax({
			url: url,
			type: "POST",
			contentType: "application/json",
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
			$('.table-sandwich-sauces > tbody:last').append(response);
			alertify.success("Data has been saved");			
		});
	});
	<c:forEach items="${sandwichSauces }" var="sandwichSauce">
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
				alertify.success("Data has been saved");
			});
		});
		$('#sandwich-sauce-amount-and-price-select-item-remove-${sandwichSauce.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
				if (e) {
					var url = 'remove-sandwich-sauce-amount-and-price';
					$.ajax({
						url: url,
						data: {
							sandwichSauceAmountAndPriceId: $('#sandwich-sauce-amount-and-price-${sandwichSauce.id}').val()
						}
					}).done(function() {
						$("#sandwich-sauce-amount-and-price-${sandwichSauce.id} option[value=" + $('#sandwich-sauce-amount-and-price-${sandwichSauce.id}').val() + "]").remove();
						alertify.error("Data has been removed");
					});
				}
			});
		});
		$('#sandwich-sauce-remove-btn-${sandwichSauce.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
			    if (e) {
			    	var url = 'remove-sandwich-sauce';
					$.ajax({
						url: url,
						data: {sandwichSauceId: '${sandwichSauce.id}'}
					}).done(function() {
						$('.sandwich-sauce-${sandwichSauce.id }').remove();
						alertify.error("Data has been removed");
					});
			    }
			});
		});
	</c:forEach>
</script>
