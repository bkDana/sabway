<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%String[] pname = request.getRequestURL().toString().split("/");%>


<%if(pname[5].equals("menu")){ %>
<!-- 메뉴 소개 : 서브 -->
<nav id="sub">
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
		<li>
			<a href="/intro/menu.do?no=5" class="<c:if test='${param.no >= 5 }'>on</c:if>">신선한 재료</a>
		</li>
	</ul>
</nav>
<%}else if(pname[5].equals("notice")||pname[5].equals("qna")||pname[5].equals("review")){ %>
<!-- 새소식(게시판) : 서브 -->
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
<%}else if(pname[6].equals("customerProfile.jsp")||pname[6].equals("myMenuList.jsp")){ %>
<!-- 마이페이지 : 서브 -->
<nav id="sub" class="basic-sub">
	<div id="subBg"></div>
	<ul class="clearfix">
		<li>
			<a href="/customerProfile.do" class="<%if(pname[6].equals("customerProfile.jsp")){ %>on<%}%>">회원정보</a>
		</li>
		<li>
			<a href="/loadOrderList.do" class="<%if(pname[5].equals("qna")){ %>on<%}%>">주문내역</a>
		</li>
		<li>
			<a href="/loadMyMenu.do" class="<%if(pname[6].equals("myMenuList.jsp")){ %>on<%}%>">나만의 메뉴</a>
		</li>
	</ul>
</nav>
<%}else{ %>
<nav id="sub" class="basic-sub">
	<div id="subBg"></div>
	<ul class="clearfix">
		<li>
			<a href="/franchise.do" class="<%if(pname[6].equals("franchise.jsp")){ %>on<%}%>">싸브웨이 프랜차이즈</a>
		</li>
		<li>
			<a href="/applyPage.do?currentPage=" class="<%if(pname[6].equals("applyWrite.jsp")){ %>on<%}%>">가맹신청/문의 </a>
		</li>
	</ul>
</nav>
<%} %>
