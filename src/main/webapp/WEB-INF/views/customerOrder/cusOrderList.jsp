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
		<h1 class="comm-content-tit">회원 주문 목록</h1>
		<table class="comm-tbl" style="max-width:1200px">
			<colgroup>
				<col width="3%">
				<col width="7%">
				<col width="7%">
				<col width="8%">
				<col width="13%">
				<col width="10%">
				<col width="8%">
				<col width="6%">
				<col width="11%">
			</colgroup>	
			<tr>
				<th>No.</th><th>총 금액</th><th>연락처</th><th>회원번호</th><th>주문번호</th><th>지점번호</th><th>주문 날짜</th><th>상태</th><th>상태변경</th>
			</tr>
			<c:forEach items="${pd.list }" var="cusOrder" varStatus="i">
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
								${cusOrder.cusoOrderNo }
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
					<c:when test="${not empty sessionScope.mgr.mgrName || sessionScope.mgr.mgrLevel == 1}">
						<tr>
							<td>
								${i.count }
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
								${cusOrder.cusoOrderNo }
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
					<td>신청 목록이 없습니다.</td>
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
			<button class="btn-style2" style="font-size:15px;" id="noneCtmLink">비회원 주문 목록</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn-style2" style="font-size:15px;" id="adminLink">목록으로</button>
		</div>
	</div>
</section>

<script type="text/javascript">
	//비회원 주문 목록으로 이동
	$('#noneCtmLink').click(function(){
		location.href="/noneCtm.do";
	});
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
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />