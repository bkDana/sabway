<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<style>
	input {
		-webkit-box-shadow: 0 0 0 1000px white inset;
		outline-style: none;
		width:250px;
		height:30px;
		font-size:20px;
	}
	[name=searchBox]{
		text-align:center;
		margin-left: 20%;
	}
	select{
		height:36px;
		font-size:15px;
	}
	.onBtn,.offBtn{
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
	.onBtn{
		background-color: #f8585b;
	}
	.offBtn{
		background-color: #122322;
	}
	[name=searchBtn]{
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
	[name=selectBox]{
		width:100px;
		margin-left: 10.6%;
	}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 주문관리 > 주문 목록</div>
		<table class="comm-tbl" style="max-width:1200px">
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="7%">
				<col width="14%">
				<col width="20%">
				<col width="10%">
				<col width="8%">
				<col width="6%">
				<col width="15%">
			</colgroup>	
			<tr>
				<th>No.</th><th>총 금액</th><th>연락처</th><th>회원번호</th><th>주문번호</th><th>지점번호</th><th>주문 날짜</th><th>상태</th>
			</tr>
			<c:forEach items="" var="cusOrder" varStatus="i">
				<tr>
					<td>
						<input type="hidden" name="cusoIdx" var="${cusOrder.cusoIdx }">
						${i.count }
					</td>
					<td>
						<input type="hidden" name="cusoTotalCost" var="${cusOrder.cusoTotalCost }">
						${cusOrder.cusoTotalCost }
					</td>
					<td>
						<input type="hidden" name="cusoTotalCost" var="${cusOrder.cusoTotalCost }">
						${cusOrder.cusoTotalCost }
					</td>
					<td>
						<input type="hidden" name="cusoMemberNo" var="${cusOrder.cusoMemberNo }">
						${cusOrder.cusoMemberNo }
					</td>
					<td>
						<input type="hidden" name="cusoOrderNo" var="${cusOrder.cusoOrderNo }">
						${cusOrder.cusoOrderNo }
					</td>
					<td>
						<input type="hidden" name="cusoBranchName" var="${cusOrder.cusoBranchName }">
						${cusOrder.cusoBranchName }
					</td>
					<td>
						<input type="hidden" name="cusoOrderDate" var="${cusOrder.cusoOrderDate }">
						${cusOrder.cusoOrderDate }
					</td>
					<td>
						<!-- 주문 상태 (접수전: 0, 접수완료: 1, 수령완료:2, 취소: -1(취소는 접수 전에만 가능) ) -->
						<input type="hidden" name="cusoOrderState" var="${cusOrder.cusoOrderState }">
						<c:if test="${cusOrder.cusoOrderState == 1}">
							접수 완료
						</c:if>
						<c:if test="${cusOrder.cusoOrderState == 2}">
							수령 완료
						</c:if>
						<c:if test="${cusOrder.cusoOrderState == 0}">
							접수 전
						</c:if>
						<c:if test="${cusOrder.cusoOrderState < 0}">
							취소
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</section>

<script type="text/javascript">

</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />