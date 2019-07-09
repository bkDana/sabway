<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<%-- Content --%>
<img src="/resources/img/img_visual_sandwich.jpg" class="sub-img">
<jsp:include page="/WEB-INF/views/common/sub.jsp" />
<div class="sub-menu-title">
	<p>Sandwich</p>
	<p>전세계 넘버원 브랜드 Subway!</p>
	<p>50년 전통의 세계 최고의 샌드위치를 맛보세요!</p>
</div>


<section id="content-wrapper" >
	
	<div class="area" >
		
		<ul class="menu-list clearfix">
			<li>
				<span>NEW</span>
				<span>
					<img src="/resources/img/sandwich.png" width="150px" height="150px"><br>
				</span>
				<span>쉬림프</span>
				<span>235kcal</span>
			</li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />