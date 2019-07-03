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

			<table class="comm-tbl type2">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<th>상태</th>
					<td>
						<c:if test="${order.mOrderState eq 0}">접수완료</c:if>
						<c:if test="${order.mOrderState eq 1}">출고완료</c:if>
						<c:if test="${order.mOrderState eq 2}">도착</c:if>
						<c:if test="${order.mOrderState eq 3}">취소</c:if>
					</td>
				</tr>
				<tr>
					<td>발주 등록일</td><td>${order.mOrderDate }</td>
				</tr>
				<tr>
					<td>도착(희망?)일</td><td>${order.mOrderDelDate }</td>
				</tr>
			</table>
			<br><br><br><br><br><br>
			<h1>물품 내역</h1>
			<table class="comm-tbl type2">
				<colgroup>
					<col width="80%">
					<col width="20%">
				</colgroup>
				<tr>
					<th>물품명</th><th>단위별 수량</th>
				</tr>
				<c:forEach items="${order.itemList }" var="item">
					<tr>
					<td>${item.mItemName }</td><td>${item.mItemAmount }</td>
				</tr>
				</c:forEach>
			</table>
			<div class="common-tbl-btn-group">
				<button class="btn-style2" type="button" onclick="history.back();">뒤로가기</button>
			</div>
	</div>
</section>

<script>


</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />