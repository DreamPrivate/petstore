<c:if test="${!empty accountBean.myList}">
	<p>Pet Favorites <br />
	Shop for more of your favorite pets here.</p>
	<ul>
		<c:forEach var="product" items="${accountBean.myList}">
			<li><a href="${ctx}/catalog/viewProduct?productId=${product.productId}">
			${product.name}
		</a> (${product.productId})</li>
		</c:forEach>
	</ul>

</c:if>
