<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>

<section id="content-wrapper" class="clearfix">
	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 재고관리 > 발주 리스트</div>
		
		<div class="board-search-box order-search">
			<form action="/managerOrder/orderList.do" method="post" name="search">
				<input type="hidden" name="reqPage">
				<input type="text" name="startDay" class="searchdate search-day" value="${search.startDay }" readonly> ~ <input type="text" name="endDay" class="searchdate search-day" value="${search.endDay }" readonly>
				<br><br>
				<input type="text" name="delDay" class="datepicker search-day" value="${search.delDay }" readonly placeholder="희망배송일">
				
				<select name="state" data-val="${search.state }">
					<option value="">---발주상태---</option>
					<option value="0">접수완료</option>
					<option value="1">출고완료</option>
					<option value="2">도착</option>
					<option value="3">취소</option>
				</select>
				<br><br>
				<select name="searchType" data-val="${search.searchType }">
					<option value="no">지점명</option>
					<option value="">뭘해야될까?</option>
				</select>
				<input placeholder="검색어를 입력해주세요." type="search" name="searchVal" class="search-word" value="${search.searchVal }">
				<button type="submit" class="bbs-search-btn" title="검색">검색</button>
				&nbsp;<button type="button" onclick="location.href='/managerOrder/orderList.do'" class="bbs-search-btn" title="초기화">초기화</button>
			</form>
		</div>
		<br>
		<table class="comm-tbl type2">
			<colgroup>
				<col width="5%">
				<col width="20%">
				<col width="45%">
				<col width="20%">
				<col width="10%">
			</colgroup>
			<tr>
				<th>NO</th><th>지점명</th><th>상품</th><th>등록일</th><th>상태</th>
			</tr>
			<c:if test="${empty list.orderList }">
				<tr><td colspan="5">등록된 발주내역이 없습니다.</td></tr>
			</c:if>
			<c:forEach items="${list.orderList }" var="order">
				<tr onclick="location.href='/managerOrder/orderView.do?no=${order.mOrderNo}';" style="cursor:pointer;">
					<td>${order.rnum }</td><td>${order.mgrName }</td><td>${order.mOrderTitle }</td><td>${order.mOrderDate }</td>
					<td>
						<c:if test="${order.mOrderState eq 0}"><span class="state-reg">접수완료</span></c:if>
						<c:if test="${order.mOrderState eq 1}"><span class="state-out">출고완료</span></c:if>
						<c:if test="${order.mOrderState eq 2}"><span class="state-arr">도착</span></c:if>
						<c:if test="${order.mOrderState eq 3}"><span class="state-can">취소</span></c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- paging -->
		<div class="paging">
			${list.pageNavi }	
		</div>
	</div>
</section>
<!-- 
<form action="/managerOrder/orderList.do" method="post" name="movePage">
	<input type="hidden" name="reqPage">
</form>
 -->

<script>

	var state = $('select[name=state]').data('val');
	$('select[name=state]').children('option').each(function(){
		if(state == $(this).val()){
			$(this).prop("selected",true);
		}
	});

	function list(p){
		$('input[name=reqPage]').val(p);
		search.submit();
	}
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />