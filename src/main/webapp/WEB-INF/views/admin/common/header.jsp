	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="/resources/img/subway_favicon.ico">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css"> <!-- 태그 초기화 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/manager-layout.css"> <!-- 레이아웃 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/manager-content.css"> <!-- 컨텐츠 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">

<!-- script -->
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 선언 -->

<!-- Datapicker 달력 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="/resources/js/common.js"></script>

<title>관리자 페이지</title>
</head>
<body>
	<header id="header">
		<div class="admin-header">
			<c:if test="${not empty sessionScope.mgr.mgrId }">
				<a href="/admin.do">${sessionScope.mgr.mgrName } 관리자 페이지</a>
			</c:if>
			<div style="float:right;margin-right:60px;">
				<c:if test="${not empty sessionScope.mgr.mgrId }">
					<span style="color:white;">${sessionScope.mgr.mgrName }</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="/adminLogout.do">로그아웃</a>
				</c:if>
			</div>
		</div>
		<div id="headerInnerWrap">
			<!-- 헤더 상단 -->
			<div id="headerInner" class="clearfix">
				<!-- 주메뉴 -->
				<nav id="gnb" class="total-menu">
					<div id="gnbBg"></div>
					<ul class="clearfix">
						<li class="gnb06">
							<a href="/salesStatics/goTotalSales.do" class="<%if(request.getRequestURL().toString().split("/")[6].equals("salesStatics")){%>on<%}%>">매출통계</a>
						</li>
						<c:if test="${sessionScope.mgr.mgrLevel eq 1 }">
							<li class="gnb01">
								<a href="/allCustomerList.do?currentPage=''" class="<%if(request.getRequestURL().toString().split("/")[6].equals("allCustomerList.jsp")){%>on<%}%>">회원관리</a>
							</li>
						</c:if>
						
						<li class="gnb01">
							<a href="/managerProfile.do?currentPage=''" class="<%if(request.getRequestURL().toString().split("/")[6].equals("managerProfile.jsp")||request.getRequestURL().toString().split("/")[6].equals("managerList.jsp")||request.getRequestURL().toString().split("/")[6].equals("managerApply.jsp")){%>on<%}%>">매장 관리</a>
						</li>
						<c:if test="${sessionScope.mgr.mgrLevel eq 1 }">
							<li class="gnb02">
								<a href="/ingreManage/goIngreReg.do" class="<%if(request.getRequestURL().toString().split("/")[6].equals("ingreManage")||request.getRequestURL().toString().split("/")[6].equals("SelectPromotion.jsp")){%>on<%}%>">재료관리</a>
							</li>
						</c:if>
						<li class="gnb03">
							<a href="/managerOrder/orderList.do" class="<%if(request.getRequestURL().toString().split("/")[6].equals("managerOrder")){%>on<%}%>">재고관리</a>
						</li>
						<li class="gnb04">
							<a href="/cusOrderList.do?currentPage=''" class="<%if(request.getRequestURL().toString().split("/")[6].equals("cusOrderList.jsp")){%>on<%}%>">주문관리</a>
						</li>
						<c:if test="${sessionScope.mgr.mgrLevel eq 1 }">
							<li class="gnb05">
								<a href="/board/boardList.do?type=notice" class="<%if(request.getRequestURL().toString().split("/")[6].equals("board")){%>on<%}%>">게시판관리</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</header>
