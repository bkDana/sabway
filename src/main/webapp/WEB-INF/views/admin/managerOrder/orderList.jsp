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
				<col width="5%">
				<col width="50%">
				<col width="35%">
				<col width="20%">
			</colgroup>
			<tr>
				<th>NO</th><th>상품</th><th>등록일</th><th>상태</th>
			</tr>
			<c:if test="${empty list.orderList }">
				<tr><td colspan="4">등록된 발주내역이 없습니다.</td></tr>
			</c:if>
			<c:forEach items="${list.orderList }" var="order">
				<tr onclick="location.href='/managerOrder/orderView.do?no=${order.mOrderNo}';" style="cursor:pointer;">
					<td>${order.rnum }</td><td>${order.mOrderTitle }</td><td>${order.mOrderDate }</td>
					<td>
						<c:if test="${order.mOrderState eq 0}">접수완료</c:if>
						<c:if test="${order.mOrderState eq 1}">출고완료</c:if>
						<c:if test="${order.mOrderState eq 2}">도착</c:if>
						<c:if test="${order.mOrderState eq 3}">취소</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- paging -->
		<div class="paging">
			${list.pageNavi }	
		</div>
	</div>
</section>

<form action="/managerOrder/orderList.do" method="post" name="movePage">
	<input type="hidden" name="reqPage">
</form>

<script>
	function list(p){
		$('input[name=reqPage]').val(p);
		movePage.submit();
	}
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />