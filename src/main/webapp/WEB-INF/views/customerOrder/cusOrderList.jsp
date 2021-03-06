<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<style>
	.board-search-box{
		position: static;
	}
	#cusOrderView {
		color:black;
	}
	#link{
		float:left;
		position: static;
	}
	#allList,#mainLink,#slash{
		font-size:20px;
		color:black;
	}
	.comm-tbl th,.comm-tbl td{
		text-align: center;
	}
	[name=cancle],[name=accept],[name=take]{
		width:65px;
	    border: none;
	    color:#fff;
	    padding: 5px 0;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    margin: 4px;
	    cursor: pointer;
	    height: 35px;
	}
	[name=cancle]{
		background-color: #f8585b;
	}
	[name=accept]{
		background-color: #122322;
	}
	[name=take]{
		background-color: #943442;
	}
	.pageNavi{
		color:black;
		text-align:center;
		margin-top:35px;
		font-size: 15px;
		font-weight: bold;
	}
	/* form ::: search */
   .form_searchM {border:2px solid #dddddd; height:41px;width:15%; display:block; vertical-align:middle; position:relative; padding-right:42px; }
   .form_searchM input{border:0; height:41px; width:100%; text-indent:14px; color:#292929; font-size:16px;}
   .form_searchM input::placeholder{color:#bbbbbb; font-size:16px;font-family:font_ns, sans-serif;}
   .form_searchM .btn_searchM{background:url(http://subway.co.kr/images/common/icon_search.png) 50% 50% no-repeat; width:41px; height:41px; position:absolute; right:0; top:0;}
   .form_searchM .btn_searchM:after{content:''; position:absolute; left:-2px; top:13px; width:2px; height:16px; background-color:#e5e5e5;}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area" style="min-height:485px;">
		<div class="sub-menu">※ 주문관리 > 주문 리스트</div>
		<h1 class="comm-content-tit">주문 리스트</h1>
		<div class="board-search-box">
			<!-- 비회원="0" , 회원="-1" , 전체="-2" -->
			<label for="chk0"><input type="checkbox" id="chk0" class="chk" value="-2">전체회원</label>
			<label for="chk1"><input type="checkbox" id="chk1" class="chk" value="-1">회원</label>
			<label for="chk2"><input type="checkbox" id="chk2" class="chk" value="0">비회원</label>
			<br>
			<select name="statusGroup">
				<option>주문번호</option>
			</select>
			<input type="text" maxlength="30" placeholder="주문번호를 입력하세요." value="${keyword }"style="height:34px; padding-left:5px;" id="textInput">
			<button type="button" class="bbs-search-btn" onclick="searchBtn();"name="searchBtn">검색</button><br>
			<span id="link">
				<a href="/admin.do" id="mainLink">메인으로</a>
				<span id="slash">/</span>
				<a href="/cusOrderList.do?currentPage=''" id="allList">전체보기</a>
			</span>
		</div>
		<table class="comm-tbl" style="max-width:100%;">
			<colgroup>
				<col width="3%">
				<col width="6%">
				<col width="9%">
				<col width="9%">
				<col width="11%">
				<col width="15%">
				<col width="8%">
				<col width="6%">
				<c:if test="${sessionScope.mgr.mgrLevel == 0 }"><col width="11%"></c:if>
			</colgroup>	
			<tr>
				<th>No.</th><th>총 금액</th><th>연락처</th><th>회원번호</th><th>주문번호</th><th>지점번호</th><th>주문 날짜</th><th>상태</th>
				<c:if test="${sessionScope.mgr.mgrLevel == 0 }"><th>상태변경</th></c:if>
			</tr>
			<c:forEach items="${pd.list }" var="cusOrder">
				<input type="hidden" name="cusoIdx" value="${cusOrder.cusoIdx }">
				<input type="hidden" name="mgrName" value="${sessionScope.mgr.mgrName }">
				<c:choose>
					<c:when test="${sessionScope.mgr.mgrName == cusOrder.cusoBranch || sessionScope.mgr.mgrLevel == 1}">
						<tr>
							<td>
								${cusOrder.rnum }
							</td>
							<td>
								<input type="hidden" name="cusoTotalCost" value="${cusOrder.cusoTotalCost }">
								<%-- ${cusOrder.cusoTotalCost } --%>
								<fmt:formatNumber value="${cusOrder.cusoTotalCost}" pattern="#,###.##"/>원<!-- 금액 형식으로 출력 -->
							</td>
							<td>
								<input type="hidden" name="cusocusoPhone" value="${cusOrder.cusoPhone }">
								${cusOrder.cusoPhone }
							</td>
							<td>
								<input type="hidden" name="cusoMemberNo" value="${cusOrder.cusoMemberNo }">
								${cusOrder.cusoMemberNo }
							</td>
							<td>
								<input type="hidden" name="cusoOrderNo" value="${cusOrder.cusoOrderNo }">
								<a href="/cusOrderInfo.do?no=${cusOrder.cusoOrderNo }" id="cusOrderView">${cusOrder.cusoOrderNo }</a>
							</td>
							<td>
								<input type="hidden" name="cusoBranch" value="${cusOrder.cusoBranch }">
								${cusOrder.cusoBranch }
							</td>
							<td>
								<input type="hidden" name="cusoOrderDate" value="${cusOrder.cusoOrderDate }">
								${cusOrder.cusoOrderDate }
							</td>
							<!-- 주문 상태 (접수전: 0, 접수완료: 1, 수령완료:2, 취소: -1(취소는 접수 전에만 가능) ) -->
							<c:if test="${cusOrder.cusoOrderState == 1}">
								<td>접수 완료</td>
								<c:if test="${sessionScope.mgr.mgrLevel == 0 }">
									<td>
										<button type="button" name="take">수령 완료</button>
									</td>
								</c:if>
							</c:if>
							<c:if test="${cusOrder.cusoOrderState == 2}">
								<td>수령 완료</td>
								<c:if test="${sessionScope.mgr.mgrLevel == 0 }">
									<td></td>
								</c:if>
							</c:if>
							<c:if test="${cusOrder.cusoOrderState == 0}">
								<td>접수 전</td>
								<c:if test="${sessionScope.mgr.mgrLevel == 0 }">
									<td>
										<button type="button" name="accept">접수 완료</button>
										<c:if test="${sessionScope.mgr.mgrLevel == 0 }">
											&nbsp;
											<button type="button" name="cancle">취소</button>
										</c:if>
									</td>
								</c:if>
							</c:if>
							<c:if test="${cusOrder.cusoOrderState < 0}">
								<td>취소</td>
								<c:if test="${sessionScope.mgr.mgrLevel == 0 }">
									<td></td>
								</c:if>
							</c:if>
						</tr>
					</c:when>
					<c:when test="${empty sessionScope.mgr.mgrName && sessionScope.mgr.mgrLevel == 1}">
						<tr>
							<td>
								${cusOrder.rnum }
							</td>
							<td>
								<input type="hidden" name="cusoTotalCost" value="${cusOrder.cusoTotalCost }">
								${cusOrder.cusoTotalCost }원
							</td>
							<td>
								<input type="hidden" name="cusocusoPhone" value="${cusOrder.cusoPhone }">
								${cusOrder.cusoPhone }
							</td>
							<td>
								<input type="hidden" name="cusoMemberNo" value="${cusOrder.cusoMemberNo }">
								${cusOrder.cusoMemberNo }
							</td>
							<td>
								<input type="hidden" name="cusoOrderNo" value="${cusOrder.cusoOrderNo }">
								<a href="/cusOrderInfo.do?no=${cusOrder.cusoOrderNo }">${cusOrder.cusoOrderNo }</a>
							</td>
							<td>
								<input type="hidden" name="cusoBranch" value="${cusOrder.cusoBranch }">
								${cusOrder.cusoBranch }
							</td>
							<td>
								<input type="hidden" name="cusoOrderDate" value="${cusOrder.cusoOrderDate }">
								${cusOrder.cusoOrderDate }
							</td>
							<!-- 주문 상태 (접수전: 0, 접수완료: 1, 수령완료:2, 취소: -1(취소는 접수 전에만 가능) ) -->
							<c:if test="${cusOrder.cusoOrderState == 1}">
								<td>접수 완료</td>
								<td>
									<a href="#" name="take">수령 완료</a>
								</td>
							</c:if>
							<c:if test="${cusOrder.cusoOrderState == 2}">
								<td>수령 완료</td>
								<td></td>
							</c:if>
							<c:if test="${cusOrder.cusoOrderState == 0}">
								<td>접수 전</td>
								<td>
									<a href="#" name="accept">접수 완료</a>
									<c:if test="${sessionScope.mgr.mgrLevel == 0 }">
										&nbsp;
										<a href="#" name="cancle">취소</a>
									</c:if>
								</td>
							</c:if>
							<c:if test="${cusOrder.cusoOrderState < 0}">
								<td>취소</td>
								<td></td>
							</c:if>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${pd.totalCount <= 0 }">
				<tr>
					<td colspan="9">주문 목록이 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<c:if test="${pd.totalCount <= 0 }">
			<div class="pageNavi">1</div>
		</c:if>
		<div class="pageNavi">
			${pd.pageNavi }
		</div>
	</div>
</section>

<script type="text/javascript">
	$(document).ready(function(){
		//접수 완료 상태로 변경
		$('[name=accept]').click(function(){
			var cusoOrderState = 1;
			var cusoIdx = $(this).parent().parent().prev().prev().val();
			console.log(cusoIdx);
			location.href="/orderStateUpdate.do?cusoOrderState="+cusoOrderState+"&cusoIdx="+cusoIdx;
		});
		//취소로 상태변경
		$('[name=cancle]').click(function(){
			var cusoOrderState = -1;
			var cusoIdx = $(this).parent().parent().prev().prev().val();
			location.href="/orderStateUpdate.do?cusoOrderState="+cusoOrderState+"&cusoIdx="+cusoIdx;
		});
		//수령 완료 상태로 변경
		$('[name=take]').click(function(){
			var cusoOrderState = 2;
			var cusoIdx = $(this).parent().parent().prev().prev().val();
			location.href="/orderStateUpdate.do?cusoOrderState="+cusoOrderState+"&cusoIdx="+cusoIdx;
		});
		//목록으로 이동
		$("#adminLink").click(function(){
			location.href="/admin.do";
		});
		/* 페이지 이동 전후로 선택한 박스 체크버튼 유지되는 것 해야됨 */
		//선택한 checkbox의 리스트 가져오기
		$('.chk').click(function(){
			var cusoMemberNo = $(this).val();
			location.href="/checkedCusoOrderList.do?cusoMemberNo="+cusoMemberNo+"&currentPage=''";
		});
		//검색어에 일치하는 리스트	
 		$('[name=searchBtn]').on("click",function(){
			var keyword = $(this).prev().val();
			location.href="/orderSearchKeyword.do?keyword="+encodeURI(keyword)+"&currentPage=''";
		}); 
	 	function searchBtn(text){
			location.href="/orderSearchKeyword.do?keyword="+encodeURI(text)+"&currentPage=''";
		};
		//선택한 체크박스 유지되게
		$('.chk').eq('${cusoMemberNo}').prop('checked',true);	
		//엔터키로 검색되게
		$('#textInput').keyup(function(event){
			if(event.keyCode == 13){
				var text = $(this).val();
				searchBtn(text);
				return;
			}
		});
	});
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />