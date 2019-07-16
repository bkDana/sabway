<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Header --%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>

<%-- content --%>
<section id="content-wrapper">
	<div class="area">
		<strong style="font-size:40px;">내 주문 </strong>
		<br><br>
			<table class="comm-tbl type2">
				<tr>
					<th>주문 일시</th><th>메뉴</th><th>수량</th><th>가격</th><th>나만의 메뉴</th>
				</tr>
				<c:forEach items="${list }" var="bucket" varStatus="status">
				
				<div class="hiddenInfo">
	 				<input type="hidden" class="hiddenBread" value="${bucket.bucBread }">
					<input type="hidden" class="hiddenMain" value="${bucket.bucMain }">
					<input type="hidden" class="hiddenVegi" value="${bucket.bucVegi }">
					<input type="hidden" class="hiddenCheese" value="${bucket.bucCheese }">
					<input type="hidden" class="hiddenSource" value="${bucket.bucSource }">
					<input type="hidden" class="hiddenSide" value="${bucket.bucSide }">
					<input type="hidden" class="hiddenIsSalad" value="${bucket.bucIsSalad }">
					<input type="hidden" class="hiddenIsOvened" value="${bucket.bucIsOvened }">
					<input type="hidden" class="hiddenSet" value="${bucket.bucSet }">
				</div>
				<tr>
					<td>${bucket.bucRegDate }</td>
					<td class="bucketOption">
						<c:if test='${bucIsSalad eq "샌드위치" }'>
							빵 : ${bucket.bucBread }<br>
						</c:if>
							메인재료 : ${bucket.bucMain }<br>
							치즈 : ${bucket.bucCheese }
					</td>
					<td>수량 : ${bucket.bucQuantity }</td>
					<td>${bucket.bucCost }￦</td>
					<td><button type="submit" style="font-size:15px; font-weight:bolder; color:#009233;'">나만의 메뉴로 만들기</button></td>
				</tr>

				</c:forEach>
			</table>
		
	</div>
</section>
<!-- <script src="/resources/js/bucketList.js" type="text/javascript"></script>  -->
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />