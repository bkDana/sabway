<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Header --%>
<link rel="stylesheet" type="text/css" href="/resources/css/formwizard.css?after" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- 아임포트 api 추가 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="/resources/js/formwizard.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>


<script type="text/javascript">
var myform=new formtowizard({
	formid: 'feedbackform',
	persistsection: true,
	revealfx: ['slide', 300]
});
</script>
<%-- content--%>
<section id="content-wrapper">
	<div class="area">
		<c:if test="${not empty sessionScope.customer}">
			<a class="header-btn" href="/myBucket.do">내 주문정보 보기</a>
		</c:if>
		<br><br>
		<h1>온라인 주문 예약</h1><br>
		<form id="feedbackform" name="feedbackform" method="post">
			<fieldset class="sectionwrap">
				<legend>샌드위치/샐러드</legend>
				<div class="type img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/sandwich/sandwich_fl04.jpg">
					<p class="label">샌드위치</p>
				</div>
				<div class="type img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/salad/salad_fl04.jpg">
					<p class="label">샐러드</p>
				</div>
				
				
				
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>빵</legend>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '빵'}">
						<div class="bread img-box select-one">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
							<div class="button-box">
								<button type="button" class="bread-amount">15cm</button>
								<button type="button" class="bread-amount">30cm</button>
							</div>
							<input type="hidden" value="${ingre.ingreKcal }">
							<input type="hidden" value="${ingre.ingreCost15 }">
							<input type="hidden" value="${ingre.ingreCost30 }">
						</div>
					</c:if>
				</c:forEach>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>메인재료</legend>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '메인재료' }">
<%-- 						<label for="${ingre.ingreLabel }"><img src="/resources/upload/ingredients/${ingre.ingreFilepath }"></label>  --%>
<%-- 						<input type="radio" class="hide" id="${ingre.ingreLabel }" name="isMain${status.conunt }" value="1"> --%>
						<div class="main img-box select-one">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
							<input type="hidden" value="${ingre.ingreKcal }">
							<input type="hidden" value="${ingre.ingreCost15 }">
							<input type="hidden" value="${ingre.ingreCost30 }">
						</div>
					</c:if>
				</c:forEach>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>치즈</legend>
				<div class="cheeze img-box select-none fix-img" style="background-color:white; clear:both;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">선택안함</p>
				</div>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '치즈' }">
						<div class="cheeze img-box select-one">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
							<input type="hidden" value="${ingre.ingreKcal }">
						</div>
					</c:if>
				</c:forEach>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>추가토핑</legend>
				<div class="topping img-box select-none fix-img" style="background-color:white; clear:both;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">선택안함</p>
				</div>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '추가토핑' }">
						<div class="topping img-box select-many">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
							<input type="hidden" value="${ingre.ingreKcal }">
							<input type="hidden" value="${ingre.ingreCost15 }">
							<input type="hidden" value="${ingre.ingreCost30 }">
						</div>
					</c:if>
				</c:forEach>
				<div class="common-tbl-btn-group">
					<button type="button" class="btn-style2 topping-check" style="clear:both;">토핑 선택완료</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>오븐</legend>
				<div class="oven img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/checkedyellow.png">
					<p class="label">오븐 사용</p>
				</div>
				<div class="oven img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">오븐 미사용</p>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>채소</legend>
				<p>아무것도 선택하지 않으시면 모두 보통으로 들어갑니다.</p>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '채소' }">
						<div class="vegi img-box">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
							<div class="button-box">
								<button type="button" class="vegi-amount">없음</button>
								<button type="button" class="vegi-amount">적게</button>
								<button type="button" class="vegi-amount select-vegi">보통</button>
								<button type="button" class="vegi-amount">많이</button>
							</div>
							<input type="hidden" value="${ingre.ingreKcal }">
						</div>
					</c:if>
				</c:forEach>
				<div class="common-tbl-btn-group">
					<button type="button" class="btn-style2 vegi-check" style="clear:both;">채소 선택완료</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>소스</legend>
				<div class="source img-box select-none fix-img" style="background-color:white; clear:both;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">선택안함</p>
				</div>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '소스' }">
						<div class="source img-box select-many">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
							<input type="hidden" value="${ingre.ingreKcal }">
						</div>
					</c:if>
				</c:forEach>
				<div class="common-tbl-btn-group">
					<button type="button" class="btn-style2 source-check" style="clear:both;">소스 선택완료</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>세트</legend>
				<div class="set img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/checkedgreen.png">
					<p class="label">단품</p>
				</div>
				<div class="set img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/checkedgreen.png">
					<p class="label">음료세트</p>
					<input type="hidden" value="${ingre.ingreKcal }">
					<input type="hidden" value="${ingre.ingreCost15 }">
				</div>
				<div class="set img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/checkedgreen.png">
					<p class="label">감자세트</p>
					<input type="hidden" value="${ingre.ingreKcal }">
					<input type="hidden" value="${ingre.ingreCost15 }">
				</div>
				<div class="set img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/checkedgreen.png">
					<p class="label">쿠키세트</p>
					<input type="hidden" value="${ingre.ingreKcal }">
					<input type="hidden" value="${ingre.ingreCost15 }">
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>사이드메뉴</legend>
				<div class="sidemenu img-box select-none fix-img" style="background-color:white; clear:both;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">선택안함</p>
				</div>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '사이드메뉴' }">
						<div class="sidemenu img-box select-many">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
							<input type="hidden" value="${ingre.ingreKcal }">
							<input type="hidden" value="${ingre.ingreCost15 }">
						</div>
					</c:if>
				</c:forEach>
				<div class="common-tbl-btn-group">
					<button type="button" class="btn-style2 sidemenu-check" style="clear:both;">주문 완료</button>
				</div>
			</fieldset>
				<div class="common-tbl-box">
					<table class="comm-tbl">
					<colgroup>
						<col width="15%">
						<col width="/">
						<col width="15%">
					</colgroup>
						<tr>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					
					</table>
					<div class="common-tbl-btn-group">
						<button class="btn-style2 insert-order">주문 완료</button>
					</div>
				</div>
				<input type="hidden" name="bucBread" class="orderInput">
				<input type="hidden" name="bucMain" class="orderInput">
				<input type="hidden" name="bucVegi" class="orderInput">
				<input type="hidden" name="bucCheese" class="orderInput">
				<input type="hidden" name="bucSource" class="orderInput">
				<input type="hidden" name="bucTopping" class="orderInput">
				<input type="hidden" name="bucSide" class="orderInput">
				<input type="hidden" name="bucIsSalad" class="orderInput">
				<input type="hidden" name="bucIsOvened" class="orderInput">
				<input type="hidden" name="bucSet" class="orderInput">
				<input type="hidden" name="bucCost" class="orderInput">
				<input type="hidden" name="bucKcal" class="orderInput"> 
				<input type="hidden" name="bucQuantity" class="orderInput">
		</form>
	</div>
</section>

<!-- <script>
// 	/* 서버 작동순서 : JAVA>JSTL>HTML>Javscript */
	
// 	$(function(){
// 		ingreList = new Array(); 
// 		kCalList = new Array();
// 		costLsit = new Array();
// 		totalKcal = 0;
// 		totalCost = 0;
// 		var ingreTypes = []; //ingreList 에서 type만 뺴올것
// 		var uniqueType = []; //orcle's 'distinct'처리(8개나옴(빵,채소,치즈,소스,추가토핑,메인재료,사이드메뉴,샐러드..?))
		
// 		/* 처음 쿼리 결과물 jsonArray로 만들어 js로 가져오기 */
// 		<c:forEach items="${ingreList}" var="ingre">
// 			var json = new Object();
// 			json.ingreLabel = "${ingre.ingreLabel}";
// 			json.ingreType = "${ingre.ingreType}";
// 			json.ingreKcal = "${ingre.ingreKcal}";
// 			json.ingreCost15 = "${ingre.ingreCost15}";
// 			json.ingreCost30 = "${ingre.ingreCost30}";
// 			ingreList.push(json);
// 		</c:forEach>
		
// 		/* ingreList에서 type만 가져오기 */
// 		for(var index in ingreList) ingreTypes[index] = ingreList[index].ingreType;
		
// 		/* ingreTypes에서 distinct한 값만 uniqueType에 저장하기(8종류), kCalList만들기(필요한가?) */
// 		$.each(ingreTypes, function(index, element) {
// 			if(($.inArray(element, uniqueType) === -1)) {
// 				uniqueType.push(element); 
// 				var json = new Object();
// 				json.type = element;
// 				json.kcal = null;
// 				var json1 = new Object();
// 				kCalList.push(json);
// 			}
// 		});
// 		console.log(ingreList);
// 		console.log(kCalList);
// 	});
	
// 	$('.img-box').click(function() {
// 		var menulabel = $(this).find('p').text();
// 		var menuType = $(this).siblings('legend').html();

// 		for(var i in ingreList) {
// 			if(!$(this).hasClass('.select-many')) {
// 				if((ingreList[i].ingreLabel == menulabel) && (ingreList[i].ingreType == menuType)) {
// 					var ingreKcal = ingreList[i].ingreKcal;
// 					console.log("ingreKcal : " + ingreKcal);
// 					var ingreType = ingreList[i].ingreType;
// 					for(var i in kCalList) {
// 						if((kCalList[i].type == ingreType) && (kCalList[i].kcal == null)) {
// 							if(ingreKcal != "0") {
// 								kCalList[i].kcal = (Number)(ingreKcal);
// 								console.log(kCalList[i].type + " - first : " + kCalList[i].kcal);
// 								totalKcal += (Number)(kCalList[i].kcal);
// 							}
// 						} else if((kCalList[i].type == ingreType) && (kCalList[i].kcal != null)) {
// 							if(ingreKcal != "0") {
// 								totalKcal -= (Number)(kCalList[i].kcal);
// 								kCalList[i].kcal = (Number)(ingreKcal);
// 								console.log(kCalList[i].type + " - after : " + kCalList[i].kcal);
// 								totalKcal += (Number)(kCalList[i].kcal);
// 							}
// 						} 
// 						//totalKcal += (Number)(kCalList[i].kcal);
// 					}//inner for-in ends
// 				}
// 			} else if($(this).hasClass('.select-many')) { //다중선택메뉴(토핑, 소스, 사이드)
// 				console.log($(this).siblings('legend').html());
// 				if(ingreList[i].ingreLabel == label) {
// 					var ingreKcal = ingreList[i].ingreKcal;
// 					var ingreType = ingreList[i].ingreType;
// 					for(var i in kCalList) {
// 						if((kCalList[i].type == ingreType) && (kCalList[i].kcal == null)) {
// 							if(ingreKcal != "0") {
// 								kCalList[i].kcal = (Number)(ingreKcal);
// 								totalKcal += (Number)(ingreKcal);
// 							}
// 						}  else if((kCalList[i].type == ingreType) && (kCalList[i].kcal != null)) {
// 							if(ingreKcal != "0") {
// 								if($(this).hasClass("selects")) {
// 									totalKcal -= (Number)(kCalList[i].kcal);
// 								} else {
// 									kCalList[i].kcal += (Number)(ingreKcal);
// 									totalKcal += (Number)(ingreKcal);
// 								}
// 							}
// 						}
// 						//totalKcal += (Number)(kCalList[i].kcal);
// 					}//inner for-in ends
// 				}
// 			}
// 		}//outer for-in ends
// 		$('#totalKcal').html(totalKcal+" 칼로리");
// 		$('input[name=bucKcal]').val(totalKcal);
		
// 		for(var i in ingreList) {
			
// 		}
// 		$('input[name=bucCost]').val(totalCost);
// 	});
	
// 	/* 아임포트 */
// 	$(function(){
		
// 		$("#pay button").click(function(){
// 			var price = $("input[name=bucCost]").val();
// 			var d = new Date();
// 			var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
// 			IMP.init('imp25889583');
// 			IMP.request_pay({
// 				pay_method : 'card',
// 				merchant_uid : "상품명_"+date,			//거래ID - 유니크 주려고 날짜까지 넣음
// 				name : $('input[name=bucMain]').val()+"외";,	//결재명
// 				amount : price,							//결재 금액
// 				buyer_tel : '010-3159-5618'
				
// 			},function(response){
// 				if(response.success){
// 					var msg = "결재가 완료되었습니다.";
// 					var info1 = "고유 ID : "+response.imp_uid;
// 					var info2 = "결재 금액 : "+response.paid_amount;
// 					var info3 = "카드 승인 번호 : "+response.apply_num;
// 					$("#paymentResult").html(msg+"<br>"+info1+"<br>"+info2+"<br>"+info3);
// 				} else {
// 					$("#patmentResult").html('에러 내용 : '+response.error_mgs+date);
// 				}
// 			});
// 		});
// 	});
	
</script> -->
<!-- 이 스크립트는 아래에 있어야 작동함 -->
<script src="/resources/js/hor.js" type="text/javascript"></script> 
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />