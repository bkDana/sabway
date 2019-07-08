<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->

<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<div class="common-tbl-box">
			<table class="comm-tbl">
				<tr>
					<th>제목</th>
					<td colspan="3"><span>${ap.applyTitle }</span></td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${ap.applyName }</td>
					<th>지역</th>
					<td>${ap.applyArea }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${ap.applyPhone }</td>
					<th>이메일</th>
					<td>${ap.applyEmail }</td>
				</tr>
				<!-- 첨부파일이 없으면 hidden -->
				<c:choose>
					<c:when test="${not empty ap.applyFilename }">
						<tr>
							<th>첨부파일</th>
							<td colspan="3">${ap.applyFilename }</td>
						</tr>
					</c:when>
				</c:choose>
				<tr>
					<th>내용</th>
					<td name="contentTd"colspan="3"><textarea>${ap.applyContent }</textarea></td>
				</tr>
			</table>
		</div>
		<div class="common-tbl-btn-group">
			<button type="button" class="btn-style2"><a href="/managerApply.do">목록으로</a></button>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />