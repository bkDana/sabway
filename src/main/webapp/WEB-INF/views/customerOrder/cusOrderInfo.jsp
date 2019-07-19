<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 주문관리 > 주문 목록(회원)</div>
		
		<table class="comm-tbl">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>	
			<tr>
				<th>주문 상태</th>
				<td>
					<!-- 주문 상태 (접수전: 0, 접수완료: 1, 수령완료:2, 취소: -1(취소는 접수 전에만 가능) ) -->
					<c:if test="${cusOrder.cusoOrderState eq 0}">접수전</c:if>
					<c:if test="${cusOrder.cusoOrderState eq 1}">접수완료</c:if>
					<c:if test="${cusOrder.cusoOrderState eq 2}">수령완료</c:if>
					<c:if test="${cusOrder.cusoOrderState eq -1}">취소</c:if>
				</td>
			</tr>
			<tr>
				<th>결제 금액</th>
				<td><fmt:formatNumber value="${cusOrder.cusoTotalCost}" pattern="#,###.##"/>원</td>
			</tr>
			<tr>
				<th>주문자 연락처</th>
				<td>${cusOrder.cusoPhone }</td>
			</tr>
			<%-- <tr>
				<th>주문자번호??</th>
				<td>${cusOrder.cusoMemberNo }</td>
			</tr> 
			<tr>
				<th>주문번호</th>
				<td>${cusOrder.cusoOrderNo }</td>
			</tr>
			--%>
			<tr>
				<th>주문지점</th>
				<td>${cusOrder.cusoBranch }</td>
			</tr>
			<tr>
				<th>주문일</th>
				<td>${cusOrder.cusoOrderDate }</td>
			</tr>
		</table>
		<br>
		뭘 주문했나요
		<table class="comm-tbl type2">
			<tr>
				<th>빵</th>
				<th>메인재료</th>
				<th>채소</th>
				<th>치즈</th>
				<th>소스</th>
				<th>추가토핑</th>
				<th>사이드메뉴</th>
				<th>샐러드냐?</th>
				<th>오븐은?</th>
				<th>세트냐?</th>
				
				
				<th>칼로리</th>
				<th>수량</th>
				<th>할인여부</th>
				<th>금액</th>
			</tr>
			<c:forEach items="${cusOrder.bucketList }" var="bucket">
				<tr>
					<td>${bucket.bucBread }</td>
					<td>${bucket.bucMain }</td>
					<td>${bucket.bucVegi }</td>
					<td>${bucket.bucCheese }</td>
					<td>${bucket.bucSource }</td>
					<td>${bucket.bucTopping }</td>
					<td>${bucket.bucSide }</td>
					<td>${bucket.bucIsSalad }</td>
					<td>${bucket.bucIsOvened }</td>
					<td>${bucket.bucSet }</td>
					
					<td>${bucket.bucKcal }Kcal</td>
					<td>${bucket.bucQuantity }</td>
					<td>${bucket.bucDiscntRate }</td>
					<td><fmt:formatNumber value="${bucket.bucCost}" pattern="#,###.##"/>원</td>
					
				</tr>
			</c:forEach>
		</table>

		<div class="common-tbl-btn-group">
			<button class="btn-style2" onclick="history.back();">목록으로</button>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />