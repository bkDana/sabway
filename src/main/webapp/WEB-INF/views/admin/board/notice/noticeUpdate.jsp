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
			<form action="/noticeUpdate.do" method="post" enctype="multipart/form-data">
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
								<select name="noticeCategory">
									<option value="공지사항">공지사항</option>
									<option value="이밴트">이벤트</option>
								</select>
							</td>
							<td>제목</td>
							<td>
								<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
								<input type="text" name="noticeTitle" value="${notice.noticeTitle }">
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="3">
								<textarea rows="20" name="noticeContent">${notice.noticeContent }</textarea>
							</td>
						</tr>
						<tr>
							<td>파일 업로드</td>
							<td colspan="3">
								<c:if test="${empty notice.filename }">
									<input type="file" name="fileName">
								</c:if>
								<c:if test="${not empty notice.filename}">
									<input type="file" name="fileName"><br>
									<input type="text" name="filename" value="${notice.filename }" readonly="readonly">
									<input type="hidden" name="filepath" value="${notice.filepath }">
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
				</table>
			</form>
		</div>
	</div>
</section>

<script>
	
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />