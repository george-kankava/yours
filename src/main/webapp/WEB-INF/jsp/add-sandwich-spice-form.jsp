<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px">Spice</span>
</h5>
<div class="col-md-3">
		<table class="table table-bordered">
			<tr>
				<td><input type="text" class="form-control" id="spiceGeo" placeholder="Spice Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="spiceEng" placeholder="Spice Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="spiceRus" placeholder="Spice Rus" /></td>
			</tr>
			<tr>
				<td><button id="sandwich-spice-add-btn" type="button" class="btn btn-default">Add</button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
		<table class="table table-bordered table-sandwich-spices">
			<thead>
				<tr>
					<th>Spices</th>
					<th colspan="3">Amount And Price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sandwichSpices }" var="sandwichSpice">
					<tr>
						<td>
							<select class="form-control">
								<option>${sandwichSpice.nameGeo }</option>
								<option>${sandwichSpice.nameEng }</option>
								<option>${sandwichSpice.nameRus }</option>
							</select>
						</td>
						<td>
							<select id="sandwich-spice-amount-and-price-${sandwichSpice.id }" class="form-control">
								<c:forEach items="${sandwichSpice.spiceAmountAndPrice }" var="spiceAmountAndPrice">
									<option>${spiceAmountAndPrice.portion} - ${spiceAmountAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="sandwich-spice-amount-and-price-select-item-remove-${sandwichSpice.id }" type="button" class="btn btn-warning">Remove</button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${sandwichSpice.id}" class="btn btn-success">Add</a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${sandwichSpice.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title">Add</h4>
        								</div>
        								<form class="form-inline" role="form" action="process-sandwich-spice-amount-and-price" method="POST">
        									<div class="modal-body">
        											<input type="hidden" id="sandwichSpiceId-${sandwichSpice.id}" name="sandwichSpiceId" value="${sandwichSpice.id}">
  													<div class="form-group">
    													<label for="sandwichSpiceAmount-${sandwichSpice.id}">Amount</label>
    													<input type="text" class="form-control" id="sandwichSpiceAmount-${sandwichSpice.id}" name="amount" placeholder="Enter Amount">
													</div>
  													<div class="form-group">
    													<label for="sandwichSpicePrice-${sandwichSpice.id}">Price</label>
    													<input type="text" class="form-control" id="sandwichSpicePrice-${sandwichSpice.id}" name="price" placeholder="Enter Price">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          										<button type="submit" class="btn btn-primary">Add</button>
        									</div>
        								</form>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="sandwich-spice-remove-btn-${sandwichSpice.id}" type="button" class="btn btn-danger">Remove</button></td>
					</tr>
			</c:forEach>
			</tbody>
		</table>
</div>
<script>
	$('#sandwich-spice-add-btn').click(function() {
		var url = 'process-add-sandwich-spice-form';
		$.ajax({
			url: url,
			data: {
				nameGeo: $('#spiceGeo').val(),
				nameEng: $('#spiceEng').val(),
				nameRus: $('#spiceRus').val(),
			}
		}).done(function(response) {
			$('#spiceGeo').val('');
			$('#spiceEng').val('');
			$('#spiceRus').val('');
			$('.table-sandwich-spices > tbody:last').append(response);
			alertify.success("Data has been saved");			
		});
	});
	<c:forEach items="${sandwichSpices }" var="sandwichSpice">
		$('#myModal-${sandwichSpice.id}').click(function() {
			var url =  'process-sandwich-spice-amount-and-price';
			$.ajax({
				url: url,
				data: {
					sandwichSpiceId: $('#sandwichSpiceId-${sandwichSpice.id}').val(),
					amount: $('#sandwichSpiceAmount-${sandwichSpice.id}').val(),
					price: $('#sandwichSpicePrice-${sandwichSpice.id}').val()
				}
			}).done(function(sandwichSpiceAmountAndPrice) {
				$('#sandwich-spice-amount-and-price-${sandwichSpice.id}').append(new Option(sandwichSpiceAmountAndPrice.portion + '-' + sandwichSpiceAmountAndPrice.price, '', false, true));
				$('#myModal-${sandwichSpice.id}').modal('hide');
			});
		});
		$('#sandwich-spice-amount-and-price-select-item-remove-${sandwichSpice.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
				if (e) {
					var url = 'remove-sandwich-spice-amount-and-price';
					$.ajax({
						url: url,
						data: {
							sandwichSpiceAmountAndPriceId: $('#sandwich-spice-amount-and-price-${sandwichSpice.id}').val()
						}
					}).done(function() {
						$("#sandwich-spice-amount-and-price-${sandwichSpice.id} option[value=" + $('#sandwich-spice-amount-and-price-${sandwichSpice.id}').val() + "]").remove();
					});			
				}
			});
		});
		$('#sandwich-spice-remove-btn-${sandwichSpice.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
			    if (e) {
			    	var url = 'remove-sandwich-spice';
					$.ajax({
						url: url,
						data: {sandwichSpiceId: '${sandwichSpice.id}'}
					}).done(function() {
						$('.sandwich-spice-${sandwichSpice.id }').remove();
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>