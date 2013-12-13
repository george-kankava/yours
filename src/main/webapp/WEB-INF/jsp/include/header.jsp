<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="header">
	<ul class="nav nav-pills pull-right">
		<li id="food-components-list"><a href="food-components-list"><spring:message code="yours.food.service.ingredients" text="Ingredient" /></a></li>
		<li id="meals-list"><a href="meals-list"><spring:message code="yours.food.service.meals" text="Meals" /></a></li>
		<li id="customer-info"><a href="customer-info"><spring:message code="yours.food.service.personal.data" text="Personal Data" /></a></li>
		<li><a href="j_spring_security_logout">Logout</a></li>
	</ul>
	<h3 class="text-muted">Yours.ge</h3>
	<c:choose>
		<c:when test="${param.pageName eq 'customer-info'}">
			<script>
				$('#customer-info').addClass('active');			
			</script>
		</c:when>
		<c:when test="${param.pageName eq 'food-components-list'}">
			<script>
				$('#food-components-list').addClass('active');
			</script>
		</c:when>
		<c:when test="${param.pageName eq 'meals-list'}">
			<script>
				$('#meals-list').addClass('active');
			</script>
		</c:when>
</c:choose>
</div>