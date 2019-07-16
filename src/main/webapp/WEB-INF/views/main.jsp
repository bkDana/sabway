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
				<c:choose>
						<c:when test="${empty sessionScope.mgr.mgrId }">
							<a href="/loginAdmin.do" style="float:right;margin-right:60px;">관리자 로그인</a>
						</c:when>
						<c:otherwise>
							<div style="float:right;margin-right:60px;">
								<a href="/adminPage.do">${sessionScope.mgr.mgrName }</a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/adminLogout.do">로그아웃</a>
							</div>
						</c:otherwise>
				</c:choose>		
			</fieldset>
		</c:otherwise>
	</c:choose>
		<h1>온라인 주문</h1><img src="/resources/img/img_recipe_b02.jpg" onclick="location.href='/cusOrder.do';" style="cursor:pointer;"><br>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />