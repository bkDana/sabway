<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<script type="text/javascript" src="/resources/js/admin-notice.js"></script>
<%-- Content --%>

<section id="content-wrapper" class="clearfix">
	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 게시판관리 > 공지사항</div>
			
		<div class="board-search-box order-search">
			<form action="/board/noticeList.do" method="post" name="search">
				<input type="hidden" name="reqPage" value="1">
				<input type="hidden" name="orderBy" value="${search.orderBy }">

				<select name="searchType" data-val="${search.searchType }">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input placeholder="검색어를 입력해주세요." type="search" name="searchVal" class="search-word" value="${search.searchVal }">
				<button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/icon_search.png"></button>

			</form>
		</div>
		<br>
		<p class="order-list-comment">
			<select id="order" data-val="${search.orderBy }">
				<option value="new">최신등록순</option>
				<option value="old">오래된...순</option>
			</select>
		</p>
		<table class="comm-tbl type2">
			<colgroup>
				<col width="3%">
				<col width="5%">
				<col width="10%">
				<col width="/">
				<col width="10%">
			</colgroup>
			<tr>
				<th><input type="checkbox" class="allcbox"></th>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<!-- 	
			<tr>
				<td><img src="/resources/img/icon_notice.png"></td>
				<td class="move-one-notice">위에 고정되는거 디자인</td>
				<td>날짜아ㅏㅏㅏㅏ</td>
			</tr>
			 -->
			<c:forEach items="${noticeList}" var="notice">
				<tr class="normal">
					<td><input type="checkbox" class="cbox" data-idx="${notice.noticeNo }"></td>
					<td>${notice.rnum }</td>
					<td>${notice.noticeCategory }</td>
					<td class="move-one-notice" data-idx="${notice.noticeNo }">${notice.noticeTitle }</td>
					<td>${notice.noticeDate }</td>
				</tr>
			</c:forEach>
			
		</table>
		<div class="common-tbl-btn-group" style="text-align: right;">
			<button class="btn-style2 insert-notice">작성하기</button>
			<button class="btn-style3" id="del-button">삭제</button>
		</div>
		<div class="paging">${pageNavi }</div>

	</div>
</section>

<script>
/* 페이지 이동 */
function list(p){
	$('input[name=reqPage]').val(p);
	search.submit();
}

/* 검색값 고정 */
var searchType = $('select[name=searchType]').data('val');
$('select[name=searchType]').children('option').each(function(){
	if(searchType == $(this).val()){
		$(this).prop("selected",true);
	}
});

var order = $('select#order').data('val');
$('select#order').children('option').each(function(){
	if(order == $(this).val()){
		$(this).prop("selected",true);
	}
});

$('select#order').change(function(){
	$('input[name=orderBy]').val($(this).val());
	search.submit();
});

/* 체크박스 전체 선택or해제 */
$('.allcbox').click(function(){
	if($(this).is(':checked')){
		$('.cbox').prop('checked',true);
	}else{
		$('.cbox').prop('checked',false);
	}
});

/* 선택 삭제 */
$('#del-button').click(function(){
	var idx = "";
	$('.cbox:checked').each(function(){
		idx += $(this).data('idx')+",";
	});
	if(idx==""){
		alert('선택된게 없어..');
	}else{

		$.ajax({
			url : '/board/allDelete.do',
			data : {idx:idx},
			type : 'post',
			dataType : 'json',
			success : function(res){
				if(res=="성공"){
					alert('삭제 완료');
					window.location.reload();
				}else{
					alert('실패한거같은데');
				}
			},
			error : function(){
				console.log('실퍄');
			}
		});
	}
});

</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />