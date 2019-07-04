<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="content-wrapper">
	<hr>
<%-- 	<c:choose>
		<c:when test="${not empty sessionScope.customer }">
			[${sessionScope.customer.customerName }]<br>
			<a href="/logout.do">로그아웃</a>
		</c:when>
		<c:otherwise> --%>
			<fieldset>
			<legend>로그인</legend>
				<form action="/adminLogin.do" method="post">
					ID : <input type="text" name="mgrId"><br>
					PW : <input type="password" name ="mgrPw"><br>
					<input type="submit" value="로그인">
				</form>	
			</fieldset>
<%-- 		</c:otherwise>
	</c:choose> --%>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />