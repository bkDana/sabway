<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] pname = request.getRequestURL().toString().split("/");
String p6 = "";
//String p7 = "";
if(pname.length==7){
	p6 = pname[6];
}
%>
	<!-- 서브 메뉴 -->
	<nav id="sub" class="total-menu">
		<div id="subBg"></div>
		<ul class="clearfix">
			<li>
				<a href="/intro/menu.do?no=1" class="<%if(p6.equals("menu1.jsp")){%>on<%}%>">샌드위치</a>
			</li>
			<li>
				<a href="/intro/menu.do?no=2" class="<%if(p6.equals("menu2.jsp")){%>on<%}%>">찹샐러드</a>
			</li>
			<li>
				<a href="/intro/menu.do?no=3" class="<%if(p6.equals("menu3.jsp")){%>on<%}%>">추가토핑</a>
			</li>
			<li>
				<a href="/intro/menu.do?no=4">사이드 · 음료</a>
			</li>
			<li>
				<a href="/intro/menu.do?no=5">단체메뉴</a>
			</li>
			<li>
				<a href="/intro/menu.do?no=6">신선한 재료 소개</a>
			</li>
		</ul>
	</nav>
