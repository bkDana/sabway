<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>

<section id="content-wrapper" class="clearfix">
	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 재고관리 > 발주 리스트</div>
		<table border="1">
			<tr>
				<th>NO</th><th>물품</th><th>발주일</th><th>상태</th>
			</tr>
			<tr>
				<td>1</td><td>~~~~</td><td>2019-06-28</td><td>도착</td>
			</tr>
			<tr>
				<td>2</td><td>~~~~</td><td>2019-06-28</td><td>도착</td>
			</tr>
			<tr>
				<td>3</td><td>~~~~</td><td>2019-06-28</td><td>도착</td>
			</tr>
			<tr>
				<td>4</td><td>~~~~</td><td>2019-06-28</td><td>도착</td>
			</tr>
			<tr>
				<td>5</td><td>~~~~</td><td>2019-06-28</td><td>도착</td>
			</tr>
			<c:forEach items="${list.orderList }" var="order">
				<tr>
					<td>?</td><td>${order.mOrderTitle }</td><td>${order.mOrderDate }</td><td>${order.mOrderState }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />