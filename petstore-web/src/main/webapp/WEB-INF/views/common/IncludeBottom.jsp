</div>

<div id="Footer">

<div id="PoweredBy">&nbsp;<a href="http://www.mybatis.org">www.mybatis.org</a>
</div>

<div id="Banner"><c:if test="${accountBean != null }">
	<c:if test="${accountBean.authenticated}">
		<c:if test="${accountBean.account.bannerOption}">
          ${accountBean.account.bannerName}
        </c:if>
	</c:if>
</c:if></div>

</div>

</body>
</html>