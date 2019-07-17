<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<strong style="font-size:40px;">내 주문 </strong>
		<br><br>
		<c:forEach items="${listAfter }" var="bucket" varStatus="status">
			<div class="hiddenInfo">
				<input type="hidden" class="hiddenBucIdx" value="${bucket.bucIdx }">
				<input type="hidden" class="hiddenCost" value="${bucket.bucCost }">
				<input type="hidden" class="hidenBranchName" value="${bucket.bucBranch }">
				<input type="hidden" class="hiddenBucCustomerIdx" name="customerNo" value="${bucket.bucCustomerIdx }">
 				<input type="hidden" class="hiddenBread" name="itemBraed" value="${bucket.bucBread }">
				<input type="hidden" class="hiddenMain" name="itemMain" value="${bucket.bucMain }">
				<input type="hidden" class="hiddenVegi" name="itemVegi" value="${bucket.bucVegi }">
				<input type="hidden" class="hiddenCheese" name="itemCheese" value="${bucket.bucCheese }">
				<input type="hidden" class="hiddenTopping" name="itemTopping" value="${bucket.bucTopping }">
				<input type="hidden" class="hiddenSource" name="itemSource" value="${bucket.bucSource }">
				<input type="hidden" class="hiddenIsSalad" name="itemIsSalad" value="${bucket.bucIsSalad }">
				<input type="hidden" class="hiddenIsOvened" name="itemIsOvened" value="${bucket.bucIsOvened }">
				<input type="hidden" class="hiddenSet" name="itemIsSet" value="${bucket.bucSet }">
				<input type="hidden" class="hiddenSide" name="itemSide" value="${bucket.bucSide }">
				<input type="hidden" class="hiddenCusoIdx" name="itemCusoIdx" value="${bucket.bucCusoIdx }">
			</div>
		</c:forEach>
			<div class="hiddenOrder">
				<form action="/insertItem.do" method="post">
					<input type="hidden" name="cusoOrderState" value="0">
					<input type="hidden" name="cusoTotalCost" value=0>
					<input type="hidden" name="cusoPhone" value="">
					<input type="hidden" name="cusoMemberNo" value="${bucket.bucCustomerIdx }">
					<input type="hidden" name="cusoOrderNo" value="">
					<input type="hidden" name="cusoBranchName" value="${bucket.bucBranch }">
					<input type="submit" id="insertItem" style="display:none">
				</form>
 			</div> 
		<table class="comm-tbl type2">
			<tr>
				<th>주문 일시</th><th>지점명</th><th>메뉴</th><th>수량</th><th>가격</th><th>나만의 메뉴</th><th>상품삭제</th>
			</tr>
			<c:forEach items="${listAfter }" var="bucket" varStatus="status">
			<tr>
				<td>${bucket.bucRegDate }</td>
				<td>${bucket.bucBranch }</td>
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
		</table>
</body>
</html>