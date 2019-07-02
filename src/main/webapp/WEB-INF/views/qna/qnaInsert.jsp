<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<div class="common-tbl-box">
		<form action="/qnaInsert.do" method="post" enctype="multipart/form-data">
			<table class="comm-tbl">
				<colgroup>
					<col width="15%">
					<col width="20%">
					<col width="15%">
					<col width="/">
				</colgroup>
				<tr>
					<td>카테고리</td>
					<td>
						<select name="qnaCategory">
							<option value="Q&A">Q&A</option>
							<option value="신고">신고</option>
						</select>
					</td>
					<td>작성자</td>
					<td>
						<input type="text" name="qnaWriter"><%--원래는 value 세션으로 받아서 처리 --%>
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3">
						<input type="text" name="qnaTitle">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea rows="20" name="qnaContent"></textarea>
					</td>
				</tr>
				<tr>
					<td>파일 업로드</td>
					<td colspan="3">
						<input type="file" name="fileName">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="common-tbl-btn-group">
							<button class="btn-style2" type="submit">작성하기</button>
						</div>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />