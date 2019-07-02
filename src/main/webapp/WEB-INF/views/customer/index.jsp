<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="content-wrapper">
	<hr>
	<c:choose>
		<c:when test="${not empty sessionScope.customer }">
			[${sessionScope.customer.customerName }]<br>
			<a href="/logout.do">로그아웃</a>
		</c:when>
		<c:otherwise>
			<fieldset>
			<legend>로그인</legend>
			<form action="/login.do" method="post">
				ID : <input type="text" name="customerId"><br>
				PW : <input type="password" name ="customerPw"><br>
				<input type="submit" value="로그인">
				<a href="/enrollPage.do">회원가입</a>
				<a href="/views/map.jsp">지도</a>
				<a href="/views/map2.jsp">지도(테스트)</a>
			</form>	
	</fieldset>
		</c:otherwise>
	</c:choose>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />