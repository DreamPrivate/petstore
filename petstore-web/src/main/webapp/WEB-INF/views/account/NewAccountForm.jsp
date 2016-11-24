<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
<form method="post" action="${ctx}/account/newAccount">

	<h3>User Information</h3>

	<table>
		<tr>
			<td>User ID:</td>
			<td><input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>New password:</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>Repeat password:</td>
			<td><input type="password" name="repeatedPassword" /></td>
		</tr>
	</table>

	<%@ include file="IncludeAccountFields.jsp"%>

	<input type="submit" name="newAccount" value="Save Account Information" />

</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>