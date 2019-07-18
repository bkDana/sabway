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
		<strong style="font-size:40px;">나만의 메뉴 </strong>
		<br><br>
		<c:forEach items="${list }" var="bucket" varStatus="status">
			<div class="hiddenInfo">
				<input type="hidden" class="hiddenBucIdx" value="${bucket.bucIdx }">
				<form action="/insertMyMenu.do" class="myMenu" method="post">
					<input type="hidden" class="hiddenCost" value="${bucket.bucCost }">
					<input type="hidden" class="hidenBranchName" value="${bucket.bucBranch }">
					<input type="hidden" class="hiddenBucCustomerIdx" name="mmCustomerNo" value="${bucket.bucCustomerIdx }">
	 				<input type="hidden" class="hiddenBread" name="mmBread" value="${bucket.bucBread }">
					<input type="hidden" class="hiddenMain" name="mmMain" value="${bucket.bucMain }">
					<input type="hidden" class="hiddenVegi" name="mmVegi" value="${bucket.bucVegi }">
					<input type="hidden" class="hiddenCheese" name="mmCheese" value="${bucket.bucCheese }">
					<input type="hidden" class="hiddenTopping" name="mmTopping" value="${bucket.bucTopping }">
					<input type="hidden" class="hiddenSource" name="mmSource" value="${bucket.bucSource }">
					<input type="hidden" class="hiddenIsSalad" name="mmIsSalad" value="${bucket.bucIsSalad }">
					<input type="hidden" class="hiddenIsOvened" name="mmIsOvened" value="${bucket.bucIsOvened }">
					<input type="hidden" class="hiddenSet" name="mmSet" value="${bucket.bucSet }">
					<input type="hidden" class="hiddenSide" name="mmSide" value="${bucket.bucSide }">
					<input type="hidden" class="hiddenKcal" name="mmKcal" value="${bucket.bucKcal }">
					<input type="hidden" class="hiddenQuantity" name="mmQuantity" value="${bucket.bucQuantity }">
					<!-- <input type="hidden" class="hiddenCusoIdx" name="itemCusoIdx" value=""> -->
					<input type="submit" class="myMenu" style="display:none;">
				</form>
				
				<c:if test="${status.index eq 0 }">
					<div class="hiddenOrder">
						<form action="/insertItem.do" method="post">
							<input type="hidden" name="cusoTotalCost" value="">
							<input type="hidden" name="cusoPhone" value="">
							<input type="hidden" name="cusoMemberNo" value="${bucket.bucCustomerIdx }">
							<input type="hidden" name="cusoOrderNo" value="">
							<input type="hidden" name="cusoBranchName" value="${bucket.bucBranch }">
							<input type="submit" id="insertOrder" style="display:none;">
						</form>
		 			</div> 
				</c:if>
			</div>
		</c:forEach>
			
		<table class="comm-tbl type2">
			<tr>
				<th>지점명</th><th>메뉴</th><th>수량</th><th>가격</th><th>주문하기</th><th>메뉴삭제</th>
			</tr>
			<c:forEach items="${list }" var="bucket" varStatus="status">
			<tr>
				<td>???</td>
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
				<td><span class="cost">${bucket.bucCost }</span>원</td>
				<td><button type="button" class="insertMyMenu" style="font-size:15px; font-weight:bolder; color:#009233;'">개별 주문하기</button></td>
				<td><button type="button" onclick="deleteMenu(this)" style="font-size:15px; font-weight:bolder; color:red;">삭제하기</button></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6">
					<div class="common-tbl-btn-group">
						<button type="submit" id="sbmOrder" class="btn-style2">모두 주문하기</button>
					</div>
				</td>
			</tr>
		</table>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />