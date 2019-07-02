<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<%-- Content --%>
<img src="/resources/img/main_event.jpg">
<section id="content-wrapper">
	<div class="area">
		<a href="/index.do">로그인!!</a>
		<img src="/resources/img/img_recipe_b01.jpg" onclick="location.href='/admin.do';" style="cursor:pointer;"><br>
		<img src="/resources/img/img_recipe_b02.jpg"><br>
		<img src="/resources/img/img_recipe_b03.jpg"><br>
		<img src="/resources/img/img_recipe_b04.jpg"><br>
		<img src="/resources/img/img_recipe_b05.jpg"><br>
		<img src="/resources/img/img_recipe_b06.jpg"><br>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />