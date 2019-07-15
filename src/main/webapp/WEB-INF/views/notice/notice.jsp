<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->
<style>
	.move-one-notice:hover{
		cursor: pointer;
		color: #ffce32;
	}
</style>
<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<h1 class="board-tit">공지사항/이벤트</h1>
		<div class="common-tbl-box">
			
			<table class="comm-tbl type2">
			<colgroup>
				<col width="15%">
				<col width="/">
				<col width="15%">
			</colgroup>
				<tr>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				
			<c:forEach items="${noticeList}" var="notice">
				<tr>
					<td>${notice.noticeCategory }</td>
					<td style="display:none;">${notice.noticeNo }</td>
					<td class="move-one-notice">${notice.noticeTitle }</td>
					<td>${notice.noticeDate }</td>
				</tr>
			</c:forEach>
			
			</table>
			<c:if test="${sessionScope.manager.managerId eq 'admin' }">
				<div class="common-tbl-btn-group">
					<button class="btn-style2 insert-notice">공지사항 작성하기</button>
				</div>
			</c:if>
			<div class="paging">${pageNavi }</div>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />