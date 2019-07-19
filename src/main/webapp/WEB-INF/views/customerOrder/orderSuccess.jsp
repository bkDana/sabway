<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<script type="text/javascript" src="/resources/js/bucket.js"></script>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<div class="area">
		<h1 class="comm-content-tit">주문이 접수되었습니다</h1>
		<c:if test="${sessionScope.customer ne null }">
			<h1>주문내역확인하기</h1>
		</c:if>
		<h1>주문번호는 ${tempCuso.cusoCallBy }입니다</h1>
		<h1>메인 페이지로 돌아가기</h1>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />