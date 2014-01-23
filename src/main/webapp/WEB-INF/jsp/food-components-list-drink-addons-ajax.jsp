<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<thead>
	<tr>
		<th></th>
		<th colspan="1"><spring:message code="yours.food.service.food.components.list.drink.addon.title" text="Drink Addon"/></th>
		<th></th>
		<th></th>
	</tr>
</thead>
<c:forEach items="${drinkAddOns }" var="drinkAddOn">
	<tr>
		<td>
			<c:choose>
				<c:when test="${locale eq 'ka' }">
					<button id="drinkAddOnPopover${drinkAddOn.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${drinkAddOn.descriptionGeo }" data-original-title="" title="">
						<span class="glyphicon glyphicon-info-sign"></span>
				    </button>										
				</c:when>
				<c:when test="${locale eq 'en' }">
					<button id="drinkAddOnPopover${drinkAddOn.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${drinkAddOn.descriptionEng }" data-original-title="" title="">
						<span class="glyphicon glyphicon-info-sign"></span>
		    		</button>
				</c:when>
				<c:when test="${locale eq 'ru' }">
					<button id="drinkAddOnPopover${drinkAddOn.id}" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-placement="right" data-content="${drinkAddOn.descriptionRus }" data-original-title="" title="">
						<span class="glyphicon glyphicon-info-sign"></span>
		    		</button>
				</c:when>
			</c:choose>
		</td>
		<td class="td-50-percent">
			<div>
				<input name="drinkAddOn" type="checkbox" id="${drinkAddOn.id }">
				<c:choose>
					<c:when test="${locale eq 'ka' }">
						<label>${drinkAddOn.nameGeo }</label>										
					</c:when>
					<c:when test="${locale eq 'en' }">
						<label>${drinkAddOn.nameEng }</label>
					</c:when>
					<c:when test="${locale eq 'ru' }">
						<label>${drinkAddOn.nameRus }</label>
					</c:when>
				</c:choose>
			</div>
		</td>
		<td>
			<c:choose>
				<c:when test="${drinkAddOn.foodComponentImage ne null }">
					<button id="drinkAddOnImage${drinkAddOn.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='food-component-images/${drinkAddOn.foodComponentImage.imageFileName }' />" data-original-title="" title="">
						<span class="glyphicon glyphicon-film"></span>
		    		</button>	
				</c:when>
				<c:otherwise>
					<button id="drinkAddOnImage${drinkAddOn.id }" type="button" class="btn btn-link" data-trigger="hover" data-container="body" data-toggle="popover" data-html="true" data-placement="auto" data-content="<img src='resources/img/NoPhotoAvailable.jpg' />" data-original-title="" title="">
						<span class="glyphicon glyphicon-film"></span>
		    		</button>
				</c:otherwise>
			</c:choose>
    		<script>
    			$('#drinkAddOnImage${drinkAddOn.id }').popover();
    		</script>
		</td>
		<td class="td-50-percent">
			<select disabled class="form-control" id="drinkAddOnAmountAndPrice${drinkAddOn.id }">
				<c:forEach items="${drinkAddOn.drinkAddOnAmountAndPrices }" var="sizeAndPrice">
					<option ingredient-price="${sizeAndPrice.price }" value="${sizeAndPrice.id}">${sizeAndPrice.amount}</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<script>
	$('#drinkAddOnPopover${drinkAddOn.id}').popover();
	(function () {
    	var previousPrice = null;

    	$("#drinkAddOnAmountAndPrice${drinkAddOn.id }").mousedown(function () {
    		previousPrice = $(this.options[this.selectedIndex]).attr('ingredient-price');
    	}).change(function() {
    		drinkPrice -= parseFloat(previousPrice);
			var price = $(this.options[this.selectedIndex]).attr('ingredient-price');
			drinkPrice += parseFloat(price);
			$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
    	});
	})();
	$('input[name="drinkAddOn"]').each(function(){
	    var self = $(this),
	      label = self.next(),
	      label_text = label.text();

	    label.remove();
	    self.iCheck({
	      checkboxClass: 'icheckbox_line-blue',
	      radioClass: 'iradio_line-blue',
	      insert: '<div class="icheck_line-icon"></div>' + label_text
	    });
	  });
	$('input[name="drinkAddOn"]').on('ifChecked', function(event){
		var ingredientName = $(event.target.outerHTML).attr('name');
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).removeAttr('disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		drinkPrice += parseFloat(price);
		$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
	});
	$('input[name="drinkAddOn"]').on('ifUnchecked', function(event){
		var ingredientName = $(event.target.outerHTML).attr('name');
		var selectElement = $('#' + ingredientName + 'AmountAndPrice' + event.target.id);
		$(selectElement).attr('disabled', 'disabled');
		var price = $('#' + ingredientName + 'AmountAndPrice' + event.target.id + " :selected").attr('ingredient-price');
		drinkPrice -= parseFloat(price);
		$('#drinkPrice').text(parseFloat(Math.round(drinkPrice * 100) / 100).toFixed(2));
	});
	</script>
</c:forEach>