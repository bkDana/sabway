<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String[] pname = request.getRequestURL().toString().split("/");
%>

	<%if(pname[5].equals("menu")){ %>
	<!-- 서브 메뉴 -->
	<nav id="sub"> <!-- class="total-menu" -->
		<div id="subBg"></div>
		<ul class="clearfix">
			<li>
				<a href="/intro/menu.do?no=1" class="<c:if test='${param.no eq 1 }'>on</c:if>">샌드위치</a>
			</li>
			<li>
				<a href="/intro/menu.do?no=2" class="<c:if test='${param.no eq 2 }'>on</c:if>">찹샐러드</a>
			</li>
			<li>
				<a href="/intro/menu.do?no=3" class="<c:if test='${param.no eq 3 }'>on</c:if>">추가토핑</a>
			</li>
			<li>
				<a href="/intro/menu.do?no=4" class="<c:if test='${param.no eq 4 }'>on</c:if>">사이드 · 음료</a>
			</li>
			<!-- 
			<li>
				<a href="/intro/menu.do?no=5">단체메뉴</a>
			</li>
			 -->
			<li>
				<a href="/intro/menu.do?no=5" class="<c:if test='${param.no >= 5 }'>on</c:if>">신선한 재료</a>
			</li>
		</ul>
	</nav>
	<%} %>

	<%if(pname[5].equals("notice")||pname[5].equals("qna")||pname[5].equals("review")){ %>
	<!-- 서브 메뉴 -->
	<nav id="sub" class="basic-sub">
		<div id="subBg"></div>
		<ul class="clearfix">
			<li>
				<a href="/notice.do?currentPage=1" class="<%if(pname[5].equals("notice")){ %>on<%}%>">공지사항/이벤트</a>
			</li>
			<li>
				<a href="/qna.do?currentPage=1" class="<%if(pname[5].equals("qna")){ %>on<%}%>">Q&A</a>
			</li>
			<li>
				<a href="/review.do?currentPage=1" class="<%if(pname[5].equals("review")){ %>on<%}%>">리뷰</a>
			</li>
		</ul>
	</nav>
	<%} %>
