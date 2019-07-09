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
<link rel="stylesheet" type="text/css" href="/resources/css/user-layout.css"> <!-- 레이아웃 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/content.css"> <!-- 컨텐츠 css(민주) -->

<link href="/resources/css/style.css" rel="stylesheet" type="text/css">

<!-- script -->
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 선언 -->
<script type="text/javascript" src="/resources/js/nav.js"></script><!-- nav.js -->

<title>진짜 메인</title>
</head>
<body>
	<%if(request.getRequestURL().toString().split("/")[5].equals("main.jsp")){%>
	<div class="banner">
		<button type="button" class="close-btn"><img src="/resources/img/main_top_line_banner_closebtn.png" ></button>
		<a href="#">
			<img src="/resources/img/써브웨이_띠배너_PC_1920x140_20190531064940182.jpg" width="100%" style="min-height:93px;">
		</a>
	</div>
	<script>
		$('.close-btn').click(function(){
			console.log('클릭');
			$('.banner').hide();
		});
	</script>
	<%} %>
	<header id="header">
		<div class="main-header">
		</div>
		<div id="headerInnerWrap">
			<!-- 로고 -->
			<div class="header-logo"><a href="/"><img src="/resources/img/logo_w.png" style="max-height:68px;"></a></div>
			<!-- 헤더 상단 -->
			<div id="headerInner" class="clearfix">
				<!-- 주메뉴 -->
				<nav id="gnb" class="total-menu">
					<div id="gnbBg"></div>
					<ul class="clearfix">
						<li class="gnb01">
							<a href="/menu1.do">메뉴소개</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">샌드위치</a></li>
									<li><a href="#">찹샐러드</a></li>
									<li><a href="#">추가토핑</a></li>
									<li><a href="#">사이드/음료</a></li>
									<li><a href="#">단체메뉴</a></li>
									<li><a href="#">신선한 재료 소개</a></li>
								</ul>
							</div>
						</li>
						<li class="gnb02">
							<a href="#">이용방법</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">써브웨이 이용방법</a></li>
									<li><a href="#">단체메뉴 이용방법</a></li>
								</ul>
							</div>
						</li>
						<li class="gnb03">
							<a href="#">새소식</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="/notice.do?currentPage=1">공지사항/이벤트</a></li>
									<li><a href="/qna.do?currentPage=1">Q&A</a></li>
									<li><a href="/review.do?currentPage=1">리뷰</a></li>
								</ul>
							</div>
						</li>
						<li class="gnb04">
							<a href="#">써브웨이</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">써브웨이 역사</a></li>
									<li><a href="#">써브웨이 약속</a></li>
									<li><a href="#">샌드위치 아티스트 지원</a></li>
									<li><a href="/findStore.do">매장찾기</a></li>
								</ul>
							</div>
						</li>
						<li class="gnb05">
							<a href="#">가맹점</a>
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">써브웨이 프랜차이즈</a></li>
									<li><a href="#">가맹관련 FAQ</a></li>
									<li><a href="/applyPage.do">가맹신청/문의</a></li>
									<li><a href="#">지사안내</a></li>
									<li><a href="#">사업설명회</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
