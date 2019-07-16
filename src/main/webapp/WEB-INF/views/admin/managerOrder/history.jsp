<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<div class="modal-area" style="width:1200px; margin:0 auto; position:relative;">
		<button class="modal-close-btn" style="position:absolute; top:-60px; right:0;"><img src="/resources/img/main_top_line_banner_closebtn.png" ></button>
		<%-- <div class="sub-menu">※ 재고관리 > <a href="/managerOrder/stockList.do">재고현황</a></div>
		
		<p>
		
			<select id="order" data-val="${search.orderBy }">
				<option value="new">최신등록순</option>
				<option value="del">배송일순</option>
				<c:if test="${sessionScope.mgr.mgrLevel eq 1 }"><option value="store">매장별</option></c:if>
			</select>
		</p>
		 --%>

		<div class="common-tbl-btn-group">
			<c:if test="${empty history.ingre.ingreFilepath }">
				<img src="/resources/img/sandwich.png" width="150px" height="100px"><br>
			</c:if>
			<c:if test="${not empty history.ingre.ingreFilepath }">
				<img src="/resources/upload/ingredients/${history.ingre.ingreFilepath }" width="150px" height="100px"><br>
			</c:if>
			<button class="btn-style2" type="button">${history.ingre.ingreLabel }</button>

		</div>
		<div>
			<table class="his-tbl">
				<colgroup>
					<col width="">
					<col width="50%">
				</colgroup>
				<tr>
					<th>내역</th><th>시간</th>
				</tr>
				<c:if test="${empty history.list }">
					<tr><td colspan="2">입/출고 내역이 없습니다.</td></tr>
				</c:if>
				<tbody id="stockList">
					<c:forEach items="${history.list }" var="history">
						<c:if test="${history.hContent ne 0 }">
							<tr>
								<td>
									<c:choose>
										<c:when test="${fn:contains(history.hContent,'-') }"><span class="state-can">${history.hContent }</span> (재고조사 차감)</c:when>
										<c:otherwise><span class="state-arr">+${history.hContent }</span> (발주물품 입고)</c:otherwise>
									</c:choose>
								</td>
								<td>${history.hDate }</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- paging -->
		<div class="modal-paging">
			${history.pageNavi }	
		</div>
		
	</div>
</section>

<script>
function list2(p){
	var state = '${search.state}';
	$.ajax({
		url : '/managerOrder/moveHistory.do',
		data : {reqPage:p,state:state},
		dataType : 'json',
		success : function(list){
			var history = list.list;
			var $tr;
			for(var i=0;i<history.length;i++){
				var $con;
				if((history[i].hContent).indexOf('-')!=-1){
					$con = ('<td><span class="state-can">'+history[i].hContent+'</span> (재고조사 차감)</td>');
				}else{
					$con = ('<td><span class="state-arr">+'+history[i].hContent+'</span> (발주물품 입고)</td>');
				}
				var $date = ('<td>'+history[i].hDate+'</td>');
				$tr += ('<tr>'+$con+$date+'</tr>');
			}
			$('tbody#stockList').html($tr);
			$('.modal-paging').html(list.pageNavi);
		},
		error : function(){
			console.log('실패');
		}
	});
}

$(document).ready(function  () {
	var $modalWrap = $(".modal-fixed-pop-wrapper");
	$(".modal-close-btn").click(function  () {
		$(".modal-inner-content").empty();
		$modalWrap.css("display","none");
		$("html").css({
			"margin-right":"0",
			"overflow-y":"scroll"
		});
		$modalWrap.fadeOut();
		return false;
	});
	
});
</script>