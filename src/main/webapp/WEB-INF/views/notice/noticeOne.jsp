<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" />
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->
<style>
	.move-pn-notice:hover,.move-all-notice:hover{
		cursor: pointer;
		color: #ffce32;
	}
</style>
<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<h1 class="board-tit">공지사항/이벤트</h1>
		<div class="common-tbl-box">
			<table class="comm-tbl">
			<colgroup>
				<col width="15%">
				<col width="65%">
				<col width="20%">
			</colgroup>
			 	<c:forEach items="${noticeList }" var="notice" varStatus="status">
			 		<c:if test="${notice.noticeNo eq noticeNo }">
			 		<c:set var = "currentIndex" value = "${status.index}"/>
						<tr>
							<th style="display:none;">${notice.noticeNo }</th>
							<th>${notice.noticeCategory }</th>
							<th>${notice.noticeTitle }</th>
							<th>${notice.noticeDate }</th>
						</tr>
						<c:if test="${notice.filepath != null }">
							<c:forTokens items="${notice.filepath}" delims="," var="item">
								<tr>
									<td colspan="3">
										<img width="100%" src="/resources/upload/${item}">
									</td>
								</tr>
							</c:forTokens>
						</c:if>
						<tr>
							<td colspan="3">${notice.noticeContent }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>

				<div class="common-tbl-btn-group">
					<button class="btn-style2 small move-all-notice">목록으로</button>
					<button class="btn-style2 small move-delete-notice">삭제하기</button>
					<c:if test="${sessionScope.member.memberId eq 'admin' }">
						<button class="btn-style2 small move-update-notice">수정하기</button>
						<button class="btn-style2 small move-delete-notice">삭제하기</button>
					</c:if>
				</div>
			
			<br><br>
			<table class="comm-tbl">
			<colgroup>
				<col width="15%">
				<col width="/">
			</colgroup>
			 	<c:forEach items="${noticeList }" var="notice" varStatus="status">
					<c:if test="${status.index eq currentIndex-1 }">
						<tr>
							<td style="display:none;">${notice.noticeNo }</td>
							<td colspan="2" class="move-pn-notice">
								△이전글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${notice.noticeTitle }
							</td>
						</tr>
					</c:if>
					<c:if test="${status.index eq currentIndex+1 }">
						<tr>
							<td style="display:none;">${notice.noticeNo }</td>
							<td colspan="2" class="move-pn-notice">
								▽다음글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${notice.noticeTitle }
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />