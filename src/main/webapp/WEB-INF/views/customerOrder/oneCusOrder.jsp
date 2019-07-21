<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" /><!-- 서브메뉴 추가했습니다 -->
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<div class="area">
		<h1 class="comm-content-tit">내 주문내역</h1>
		<table class="comm-tbl" style="max-width:1200px">
			<colgroup>
				<col width="3%">
				<col width="7%">
				<col width="7%">
				<col width="14%">
				<col width="13%">
				<col width="10%">
				<col width="8%">
				<col width="6%">
				<col width="11%">
			</colgroup>	
			<tr>
				<th>No.</th><th>금액</th><th>주문번호</th><th>지점명</th><th>주문 날짜</th><th>상태</th>
			</tr>
			<c:forEach items="${list }" var="cusOrder" varStatus="i">
				<input type="hidden" name="cusoIdx" value="${cusOrder.cusoIdx }">
				<tr>
					<td>
						${i.count }
					</td>
					<td>
						<input type="hidden" name="cusoTotalCost" value="${cusOrder.cusoTotalCost }">
						${cusOrder.cusoTotalCost }원
					</td>
					<td>
						<input type="hidden" name="cusoOrderNo" value="${cusOrder.cusoOrderNo }">
						${cusOrder.cusoOrderNo }
					</td>
					<td>
						<input type="hidden" name="cusoBranch" value="${cusOrder.cusoBranch }">
						${cusOrder.cusoBranch }
					</td>
					<td>
						<input type="hidden" name="cusoOrderDate" value="${cusOrder.cusoOrderDate }">
						${cusOrder.cusoOrderDate }
					</td>
					<!-- 주문 상태 (접수전: 0, 접수완료: 1, 수령완료:2, 취소: -1(취소는 접수 전에만 가능) ) -->
					<c:if test="${cusOrder.cusoOrderState == 1}">
						<td>접수 완료</td>
					</c:if>
					<c:if test="${cusOrder.cusoOrderState == 2}">
						<td>수령 완료</td>
					</c:if>
					<c:if test="${cusOrder.cusoOrderState == 0}">
						<td>접수 전<br><a href="/cancelOrder.do">취소하기</a></td>
					</c:if>
					<c:if test="${cusOrder.cusoOrderState == -1}">
						<td>취소된 주문</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<!-- <div class="common-tbl-btn-group">
			<button class="btn-style2" style="font-size:15px;" id="adminLink">목록으로</button>
		</div> -->
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />