<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" />
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->
<style>
	.move-pn-qna:hover,.move-all-qna:hover{
		cursor: pointer;
		color: #ffce32;
	}
</style>
<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<h1 class="board-tit">Q&A/신고</h1>
		<div class="common-tbl-box">
			<table class="comm-tbl">
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="60%">
				<col width="20%">
			</colgroup>
			 	<c:forEach items="${qnaList }" var="qna" varStatus="status">
			 		<c:if test="${qna.qnaNo eq qnaNo }">
			 		<c:set var = "currentIndex" value = "${status.index}"/>
						<tr>
							<th style="display:none;">${qna.qnaNo }</th>
							<th>${qna.qnaCategory }</th>
							<th>${qna.qnaWriter }</th>
							<th>${qna.qnaTitle }</th>
							<th>${qna.qnaDate }</th>
						</tr>
						<c:if test="${qna.filepath != null }">
							<c:forTokens items="${qna.filepath}" delims="," var="item">
								<tr>
									<td colspan="4">
										<img width="100%" src="/resources/upload/${item}">
									</td>
								</tr>
							</c:forTokens>
						</c:if>
						<tr>
							<td colspan="4">${qna.qnaContent }</td>
						</tr>
						<c:if test="${not empty qna.qnaComment }">
							<tr>
								<th>답변</th><td colspan="3">${qna.qnaComment }</td>
							</tr>
						</c:if>
					</c:if>
				</c:forEach>
			</table>

				<div class="common-tbl-btn-group">
					<button class="btn-style2 small move-all-qna">목록으로</button>
					<c:if test="${sessionScope.mgr.mgrLevel eq 1 }">
						<button class="btn-style2 small move-update-qna">수정하기</button>
						<button class="btn-style2 small move-delete-qna">삭제하기</button>
					</c:if>
				</div>
			
			<br><br>
			<table class="comm-tbl">
			<colgroup>
				<col width="15%">
				<col width="/">
			</colgroup>
			 	<c:forEach items="${qnaList }" var="qna" varStatus="status">
					<c:if test="${status.index eq currentIndex-1 }">
						<tr>
							<td style="display:none;">${qna.qnaNo }</td>
							<td colspan="2" class="move-pn-qna">
								△이전글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${qna.qnaTitle }
							</td>
						</tr>
					</c:if>
					<c:if test="${status.index eq currentIndex+1 }">
						<tr>
							<td style="display:none;">${qna.qnaNo }</td>
							<td colspan="2" class="move-pn-qna">
								▽다음글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${qna.qnaTitle }
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