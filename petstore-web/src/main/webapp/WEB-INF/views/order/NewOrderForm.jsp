<%@ include file="../common/IncludeTop.jsp"%>

<div id="Catalog">
<form id="newOrderForm" method="post">

	<table>
		<tr>
			<th colspan=2>Payment Details</th>
		</tr>
		<tr>
			<td>Card Type:</td>
			<td>
				<select name="cardType">
					<c:forEach items="${creditCardTypes}" var="cardType">
						<c:if test="${order.cardType == cardType}">
							<option value="${cardType}" label="${cardType}" selected="selected" />
						</c:if>
						<c:if test="${order.cardType != cardType}">
							<option value="${cardType}" label="${cardType}" />
						</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>Card Number:</td>
			<td><input type="text" name="creditCard" value="${order.creditCard}" /> * Use a fake
			number!</td>
		</tr>
		<tr>
			<td>Expiry Date (MM/YYYY):</td>
			<td><input type="text" name="expiryDate" value="${order.expiryDate}" /></td>
		</tr>
		<tr>
			<th colspan=2>Billing Address</th>
		</tr>

		<tr>
			<td>First name:</td>
			<td><input type="text" name="billToFirstName" value="${order.billToFirstName}" /></td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td><input type="text" name="billToLastName" value="${order.billToLastName}" /></td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td><input type="text" size="40" name="billAddress1" value="${order.billAddress1}" /></td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td><input type="text" size="40" name="billAddress2" value="${order.billAddress2}" /></td>
		</tr>
		<tr>
			<td>City:</td>
			<td><input type="text" name="billCity" value="${order.billCity}" /></td>
		</tr>
		<tr>
			<td>State:</td>
			<td><input type="text" size="4" name="billState" value="${order.billState}" /></td>
		</tr>
		<tr>
			<td>Zip:</td>
			<td><input type="text" size="10" name="billZip" value="${order.billZip}" /></td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><input type="text" size="15" name="billCountry" value="${order.billCountry}" /></td>
		</tr>

		<tr>
			<td colspan=2><input type="checkbox" name="shippingAddressRequired" />
			Ship to different address...</td>
		</tr>

	</table>

	<input type="button" name="newOrder" class="Button" onclick="formSubmit()"  value="Continue" />

</form></div>

<script type="text/javascript">
//<!--
	function formSubmit() {
		var isShipping = $("input[name='shippingAddressRequired']").prop("checked");
		var form = $("#newOrderForm");
		var actionUrl;
		if (true == isShipping) {
			actionUrl = "${ctx}/order/newShipping?orderSid=${orderSid}&shippingAddressRequired=true";
		}
		else {
			actionUrl = "${ctx}/order/newOrder?orderSid=${orderSid}";
		}
		form.attr("action", actionUrl);
		form.submit();
	}
//-->
</script>

<%@ include file="../common/IncludeBottom.jsp"%>