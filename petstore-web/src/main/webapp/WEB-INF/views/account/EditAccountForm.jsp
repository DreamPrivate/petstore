<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
<form method="post" action="${ctx}/account/editAccount">

	<h3>User Information</h3>

	<table>
		<tr>
			<td>User ID:</td>
			<td>${accountBean.account.username}<input type="hidden" name="username" value="${accountBean.account.username}"/></td>
		</tr>
		<tr>
			<td>New password:</td>
			<td><input type="password" name="password" value="${accountBean.account.password}" /></td>
		</tr>
		<tr>
			<td>Repeat password:</td>
			<td><input type="password" name="repeatedPassword" /></td>
		</tr>
	</table>
	<%@ include file="IncludeAccountFields.jsp"%>

	<input type="submit" name="editAccount" value="Save Account Information" />

</form> 
<a href="${ctx}/order/listOrders">My Orders</a>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>
