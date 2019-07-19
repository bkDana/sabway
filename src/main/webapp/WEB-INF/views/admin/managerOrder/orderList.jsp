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
		<c:if test="${sessionScope.mgr.mgrLevel eq 1 }">
			※ 희망배송일 오전 8시에 출고완료 상태인 발주건은 도착으로 자동 상태변경됩니다. 
			수동으로 변경하기-> <a href="/managerOrder/test.do">수동으로 재고 추가</a>
		</c:if>
		<div class="board-search-box order-search">
			<form action="/managerOrder/orderList.do" method="post" name="search">
				<input type="hidden" name="reqPage" value="1">
				<input type="hidden" name="orderBy" value="${search.orderBy }">
				발주서 등록일 : <input type="search" name="startDay" class="searchdate search-day" value="${search.startDay }" autocomplete="off"> ~ <input type="search" name="endDay" class="searchdate search-day" value="${search.endDay }" autocomplete="off">
				<br><br>
				<input type="search" name="delDay" class="datepicker search-day" value="${search.delDay }"  placeholder="희망배송일" autocomplete="off">
				
				<select name="state" data-val="${search.state }">
					<option value="0">---발주상태---</option>
					<option value="1">접수완료</option>
					<option value="2">출고완료</option>
					<option value="3">도착</option>
					<option value="4">취소</option>
				</select>
				<c:if test="${sessionScope.mgr.mgrLevel eq 0 }">
					<button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/icon_search.png"></button>
					<button type="button" onclick="location.href='/managerOrder/orderList.do'" class="bbs-search-btn" title="초기화">초기화</button>
				</c:if>
				<br><br>
				<c:if test="${sessionScope.mgr.mgrLevel eq 1 }">
					<select name="searchType" data-val="${search.searchType }">
						<option value="name">지점명</option>
						<option value="">뭘해야될까?</option>
					</select>
					<input placeholder="검색어를 입력해주세요." type="search" name="searchVal" class="search-word" value="${search.searchVal }">
				
					<button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/icon_search.png"></button>
					<button type="button" onclick="location.href='/managerOrder/orderList.do'" class="bbs-search-btn" title="초기화">초기화</button>
				</c:if>
			</form>
		</div>
		<br>
		<p class="order-list-comment">
			<select id="order" data-val="${search.orderBy }">
				<option value="new">최신등록순</option>
				<option value="del">희망배송일순</option>
				<c:if test="${sessionScope.mgr.mgrLevel eq 1 }"><option value="store">매장별</option></c:if>
			</select>
		</p>
		<table class="comm-tbl type2">
			<colgroup>
				<col width="3%">
				<col width="5%">
				<c:if test="${sessionScope.mgr.mgrLevel eq 1 }"><col width="20%"></c:if>
				<col width="10%">
				<col width="">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<tr>
				<th><input type="checkbox" class="allcbox"></th><th>번호</th>
				<c:if test="${sessionScope.mgr.mgrLevel eq 1 }"><th>지점명</th></c:if>
				<th>희망배송일</th><th>상품</th><th>등록일</th><th>상태</th>
			</tr>
			<c:if test="${empty list.orderList }">
				<tr><td colspan="7">검색 결과가 없습니다.</td></tr>
			</c:if>
			<c:forEach items="${list.orderList }" var="order">
				<tr>
					<td>
						<c:if test="${order.mOrderState eq 1}"><input type="checkbox" class="cbox" data-idx="${order.mOrderNo }"></c:if>
					</td>
					<td>${order.rnum }</td>
					<c:if test="${sessionScope.mgr.mgrLevel eq 1 }"><td>${order.mgrName }</td></c:if>
					<td>${order.mOrderDelDate }</td>
					<td onclick="location.href='/managerOrder/orderView.do?no=${order.mOrderNo}';" style="cursor:pointer;">${order.mOrderTitle }</td><td>${order.mOrderDate }</td>
					<td>
						<c:if test="${order.mOrderState eq 1}"><span class="state-reg">접수완료</span></c:if>
						<c:if test="${order.mOrderState eq 2}"><span class="state-out">출고완료</span></c:if>
						<c:if test="${order.mOrderState eq 3}"><span class="state-arr">도착</span></c:if>
						<c:if test="${order.mOrderState eq 4}"><span class="state-can">취소</span></c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="common-tbl-btn-group" style="text-align: right;">
			<c:if test="${sessionScope.mgr.mgrLevel eq 0 }">
				<button class="btn-style3" onclick="allUpdate(4);">취소</button>
			</c:if>
			<c:if test="${sessionScope.mgr.mgrLevel eq 1 }">
				<button class="btn-style3" onclick="allUpdate(2);">출고</button>
			</c:if>
		</div>
		
		<!-- paging -->
		<div class="paging">
			${list.pageNavi }	
		</div>
	</div>
</section>

<script>
	
	/* 검색값 고정 */
	var state = $('select[name=state]').data('val');
	$('select[name=state]').children('option').each(function(){
		if(state == $(this).val()){
			$(this).prop("selected",true);
		}
	});
	
	/* 정렬 고정 */
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

	
	/* 선택 출고or취소 */
	function allUpdate(st){
		if(st==4){
			if(!confirm('취소하시겠습니까?')){
				return;
			}
		}
		if(st==2){
			if(!confirm('출고하시겠습니까?')){
				return;
			}
		}
		var idx = "";
		$('.cbox:checked').each(function(){
			idx += $(this).data('idx')+",";
		});
		
		if(idx==""){
			alert('선택된게 없어..');
		}else{

			$.ajax({
				url : '/managerOrder/allUpdate.do',
				data : {idx:idx,st:st},
				type : 'post',
				dataType : 'json',
				success : function(res){
					if(res=="완료"){
						alert('상태 변경 완료');
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
	}
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />