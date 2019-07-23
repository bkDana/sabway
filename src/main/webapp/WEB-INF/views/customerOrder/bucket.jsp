<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Header --%>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- 아임포트 api 추가 -->
<script type="text/javascript" src="/resources/js/bucket.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" />
<%-- content --%>
<section id="content-wrapper">
	<div class="area" style="min-height:481px;">
		<strong style="font-size:40px;">내 주문 </strong>
		<br><br>
		<c:forEach items="${list }" var="bucket" varStatus="status">
			<div class="hiddenInfo">			
				<input type="hidden" class="hiddenVegi" value="${bucket.bucVegi }">
				<input type="hidden" class="hiddenBread" value="${bucket.bucBread }">
				<input type="hidden" class="hiddenCheese" value="${bucket.bucCheese }">
				<input type="hidden" class="hiddenTopping" value="${bucket.bucTopping }">
				<input type="hidden" class="hiddenSource" value="${bucket.bucSource }">
				<input type="hidden" class="hiddenIsSalad" value="${bucket.bucIsSalad }">
				<input type="hidden" class="hiddenIsOvened" value="${bucket.bucIsOvened }">
				<input type="hidden" class="hiddenSet" value="${bucket.bucSet }">
				<input type="hidden" class="hiddenSide" value="${bucket.bucSide }">
				<input type="hidden" class="hiddenKcal" value="${bucket.bucKcal }">
				<input type="hidden" class="hiddenQuantity" value="${bucket.bucQuantity }">
				<input type="hidden" class="hiddenChkMM" value="${bucket.bucChkMM }">
				<form action="/insertMyMenu.do" class="myMenuInsert" method="post">
					<input type="hidden" class="hiddenBucIdx" name="mmBucIdx" value="${bucket.bucIdx }">
					<input type="hidden" class="hiddenBucCustomerIdx" name="mmCustomerNo" value="${bucket.bucCustomerIdx }">	 				
					<input type="hidden" class="hiddenMain" name="mmMenuLabel" value="${bucket.bucMain } ${bucket.bucIsSalad }">
					<!-- <input type="hidden" class="hiddenCusoIdx" name="itemCusoIdx" value=""> -->
					<input type="submit" class="sbmMyMenu" style="display:none;">
				</form>
				<form action="tempOrderDelete.do" class="myMenu" method="post">
					<input type="hidden" class="hiddenBucIdx" name="bucIdx" value="${bucket.bucIdx }">
					<input type="submit" class="sbmMyMenu" style="display:none;">
				</form>
				
				<c:if test="${status.index eq 0 }">
					<div class="hiddenOrder">
						<form id="insertOrder" action="/insertOrder.do" method="post">
							<input type="hidden" name="cusoTotalCost" value="">
							<input type="hidden" name="cusoPhone" value="">
							<input type="hidden" name="cusoMemberNo" value="${bucket.bucCustomerIdx }">
							<input type="hidden" name="cusoOrderNo" value="">
							<input type="hidden" name="cusoBranchName" value="">
							<input type="hidden" name="cusoCallBy" value="">
							<!-- <input type="submit" id="insertOrder" style="display:none;"> -->
						</form>
		 			</div> 
				</c:if>
			</div>
		</c:forEach>
				
		<table class="comm-tbl type2">
			<colgroup>
				<col width="3%">
				<col width="7%">
				<col width="12%">
				<col width="30%">
				<col width="5%">
				<col width="8%">
				<col width="10%">
				<col width="8%">
			</colgroup>
			<tr>
				<th><input type="checkbox" class="addAll"></th>
				<th>담은 날짜</th><th>지점명</th><th>메뉴</th><th>수량</th><th>가격</th><th>나만의 메뉴</th><th>상품삭제</th>
			</tr>
			<c:forEach items="${list }" var="bucket" varStatus="status">
			<tr>
				<td><input type="checkbox" class="addOrder"></td>
				<td>${bucket.bucRegDate }</td>
				<td class="branch">${bucket.bucBranch }</td>
				<td class="bucketOption">
						<span class="bread">빵 : ${bucket.bucBread }</span><br>
						<span class="main">메인재료 : ${bucket.bucMain }&nbsp;${bucket.bucIsSalad }</span><br>
						<span class="cheese">치즈 : ${bucket.bucCheese }</span><br>
						<span class="topping"></span><br>
						<span class="oven"></span><br>
						<span class="vegi"></span><br>
						<span class="source"></span><br>
						<span class="set">세트종류 : ${bucket.bucSet }</span><br>
						<span class="side"></span>
				</td>
				<td>수량 : ${bucket.bucQuantity }</td>
				<td><span class="cost">${bucket.bucCost * bucket.bucQuantity }</span>원</td>
				<td><button type="button" class="insertMyMenu" style="font-size:15px; font-weight:bolder; color:#009233;'">나만의 메뉴 만들기</button></td>
				<td><button type="button" class="deleteBucket" style="font-size:15px; font-weight:bolder; color:red;">삭제하기</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="8">
					<div class="common-tbl-btn-group">
						<strong style="float:left;">* '나만의 메뉴'를 등록하시면 이후 옵션 선택없이 빠른 주문이 가능합니다</strong><br>
						
						<!-- <button type="submit" id="sbmTest" class="btn-style2">컨트롤러테스트</button> -->
						<button type="button" id="sbmOrder" class="btn-style2">주문하기</button>
					</div>
				</td>
			</tr>
		</table>
		<input type="hidden" id="sessionPhone" value="${sessionScope.customer.phone }">
		<input type="hidden" id="sessionNick" value="${sessionScope.customer.customerNick }">
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />