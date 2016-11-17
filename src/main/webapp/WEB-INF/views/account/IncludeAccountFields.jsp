<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<h3>Account Information</h3>

<table>
	<tr>
		<td>First name:</td>
		<td><input type="text" name="firstName" value="${accountBean.account.firstName}" /></td>
	</tr>
	<tr>
		<td>Last name:</td>
		<td><input type="text" name="lastName" value="${accountBean.account.lastName}" /></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><input type="text" size="40" name="email" value="${accountBean.account.email}" /></td>
	</tr>
	<tr>
		<td>Phone:</td>
		<td><input type="text" name="phone" value="${accountBean.account.phone}" /></td>
	</tr>
	<tr>
		<td>Address 1:</td>
		<td><input type="text" size="40" name="address1" value="${accountBean.account.address1}" /></td>
	</tr>
	<tr>
		<td>Address 2:</td>
		<td><input type="text" size="40" name="address2" value="${accountBean.account.address2}" /></td>
	</tr>
	<tr>
		<td>City:</td>
		<td><input type="text" name="city" value="${accountBean.account.city}" /></td>
	</tr>
	<tr>
		<td>State:</td>
		<td><input type="text" size="4" name="state" value="${accountBean.account.state}" /></td>
	</tr>
	<tr>
		<td>Zip:</td>
		<td><input type="text" size="10" name="zip" value="${accountBean.account.zip}" /></td>
	</tr>
	<tr>
		<td>Country:</td>
		<td><input type="text" size="15" name="country" value="${accountBean.account.country}" /></td>
	</tr>
</table>

<h3>Profile Information</h3>

<table>
	<tr>
		<td>Language Preference:</td>
		<td>
			<select name="languagePreference">
				<c:forEach items="${accountBean.languages}" var="language">
					<c:if test="${accountBean.account.languagePreference == language}">
						<option value="${language}" label="${language}" selected="selected" />
					</c:if>
					<c:if test="${accountBean.account.languagePreference != language}">
						<option value="${language}" label="${language}" />
					</c:if>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>Favourite Category:</td>
		<td>
			<select name="favouriteCategoryId">
				<c:forEach items="${accountBean.categories}" var="category">
					<c:if test="${accountBean.account.favouriteCategoryId == category}">
						<option value="${category}" label="${category}" selected="selected" />
					</c:if>
					<c:if test="${accountBean.account.favouriteCategoryId != category}">
						<option value="${category}" label="${category}" />
					</c:if>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>Enable MyList</td>
		<td><input type="checkbox" name="listOption" 
			<c:if test="${accountBean.account.listOption}">
				checked="checked" 
			</c:if>
		/></td>
	</tr>
	<tr>
		<td>Enable MyBanner</td>
		<td><input type="checkbox" name="bannerOption" 
			<c:if test="${accountBean.account.bannerOption}">
				checked="checked" 
			</c:if>
		/></td>
	</tr>

</table>
