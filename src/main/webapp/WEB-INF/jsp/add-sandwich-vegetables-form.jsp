<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px">Vegetables</span>
</h5>
<div class="col-md-3">
		<table class="table table-bordered">
			<tr>
				<td><input type="text" class="form-control" id="vegetableGeo" placeholder="Vegetable Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="vegetableEng" placeholder="Vegetable Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="vegetableRus" placeholder="Vegetable Rus" /></td>
			</tr>
			<tr>
				<td><button type="button" id="sandwich-vegetable-add-btn" class="btn btn-default">Add</button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
		<table class="table table-bordered table-sandwich-vegetables">
			<thead>
				<tr>
					<th>Vegetable</th>
					<th colspan="3">Amount And Price</th>
					<th>Remove</th>
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
							<select id="sandwich-vegetable-amount-and-price-${sandwichVegetable.id }" class="form-control">
								<c:forEach items="${sandwichVegetable.vegetableAmountAndPrices }" var="vegetableAmountAndPrice">
									<option value="${vegetableAmountAndPrice.id }">${vegetableAmountAndPrice.portion} - ${vegetableAmountAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="sandwich-vegetable-amount-and-price-select-item-remove-${sandwichVegetable.id }" type="button" class="btn btn-warning">Remove</button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${sandwichVegetable.id}" class="btn btn-success">Add</a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${sandwichVegetable.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title">Add</h4>
        								</div>
        									<div class="modal-body">
        											<input type="hidden" id="sandwichVegetableId-${sandwichVegetable.id }" name="sandwichVegetableId" value="${sandwichVegetable.id}">
  													<div class="form-group">
    													<label for="sandwichVegetableAmount-${sandwichVegetable.id }">Amount</label>
    													<input type="text" class="form-control" id="sandwichVegetableAmount-${sandwichVegetable.id }" name="amount" placeholder="Enter Amount">
													</div>
  													<div class="form-group">
    													<label for="sandwichVegetablePrice-${sandwichVegetable.id }">Price</label>
    													<input type="text" class="form-control" id="sandwichVegetablePrice-${sandwichVegetable.id }" name="price" placeholder="Enter Price">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          										<button id="my-modal-${sandwichVegetable.id }" type="submit" class="btn btn-primary">Add</button>
        									</div>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="sandwich-vegetable-remove-btn-${sandwichVegetable.id }" type="button" class="btn btn-danger">Remove</button></td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
</div>
<script>
	$('#sandwich-vegetable-add-btn').click(function() {
		var url = 'process-add-sandwich-vegetable-form';
		$.ajax({
			url: url,
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify({
				nameGeo: toUnicode($('#vegetableGeo').val()),
				nameEng: toUnicode($('#vegetableEng').val()),
				nameRus: toUnicode($('#vegetableRus').val()),
			})
		}).done(function(response) {
			$('#vegetableGeo').val('');
			$('#vegetableEng').val('');
			$('#vegetableRus').val('');
			$('.table-sandwich-vegetables > tbody:last').append(response);
			alertify.success("Data has been saved");
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
				alertify.success("Data has been saved");
			});
		});
		$('#sandwich-vegetable-amount-and-price-select-item-remove-${sandwichVegetable.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
				if (e) {
					var url = 'remove-sandwich-vegetable-amount-and-price';
					$.ajax({
						url: url,
						data: {
							sandwichVegetableAmountAndPriceId: $('#sandwich-vegetable-amount-and-price-${sandwichVegetable.id}').val()
						}
					}).done(function() {
						$("#sandwich-vegetable-amount-and-price-${sandwichVegetable.id} option[value=" + $('#sandwich-vegetable-amount-and-price-${sandwichVegetable.id}').val() + "]").remove();
						alertify.error("Data has been removed");
					});
				}
			});
		});
		$('#sandwich-vegetable-remove-btn-${sandwichVegetable.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
			    if (e) {
			    	var url = 'remove-sandwich-vegetable';
					$.ajax({
						url: url,
						data: {sandwichVegetableId: '${sandwichVegetable.id}'}
					}).done(function() {
						$('.sandwich-vegetable-${sandwichVegetable.id }').remove();
						alertify.error("Data has been removed");
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
