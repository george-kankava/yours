<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h5>
	<span style="margin-left: 35px">Bread</span>
</h5>
<div class="col-md-3">
		<table class="table table-bordered">
			<tr>
				<td><input type="text" class="form-control" id="breadTypeGeo" placeholder="Bread Type Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="breadTypeEng" placeholder="Bread Type Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="breadTypeRus" placeholder="Bread Type Rus" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="breadDescGeo" placeholder="Bread Desc Geo" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="breadDescEng" placeholder="Bread Desc Eng" /></td>
			</tr>
			<tr>
				<td><input type="text" class="form-control" id="breadDescRus" placeholder="Bread Desc Rus" /></td>
			</tr>
			<tr>
				<td><button type="submit" id="hotdog-bread-add-btn" class="btn btn-default">Add</button></td>
			</tr>
		</table>
</div>
<div class="col-md-9">
	<table class="table table-bordered table-hotdog-breads">
			<thead>
				<tr>
					<th>Bread Type</th>
					<th>Bread Desc</th>
					<th colspan="3">Size And Price</th>
					<th>Remove</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${hotdogBreads }" var="hotdogBread">
					<tr class="hotdog-bread-${hotdogBread.id }">
						<td>
							<select class="form-control">
								<option>${hotdogBread.nameGeo }</option>
								<option>${hotdogBread.nameEng }</option>
								<option>${hotdogBread.nameRus }</option>
							</select>
						</td>
						<td>
							<select class="form-control">
								<option>${hotdogBread.descriptionGeo }</option>
								<option>${hotdogBread.descriptionEng }</option>
								<option>${hotdogBread.descriptionRus }</option>
							</select>
						</td>
						<td>
							<select id="hotdog-bread-size-and-price-${hotdogBread.id}" class="form-control">
								<c:forEach items="${hotdogBread.hotdogBreadSizeAndPrices }" var="hotdogBreadSizeAndPrice">
									<option value="${hotdogBreadSizeAndPrice.id }">${hotdogBreadSizeAndPrice.size } - ${hotdogBreadSizeAndPrice.price }</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<button id="hotdog-bread-size-and-price-select-item-remove-${hotdogBread.id }" type="button" class="btn btn-warning">Remove</button>
						</td>
						<td><a data-toggle="modal" href="#myModal-${hotdogBread.id}" class="btn btn-success">Add</a>
							<!-- Modal -->
  							<div class="modal fade" id="myModal-${hotdogBread.id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    							<div class="modal-dialog">
      								<div class="modal-content">
        								<div class="modal-header">
          									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          									<h4 class="modal-title">Add</h4>
        								</div>
        									<div class="modal-body">
        											<input type="hidden" id="hotdogBreadId-${hotdogBread.id}" name="hotdogBreadId" value="${hotdogBread.id}">
  													<div class="form-group">
    													<label for="hotdogBreadSize-${hotdogBread.id }">Size</label>
    													<input type="text" class="form-control" id="hotdogBreadSize-${hotdogBread.id}" name="size" placeholder="Enter Size">
													</div>
  													<div class="form-group">
    													<label for="hotdogBreadPrice-${hotdogBread.id }">Price</label>
    													<input type="text" class="form-control" id="hotdogBreadPrice-${hotdogBread.id}" name="price" placeholder="Enter Price">
  													</div>
        									</div>
        									<div class="modal-footer">
          										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          										<button type="button" id="my-modal-${hotdogBread.id}"  class="btn btn-primary">Add</button>
        									</div>
      								</div><!-- /.modal-content -->
    							</div><!-- /.modal-dialog -->
  							</div><!-- /.modal -->
						</td>
						<td><button id="hotdog-bread-remove-btn-${hotdogBread.id }" type="button" class="btn btn-danger">Remove</button></td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
</div>
<script>
	$('#hotdog-bread-add-btn').click(function() {
		var url = 'process-add-hotdog-bread-form';
		$.ajax({
			url: url,
			data: {
				nameGeo: $('#breadTypeGeo').val(),
				nameEng: $('#breadTypeEng').val(),
				nameRus: $('#breadTypeRus').val(),
				descriptionGeo: $('#breadDescGeo').val(),
				descriptionEng: $('#breadDescEng').val(),
				descriptionRus: $('#breadDescRus').val()
			}
		}).done(function(response) {
			$('#breadTypeGeo').val('');
			$('#breadTypeEng').val('');
			$('#breadTypeRus').val('');
			$('#breadDescGeo').val('');
			$('#breadDescEng').val('');
			$('#breadDescRus').val('');
			$('.table-hotdog-breads > tbody:last').append(response);
			alertify.success("Data has been saved");			
		});
	});
	<c:forEach items="${hotdogBreads }" var="hotdogBread">
		$('#my-modal-${hotdogBread.id}').click(function() {
			var url =  'process-hotdog-bread-price-and-size';
			$.ajax({
				url: url,
				data: {
					hotdogBreadId: $('#hotdogBreadId-${hotdogBread.id}').val(),
					size: $('#hotdogBreadSize-${hotdogBread.id}').val(),
					price: $('#hotdogBreadPrice-${hotdogBread.id}').val()
				}
			}).done(function(hotdogBreadSizeAndPrice) {
				$('#hotdog-bread-size-and-price-${hotdogBread.id}').append(new Option(hotdogBreadSizeAndPrice.size + '-' + hotdogBreadSizeAndPrice.price, '', false, true));
				$('#myModal-${hotdogBread.id}').modal('hide');
			});
		});
		$('#hotdog-bread-size-and-price-select-item-remove-${hotdogBread.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
				if (e) {
					var url = 'remove-hotdog-bread-size-and-price';
					$.ajax({
						url: url,
						data: {
							hotdogBreadSizeAndPriceId: $('#hotdog-bread-size-and-price-${hotdogBread.id}').val()
						}
					}).done(function() {
						$("#hotdog-bread-size-and-price-${hotdogBread.id} option[value=" + $('#hotdog-bread-size-and-price-${hotdogBread.id}').val() + "]").remove();
					});			
				}
			});
		});
		$('#hotdog-bread-remove-btn-${hotdogBread.id }').click(function() {
			alertify.confirm("Do you really want to remove this entry?", function (e) {
			    if (e) {
			    	var url = 'remove-hotdog-bread';
					$.ajax({
						url: url,
						data: {hotdogBreadId: '${hotdogBread.id}'}
					}).done(function() {
						$('.hotdog-bread-${hotdogBread.id }').remove();
					});			    	
			    } 
			});
		});
	</c:forEach>
</script>
