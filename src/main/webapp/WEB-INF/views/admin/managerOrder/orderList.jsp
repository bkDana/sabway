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
				<col width="20%">
				<col width="45%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>NO</th><th>지점명</th><th>상품</th><th>등록일</th><th>상태</th>
			</tr>
			<c:if test="${empty list.orderList }">
				<tr><td colspan="5">등록된 발주내역이 없습니다.</td></tr>
			</c:if>
			<c:forEach items="${list.orderList }" var="order">
				<tr onclick="location.href='/managerOrder/orderView.do?no=${order.mOrderNo}';" style="cursor:pointer;">
					<td>${order.rnum }</td><td>${order.mgrName }</td><td>${order.mOrderTitle }</td><td>${order.mOrderDate }</td>
					<td>
						<c:if test="${order.mOrderState eq 0}"><span class="state-reg">접수완료</span></c:if>
						<c:if test="${order.mOrderState eq 1}"><span class="state-out">출고완료</span></c:if>
						<c:if test="${order.mOrderState eq 2}"><span class="state-arr">도착</span></c:if>
						<c:if test="${order.mOrderState eq 3}"><span class="state-can">취소</span></c:if>
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