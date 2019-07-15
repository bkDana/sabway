<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->


<jsp:include page="/WEB-INF/views/common/sub.jsp" />

<%-- Content --%>
<section id="content-wrapper" style="background-color: #fff;">
	<div class="area">
		<h1 class="board-tit">Q&A/신고</h1>
		<!-- <div class="common-tbl-box"> -->
			
			<table class="comm-tbl board">
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="/">
				<col width="15%">
			</colgroup>
				<tr>
					<td>번호</td>
					<td>작성자</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
				
			<c:forEach items="${qnaList}" var="qna">
				<tr class="normal">
					<td>${qna.qnaCategory }</td>
					<td>${qna.qnaWriter }</td>
					<td style="display:none;">${qna.qnaNo }</td>
					<%--><c:if test="${sessionScope. }">--%>
						<td class="move-one-qna">${qna.qnaTitle }</td>
					
					<td>${qna.qnaDate }</td>
				</tr>
			</c:forEach>
			
			</table>
			
			<c:if test="${not empty sessionScope.customer }">
				<div class="common-tbl-btn-group">
					<button class="btn-style2 insert-qna">게시글 작성하기</button>
				</div>
			</c:if>
				<div class="common-tbl-btn-group">
					<button class="btn-style2 insert-qna">게시글 작성하기</button>
				</div>
			<div class="paging">${pageNavi }</div>
		</div>
	<!-- </div> -->
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />