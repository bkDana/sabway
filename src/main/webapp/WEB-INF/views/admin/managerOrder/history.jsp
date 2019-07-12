<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">

	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 재고관리 > <a href="/managerOrder/stockList.do">재고현황</a></div>
		<%-- 
		<p>
		
			<select id="order" data-val="${search.orderBy }">
				<option value="new">최신등록순</option>
				<option value="del">배송일순</option>
				<c:if test="${sessionScope.mgr.mgrLevel eq 1 }"><option value="store">매장별</option></c:if>
			</select>
		</p>
		 --%>
		<table class="his-tbl">
			<colgroup>
				<col width="">
				<col width="50%">
			</colgroup>
			<tr>
				<th>내역</th><th>시간</th>
			</tr>
			<c:forEach items="${history }" var="history">
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
		</table>
		
		<!-- paging 
		<div class="paging">
			${list.pageNavi }	
		</div>
		-->
	</div>
</section>


<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />