<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog"><form id="shippingForm" method="post" action="${ctx}/order/newShipping?orderSid=${orderSid}">

	<table>
		<tr>
			<th colspan=2>Shipping Address</th>
		</tr>

		<tr>
			<td>First name:</td>
			<td><input type="text" name="shipToFirstName" /></td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td><input type="text" name="shipToLastName" /></td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td><input type="text" size="40" name="shipAddress1" /></td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td><input type="text" size="40" name="shipAddress2" /></td>
		</tr>
		<tr>
			<td>City:</td>
			<td><input type="text" name="shipCity" /></td>
		</tr>
		<tr>
			<td>State:</td>
			<td><input type="text" size="4" name="shipState" /></td>
		</tr>
		<tr>
			<td>Zip:</td>
			<td><input type="text" size="10" name="shipZip" /></td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><input type="text" size="15" name="shipCountry" /></td>
		</tr>


	</table>

	<input type="submit" name="newOrder" value="Continue" />

</form></div>

<script type="text/javascript">
//<!--
	/* function formSubmit() {
		var order = JSON.parse('${order.toJson()}');
		var form = document.getElementById('shippingForm');
		for (var key in order) {
			//应该用排除法将当前页面已有的order字段排除，其他字段可加到隐藏域 
			if (null != order[key] && "" != order[key]) {
				var input = document.createElement('input');
				input.type = 'hidden';
				input.name = key;
				input.value = order[key];
				form.appendChild(input);
			}
		}
		form.submit();
	} */
//-->
</script>

<%@ include file="../common/IncludeBottom.jsp"%>