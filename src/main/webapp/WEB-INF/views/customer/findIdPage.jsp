<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section id="content-wrapper">
	<div class="area">
		<form action="/findId.do" method="post">
			<div class="login-tbl-box">
				<table class="comm-tbl login-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>이름</th>
						<td><input type="text" name="customerName"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="password" name="email" placeholder='등록된 이메일을 입력해주세요.'></td>
					</tr>
				</table>
			</div>
			<div class="common-tbl-btn-group" style="padding-top:35px;text-align:center">
				<button type="submit" class="btn-style1">찾기</button>
			</div>
		</form>
	</div>
</section>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />