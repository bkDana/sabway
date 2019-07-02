<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />


<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 메뉴관리 > 메뉴 리스트</div>
		
		<div class="common-tbl-box">
			<table class="comm-tbl">
				<%-- <colgroup>
					<col width="15%">
					<col width="/">
					<col width="15%">
				</colgroup> --%>
				<tr>
					<th>번호</th>
					<th>재료 카테고리</th>
					<th>상품명</th>
					<th>판매가격</th>
					<th>칼로리</th>
					<th>등록일</th>
					<th>활성화 여부</th>
					<th>수정/삭제</th>
				</tr>
				<c:forEach items="${ingreList}" var="list">
					<tr>
						<td>${list.rnum }</td>
						<td>${list.ingreType }</td>
						<td>${list.ingreLabel }</td>
						<td>15cm : ${list.ingreCost15 } / 30cm : ${list.ingreCost30 }</td>
						<td>15cm : ${list.ingreKcal } / 30cm : ${list.ingreKcal*2}</td>
						<td>${list.ingreRegDate }</td>
						<td>${list.ingreActive }</td>
						<td>수정/삭제 버튼 넣기</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="paging">${pageNavi }</div>
		
		<!-- 검색박스 -->
		<div class="board-search-box">
			<form action="/ingreList.do?reqPage=1" method="post" name="search">
				<select name="searchType" id="searchType" data-type="${searchType }">
					<option value="ingreType">재료 카테고리</option>
					<option value="ingreDiscntRate">할인여부</option>
					<option value="ingreActive">활성화 여부</option>
				</select>
				<select name="searchVal" id="searchVal" data-val="${searchVal }">
					<option value=""></option>
				</select>
				<button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/search_icon.png" style="width:30px;"></button>
			</form>
		</div>
	</div>
</section>


<script>
$(document).ready(function(){
	/* 검색 카테고리 셋팅 */
	var searchType = $('select[name=searchType]').data('type');
	$('select[name=searchType]').children('option').each(function(){
		if(searchType == $(this).val()){
			$(this).prop("selected",true);
		}
	});
	
	/* 하위 검색값 셋팅 */
	var searchVal = $('select[name=searchVal]').data('val');
	$('select[name=searchVal]').children('option').each(function(){
		if(searchVal == $(this).val()){
			$(this).prop("selected",true);
		}
	});
	
	/* 검색 카테고리에 따른 하위 옵션  */
	$("#searchType").change(function(){
		getVal();
	}); 
	
	function getVal(){
		/* 재료 카테고리 선택했을 경우 */
		if($("#searchType").val().equals('ingreType')){
			var ingreType = $("#searchType").val();
			$.ajax({
				url:"/ingreType.do",
				datatype: "json",
				success: function(data){
					var $select = $("#searchVal");
					$select.find("option").remove();
					$select.appen("<option value=''></option>");
					for(var i=0;data.length;i++){
						$select.append("<option value='"+data[i]+"'>"+data[i]+"</option>");
					}
				},
				error : function(){
					console.log("안돼에에에");
				}
			});
		}else if($("#searchType").val().equals('ingreDiscntRate')){	/* 할인률 선택했을 경우 */
			var $select = $("#searchVal");
			$select.find("option").remove();
			$select.appen("<option value='1'>할인중인 메인재료</option>");
			$select.appen("<option value='0'>할인 안하는 메인재료....뭐라하지...</option>");
		}else{
			var $select = $("#searchVal");
			$select.find("option").remove();
			$select.appen("<option value='1'>활성화</option>");
			$select.appen("<option value='0'>비활성화</option>");
		}
	}
	
});	
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />