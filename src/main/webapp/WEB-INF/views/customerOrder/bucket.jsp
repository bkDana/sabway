<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Header --%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- 아임포트 api 추가 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<%-- content --%>
<section id="content-wrapper">
	<div class="area">
		<strong style="font-size:40px;">내 주문 </strong>
		<br><br>
		<table class="comm-tbl type2">
			<tr>
				<th>주문 일시</th><th>메뉴</th><th>수량</th><th>가격</th><th>나만의 메뉴</th><th>상품삭제</th>
			</tr>
			<c:forEach items="${list }" var="bucket" varStatus="status">
			<div class="hiddenInfo">
				<c:if test="${sessionScope.customer ne null }">
				<input type="hidden" class="hiddenBucCustomerIdx" value="${bucket.bucCustomerIdx }">
				</c:if>
				<input type="hidden" class="hiddenBucIdx" value="${bucket.bucIdx }">
 				<input type="hidden" class="hiddenBread" value="${bucket.bucBread }">
				<input type="hidden" class="hiddenMain" value="${bucket.bucMain }">
				<input type="hidden" class="hiddenVegi" value="${bucket.bucVegi }">
				<input type="hidden" class="hiddenCheese" value="${bucket.bucCheese }">
				<input type="hidden" class="hiddenTopping" value="${bucket.bucTopping }">
				<input type="hidden" class="hiddenSource" value="${bucket.bucSource }">
				<input type="hidden" class="hiddenIsSalad" value="${bucket.bucIsSalad }">
				<input type="hidden" class="hiddenIsOvened" value="${bucket.bucIsOvened }">
				<input type="hidden" class="hiddenSet" value="${bucket.bucSet }">
				<input type="hidden" class="hiddenSide" value="${bucket.bucSide }">
				<input type="hidden" class="hiddenCost" value="${bucket.bucCost }">
			</div>
			<tr>
				<td>${bucket.bucRegDate }</td>
				<td class="bucketOption">
						<span id="bread">빵 : ${bucket.bucBread }</span><br>
						<span id="main">메인재료 : ${bucket.bucMain }&nbsp;${bucket.bucIsSalad }</span><br>
						<span id="cheese">치즈 : ${bucket.bucCheese }</span><br>
						<span id="topping"></span><br>
						<span id="oven"></span><br>
						<span id="vegi"></span><br>
						<span id="source"></span><br>
						<span id="set">세트종류 : ${bucket.bucSet }</span><br>
						<span id="side"></span>
				</td>
				<td>수량 : ${bucket.bucQuantity }</td>
				<td><span class="cost">${bucket.bucCost }</span>￦</td>
				<td><button type="button" style="font-size:15px; font-weight:bolder; color:#009233;'">나만의 메뉴 만들기</button></td>
				<td><button type="button" onclick="deleteOrder(this)" style="font-size:15px; font-weight:bolder; color:red;">삭제하기</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6">
					<div class="common-tbl-btn-group">
						<!-- <button type="button" class="btn-style2 add-order">추가 주문</button> -->
						<button type="submit" id="sbmOrder" class="btn-style2">주문하기</button>
					</div>
				</td>
			</tr>
		</table>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />