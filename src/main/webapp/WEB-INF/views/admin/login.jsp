<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="/resources/img/subway_favicon.ico">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css"> <!-- 태그 초기화 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/user-layout.css"> <!-- 레이아웃 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/content.css"> <!-- 컨텐츠 css(민주) -->

<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->

<%-- Content --%>
<section id="content-wrapper" style="background-color:#f8f8f8;height:100%;">
	<div class="area">
		<h2 class="comm-content-tit">관리자 로그인</h2>
		<div class="common-tbl-box" style="padding-bottom:50px;">
			<form action="/adminLogin.do" method="post">
				<div class="login-inner clearfix">
					<div class="login-tbl-box">
					<table class="comm-tbl login-tbl">
						<colgroup>
							<col width="20%">
							<col width="/">
						</colgroup>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="mgrId"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="mgrPw"></td>
						</tr>
					</table>
					</div>
					<div class="common-tbl-btn-group">
						<button type="submit" class="btn-style1">LOGIN</button>
					</div>
				</div>
			</form>	
		</div>
	</div>
</section>

<%-- Footer --%>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> --%>