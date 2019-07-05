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
			<form action="/managerOrder/stockList.do" method="post" name="searchform">
				<input type="hidden" name="reqPage" value="1">
				<select name="searchType" data-val="${search.searchType }" data-search="${search.searchVal }">
					<option value="name">재료명</option>
					<option value="cat">카테고리</option>
				</select>
				<%-- <input placeholder="검색어를 입력해주세요." type="search" name="searchVal" class="search-word" value="${search.searchVal }"> --%>
				<button type="submit" class="bbs-search-btn" title="검색">검색</button>
				<!-- &nbsp;<button type="button" onclick="location.href='/managerOrder/orderList.do'" class="bbs-search-btn" title="초기화">초기화</button> -->
			</form>
		</div>
		<br>
		<label><input type="checkbox" class="allcbox"> 전체 선택</label> : 별 기능은 없다.... 그냥 만들어야될거같아서 넣음
		<ul class="stock-list clearfix">
			<c:if test="${empty list.stockList }">
				<li>검색 결과가 없습니다</li>
			</c:if>
			<c:forEach items="${list.stockList }" var="stock">
			<li>
				<label>
					<span><input type="checkbox" class="cbox"></span>
					<span>
					<c:if test="${empty stock.ingreFilepath }">
						<img src="/resources/img/sandwich.png" width="150px" height="150px"><br>
					</c:if>
					<c:if test="${not empty stock.ingreFilepath }">
						<img src="/resources/upload/ingredients/${stock.ingreFilepath }" width="150px" height="150px"><br>
					</c:if>
					</span>
					<!-- <span><img src="/resources/img/sandwich.png" width="150px" height="150px"></span> -->
					<span>${stock.ingreLabel }</span>
					<span><input type="text" class="short" value="${stock.mStock }" readonly="readonly"> ${stock.ingreUnit }<c:if test="${empty stock.ingreUnit }">개</c:if></span>
				</label>
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

	/* 검색 타입 고정 */
	var searchType = $('select[name=searchType]').data('val');
	$('select[name=searchType]').children('option').each(function(){
		if(searchType == $(this).val()){
			$(this).prop("selected",true);
		}
	});
	
	
	var search = $('select[name=searchType]').data('search');
	setting(searchType,search);
	
	$('select[name=searchType]').change(function(){	
		setting($(this).val());
	});

	
	/* 체크박스 전체 선택or해제 */
	$('.allcbox').click(function(){
		if($(this).is(':checked')){
			$('.cbox').prop('checked',true);
		}else{
			$('.cbox').prop('checked',false);
		}
	});
	
	function setting(value,search){
		if(value=='cat'){
			$('input[name=searchVal]').remove();
			$.ajax({
				url : '/ingreType.do',
				success : function(data){
					var $sel = $('<select name="searchVal">');
					
					for(var i=0;i<data.length;i++){
						var chk = '';
						if(search==data[i]){
							chk = 'selected';
						}
						$sel.append('<option value='+data[i]+' '+chk+'>'+data[i]+'</option>');
					}
					
					$('select[name=searchType]').after($sel);
					$('select[name=searchType]').after(" ");
				},
				error : function(){
					console.log('실패');
				}
			});
			
		}else{
			$('select[name=searchVal]').remove();
			$('select[name=searchType]').after(' <input placeholder="검색어를 입력해주세요." type="search" name="searchVal" class="search-word">');
		}
	}
	
	
	/* 페이지 이동 */
	function list(p){
		console.log(p);
		$('input[name=reqPage]').val(p);
		searchform.submit();
	}
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />