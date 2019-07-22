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
		<h1 class="board-tit">공지사항/이벤트</h1>
		<!-- <div class="common-tbl-box"> -->
			
			<table class="comm-tbl board">
			<colgroup>
				<col width="10%">
				<col width="/">
				<col width="15%">
			</colgroup>
			<!-- 
				<tr>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			 -->	
			<tr>
				<td><img src="/resources/img/icon_notice.png"></td>
				<td class="move-one-notice">위에 고정되는거 디자인</td>
				<td>날짜아ㅏㅏㅏㅏ</td>
			</tr>
			<c:forEach items="${noticeList}" var="notice">
				<tr class="normal">
					<%-- <td>${notice.noticeCategory }</td> --%>
					<td><!-- style="display:none;" -->${notice.noticeNo }</td>
					<td class="move-one-notice">${notice.noticeTitle }</td>
					<td>${notice.noticeDate }</td>
				</tr>
			</c:forEach>
			
			</table>
			<c:if test="${sessionScope.mgr.mgrLevel eq 1 }">
				<div class="common-tbl-btn-group">
					<button class="btn-style2 insert-notice">작성하기</button>
				</div>
			</c:if>
			<div class="paging">${pageNavi }</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />