<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<script src="${ctx}/static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<link rel="StyleSheet" href="../css/jpetstore.css" type="text/css"
	media="screen" />

<meta name="generator"
	content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />
<title>JPetStore Demo</title>
<meta content="text/html; charset=utf-8"
	http-equiv="Content-Type" />
<meta http-equiv="Cache-Control" content="max-age=0" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="Pragma" content="no-cache" />
</head>

<body>

<div id="Header">

<div id="Logo">
<div id="LogoContent"><a href="${ctx}/catalog/viewMain">
	<img src="../images/logo-topbar.gif" />
</a></div>
</div>

<div id="Menu">
<div id="MenuContent"><a href="${ctx}/cart/viewCart">
	<img align="middle" name="img_cart" src="../images/cart.gif" />
</a> <img align="middle" src="../images/separator.gif" /> <c:if
	test="${accountBean == null}">
	<a href="${ctx}/account/signonForm">
          Sign In
	    </a>
</c:if> <c:if test="${accountBean != null}">
	<c:if test="${!accountBean.authenticated}">
		<a href="${ctx}/account/signonForm">
            Sign In
	      </a>
	</c:if>
</c:if> <c:if test="${accountBean != null}">
	<c:if test="${accountBean.authenticated}">
		<a href="${ctx}/account/signoff">
            Sign Out
	      </a>
		<img align="middle" src="../images/separator.gif" />
		<a href="${ctx}/account/editAccountForm">
            My Account
	      </a>
	</c:if>
</c:if> <img align="middle" src="../images/separator.gif" /> <a
	href="../help.html">?</a></div>
</div>

<div id="Search">
<div id="SearchContent"><form method="post" action="${ctx}/catalog/searchProducts">
	<input type="text" name="keyword" size="14" />
	<input type="submit" name="searchProducts" value="Search" />
</form></div>
</div>

<div id="QuickLinks"><a href="${ctx}/catalog/viewCategory?categoryId=FISH">
	<img src="../images/sm_fish.gif" />
</a> <img src="../images/separator.gif" /> 
<a href="${ctx}/catalog/viewCategory?categoryId=DOGS">
	<img src="../images/sm_dogs.gif" />
</a> <img src="../images/separator.gif" /> 
<a href="${ctx}/catalog/viewCategory?categoryId=REPTILES">
	<img src="../images/sm_reptiles.gif" />
</a> <img src="../images/separator.gif" /> 
<a href="${ctx}/catalog/viewCategory?categoryId=CATS">
	<img src="../images/sm_cats.gif" />
</a> <img src="../images/separator.gif" /> 
<a href="${ctx}/catalog/viewCategory?categoryId=BIRDS">
	<img src="../images/sm_birds.gif" />
</a></div>

</div>

<div id="Content">${msg}