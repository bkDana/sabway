<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div class="common-tbl-box">
			<form action="/qnaUpdate.do" method="post" enctype="multipart/form-data">
				<table class="comm-tbl">
					<colgroup>
						<col width="15%">
						<col width="20%">
						<col width="15%">
						<col width="/">
					</colgroup>
					<c:forEach items="${qnaList }" var="qna" varStatus="status">
			 			<c:if test="${qna.qnaNo eq qnaNo }">
							<tr>
								<td>카테고리</td>
								<td>
									<select name="qnaCategory">
										<option value="Q&A">Q&A</option>
										<option value="신고">신고</option>
									</select>
								</td>
								<td>제목</td>
								<td>
									<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
									<input type="text" name="qnaTitle" value="${qna.qnaTitle }">
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="3">
									<textarea rows="20" name="qnaContent">${qna.qnaContent }</textarea>
								</td>
							</tr>
							<tr>
								<td>파일 업로드</td>
								<td colspan="3" class="common-tbl-btn-group">
									<c:if test="${empty qna.filename }">
										<input type="file" name="fileName">
									</c:if>
									<c:if test="${not empty qna.filename}">
										<input type="file" name="fileName">
										<input type="text" name="filename" value="${qna.filename }" readonly="readonly">
										<input type="hidden" name="filepath" value="${qna.filepath }">
										<button type="button" id="fileDelete">기존 파일삭제</button>
									</c:if>
										<input type="hidden" id="fileStatus" name="fileStatus" value="0">
								</td>
								
							</tr>
							<tr>
								<td colspan="4">
									<div class="common-tbl-btn-group">
										<button class="btn-style2" type="submit">수정하기</button>
									</div>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</form>
		</div>
	</div>
</section>

<script>
	
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />