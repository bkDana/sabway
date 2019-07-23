<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 주문관리 > 주문 목록</div>
		
		<table class="comm-tbl" style="margin: 0;">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>	
			<tr>
				<th>주문자</th>
				<td>${cusOrder.cusoCallBy }</td>
			</tr>
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
		<p class="sub-title">주문 상품</p>
		<table class="comm-tbl type2">
			<colgroup>
				<col width="8%">
				<col width="10%">
				<col width="8%">
				<col width="8%">
				<col width="8%">
				<col width="5%">
				<col width="10%">
				<col width="3%">
				<col width="5%">
				<col width="5%">
				<col width="3%">
				<col width="5%">
				<col width="5%">
			</colgroup>
			<tr>
				<th>빵</th>
				<th>메인재료</th>
				<th>채소</th>
				<th>치즈</th>
				<th>소스</th>
				<th>추가토핑</th>
				<th>사이드메뉴</th>
				<!-- <th>샐러드냐?</th> -->
				<th>오븐</th>
				<th>세트</th>
				<th>칼로리</th>
				<th>수량</th>
				<th>할인여부</th>
				<th>금액</th>
			</tr>
			<c:forEach items="${cusOrder.bucketList }" var="bucket">
				<tr>
					<td>
						<c:if test="${bucket.bucIsSalad eq '샌드위치'}">
							${fn:split(bucket.bucBread,',')[0] }<br>
							(${fn:split(bucket.bucBread,',')[1] }cm)
						</c:if>
						<c:if test="${bucket.bucIsSalad eq '샐러드'}">-</c:if>
					</td>
					<td>${bucket.bucMain }</td>
					<td>
						<c:set var="vegi" value="${fn:split(bucket.bucVegi,',')}" />
						<c:forEach items="${vegi }" var="v">
							${v }<br>
						</c:forEach>
					</td>
					<td>
						<c:choose>
							<c:when test="${bucket.bucCheese eq '선택안함'}">-</c:when>
							<c:otherwise>
								${bucket.bucCheese }
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${bucket.bucSource eq '소스 선택안함'}">-</c:when>
							<c:otherwise>
								<c:set var="source" value="${fn:split(bucket.bucSource,',')}" />
								<c:forEach items="${source }" var="s">
									${s }<br>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${bucket.bucTopping eq '토핑 선택안함'}">-</c:when>
							<c:otherwise>
								<c:set var="topping" value="${fn:split(bucket.bucTopping,',')}" />
								<c:forEach items="${topping }" var="t">
									${t }<br>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${bucket.bucSide eq '사이드 선택안함'}">-</c:when>
							<c:otherwise>
								<c:set var="side" value="${fn:split(bucket.bucSide,',')}" />
								<c:forEach items="${side }" var="s">
									${s }<br>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</td>
					<%-- <td>${bucket.bucIsSalad }</td> --%>
					<td>
						<c:if test="${bucket.bucIsOvened eq 0}">O</c:if>
						<c:if test="${bucket.bucIsOvened eq 1}">X</c:if>
					</td>
					<td>${bucket.bucSet }</td>
					
					<td>${bucket.bucKcal }Kcal</td>
					<td>${bucket.bucQuantity }</td>
					<td>
						<c:choose>
							<c:when test="${bucket.bucDiscntRate eq 0}">-</c:when>
							<c:otherwise>${bucket.bucDiscntRate }%</c:otherwise>
						</c:choose>
					</td>
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