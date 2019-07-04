<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->

<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<h1 class="comm-content-tit">관리자 로그인</h1>
		<div class="common-tbl-box">
			<form action="/adminLogin.do" method="post">
				ID : <input type="text" name="mgrId"><br>
				PW : <input type="password" name ="mgrPw"><br>
				<input type="submit" value="로그인">
			</form>	
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />