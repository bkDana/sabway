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
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<!--<script type="text/javascript" src="/resources/js/nav.js"></script> nav.js 메뉴가 허전해서 뺐어요...-->

<!-- Datapicker 달력 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="/resources/js/common.js"></script>

<script>
	$(document).ready(function(){
		if(!Cookies.get('sabwayNoneCustomer')){
			setCookie();
			//console.log("쿠키생성");
		}else{
			console.log("쿠키있음");			
		}
		
		//장바구니
		$('#bucket').click(function() {
			location.href="/loadBucket.do"
		});
	});
	var setCookie = function setCookie(){
		var cookieDate = new Date();
		var date = cookieDate.getFullYear()+''+(cookieDate.getMonth()+1)+''+cookieDate.getDate()+''+cookieDate.getHours()+''+cookieDate.getMinutes()+''+cookieDate.getSeconds();
		//document.cookie = "sabwayNoneCustomer="+date;
		Cookies.set('sabwayNoneCustomer', date);
		console.log("쿠키 생성 완료. 자 이게 장바구니 쿠키값이에요:"+Cookies.get('sabwayNoneCustomer'));
	}
	
	
</script>

<title>사브웨이</title>
</head>
<body>
<%
	String[] pname = request.getRequestURL().toString().split("/");
	String p6 = "";
	//String p7 = "";
	if(pname.length==7){
		p6 = pname[6];
	}
	/* 
	if(pname.length==8){
		p7 = pname[7];
	}
	 */
%>
	<%if(pname[5].equals("main.jsp")){%>
	<div class="banner">
		<button type="button" class="close-btn"><img src="/resources/img/main_top_line_banner_closebtn.png" ></button>
		<a href="#">
			<img src="/resources/img/써브웨이_띠배너_PC_1920x140_20190531064940182.jpg" width="100%" style="min-height:93px;">
		</a>
	</div>
	<script>
		/* 상단 배너 닫기 버튼 */
		$('.close-btn').click(function(){
			$('.banner').hide();
		});
	</script>
	<%} %>
	<header id="header">
		<div class="main-header">
		</div>
		<div id="headerInnerWrap">
			<!-- 로고 -->
			<div class="header-logo">
				
				<a href="/" class="sabway"><img src="/resources/img/logo_w.png" style="max-height:68px;"></a>
				<ul class="header-menu clearfix">
					<!--
					<li><a class="header-btn">매장찾기</a></li>
					<li><a class="header-btn">가맹신청 · 문의</a></li>
					<li><a class="header-btn">고객센터</a></li>
					-->
					<c:choose>
						<c:when test="${not empty sessionScope.customer }">
							
							<li><a href="/logout.do" class="header-btn">로그아웃</a></li>
							<li><a href="/customerProfile.do" class="header-btn" <%if(p6.equals("customerProfile.jsp")||p6.equals("oneCusOrder.jsp")||p6.equals("myMenuList.jsp")){ %>style="background-color:#009223;color:#fff;"<%}%> >마이페이지</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/index.do" class="header-btn">로그인</a></li>
						</c:otherwise>
					</c:choose>
					
					<!-- <li><a href="/admin.do" class="header-btn">관리자</a></li> footer의 '점주관리자'에 연결해놓았음. -->
					<li><a class="header-btn" id="bucket" onclick="loadBucket()"><img src="/resources/img/shopping-cart.png" width="20px" style="padding-top:4px;"></a></li><!-- 장바구니 개수 넣어주세요 -->
				</ul>
			</div>
			<!-- 헤더 상단 -->
			<div id="headerInner" class="clearfix">
				<!-- 주메뉴 -->
				<nav id="gnb" class="total-menu">
					<div id="gnbBg"></div>
					<ul class="clearfix">
						<li class="gnb01">
							<a href="/intro/menu.do?no=1" class="<%if(pname[5].equals("menu")){%>on<%}%>">메뉴소개</a>
							<%-- 
							<div class="gnb-2dep">
								<ul>
									<li><a href="/intro/menu.do?no=1" class="<c:if test='${param.no eq 1 }'>on</c:if>">샌드위치</a></li>
									<li><a href="/intro/menu.do?no=2" class="<c:if test='${param.no eq 2 }'>on</c:if>">찹샐러드</a></li>
									<li><a href="/intro/menu.do?no=3" class="<c:if test='${param.no eq 3 }'>on</c:if>">추가토핑</a></li>
									<li><a href="/intro/menu.do?no=4" class="<c:if test='${param.no eq 4 }'>on</c:if>">사이드/음료</a></li>
									<li><a href="/intro/menu.do?no=5" class="<c:if test='${param.no >= 5 }'>on</c:if>">신선한 재료</a></li>
								</ul>
							</div>
							 --%>
						</li>
						<li class="gnb02">
							<a href="/findStore.do?status=11">온라인 주문</a>
							<!-- 
							<div class="gnb-2dep">
								<ul>
									<li><a href="/findStore.do?status=11">주문하기</a></li>
									<li><a href="#">단체메뉴 이용방법</a></li>
								</ul>
							</div>
							 -->
						</li>
						<li class="gnb03">
							<a href="/notice.do?currentPage=1" class="<%if(pname[5].equals("notice")||pname[5].equals("qna")||pname[5].equals("review")){%>on<%}%>">새소식</a>
							<%-- 
							<div class="gnb-2dep">
								<ul>
									<li><a href="/notice.do?currentPage=1" class="<%if(pname[5].equals("notice")){%>on<%}%>">공지사항/이벤트</a></li>
									<li><a href="/qna.do?currentPage=1" class="<%if(pname[5].equals("qna")){%>on<%}%>">Q&A</a></li>
									<li><a href="/review.do?currentPage=1" class="<%if(pname[5].equals("review")){%>on<%}%>">리뷰</a></li>
								</ul>
							</div>
							 --%>
						</li>
						<li class="gnb04">
							<a href="/findStore.do?status=22" class="<%if(p6.equals("findStore.jsp")){ %>on<%}%>">매장찾기</a>
							<!-- 
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">써브웨이 역사</a></li>
									<li><a href="#">써브웨이 약속</a></li>
									<li><a href="#">샌드위치 아티스트 지원</a></li>
									<li><a href="/findStore.do?status=22">매장찾기</a></li>
								</ul>
							</div>
							 -->
						</li>
						<li class="gnb05">
							<a href="/franchise.do">가맹점</a>
							<!-- 
							<div class="gnb-2dep">
								<ul>
									<li><a href="#">써브웨이 프랜차이즈</a></li>
									<li><a href="#">가맹관련 FAQ</a></li>
									<li><a href="/applyPage.do?currentPage=''">가맹신청ㆍ문의</a></li>
									<li><a href="#">지사안내</a></li>
									<li><a href="#">사업설명회</a></li>
								</ul>
							</div>
							 -->
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	
