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
			<table class="comm-tbl type2" id="ingreList">
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
						<td>
							<c:if test="${list.ingreDiscntRate > 0}">
								<img src="/resources/img/sale_icon.png" style="width:30px;">&nbsp;${list.ingreType } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</c:if>
							<c:if test="${list.ingreDiscntRate == 0}">
								${list.ingreType }
							</c:if>
						</td>
						<td>${list.ingreLabel }</td>
						<td>
							15cm : ${list.ingreCost15 }원<br>
							30cm : ${list.ingreCost30 }원
						</td>
						<td>
							15cm : ${list.ingreKcal }kcal<br>
							30cm : ${list.ingreKcal*2}kcal
						</td>
						<td>${list.ingreRegDate }</td>
						<td>
							<select class="ingreActive" data-active="${list.ingreActive}" data-no="${list.ingreIdx }">
								<option value="1">활성화</option>
								<option value="0">비활성화</option>
							</select>
						</td>
						<td>
							<button class="add-btn" onclick="loction.href='/updateIngre.do?ingreIdx=${list.ingreIdx}'">수정</button>
							<button class="del-btn" onclick="loction.href='/deleteIngre.do?ingreIdx=${list.ingreIdx}'">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="paging">${pageNavi }</div>
		
		<!-- 검색박스 -->
		<div class="board-search-box">
			<form action="/ingreList.do" method="post" name="search">
				<input type="hidden" name="reqPage" value="1">
				<select name="searchType" id="searchType" data-type="${searchType }">
					<option value="">-- 1차 분류 --</option>
					<option value="ingreType">재료 카테고리</option>
					<option value="ingreDiscntRate">할인여부</option>
					<option value="ingreActive">활성화 여부</option>
				</select>
				<select name="searchVal" id="searchVal" data-val="${searchVal }">
					<option value="">-- 2차 분류 --</option>
				</select>
				<button type="submit" class="bbs-search-btn" title="검색"> <img src="/resources/img/search_icon.png" style="width:30px;"></button>
			</form>
		</div>
	</div>
</section>


<script>
$(document).ready(function(){
	/* 활성화/비활성화 ajax */
	$(".ingreActive").change(function(){
		var no = $(this).data('no');
		var ingreActive = $(this).val();
		console.log(no);
		console.log(ingreActive);
		$.ajax({
			url : "/updateIngreActive.do",
			data : {ingreActive:ingreActive,ingreIdx:no},
			success:function(data){
				console.log(data);
			},
			error:function(){
				console.log("활성화여부 업데이트 실패..");
			}
		});
	});
	
	/* 활성화상태 selectbox 세팅 */
	$('select.ingreActive').children('option').each(function(){
		var active = $(this).parent().data('active');
		//console.log(active);
		//console.log($(this).val());
		if(active == $(this).val()){
			$(this).prop("selected",true);
		}
	});
	
	/* 검색 후 검색 카테고리 셋팅 */
	var searchType = $('select[name=searchType]').data('type');
	$('select[name=searchType]').children('option').each(function(){
		if(searchType == $(this).val()){
			$(this).prop("selected",true);
		}
	});
	
	/* 검색 카테고리에 따른 하위 옵션  */
	$("#searchType").change(function(){
		getVal();
	}); 
	
	getVal();
	
	function getVal(){
		/* 재료 카테고리 선택했을 경우 */
		if($("#searchType").val()=='ingreType'){
			var ingreType = $("#searchType").val();
			$.ajax({
				url:"/ingreType.do",
				datatype: "json",
				success: function(data){
					console.log(data);
					var $select = $("#searchVal");
					$select.find("option").remove();
					$select.append("<option value=''>-- 재료 --</option>");
					for(var i=0;i<data.length;i++){
						$select.append("<option value='"+data[i]+"'>"+data[i]+"</option>");
					}
				},
				error : function(){
					console.log("안돼에에에");
				}
			});
		}else if($("#searchType").val()=='ingreDiscntRate'){	/* 할인률 선택했을 경우 */
			var $select = $("#searchVal");
			$select.find("option").remove();
			$select.append("<option value=''>-- 할인 여부 --</option>");
			$select.append("<option value='1'>할인중인 메인재료</option>");
			$select.append("<option value='0'>할인 안하는 메인재료....뭐라하지...</option>");
		}else if($("#searchType").val()=='ingreActive'){
			var $select = $("#searchVal");
			$select.find("option").remove();
			$select.append("<option value=''>-- 활성화 여부 --</option>");
			$select.append("<option value='1'>활성화</option>");
			$select.append("<option value='0'>비활성화</option>");
		}else{
			var $select = $("#searchVal");
			$select.find("option").remove();
			$select.append("<option value=''>-- 2차 분류 --</option>");
		}
		/* 검색 후 검색값 설정 */
		var searchVal = $('select[name=searchVal]').data('val');
		$('select[name=searchVal]').children('option').each(function(){
			if(searchVal == $(this).val()){
				$(this).prop("selected",true);
			}
		});
	}
	
});	
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />