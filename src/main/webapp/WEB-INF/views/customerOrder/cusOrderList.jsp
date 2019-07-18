<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<style>
	[name=cancle],[name=accept],[name=take]{
		width:60px;
	    border: none;
	    color:#fff;
	    padding: 5px 0;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    cursor: pointer;
	    height: 20px;
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
	#searchOrder{
		height:36px;
		width:100px;
		margin-left: 10.6%;
	    text-align: center;
	}
	#searchBtn{
		background-color: gray;
		width:50px;
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
	#keyword {
		-webkit-box-shadow: 0 0 0 1000px white inset;
		outline-style: none;
		width:250px;
		height:30px;
		font-size:20px;
	}
	.pageNavi{
		color:black;
		text-align:center;
		margin-top:35px;
		font-size: 15px;
		font-weight: bold;
	}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 주문관리 > 주문 목록(회원)</div>
		<h1 class="comm-content-tit">주문 목록</h1>
		<!-- 비회원="0" , 회원="-1" , 전체="-2" -->
		<label for="chkAll"><input type="checkbox" id="chkAll" class="chk" value="-2">전체회원</label>
		<label for="chkMgr"><input type="checkbox" id="chkMgr" class="chk" value="-1">회원</label>
		<label for="chkNoneCtm"><input type="checkbox" id="chkNoneCtm" class="chk" value="0">비회원</label>
		<select id="searchOrder">
			<option>주문번호</option>
		</select>
		<input type="text" id="keyword">
		<button type="button" id="searchBtn">검색</button>
		<br><br>
		<table class="comm-tbl" style="max-width:1200px">
			<colgroup>
				<col width="3%">
				<col width="6%">
				<col width="9%">
				<col width="7%">
				<col width="11%">
				<col width="15%">
				<col width="8%">
				<col width="6%">
				<col width="11%">
			</colgroup>	
			<tr>
				<th>No.</th><th>총 금액</th><th>연락처</th><th>회원번호</th><th>주문번호</th><th>지점번호</th><th>주문 날짜</th><th>상태</th><th>상태변경</th>
			</tr>
			<c:forEach items="${pd.list }" var="cusOrder">
				<input type="hidden" name="cusoIdx" value="${cusOrder.cusoIdx }">
				<c:choose>
					<c:when test="${sessionScope.mgr.mgrName == cusOrder.cusoBranch || sessionScope.mgr.mgrLevel == 1}">
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
									/
									<a href="#" name="cancle">취소</a>
								</td>
							</c:if>
							<c:if test="${cusOrder.cusoOrderState < 0}">
								<td>취소</td>
								<td></td>
							</c:if>
						</tr>
					</c:when>
					<c:when test="${not empty sessionScope.mgr.mgrName && sessionScope.mgr.mgrLevel == 1}">
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
									/
									<a href="#" name="cancle">취소</a>
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
					<td colspan="9">신청 목록이 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<c:if test="${pd.totalCount <= 0 }">
			<div class="pageNavi">1</div>
		</c:if>
		<div class="pageNavi">
			${pd.pageNavi }
		</div>
		<div class="common-tbl-btn-group">
			<button class="btn-style2" style="font-size:15px;" id="adminLink">목록으로</button>
		</div>
	</div>
</section>

<script type="text/javascript">
	//접수 완료 상태로 변경
	$('[name=accept]').click(function(){
		var cusoOrderState = 1;
		var cusoIdx = $(this).parent().parent().prev().val();
		console.log(cusoIdx);
		location.href="/orderStateUpdate.do?cusoOrderState="+cusoOrderState+"&cusoIdx="+cusoIdx;
	});
	//취소로 상태변경
	$('[name=cancle]').click(function(){
		var cusoOrderState = -1;
		var cusoIdx = $(this).parent().parent().prev().val();
		location.href="/orderStateUpdate.do?cusoOrderState="+cusoOrderState+"&cusoIdx="+cusoIdx;
	});
	//수령 완료 상태로 변경
	$('[name=take]').click(function(){
		var cusoOrderState = 2;
		var cusoIdx = $(this).parent().parent().prev().val();
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
	$('#searchBtn').click(function(){
		var keyword = $("#keyword").val();
		location.href="/orderSearchKeyword.do?keyword="+keyword+"&currentPage=''";
	});
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />