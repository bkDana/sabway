<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<%-- Content --%>

<img src="/resources/img/main_event.jpg">
<section id="content-wrapper">
	<div class="area">
	<c:choose>
		<c:when test="${not empty sessionScope.customer }">
			[${sessionScope.customer.customerName }]<br>
			<a href="/logout.do">로그아웃</a>
		</c:when>
		<c:otherwise>
			<fieldset>
				<a href="/index.do">로그인!!</a>		
			</fieldset>
		</c:otherwise>
	</c:choose>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />