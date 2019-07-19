<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
#content-wrapper1{padding:100px 0; background-color:#f6f6f6;}
.area1{ max-width:1900px; margin:0px auto; }

#wrap{min-width:1280px;}
.content{max-width:1170px; margin:0 auto; position:relative;}

#content{padding-top:0; position:relative; z-index:3;}
#content h2.subTitle{text-align:center; font-size:40px; color:#292929; font-weight:600; letter-spacing:-0.07em; padding:134px 0 80px;}
#content h2.subTitle > span{margin-bottom:-20px;display: block;color: #666;font-weight:normal;font-size:16px;letter-spacing: -0.025em}
#content h3.h_title{font-size:28px; color:#292929; font-weight:bold; letter-spacing:-0.05em; padding-bottom:38px;}

/* 가맹점 ::: 써브웨이 프렌차이즈 */
.franchise_wrapper{margin-top:-61px;}
.franchise_wrapper .summary{font-size:16px; line-height:26px; text-align:center; letter-spacing:-0.045em}
.franchise_wrapper .store_wrapper{overflow:hidden; margin-top:66px;}
.franchise_wrapper .store_wrapper >div{float:left; width:50%; height:220px; background-color:#f6f6f6; color:#292929; overflow:hidden; transition-duration:0.3s; position:relative;}
.franchise_wrapper .store_wrapper >div:after{content:''; position:absolute; left:0; width:100%; top:0; height:100%; z-index:2; opacity:0; transition-duration:0.3s}
.franchise_wrapper .store_wrapper >div .inner{text-align:center; font-size:30px; margin-top:45px; position:relative; z-index:3;}
.franchise_wrapper .store_wrapper >div .inner p{margin-bottom:38px;}
.franchise_wrapper .store_wrapper >div .inner p span{display:inline-block; position:relative; padding-bottom:6px;}
.franchise_wrapper .store_wrapper >div .inner p span:after{content:''; height:1px; position:absolute; left:0; right:0; bottom:0; transition-duration:0.3s}
.franchise_wrapper .store_wrapper >div .inner strong{font-weight:bold; font-size:80px; letter-spacing:-0.025em; display:inline-block; margin-right:5px; }
.franchise_wrapper .store_wrapper .nation .inner{float:right; margin-right:197px;}
.franchise_wrapper .store_wrapper .nation .inner span:after{background-color:#000}
.franchise_wrapper .store_wrapper .store .inner{float:left; margin-left:153px;}
.franchise_wrapper .store_wrapper .store .inner span:after{background-color:#fff}

.franchise_wrapper .store_wrapper >div.hover{color:#fff;}
.franchise_wrapper .store_wrapper >div.hover .inner p span:after{background-color:#fff;}
.franchise_wrapper .store_wrapper >div.hover:after{opacity:1;}
.franchise_wrapper .store_wrapper .nation:after{background:url(/resources/img/franchise/bg_nation.jpg) 0 0 no-repeat;}
.franchise_wrapper .store_wrapper .store:after{background:url(/resources/img/franchise/bg_store.jpg) 0 0 no-repeat;}

.franchise_wrapper .barnd_comp{width:1170px; margin:0 auto 48px;}
.franchise_wrapper .barnd_comp h3{text-align:center; margin:96px 0 0 0;}
.franchise_wrapper .barnd_comp >ul{overflow:hidden; margin-left:-30px;}
.franchise_wrapper .barnd_comp >ul >li{height:460px; float:left; width:570px; position:relative; margin-left:30px;}
.franchise_wrapper .barnd_comp >ul >li h4{background-color:#ffce32; width:170px; height:150px; padding-top:41px; box-sizing:border-box; text-align:center; line-height:30px; color:#009223; font-size:22px; font-weight:bold; position:absolute; left:0; top:215px; font-family:font_sw;}
.franchise_wrapper .barnd_comp >ul >li ul{margin:19px 0 0 192px;}
.franchise_wrapper .barnd_comp >ul >li ul li{font-size:16px; color:#666666; line-height:26px; letter-spacing:-0.055em; text-indent:-12px; margin-left:12px;}

.franchise_process{height:710px; text-align:center; color:#fff; background:url(/resources/img/franchise/bg_franchise_process.jpg) 50% 0 no-repeat;}
.franchise_process h3{font-size:28px; font-weight:bold; padding-top:95px; letter-spacing:-0.04em;}
.franchise_process .summary{font-size:16px; line-height:26px; margin-top:22px;}
.franchise_process .step_wrapper{margin-top:65px;}
.franchise_process .step_wrapper >ol{overflow:hidden; display:inline-block;}
.franchise_process .step_wrapper >ol >li{float:left; width:200px; padding:0 22px; position:relative;}
.franchise_process .step_wrapper >ol >li:after{content:''; position:absolute; left:-3px; top:95px; background:url(/resources/img/franchise/icon_arr_r02.png) 0 0 no-repeat; width:6px; height:11px;}
.franchise_process .step_wrapper >ol >li:first-child:after{display:none;}
.franchise_process .step_wrapper >ol >li .step{width:192px; height:192px; border:4px solid #009223; border-radius:100px; font-size:22px; line-height:26px; margin:0 auto 16px;}
.franchise_process .step_wrapper >ol >li .step em{display:block; font-weight:300; font-size:13px; padding-top:67px;}
.franchise_process .step_wrapper >ol >li .step strong{font-weight:300; letter-spacing:-0.02em;}
.franchise_process .step_wrapper >ol >li ul li{line-height:22px; font-size:16px; margin-bottom:4px; letter-spacing:-0.035em;}
.franchise_process .step_wrapper >ol >li:nth-child(odd) .step{border-color:#ffc300;}
.franchise_process .step_wrapper >ol >li:nth-child(odd) .step em{color:#ffd800;}
.franchise_process .step_wrapper >ol >li:nth-child(even) .step{border-color:#009223;}
.franchise_process .step_wrapper >ol >li:nth-child(even) .step em{color:#62ce08;}
.franchise_process .step_wrapper .text{text-align:left; width:1170px; margin:0 auto; color:#999999; font-size:13px; padding-top:32px; letter-spacing:-0.04em; position:relative; left:-4px;}

.invertment_expense{margin-top:95px;}
.invertment_expense .h_title{text-align:center; padding-bottom:7px !important;}
.invertment_expense .board_list_wrapper .cont_right{font-size:13px; color:#999999; margin-bottom:16px; letter-spacing:-0.03em;}
.invertment_expense .board_list_wrapper table th{text-align:left; padding:0 30px; color:#292929; line-height:22px; font-weight:normal; border-bottom:1px solid #dddddd;}
.invertment_expense .board_list_wrapper table td{padding:0 30px; text-align:left; color:#666; line-height:22px; font-size:16px; letter-spacing:-0.05em;}
.invertment_expense .board_list_wrapper table thead th{border-color:#009223;}
.invertment_expense .board_list_wrapper table tfoot{background-color:#f6f6f6;}
.invertment_expense .board_list_wrapper table tfoot th,
.invertment_expense .board_list_wrapper table tfoot td{font-weight:300; color:#292929;}
.invertment_expense .board_list_wrapper .notice{color:#999; font-size:13px; line-height:23px; margin:19px 0 50px;}
.invertment_expense .board_list_wrapper .notice li{margin-bottom:8px; letter-spacing:-0.035em;}

/*  */
/* board list */
.board_list_wrapper{position:relative; overflow:hidden; padding-bottom:127px;}
.board_list_wrapper .board_total{color:#999999; letter-spacing:-0.045em; float:left; margin-top:17px;}
.board_list_wrapper .board_total strong{font-weight:bold; color:#009223; display:inline-block; margin:0 0 0 3px;}
.board_list_wrapper .cont_right{float:right; margin-bottom:10px;}
.board_list_wrapper .cont_right .form_search{width:224px; display:inline-block; vertical-align:middle;}
.board_list_wrapper table{clear:both; border-top:4px solid #009223;}
.board_list_wrapper table th{color:#009223; font-size:16px; font-weight:300; height:69px; border-bottom:1px solid #009223; text-align:center;}
.board_list_wrapper table th.hide{font-size:0;}
.board_list_wrapper table td{height:69px; border-bottom:1px solid #dddddd; text-align:center; color:#292929; font-size:16px;}
.board_list_wrapper table td .title{text-align:left; letter-spacing:-0.04em;}
.board_list_wrapper table td .date{color:#bbbbbb; font-family:font_sw;}
.board_list_wrapper table td .num{color:#ffc300; font-family:font_sw; font-weight:bold;}
.board_list_wrapper table td .service span{display:inline-block; font-size:13px; color:#bbb; border:1px solid #bbb; border-radius:30px; height:23px; line-height:23px; padding:0 8px;}
.board_list_wrapper table td .service span.on{font-weight:300; color:#666; border-color:#666;}
.board_list_wrapper table td .tel{color:#bbbbbb; font-family:font_sw;}
.board_list_wrapper table td .coming{color:#009223; font-family:font_sw; font-size:13px; font-weight:bold; background-color:#ffce32; height:25px; line-height:22px; width:110px; margin:0 auto; text-align:center; border-radius:15px;}
.board_list_wrapper table tr.notice td{background-color:#f8f8f8;}
.board_list_wrapper table tr.notice td .title a{color:#009223; font-weight:bold;}


.btns_wrapper{text-align:center;}
.btns_wrapper .btn{margin:0 4px;}
.btn{font-size:18px; font-weight:bold; text-align:center; display:inline-block; vertical-align:middle; border-radius:30px; transition-duration:0.2s;}
.btn span{display:inline-block; vertical-align:middle; height:46px; line-height:46px;}
.btn.bgc_point{background-color:#009223; color:#fff;}
.btn.bgc_point span{height:50px; line-height:50px; letter-spacing:-0.03em;}
.btn.bgc_point:hover{background-color:#00811f;}
.btn.i_arr:after{content:''; display:inline-block; vertical-align:middle; width:10px; height:14px; background:url(/resources/img/franchise/icon_arr_r01.png) 0 0 no-repeat; margin-left:7px;}



</style>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- Content -->
<section id="content-wrapper1" style="padding:0;background-color:#fff;">
	<div class="area1">
			<!-- sub content s -->
			<div id="content">
				<h2 class="subTitle">싸브웨이 프랜차이즈</h2>

				<div class="franchise_wrapper">
					<p class="summary">
						미국 프랜차이즈 1위! 써브웨이는 매장수 및 분포지역 기준, <br>
						Quick Service Restaurant(QSR) 부분 No.1 프랜차이즈입니다.
					</p>
					<!-- 전세계 매장수 -->
					<div class="store_wrapper">
						<div class="nation">
							<div class="inner">
								<p><span>전세계</span></p>
								<strong>111</strong>개국
							</div>
						</div>
						<div class="store hover">
							<div class="inner">
								<p><span>매장수</span></p>
								<strong>44,644</strong>개
							</div>
						</div>
					</div>
					<!--// 전세계 매장수 -->

					<!-- 써브웨이 브랜드 경쟁력 -->
					<div class="barnd_comp">
						<h3 class="h_title">싸브웨이 브랜드 경쟁력</h3>
						<ul>
							<li>
								<div class="img"><img alt=">BRAND POWER" src="/resources/img/franchise/img_barnd_comp01.jpg"></div>
								<h4 style="font-weight:750;">BRAND<br>POWER</h4>
								<ul>
									<li>· 세계 1위 프랜차이즈로서의 브랜드가치</li>
									<li>· 전세계 4만 4천여 개 매장으로 검증된 안정성</li>
									<li>· 글로벌 브랜드 관리 및 지원 - 신제품 개발, 브랜드 가치<br>향상, 스탠더드 관리</li>
								</ul>
							</li>
							<li>
								<div class="img"><img alt="WELL-BEING" src="/resources/img/franchise/img_barnd_comp02.jpg"></div>
								<h4>WELL<br>-BEING</h4>
								<ul>
									<li>· 건강한 식재료 공급을 통한 균형잡힌 메뉴 제공</li>
									<li>· 아이들에게도 안심하고 먹을 수 있는 영양식</li>
									<li>· 신뢰할 수 있는 영양정보 제공</li>
								</ul>
							</li>
							<li>
								<div class="img"><img alt="MADE FRESH" src="/resources/img/franchise/img_barnd_comp03.jpg"></div>
								<h4>MADE<br>FRESH</h4>
								<ul>
									<li>· Fresh Baked Bread - 매장에서 매일 갓 구워낸 빵 제공</li>
									<li>· Made To Order - 취향대로 재료 선택 가능</li>
									<li>· Fresh Vegetable - 매장에서 매일 준비되는 신선한 야채</li>
								</ul>
							</li>
							<li>
								<div class="img"><img alt="SMART INVESTMENT" src="/resources/img/franchise/img_barnd_comp04.jpg"></div><!-- 20180213 -->
								<h4>SMART<br>INVESTMENT</h4><!-- 20180213 -->
								<ul>
									<li>· 빠른 ROI - 최적의 비지니스 모델 제공</li>
									<li>· 체계적인 오퍼레이션 - 용이한 직원 교육 가능</li>
									<li>· 효율적인 인력 운영 - 인력 운영 시스템 및 체계적인 교육 제공</li>
									<li>· 빠른 테이블 회전율과 엄격한 재고 관리</li>
								</ul>
							</li>
						</ul>
					</div>
					<!--// 써브웨이 브랜드 경쟁력 -->

					<!-- 가맹점 개설 절차 -->
					<div class="franchise_process">
						<h3> 가맹점 개설 절차</h3>
						<p class="summary">높은 수익성과 탁월한 안정성이 전세계 110개국, 44,500여개 매장으로 검증된 글로벌 No.1 프랜차이즈 싸브웨이<br>체계화된 성공 노하우와 함께 새로운 비즈니스의 시작을 준비하십시오.</p>

						<div class="step_wrapper">
							<ol>
								<li>
									<div class="step">
										<em>STEP1</em>
										<strong>신청서 작성 및 상담</strong>
									</div>
									<ul>
										<li>· 가맹과 경영에 대한<br>정보 상담</li>
									</ul>
								</li>
								<li>
									<div class="step">
										<em>STEP2</em>
										<strong>가맹계약 체결</strong>
									</div>
									<ul>
										<li>· 계약서 작성</li>
										<li>· 가맹비 입금</li>
									</ul>
								</li>
								<li>
									<div class="step">
										<em>STEP3</em>
										<strong>상권분석 및 선정</strong>
									</div>
									<ul>
										<li>· 상권조사 / 입지분석</li>
										<li>· 매장 결정</li>
										<li>· 공사일정 협의</li>
									</ul>
								</li>
								<li>
									<div class="step">
										<em>STEP4</em>
										<strong>오픈 준비</strong>
									</div>
									<ul>
										<li>· 설계도 확정 / 장비주문</li>
										<li>· 인테리어 공사</li>
										<li>· 가맹교육 / 매장 실습</li>
									</ul>
								</li>
								<li>
									<div class="step">
										<em>STEP5</em>
										<strong>매장 오픈</strong>
									</div>
									<ul>
										<li>· 직원교육</li>
										<li>· 운영테스트</li>
										<li>· 그랜드오픈</li>
									</ul>
								</li>
							</ol>
							<p class="text">※ 가맹 신청부터 매장 오픈까지 최소 2달 이상 소요됩니다.</p>
						</div>
					</div>
					<!--// 가맹점 개설 절차 -->

					<!-- 예상 투자비용 -->
					<div class="invertment_expense">
						<h3 class="h_title">예상 투자비용</h3>
						<!-- board list s -->
						<div class="board_list_wrapper">
							<div class="content">
								<div class="cont_right">
									<p>단위 : 만(원)/VAT 별도, 25평 기준</p>
								</div>

								<table>
									<caption>예상 투자비용 테이블</caption>
									<colgroup>
										<col width="270px">
										<col width="270px">
										<col width="*">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">항목</th>
											<th scope="col">금액</th>
											<th scope="col" style="text-align:center;">내용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">가맹비</th>
											<td>1,100</td><!-- 20180208 -->
											<td>소멸성</td>
										</tr>
										<tr>
											<th scope="row">교육비</th>
											<td>없음</td>
											<td>교육에 대한 추가 비용 없음</td>
										</tr>
										<tr>
											<th scope="row">장비 및 기자재</th>
											<td>12,000~</td>
											<td>샌드위치 유니트, 브래드 오븐, 스피드 오븐, 전자레인지, 냉장냉동시설, 주방설비 및 집기, 커피머신, CCTV, 음향장비, 가구 및 인테리어 소품 등</td>
										</tr>
										<tr>
											<th scope="row">인테리어<br>(간판 및 철거비용 제외)</th>
											<td>(200~210 / 평당)</td>
											<td>가설, 전기, 바닥, 벽체, 천정, 설비, 출입문 철거 및 조성, 장비세팅, 기본덕트, 스프링쿨러 등</td>
										</tr>
										<tr>
											<th scope="row">간판</th>
											<td>410</td>
											<td>H:450mm / 1면 기준, 어닝 포함</td>
										</tr>
										<tr>
											<th scope="row">전기증설</th>
											<td>150</td>
											<td>10KW증설</td>
										</tr>
										<tr>
											<th scope="row">냉난방</th>
											<td>450</td>
											<td>32평형 시스템1, 벽걸이(냉난방)1, 배관비</td>
										</tr>
									</tbody>
									<tfoot>
										<tr>
											<th scope="row">합계</th>
											<td>약 1억 9천만 ~ 2억원</td>
											<td>총 비용은 경우에 따라 변동 될 수 있습니다.</td>
										</tr>
									</tfoot>
								</table>

								<ul class="notice">
									<li>※ 일반 매장 최소 전용면적은 25평이며, 공항, 백화점, 병원 등 특수상권 매장은 25평 이하로 선택적 입점 가능</li>
									<li>※ 별도 비용 : 외부공사(갈바, 데크 등), 추가공사(철거, 자동문 등), 전기 간선작업, 건물의 공사 준수사항에 따른 비용 등 매장 여건에 따라 투자비용이 달라질 수 있습니다</li>
								</ul>

								<div class="btns_wrapper">
									<a class="btn bgc_point i_arr" href="/applyPage.do?currentPage=''" style="width:160px;"><span>가맹신청/문의</span></a>
								</div>
							</div>
						</div>
						<!-- board list e -->
					</div>
					<!--// 예상 투자비용 -->

				</div>
			</div>
			<!--// sub content e -->
	</div>
</section>
<script>
	$(document).ready(function(){
		franchiseOver();
	});
		function franchiseOver(){// 써브웨이 프랜차이즈
			$('.store_wrapper >div').on('mouseover',function(){
				$(this).addClass('hover').siblings('div').removeClass('hover')
			})
		}
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />