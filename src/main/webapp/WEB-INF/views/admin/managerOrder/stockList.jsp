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
		<div class="sub-menu">※ 재고관리 > 재고현황</div>
		<div class="board-search-box order-search">
			<form action="/managerOrder/stockList.do" method="post" name="search">
				<select name="searchType" data-val="${search.searchType }">
					<option value="name">재료명</option>
					<option value="">뭘해야될까?</option>
				</select>
				<input placeholder="검색어를 입력해주세요." type="search" name="searchVal" class="search-word" value="${search.searchVal }">
				<button type="submit" class="bbs-search-btn" title="검색">검색</button>
				<!-- &nbsp;<button type="button" onclick="location.href='/managerOrder/orderList.do'" class="bbs-search-btn" title="초기화">초기화</button> -->
			</form>
		</div>
		<br>
		<input type="checkbox" class="allcbox"> 전체 선택
		<ul class="stock-list clearfix">
			<c:forEach items="${list.stockList }" var="stock">
			<li>
				<input type="checkbox" class="cbox"><br>
				<c:if test="${empty stock.ingreFilepath }">
					<img src="/resources/img/sandwich.png" width="100px" height="100px"><br>
				</c:if>
				<c:if test="${not empty stock.ingreFilepath }">
					<img src="/resources/upload/ingredients/${stock.ingreFilepath }" idth="100px" height="100px"><br>
				</c:if>
				<span>${stock.ingreLabel }</span><br>
				<span>${stock.mStock } ${stock.ingreUnit }<c:if test="${empty stock.ingreUnit }">개</c:if></span><br>
			</li>
			</c:forEach>
		</ul>
		
		<!-- paging -->
		<div class="paging">
			${list.pageNavi }	
		</div>
	</div>
</section>
<script>

	var state = $('select[name=state]').data('val');
	$('select[name=state]').children('option').each(function(){
		if(state == $(this).val()){
			$(this).prop("selected",true);
		}
	});

	/* 페이지 이동 */
	function list(p){
		$('input[name=reqPage]').val(p);
		search.submit();
	}
	
	/* 체크박스 전체 선택or해제 */
	$('.allcbox').click(function(){
		if($(this).is(':checked')){
			$('.cbox').prop('checked',true);
		}else{
			$('.cbox').prop('checked',false);
		}
	});
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />