<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<script type="text/javascript" src="/resources/js/bucket.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<div class="area">
		<div class="common-tbl-btn-group">
			<h1 class="comm-content-tit">주문이 접수되었습니다</h1>
			<c:if test="${sessionScope.customer ne null }">
				
				<button class="btn-style1" onclick="location.href='/loadOrderList.do'">주문내역확인</button>&ensp;
			</c:if>
			<c:if test="${sessionScope.customer eq null }">
				<h1>주문번호는 ${tempCuso.cusoCallBy }입니다</h1><br>
			</c:if>
				
				<button class="btn-style1" onclick="location.href='/toMain.do'">메인페이지로</button>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />