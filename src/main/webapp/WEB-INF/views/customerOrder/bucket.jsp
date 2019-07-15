<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Header --%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<style>
	.bucketImg{
		width:200px;
	}
</style>
<%-- content --%>
<section id="content-wrapper">
	<div class="area">
			<table class="comm-tbl type2">
				<tr>
					<td colspan="5" style="background-color:#f6f5f6;"><strong style="font-size:40px; float:left;">카트</strong><br><br></td><td style="background-color:#f6f5f6;"><button type="submit" style="font-size:15px; font-weight:bolder; color:red; float:right; margin-top:20px;">카트 모두 삭제</button></td>
				</tr>
				<tr>
					<th>주문 일시</th><th>메뉴</th><th>옵션</th><th>수량</th><th>가격</th><th>삭제하기</th>
				</tr>
				<c:forEach items="${list }" var="bucket" varStatus="status">
				
				<%-- <div class="hiddenInfo">
 				<input type="hidden" class="hiddenBread" value="${bucket.bucBread }">
				<input type="hidden" class="hiddenMain" value="${bucket.bucMain }">
				<input type="hidden" class="hiddenVegi" value="${bucket.bucVegi }">
				<input type="hidden" class="hiddenCheese" value="${bucket.bucCheese }">
				<input type="hidden" class="hiddenSource" value="${bucket.bucSource }">
				<input type="hidden" class="hiddenSide" value="${bucket.bucSide }">
				<input type="hidden" class="hiddenIsSalad" value="${bucket.bucIsSalad }">
				<input type="hidden" class="hiddenIsOvened" value="${bucket.bucIsOvened }">
				<input type="hidden" class="hiddenSet" value="${bucket.bucSet }">
				</div> --%>
				<tr>
					<td>${bucket.bucRegDate }</td>
					<td class="itemImg">
						<img alt="메인메뉴 이미지" class="bucketImg" src="${bucket.bucMain }">
					</td>
					<td class="bucketOption">
					</td>
					<td>
						<option name="quantity">
							<select value="1">1</select>
							<select value="2">2</select>
							<select value="2">2</select>
						</option>
					</td>
					<td>${bucket.bucCost }￦</td>
					<td><button type="button" style="font-size:15px; font-weight:bolder; color:#009233;">삭제하기</button></td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan="6">
						<button type="submit" style="border:1px solid grey; font-size:30px; font-weight:bolder; color:#009233;">주문하기</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" style="border:1px solid grey; font-size:30px; font-weight:bolder; color:#ffc20d;">메뉴추가 +</button>
					</td>
				</tr>
			</table>
		
	</div>
</section>
<!-- <script src="/resources/js/bucketList.js" type="text/javascript"></script>  -->
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />