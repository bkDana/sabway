<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="/resources/img/subway_favicon.ico">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css"> <!-- 태그 초기화 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/layout.css"> <!-- 레이아웃 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/content.css"> <!-- 컨텐츠 css(민주) -->

<link href="/resources/css/style.css" rel="stylesheet" type="text/css">

<!-- script -->
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 선언 -->
<script type="text/javascript" src="/resources/js/nav.js"></script><!-- nav.js -->

<title>관리자 페이지</title>
</head>
<body>
	<header id="header">
		<div class="main-header">
			OO점 관리자 페이지
		</div>
		<div id="headerInnerWrap">
			<!-- 헤더 상단 -->
			<div id="headerInner" class="clearfix">
				<!-- 주메뉴 -->
				<nav id="gnb" class="total-menu">
					<div id="gnbBg"></div>
					<ul class="clearfix">
						<li class="gnb01">
							<a href="#">회원관리</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">회원 리스트</a></li>
								</ul>
							</div>
						</li>
						<li class="gnb02">
							<a href="#">매장관리</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">가맹점 리스트</a></li>
									<li><a href="#">가맹점 회원 등록</a></li>
									<li><a href="#">가맹점 신청 리스트</a></li>
								</ul>
							</div>
						</li>
						<li class="gnb03">
							<a href="#">메뉴관리</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">메뉴 리스트</a></li>
								</ul>
							</div>
						</li>
						<li class="gnb04">
							<a href="/orderList.do">발주관리</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="/orderList.do">발주 리스트</a></li>
									
								</ul>
							</div>
						</li>
						<li class="gnb05">
							<a href="#">주문관리</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">주문 리스트</a></li>
								</ul>
							</div>
						</li>
						<li class="gnb06">
							<a href="#">게시판관리</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">공지사항</a></li>
									<li><a href="#">이벤트</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
