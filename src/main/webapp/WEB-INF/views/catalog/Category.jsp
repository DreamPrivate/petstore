<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink"><a href="${ctx}/catalog/viewMain">
	Return to Main Menu</a></div>

<div id="Catalog">

<h2>${category.name}</h2>

<table>
	<tr>
		<th>Product ID</th>
		<th>Name</th>
	</tr>
	<c:forEach var="product" items="${productList}">
		<tr>
			<td><a href="${ctx}/catalog/viewProduct?productId=${product.productId}">
				${product.productId}
			</a></td>
			<td>${product.name}</td>
		</tr>
	</c:forEach>
</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>


