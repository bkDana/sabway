<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<script type="text/javascript" src="/resources/js/admin-notice.js"></script>

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 게시판관리 > <a href="/board/noticeList.do">공지사항</a></div>
		<div class="common-tbl-box">
		<form action="/board/noticeInsert.do" method="post" enctype="multipart/form-data">
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
							<option value="이벤트">이벤트</option>
						</select>
					</td>
					<td>제목</td>
					<td>
						<input type="text" name="noticeTitle">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea rows="20" name="noticeContent"></textarea>
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
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />