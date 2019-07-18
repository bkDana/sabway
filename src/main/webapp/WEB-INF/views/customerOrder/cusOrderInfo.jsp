<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 주문관리 > 주문 목록(회원)</div>
		
		<table class="comm-tbl type2">
			<c:forEach items="${cusOrder.bucketList }" var="bucket">
				<tr>
					<td>${bucket.bucBread }</td>
					<td>${bucket.bucMain }</td>
					<td>${bucket.bucCheese }</td>
				</tr>
			</c:forEach>
		</table>

		<div class="common-tbl-btn-group">
			<button class="btn-style2" style="font-size:15px;" id="adminLink">목록으로</button>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />