<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px">Sausage</span>
</h5>
<div class="col-md-3">
		<table class="table table-bordered">
			<tr>
				<td><input type="text" class="form-control" id="sausageNameGeo" placeholder="Sausage Name Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sausageNameEng" placeholder="Sausage Name Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sausageNameRus" placeholder="Sausage Name Rus" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sausageDescGeo" placeholder="Sausage Desc Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sausageDescEng" placeholder="Sausage Desc Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="sausageDescRus" placeholder="Sausage Desc Rus" /></td>
			</tr>
			<tr>
				<td><button type="button" id="hotdog-sausage-add-btn" class="btn btn-default">Add</button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-hotdog-sausage">
			<thead>
				<tr>
					<th>Sausage Name</th>
					<th>Sausage Desc</th>
					<th colspan="3">Amount And Price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${hotdogSausages }" var="hotdogSausage">
					<tr class="hotdog-sausage-${hotdogSausage.id }">
						<td>
							<select class="form-control">
								<option>${hotdogSausage.nameGeo }</option>
								<option>${hotdogSausage.nameEng }</option>
								<option>${hotdogSausage.nameRus }</option>
							</select>
						</td>
						<td>
							<select class="form-control">
								<option>${hotdogSausage.descriptionGeo }</option>
								<option>${hotdogSausage.descriptionEng }</option>
								<option>${hotdogSausage.descriptionRus }</option>
							</select>
						</td>
						<td>
							<select id="hotdog-sausage-amount-and-price-${hotdogSausage.id}" class="form-control">
								<c:forEach items="${hotdogSausage.hotDogSausageAmountAndPrice }" var="hotdogSausageAmountAndPrice">
									<option value="${hotdogSausageAmountAndPrice.id }">${hotdogSausageAmountAndPrice.portion } - ${hotdogSausageAmountAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="hotdog-sausage-amount-and-price-select-item-remove-${hotdogSausage.id }" type="button" class="btn btn-warning">Remove</button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${hotdogSausage.id}" class="btn btn-success">Add</a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${hotdogSausage.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title">Add</h4>
        								</div>
        								<form class="form-inline" role="form">
        									<div class="modal-body">
        											<input type="hidden" id="hotdogSausageId-${hotdogSausage.id}" name="hotdogSausageId" value="${hotdogSausage.id}">
  													<div class="form-group">
    													<label for="hotdogSausageAmount-${hotdogSausage.id }">Amount</label>
    													<input type="text" class="form-control" id="hotdogSausageAmount-${hotdogSausage.id}" name="amount" placeholder="Enter Amount">
													</div>
  													<div class="form-group">
    													<label for="hotdogSausagePrice-${hotdogSausage.id }">Price</label>
    													<input type="text" class="form-control" id="hotdogSausagePrice-${hotdogSausage.id}" name="price" placeholder="Enter Price">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          										<button type="button" id="my-modal-${hotdogSausage.id}"  class="btn btn-primary">Add</button>
        									</div>
        								</form>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="hotdog-sausage-remove-btn-${hotdogSausage.id }" type="button" class="btn btn-danger">Remove</button></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#hotdog-sausage-add-btn').click(function() {
		var url = 'process-add-hotdog-sausage-form';
		$.ajax({
			url: url,
			type: "POST",
			contentType: "application/json",
			data: JSON.stringify({
				nameGeo: toUnicode($('#sausageNameGeo').val()),
				nameEng: toUnicode($('#sausageNameEng').val()),
				nameRus: toUnicode($('#sausageNameRus').val()),
				descriptionGeo: toUnicode($('#sausageDescGeo').val()),
				descriptionEng: toUnicode($('#sausageDescEng').val()),
				descriptionRus: toUnicode($('#sausageDescRus').val())
			})
		}).done(function(response) {
			$('#sausageNameGeo').val('');
			$('#sausageNameEng').val('');
			$('#sausageNameRus').val('');
			$('#sausageDescGeo').val('');
			$('#sausageDescEng').val('');
			$('#sausageDescRus').val('');
			$('.table-hotdog-sausage > tbody:last').append(response);
			alertify.success("Data has been saved");			
		});
	});
	<c:forEach items="${hotdogSausages }" var="hotdogSausage">
		$('#my-modal-${hotdogSausage.id}').click(function() {
			var url =  'process-hotdog-sausage-amount-and-price';
			$.ajax({
				url: url,
				data: {
					hotdogSausageId: $('#hotdogSausageId-${hotdogSausage.id}').val(),
					amount: toUnicode($('#hotdogSausageAmount-${hotdogSausage.id}').val()),
					price: $('#hotdogSausagePrice-${hotdogSausage.id}').val()
				}
			}).done(function(hotdogSausageAmountAndPrice) {
				$('#hotdog-sausage-amount-and-price-${hotdogSausage.id}').append('<option value=' + hotdogSausageAmountAndPrice.id + ' selected="selected">' + hotdogSausageAmountAndPrice.portion + ' - ' + parseFloat(Math.round(hotdogSausageAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
				$('#myModal-${hotdogSausage.id}').modal('hide');
				alertify.success("Data has been saved");
			});
		});
		$('#hotdog-sausage-amount-and-price-select-item-remove-${hotdogSausage.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
				if (e) {
					var url = 'remove-hotdog-sausage-amount-and-price';
					$.ajax({
						url: url,
						data: {
							hotdogSausageAmountAndPriceId: $('#hotdog-sausage-amount-and-price-${hotdogSausage.id}').val()
						}
					}).done(function() {
						$("#hotdog-sausage-amount-and-price-${hotdogSausage.id} option[value=" + $('#hotdog-sausage-amount-and-price-${hotdogSausage.id}').val() + "]").remove();
						alertify.error("Data has been removed");
					});			
				}
			});
		});
		$('#hotdog-sausage-remove-btn-${hotdogSausage.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
			    if (e) {
			    	var url = 'remove-hotdog-sausage';
					$.ajax({
						url: url,
						data: {hotdogSausageId: '${hotdogSausage.id}'}
					}).done(function() {
						$('.hotdog-sausage-${hotdogSausage.id }').remove();
						alertify.error("Data has been removed");
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
