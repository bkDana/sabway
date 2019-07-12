<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Header --%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>

<%-- content --%>
<section id="content-wrapper">
	<div class="area">
		<h1>내 주문정보</h1>
		<c:forEach items="${list }" var="bucket" varStatus="status">
			<table>
				<tr>
					<th>주문 일시</th><th>메뉴</th><th>수량</th><th>가격</th>
				</tr>
				<tr>
					<td>${bucket.bucRegDate }</td><td>${bucket.bucMain }</td><td>${bucket.bucQuantity }</td>
					<td>${bucket.bucCost }</td>
				</tr>
			</table>
		</c:forEach>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />