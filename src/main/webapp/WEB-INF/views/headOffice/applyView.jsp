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
					<th style="text-align:center;">제목</th>
					<td colspan="3"><span>${ap.applyTitle }</span></td>
				</tr>
				<tr>
					<th style="text-align:center;">이름</th>
					<td>${ap.applyName }</td>
					<th style="text-align:center;">지역</th>
					<td>${ap.applyArea }</td>
				</tr>
				<tr>
					<th style="text-align:center;">연락처</th>
					<td>${ap.applyPhone }</td>
					<th style="text-align:center;">이메일</th>
					<td>${ap.applyEmail }</td>
				</tr>
				<!-- 첨부파일이 있으면 출력 -->
				<c:if test="${not empty ap.applyFilename }">
					<tr>
						<th style="border-bottom:none; text-align:center;">첨부파일</th>
						<td colspan="3" style="border-bottom:none; text-align:center;" name="contentTd">
							<img src="/resources/upload/${ap.applyFilepath }" width="500px" height="350px">
						</td>
					</tr>
					<tr>
						<th height="400px" style="border-top:none; text-align:center;">내용</th>
						<td name="contentTd" colspan="3" style="border-top:none;"><span>${ap.applyContent }</span></td>
					</tr>
				</c:if>
				<c:if test="${empty ap.applyFilename }">
					<tr>
						<th style="text-align:center;">내용</th>
						<td name="contentTd" colspan="3" height="500px" >${ap.applyContent }</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div class="common-tbl-btn-group">
			<button type="button" class="btn-style2"><a href="/managerApply.do">목록으로</a></button>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />