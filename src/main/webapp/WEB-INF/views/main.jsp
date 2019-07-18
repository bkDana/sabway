<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>


<style>
#content-wrapper1{padding:100px 0; background-color:#f6f6f6;}
.area1{ max-width:1900px; margin:0px auto; }

.main_tap_event_wrapper{position:relative; height:490px; background-color:#fff;}
.main_tap_event_wrapper .quick_link{overflow:hidden; position:absolute; left:50%; bottom:0; width:1170px; margin-left:-585px; text-align:right; z-index:5}
.main_tap_event_wrapper .quick_link .quick_link_content{overflow:hidden; float:right; display:table;}
.main_tap_event_wrapper .quick_link .quick_link_content >div{display:table-cell; vertical-align:bottom; height:80px}/*2018.02.01 인디케이터위치수정으로 높이값 수정 150->80*/
.main_tap_event_wrapper .quick_link .quick_link_content >div a{display:block; width:300px; height:80px; position:relative; text-align:center; overflow:hidden;}
.main_tap_event_wrapper .quick_link .quick_link_content >div a >strong{font-size:22px; font-weight:bold; display:inline-block; padding:27px 0 0 0}
.main_tap_event_wrapper .quick_link .quick_link_content >div a >strong:before{content:''; display:inline-block; vertical-align:middle; padding-right:13px; position:relative; top:-2px;}
.main_tap_event_wrapper .quick_link .quick_link_content .store a{background-color:#ffce32; border-radius:30px 0 0 0; float:right; transition-duration:0.2s;  letter-spacing:-0.02em}
.main_tap_event_wrapper .quick_link .quick_link_content .store a >strong{color:#292929; display:block;}
.main_tap_event_wrapper .quick_link .quick_link_content .store a >strong:before{background:url(/resources/img/main/icon_map.png) 0 0 no-repeat; width:24px; height:30px;}
.main_tap_event_wrapper .quick_link .quick_link_content .store .layer{display:none; color:#292929; font-size:16px; line-height:26px; margin-top:15px; padding-left:37px; background:url(/resources/img/main/icon_arr_r03.png) 273px 14px no-repeat;}
.main_tap_event_wrapper .quick_link .quick_link_content .store .layer strong{display:inline-block; font-size:22px; padding:11px 0 17px;}
.main_tap_event_wrapper .quick_link .quick_link_content .store .layer p{line-height:26px;}
.main_tap_event_wrapper .quick_link .quick_link_content .store .layer strong:before{content:'';display:inline-block; vertical-align:middle; padding-right:13px; background:url(/resources/img/main/icon_map02.png) 0 0 no-repeat; width:22px; height:22px;}
.main_tap_event_wrapper .quick_link .quick_link_content .franchise a{background-color:#009223; border-radius:0 0 30px 0; float:left;  letter-spacing:-0.05em}
.main_tap_event_wrapper .quick_link .quick_link_content .franchise a >strong{color:#fff;}
.main_tap_event_wrapper .quick_link .quick_link_content .franchise a >strong:before{background:url(/resources/img/main/icon_franchise.png) 0 0 no-repeat; width:34px; height:30px;}

/* subway menu */
.section_subway_menu{background-color:#fff; padding:60px 0 0; height:500px;}
.section_subway_menu .hd{width:1170px; margin:0 auto; padding-bottom:33px; position:relative;}
.section_subway_menu .hd h2{color:#292929; font-size:40px; font-weight:bold; font-family:font_sw; background:url(/resources/img/main/bul_tit.png) 0 12px no-repeat; min-height:60px; padding:17px 0 0 25px; margin-bottom:1px}
/* .section_subway_menu .hd .tab{position:absolute; right:0; top:44px}
.section_subway_menu .hd .tab ul{overflow:hidden;}
.section_subway_menu .hd .tab ul li{float:left; position:relative; margin-left:23px; padding:0 0 0 25px;}
.section_subway_menu .hd .tab ul li:after{content:''; position:absolute; left:0; top:3px; width:1px; height:15px; background-color:#dddddd;}
.section_subway_menu .hd .tab ul li:first-child{padding:0; margin:0}
.section_subway_menu .hd .tab ul li:first-child:after{display:none;}
.section_subway_menu .hd .tab ul li a{display:block; font-size:16px; color:#666666; font-weight:300; letter-spacing:-0.03em;}
.section_subway_menu .hd .tab ul li.active a{color:#009223; font-weight:bold;} */

/* section_subway */
.section_subway{text-align:center; padding:60px;background:url('/resources/img/main/bg_content.gif');}
.section_subway .content_top{overflow:hidden;display:inline-block;}
.section_subway .content_top .utilization{background:url(/resources/img/main/bg_utilization.png) 0 0 no-repeat; width:400px; height:300px; position:relative; margin-left:55px; float:left;}
.section_subway .content_top .utilization p{color:#fff; font-size:28px; font-weight:bold; line-height:40px; letter-spacing:-0.03em; position:absolute; left:39px; top:38px;}
.section_subway .content_top .utilization .btn{position:absolute; left:41px; bottom:42px; border:2px solid #fff; border-radius:20px; width:92px;}
.section_subway .content_top .utilization .btn span{display:block; height:36px; line-height:36px; color:#fff; font-size:16px; font-weight:300;padding-left:5px;}
.section_subway .content_top .history{float:left; width:825px; position:relative}

.section_subway .content_top .history p{color:#fff; font-size:28px; font-weight:bold; line-height:40px; letter-spacing:-0.03em; position:absolute; left:410px; top:38px;}
.section_subway .content_top .history .btn{position:absolute; left:410px; bottom:42px; border:2px solid #fff; border-radius:20px; width:128px;}
.section_subway .content_top .history .btn span{display:block; height:36px; line-height:36px; color:#fff; font-size:16px; font-weight:300;padding-left:8px;}


.section_subway .content_bottom{margin:30px 0 0 0; overflow:hidden;display:inline-block;}
.section_subway .content_bottom .whats_new{background-color:#fff; width:870px; height:300px; border-radius:30px 0 30px 0; position:relative; float:left;}
.section_subway .content_bottom .whats_new .hd{position:absolute; top:75px; left:60px}
.section_subway .content_bottom .whats_new .hd h2{color:#292929; font-size:30px; font-weight:bold; font-family:font_sw; background:url(/resources/img/main/bul_tit.png) 0 0 no-repeat; min-height:60px; padding:17px 0 0 25px; margin-bottom:1px}
.section_subway .content_bottom .whats_new .hd p{text-align:center; line-height:26px; letter-spacing:-0.04em;}
.section_subway .content_bottom .whats_new .board_list{position:absolute; left:389px; top:76px;}
.section_subway .content_bottom .whats_new .board_list ul li{margin-top:21px;}
.section_subway .content_bottom .whats_new .board_list ul li:first-child{margin-top:0}
.section_subway .content_bottom .whats_new .board_list ul li a{display:inline-block; font-size:16px; color:#292929; position:relative; letter-spacing:-0.04em}
.section_subway .content_bottom .whats_new .board_list ul li a:after{content:''; height:1px; left:0; bottom:1px; width:0; background-color:#009223; position:absolute; transition-duration:0.2s}
.section_subway .content_bottom .whats_new .board_list ul li a:hover{color:#009223;}
.section_subway .content_bottom .whats_new .board_list ul li a:hover:after{width:100%;}
.section_subway .content_bottom .whats_new .board_list .more{display:inline-block; color:#999999; font-size:14px; padding:33px 0 8px}

.section_subway .content_bottom .banner_sponsor{float:left; width:270px; height:300px; margin-left:30px; position:relative; overflow:hidden; border-radius:0 30px 0 30px;}
.section_subway .content_bottom .banner_sponsor .bx-wrapper .bx-pager{position:absolute; right:15px; top:14px}
.section_subway .content_bottom .banner_sponsor .bx-wrapper .bx-pager .bx-pager-item{display:inline-block; margin:0 5px;}
.section_subway .content_bottom .banner_sponsor .bx-wrapper .bx-pager a{display:block; width:10px; height:10px; background-color:#fff; font-size:0; line-height:0; text-indent:-9999px; overflow:hidden; border-radius:30px; transition-duration:0.3s}
.section_subway .content_bottom .banner_sponsor .bx-wrapper .bx-pager a.active{background-color:#ffc300; width:30px;}



</style>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!-- 슬라이드 CSS & Jquery -->
<link rel="stylesheet" type="text/css" href="/resources/css/plugin/slick.css">
<script src="/resources/js/plugin/slick.js"></script>

<script>
$(document).ready(function(){
	$('.main-adopt-list').slick({
		slidesToShow:4,
		slideToScroll:1,
		arrows:true,
		fade:false,
		dots:false,
		autoplay:true,
		spped:2000,
		infinite:true,
		autoplaySpeed:3000,
		pauseOnHover:true
	});
});
</script>

<%-- Content --%>

<div class="main_wrapper" id="container">
	<div class="main_tap_event_wrapper">
		<div class="bx-wrapper" style="max-width:100%;">
			<img src="/resources/img/main_event.jpg">
		</div>
		<!-- 매장찾기, 가맹신첨 문의 -->
		<div class="quick_link">
			<div class="quick_link_content">
				<div class="store">
					<a href="/findStore.do?status=22">
						<strong>
							매장찾기
						</strong>
					</a>
				</div>
				<div class="franchise">
					<a href="/applyPage.do">
						<strong>
							가맹신청 . 문의
						</strong>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- main_tap_event_wrapper 끝 -->

<section id="content-wrapper1" style="padding:0;background-color:#fff;">
	<div class="area1">
		<div class="section_subway_menu">
			<div class="hd">
				<h2>Subway's Menu</h2>
			</div>
			<div id="mainTopBox" class="area">
				<div id="mainAdoptBox">
						<div class="main-adopt-box">
							<ul class="main-adopt-list"><!-- 입양 리스트 갯수가 최소 20개가 노출됩니다.(최신순) -->
								<li>
									<a href="/intro/menu.do?no=1">
										<div class="img-thum">
											<span style="background:url('/resources/img/sandwich/sandwich_cl01.jpg') no-repeat center center; background-size:contain;"></span>
											<em class="best-prd-plus btn-effect01 effect"><img src="/resources/img/main/btn_more.png"></em>
											<!-- <div class="img">
												<img alt="이탈리안 비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg" style="width:100%;">
											</div>
											<strong class="title">이탈리안 비엠티</strong>
											<p>
												설명<br>
												설명<br>
												설명<br>
												설명
											</p> -->
										</div>
									</a>
								</li>
								<li>
									<a href="/intro/menu.do?no=1">
										<div class="img-thum">
											<span style="background:url('/resources/img/sandwich/sandwich_cl01.jpg') no-repeat center center; background-size:contain;"></span>
											<em class="best-prd-plus btn-effect01 effect"><img src="/resources/img/main/btn_more.png"></em>
											<!-- <div class="img">
												<img alt="이탈리안 비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg" style="width:100%;">
											</div>
											<strong class="title">이탈리안 비엠티</strong>
											<p>
												설명<br>
												설명<br>
												설명<br>
												설명
											</p> -->
										</div>
									</a>
								</li>
								<li>
									<a href="/intro/menu.do?no=1">
										<div class="img-thum">
											<span style="background:url('/resources/img/sandwich/sandwich_cl01.jpg') no-repeat center center; background-size:contain;"></span>
											<em class="best-prd-plus btn-effect01 effect"><img src="/resources/img/main/btn_more.png"></em>
											<!-- <div class="img">
												<img alt="이탈리안 비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg" style="width:100%;">
											</div>
											<strong class="title">이탈리안 비엠티</strong>
											<p>
												설명<br>
												설명<br>
												설명<br>
												설명
											</p> -->
										</div>
									</a>
								</li>
								<li>
									<a href="/intro/menu.do?no=1">
										<div class="img-thum">
											<span style="background:url('/resources/img/sandwich/sandwich_cl01.jpg') no-repeat center center; background-size:contain;"></span>
											<em class="best-prd-plus btn-effect01 effect"><img src="/resources/img/main/btn_more.png"></em>
											<!-- <div class="img">
												<img alt="이탈리안 비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg" style="width:100%;">
											</div>
											<strong class="title">이탈리안 비엠티</strong>
											<p>
												설명<br>
												설명<br>
												설명<br>
												설명
											</p> -->
										</div>
									</a>
								</li>
								<li>
									<a href="/intro/menu.do?no=1">
										<div class="img-thum">
											<span style="background:url('/resources/img/sandwich/sandwich_cl01.jpg') no-repeat center center; background-size:contain;"></span>
											<em class="best-prd-plus btn-effect01 effect"><img src="/resources/img/main/btn_more.png"></em>
											<!-- <div class="img">
												<img alt="이탈리안 비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg" style="width:100%;">
											</div>
											<strong class="title">이탈리안 비엠티</strong>
											<p>
												설명<br>
												설명<br>
												설명<br>
												설명
											</p> -->
										</div>
									</a>
								</li>
								<li>
									<a href="/intro/menu.do?no=1">
										<div class="img-thum">
											<span style="background:url('/resources/img/sandwich/sandwich_cl01.jpg') no-repeat center center; background-size:contain;"></span>
											<em class="best-prd-plus btn-effect01 effect"><img src="/resources/img/main/btn_more.png"></em>
											<!-- <div class="img">
												<img alt="이탈리안 비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg" style="width:100%;">
											</div>
											<strong class="title">이탈리안 비엠티</strong>
											<p>
												설명<br>
												설명<br>
												설명<br>
												설명
											</p> -->
										</div>
									</a>
								</li>
								<li>
									<a href="/intro/menu.do?no=1">
										<div class="img-thum">
											<span style="background:url('/resources/img/sandwich/sandwich_cl01.jpg') no-repeat center center; background-size:contain;"></span>
											<em class="best-prd-plus btn-effect01 effect"><img src="/resources/img/main/btn_more.png"></em>
											<!-- <div class="img">
												<img alt="이탈리안 비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg" style="width:100%;">
											</div>
											<strong class="title">이탈리안 비엠티</strong>
											<p>
												설명<br>
												설명<br>
												설명<br>
												설명
											</p> -->
										</div>
									</a>
								</li>
								<li>
									<a href="/intro/menu.do?no=1">
										<div class="img-thum">
											<span style="background:url('/resources/img/sandwich/sandwich_cl01.jpg') no-repeat center center; background-size:contain;"></span>
											<em class="best-prd-plus btn-effect01 effect"><img src="/resources/img/main/btn_more.png"></em>
											<!-- <div class="img">
												<img alt="이탈리안 비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg" style="width:100%;">
											</div>
											<strong class="title">이탈리안 비엠티</strong>
											<p>
												설명<br>
												설명<br>
												설명<br>
												설명
											</p> -->
										</div>
									</a>
								</li>
								
							</ul>
						</div>
					</div>
			
			</div>
		</div>
		<!-- section_subway_menu 끝 -->
		
		<div class="section_subway">
			<div class="content_top">
				<!-- 온라인 주문 -->
				<div class="utilization">
					<p>써브웨이를 <br>제대로 즐기는 방법!</p>
					<a class="btn" href="/findStore.do?status=11">
						<span>온라인 주문</span>
					</a>
				</div>
				<!-- 서브웨이 약속 -->
				<div class="history">
					<p>SEARCH FOR BETTER<br>신선함을 위한 노력</p>
					<a class="btn" href="#"><span>써브웨이 약속</span></a>
					<img src="/resources/img/main/img_subway_history.png">
				</div>
			</div>
			<!-- content_top 끝 -->
			<div class="content_bottom">
				<div class="whats_new">
					<div class="hd">
						<h2>What's New</h2>
						<p>써브웨이의 다양한 소식을 <br>빠르게 전달해드립니다.</p>
					</div>
					<div class="board_list">
						<ul>
							<li>
								<a href="#" onclick="" data-idx="글번호">글주제</a>
							</li>
							<li>
								<a href="#" onclick="" data-idx="글번호">글주제</a>
							</li>
							<li>
								<a href="#" onclick="" data-idx="글번호">글주제</a>
							</li>
						</ul>
						<a class="more" href="/공지사항으로">more</a>
					</div>
				</div>
				<!-- What's new끝 -->
				
				<div class="banner_sponsor">
					<div class="bx-wrapper" style="max-width:100%">
					
						<a href="#">
							<img src="/resources/img/main/banner.jpg">
						</a>
					</div>
				</div>
			</div>
			<!-- content_bottom끝 -->
		</div>
		
		
	



		
	
	












	
	</div>
</section>


<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />