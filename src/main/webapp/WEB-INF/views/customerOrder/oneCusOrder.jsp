<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- 아임포트 api 추가 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" /><!-- 서브메뉴 추가했습니다 -->
<%-- Content --%>
<section id="content-wrapper">
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
				<col width="8%">
			</colgroup>	
			<tr>
				<th>No.</th><th>금액</th><th>주문번호</th><th>지점명</th><th>주문 날짜</th><th>상태 <span style="font-size:10px;">*'접수 전'에만 취소 가능합니다</span></th>
			</tr>
			<c:forEach items="${list }" var="cusOrder" varStatus="i">
				<input type="hidden" class="idx" value="${cusOrder.cusoIdx }">
				<tr>
					<td>
						${i.count }
					</td>
					<td>
						<input type="hidden" class="cost" value="${cusOrder.cusoTotalCost }">
						${cusOrder.cusoTotalCost }원
					</td>
					<td>
						<input type="hidden" class="cusoOrderNo" value="${cusOrder.cusoOrderNo }">
						${cusOrder.cusoOrderNo }
					</td>
					<td>
						<input type="hidden" value="${cusOrder.cusoBranch }">
						${cusOrder.cusoBranch }
					</td>
					<td>
						<input type="hidden" value="${cusOrder.cusoOrderDate }">
						${cusOrder.cusoOrderDate }
					</td>
					<!-- 주문 상태 (접수전: 0, 접수완료: 1, 수령완료:2, 취소: -1(취소는 접수 전에만 가능) ) -->
					<c:if test="${cusOrder.cusoOrderState == 1}">
						<td class="status">접수 완료</td>
					</c:if>
					<c:if test="${cusOrder.cusoOrderState == 2}">
						<td class="status">수령 완료</td>
					</c:if>
					<c:if test="${cusOrder.cusoOrderState == 0}">
						<td class="status">접수 전 &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<button type="button" class="cancelorder" style="color:red;">주문취소</button></td>
					</c:if>
					<c:if test="${cusOrder.cusoOrderState == -1}">
						<td class="status">취소된 주문</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		
		
		
		<!-- <div class="common-tbl-btn-group">
			<button class="btn-style2" style="font-size:15px;" id="adminLink">목록으로</button>
		</div> -->
	</div>
</section>
<script>
$(function(){
	$(".cancelorder").click(function() {
		var i = $('.cancelorder').index(this);
		console.log(i);
		var cusoOrderNo = $('.cusoOrderNo').eq(i).val();
		console.log(cusoOrderNo);
		
		$.ajax({
			url : "/cancelOrder.do",
			type : "post",
			data : {"cusoOrderNo" :cusoOrderNo},
			success : function(){
				$('.cancelorder').eq(i).empty();
				$('.cancelorder').eq(i).parent().html("취소요청 완료");
			}
		});
	});
});

</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />