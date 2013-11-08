<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr class="sandwich-spice-${sandwichSpice.id }">
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
									<option value="${spiceAmountAndPrice.id}">${spiceAmountAndPrice.portion} - ${spiceAmountAndPrice.price }</option>
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
        								<form class="form-inline" role="form">
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
          										<button type="button" id="my-modal-${sandwichSpice.id}" class="btn btn-primary">Add</button>
        									</div>
        								</form>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="sandwich-spice-remove-btn-${sandwichSpice.id}" type="button" class="btn btn-danger">Remove</button></td>
					</tr>
					<script>
					$('#my-modal-${sandwichSpice.id}').click(function() {
						var url =  'process-sandwich-spice-amount-and-price';
						$.ajax({
							url: url,
							data: {
								sandwichSpiceId: $('#sandwichSpiceId-${sandwichSpice.id}').val(),
								amount: toUnicode($('#sandwichSpiceAmount-${sandwichSpice.id}').val()),
								price: $('#sandwichSpicePrice-${sandwichSpice.id}').val()
							}
						}).done(function(sandwichSpiceAmountAndPrice) {
							$('#sandwich-spice-amount-and-price-${sandwichSpice.id}').append('<option value=' + sandwichSpiceAmountAndPrice.id + ' selected="selected">' + sandwichSpiceAmountAndPrice.portion + ' - ' + parseFloat(Math.round(sandwichSpiceAmountAndPrice.price * 100) / 100).toFixed(2) + '</option>');
							$('#myModal-${sandwichSpice.id}').modal('hide');
							alertify.success("Data has been saved");
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
									alertify.error("Data has been removed");
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
									alertify.error("Data has been removed");
								});			    	
						    } 
						});
					});
					</script>