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
				<button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/icon_search.png"></button>
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
						<img src="/resources/img/sandwich.png" width="150px" height="100px"><br>
					</c:if>
					<c:if test="${not empty stock.ingreFilepath }">
						<img src="/resources/upload/ingredients/${stock.ingreFilepath }" width="150px" height="100px"><br>
					</c:if>
					</span>
				</label>
					<span>${stock.ingreLabel }</span>
					<span>
						<input type="text" class="short num" value="${stock.mStock }" data-idx="${stock.mStockIdx }" data-pre="${stock.mStock }" > ${stock.ingreUnit }<c:if test="${empty stock.ingreUnit }">개</c:if>
						<button type="button" class="update-btn" >수정</button>
					</span>
					<span>
						<%-- <button type="button" class="detail-btn" onclick="location.href='/managerOrder/stockHistory.do?no=${stock.mStockIdx }';">상세</button> --%>
						<button type="button" class="detail-btn" onclick="layerLoad('/managerOrder/stockHistory.do?state=${stock.mStockIdx }');">입/출고 내역</button>
					</span>
				
			</li>
			</c:forEach>
		</ul>
		
		<!-- paging -->
		<div class="paging">
			${list.pageNavi }	
		</div>
	</div>
</section>

<%-- 모달 레이어 팝업 --%>
<article class="modal-fixed-pop-wrapper">
	<div class="modal-fixed-pop-inner">
		<div class="modal-loading"><span class="loading"></span></div>
		<div class="modal-inner-box">
			<div class="modal-inner-content"></div>
		</div>
	</div>
</article>

<script>
/* 페이지 이동 */
function list(p){
	//console.log(p);
	$('input[name=reqPage]').val(p);
	searchform.submit();
}

function layerLoad(strUrl){
	var $modalWrap = $(".modal-fixed-pop-wrapper");

	$("html").css({
		"margin-right":"17px",
		"overflow-y":"hidden"
	});
	$modalWrap.fadeIn();
	
	$.ajax({
		type: "POST",
		url: strUrl,
		data: "",
		success: function(resultText){
			$modalWrap.find(".modal-inner-content").html(resultText);
		},
		error: function() {
			alert("호출에 실패했습니다.");
			$(".modal-fixed-pop-wrapper").hide();
			$("html").css({
				"margin-right":"0",
				"overflow-y":"scroll"
			});
		},
		beforeSend:function(){ 
			$('.modal-loading').fadeIn(); 
		},
		complete:function(){ 
			$('.modal-loading').hide();
		}
	});
	 
}

	
$(function(){
	/* 수량 수정 */
	$('.update-btn').on('click',function(){
		var mStockIdx = $(this).siblings('input').data('idx');
		var mItemAmount = $(this).siblings('input').val();
		var mItemIdx = $(this).siblings('input').attr('data-pre');//기존 재고

		if(Number(mItemAmount)>=Number(mItemIdx)){
			alert('수량을 확인하세요');
			return;
		}
		
		var $my = $(this);
		$.ajax({
			url : '/managerOrder/modifyStock.do',
			data : {mStockIdx:mStockIdx, mItemAmount:mItemAmount, mItemIdx:mItemIdx},
			success : function(data){
				if(data==1){
					$my.siblings('input').attr('data-pre',mItemAmount);
					alert('재고가 수정되었습니다');
				}else{
					alert('재고 수정에 실패했습니다. 관리자에게 문의하세요.');
				}
			},
			error : function(){
				console.log('실패');
			}
		});
		
		
	});

});
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
				url : '/ingreManage/ingreType.do',
				success : function(data){
					var $sel = $('<select name="searchVal">');
					$sel.append('<option value="">전체</option>');
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
			$('select[name=searchType]').after(' <input placeholder="검색어를 입력하세요." type="search" name="searchVal" class="search-word" value="'+search+'">');
		}
	}
	
	
	
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />