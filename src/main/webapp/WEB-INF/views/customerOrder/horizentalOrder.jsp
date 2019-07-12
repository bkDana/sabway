<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Header --%>
<link rel="stylesheet" type="text/css" href="/resources/css/formwizard.css?after" />
<link rel="stylesheet" type="text/css" href="/resources/css/hor.css?after" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="/resources/js/formwizard.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>

<!-- 모든 한글로 쓰인 attribute : 실재 EL로 바꿔야함 -->
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
		<form id="feedbackform" action="/submitCusOrder.do" method="post"> 
			<fieldset class="sectionwrap">
				<legend>샌드위치/샐러드</legend>
				<label for="샌드위치"><img alt="샌드위치"src="/resources/img/sandwich/sandwich_fl04.jpg"></label> 
				<input type="radio" class="hide" id="샌드위치" name="isSalad" value="0"> 
				<label for="샐러드"><img alt="샐러드" src="/resources/img/salad/salad_fl04.jpg"></label> 
				<input type="radio" class="hide" id="샐러드" name="isSalad" value="1">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>주 재료</legend>
				<div id="main"></div>
			</fieldset>
			
			<fieldset class="sectionwrap">
				<legend>치즈</legend>
				<label for="아메리칸치즈"><img alt="아메리칸" src="/resources/img/recipe/img_recipe_c01.jpg"></label> 
				<input type="radio" class="hide" id="아메리칸치즈" name="cheese" value="0">
				
				<label for="슈레드치즈"><img alt="슈레드" src="/resources/img/recipe/img_recipe_c02.jpg"></label> 
				<input type="radio" class="hide" id="슈레드치즈" name="cheese" value="1">
				
				<label for="선택안함"><span>선택안함</span></label> 
				<input type="radio" id="선택안함" name="cheese" value="-1">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>추가토핑</legend>
				<label for="선택안함"><span>선택안함</span></label> 
				<input type="checkbox" id="선택안함" name="toppingRef" value="-1"><br>
				<!-- <label for="초기화"><span>초기화</span></label> 
				<input type="checkbox" id="초기화" name="toppingReset">  -->
				<label for="더블업"><img alt="더블업" src="/resources/img/topping/img_toppping_01.jpg"></label>
				<input type="checkbox" class="hide" id="더블업" name="toppingRef" value="0"> 
				<label for="쉬림프"><img alt="쉬림프더블업" src="/resources/img/topping/img_toppping_03.jpg"></label>
				<input type="checkbox" class="hide" id="쉬림프" name="toppingRef" value="1"> 
				<label for="에그마요"><img alt="에그마요" src="/resources/img/topping/img_toppping_04.jpg"></label> 
				<input type="checkbox" class="hide" id="에그마요" name="toppingRef" value="2">
				<label for="오믈렛"><img alt="오믈렛" src="/resources/img/topping/img_toppping_05.jpg"></label> 
				<input type="checkbox" class="hide" id="오믈렛" name="toppingRef" value="3">
				<label for="아보카도"><img alt="아보카도" src="/resources/img/topping/img_toppping_06.jpg"></label> 
				<input type="checkbox" class="hide" id="아보카도" name="toppingRef" value="4">
				<label for="베이컨"><img alt="베이컨" src="/resources/img/topping/img_toppping_07.jpg"></label> 
				<input type="checkbox" class="hide" id="베이컨" name="toppingRef" value="5">
				<label for="페퍼로니"><img alt="페퍼로니" src="/resources/img/topping/img_toppping_08.jpg"></label> 
				<input type="checkbox" class="hide" id="페퍼로니" name="toppingRef" value="6">
				<label for="더블치즈"><img alt="더블치즈" src="/resources/img/topping/img_toppping_09.jpg"></label> 
				<input type="checkbox" class="hide" id="더블치즈" name="toppingRef" value="7">
				<input type="hidden" name="topping" value="">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>오븐</legend>
				<label for="Yes"><span>Yes</span></label><input type="radio" id="Yes" name="isOvened" value="1"required>
				<label for="No"><span>No</span></label><input type="radio" id="No" name="isOvened" value="0" required><br>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>채소</legend>
				<p>채소의 양을 정하세요</p>
				<hr>
				<label for="default"><span>그대로</span></label>
				<input type="checkbox" id="default" class="vegiRef" name="vegiRef" value="" checked="checked"><br> 
				<img alt="양배추" src="/resources/img/recipe/img_recipe_v01.jpg">
				<label for="cab0"><span>없음</span></label><input type="radio" class="vegiRef" id="cab0" name="1" value="0">
				<label for="cab1"><span>적게</span></label><input type="radio" class="vegiRef" id="cab1" name="1" value="1">
				<label for="cab2"><span>보통</span></label><input type="radio" class="vegiRef" id="cab2" name="1" value="2" checked="checked">
				<label for="cab3"><span>많이</span></label><input type="radio" class="vegiRef" id="cab3" name="1" value="3">
				
				<img alt="토마토" src="/resources/img/recipe/img_recipe_v02.jpg">
				<label for="tom0"><span>없음</span></label><input type="radio" class="vegiRef" id="tom0" name="2" value="0">
				<label for="tom1"><span>적게</span></label><input type="radio" class="vegiRef" id="tom1" name="2" value="1">
				<label for="tom2"><span>보통</span></label><input type="radio" class="vegiRef" id="tom2" name="2" value="2" checked="checked">
				<label for="tom3"><span>많이</span></label><input type="radio" class="vegiRef" id="tom3" name="2" value="3">
				
				<img alt="오이" src="/resources/img/recipe/img_recipe_v03.jpg"> 
				<label for="cuc0"><span>없음</span></label><input type="radio" class="vegiRef" id="cuc0" name="3" value="0">
				<label for="cuc1"><span>적게</span></label><input type="radio" class="vegiRef" id="cuc1" name="3" value="1">
				<label for="cuc2"><span>보통</span></label><input type="radio" class="vegiRef" id="cuc2" name="3" value="2" checked="checked">
				<label for="cuc3"><span>많이</span></label><input type="radio" class="vegiRef" id="cuc3" name="3" value="3">
				
				<img alt="피망" src="/resources/img/recipe/img_recipe_v04.jpg">
				<label for="pim0"><span>없음</span></label><input type="radio" class="vegiRef" id="pim0" name="4" value="0">
				<label for="pim1"><span>적게</span></label><input type="radio" class="vegiRef" id="pim1" name="4" value="1">
				<label for="pim2"><span>보통</span></label><input type="radio" class="vegiRef" id="pim2" name="4" value="2" checked="checked">
				<label for="pim3"><span>많이</span></label><input type="radio" class="vegiRef" id="pim3" name="4" value="3">

				<img alt="양파" src="/resources/img/recipe/img_recipe_v05.jpg">
				<label for="oni0"><span>없음</span></label><input type="radio" class="vegiRef" id="oni0" name="5" value="0">
				<label for="oni1"><span>적게</span></label><input type="radio" class="vegiRef" id="oni1" name="5" value="1">
				<label for="oni2"><span>보통</span></label><input type="radio" class="vegiRef" id="oni2" name="5" value="2" checked="checked">
				<label for="oni3"><span>많이</span></label><input type="radio" class="vegiRef" id="oni3" name="5" value="3">
				
				<img alt="피클" src="/resources/img/recipe/img_recipe_v06.jpg"> 
				<label for="pic0"><span>없음</span></label><input type="radio" class="vegiRef" id="pic0" name="6" value="0">
				<label for="pic1"><span>적게</span></label><input type="radio" class="vegiRef" id="pic1" name="6" value="1">
				<label for="pic2"><span>보통</span></label><input type="radio" class="vegiRef" id="pic2" name="6" value="2" checked="checked">
				<label for="pic3"><span>많이</span></label><input type="radio" class="vegiRef" id="pic3" name="6" value="3">
				
				<img alt="올리브" src="/resources/img/recipe/img_recipe_v07.jpg">
				<label for="oli0"><span>없음</span></label><input type="radio" class="vegiRef" id="oli0" name="7" value="0">
				<label for="oli1"><span>적게</span></label><input type="radio" class="vegiRef" id="oli1" name="7" value="1">
				<label for="oli2"><span>보통</span></label><input type="radio" class="vegiRef" id="oli2" name="7" value="2" checked="checked">
				<label for="oli3"><span>많이</span></label><input type="radio" class="vegiRef" id="oli3" name="7" value="3">
				
				<img alt="할라피뇨" src="/resources/img/recipe/img_recipe_v08.jpg">
				<label for="jal0"><span>없음</span></label><input type="radio" class="vegiRef" id="jal0" name="8" value="0">
				<label for="jal1"><span>적게</span></label><input type="radio" class="vegiRef" id="jal1" name="8" value="1">
				<label for="jal2"><span>보통</span></label><input type="radio" class="vegiRef" id="jal2" name="8" value="2" checked="checked">
				<label for="jal3"><span>많이</span></label><input type="radio" class="vegiRef" id="jal3" name="8" value="3">
				<input type="hidden" name="vegi" value="">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>소스</legend>
				<label for="선택안함"><span>선택안함</span></label> 
				<input type="checkbox" id="선택안함" name="sourceRef" value="-1">
				<br>
				<label for="랜치"><img alt="랜치" src="/resources/img/recipe/img_recipe_s01.jpg"></label> 
				<input type="checkbox" class="hide" id="랜치" name="sourceRef" value="0">
				<label for="마요"><img alt="마요" src="/resources/img/recipe/img_recipe_s02.jpg"></label> 
				<input type="checkbox" class="hide" id="마요" name="sourceRef" value="1">
				<label for="스윗어니언"><img alt="스윗어니언" src="/resources/img/recipe/img_recipe_s03.jpg"></label> 
				<input type="checkbox" class="hide" id="스윗어니언" name="sourceRef" value="2"> 
				<label for="허니머스타드"><img alt="허니머스타드" src="/resources/img/recipe/img_recipe_s04.jpg"></label>
				<input type="checkbox" class="hide" id="허니머스타드" name="sourceRef" value="3"> 
				<label for="스위트칠리"><img alt="스위트칠리" src="/resources/img/recipe/img_recipe_s05.jpg"></label>
				<input type="checkbox" class="hide" id="스위트칠리" name="sourceRef" value="4">
				<label for="핫칠리"><img alt="핫칠리" src="/resources/img/recipe/img_recipe_s06.jpg"></label> 
				<input type="checkbox" class="hide" id="핫칠리" name="sourceRef" value="5">
				<label for="사우스웨스트"><img alt="사우스웨스트" src="/resources/img/recipe/img_recipe_s07.jpg"></label> 
				<input type="checkbox" class="hide" id="사우스웨스트" name="sourceRef" value="6"> 
				<label for="머스타드"><img alt="머스타드" src="/resources/img/recipe/img_recipe_s08.jpg"></label> 
				<input type="checkbox" class="hide" id="머스타드" name="sourceRef" value="7">
				<label for="홀스래디쉬"><img alt="홀스래디쉬" src="/resources/img/recipe/img_recipe_s09.jpg"></label> 
				<input type="checkbox" class="hide" id="홀스래디쉬" name="sourceRef" value="8"> 
				<label for="사우전아일랜드"><img alt="사우전아일랜드" src="/resources/img/recipe/img_recipe_s10.jpg"></label>
				<input type="checkbox" class="hide" id="사우전아일랜드" name="sourceRef" value="9"> 
				<label for="이탈리안드레싱"><img alt="이탈리안드레싱" src="/resources/img/recipe/img_recipe_s11.jpg"></label>
				<input type="checkbox" class="hide" id="이탈리안드레싱" name="sourceRef" value="10"> 
				<label for="올리브오일"><img alt="올리브오일" src="/resources/img/recipe/img_recipe_s12.jpg"></label>
				<input type="checkbox" class="hide" id="올리브오일" name="sourceRef" value="11"> 
				<label for="레드와인식초"><img alt="레드와인식초" src="/resources/img/recipe/img_recipe_s13.jpg"></label>
				<input type="checkbox" class="hide" id="레드와인식초" name="sourceRef" value="12"> 
				<label for="스모크BBQ"><img alt="스모BBQ" src="/resources/img/recipe/img_recipe_s14.jpg"></label>
				<input type="checkbox" class="hide" id="스모크BBQ" name="sourceRef" value="13"> 
				<label for="소금"><img alt="소금" src="/resources/img/recipe/img_recipe_s15.jpg"></label> 
				<input type="checkbox" class="hide" id="소금" name="sourceRef" value="14">
				<label for="후추"><img alt="후추" src="/resources/img/recipe/img_recipe_s16.jpg"></label> 
				<input type="checkbox" class="hide" id="후추" name="sourceRef" value="15">
				<input type="hidden" name="source" value="">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>사이드메뉴</legend>
				<label for="선택안함"><span>선택안함</span></label> 
				<input type="checkbox" id="선택안함" name="sideRef" value="-1">
				<br>
				<label for="브로콜리체다수프"><img alt="브로콜리체다수프" src="/resources/img/side/img_sides_01.jpg"></label> 
				<input type="checkbox" class="hide" id="브로콜리체다수프" name="sideRef" value="0">
				<label for="베이크포테이토수프"><img alt="베이크포테이토수프" src="/resources/img/side/img_sides_02.jpg"></label> 
				<input type="checkbox" class="hide" id="베이크포테이토수프" name="sideRef" value="1">
				<label for="더블초코칩쿠키"><img alt="더블초코칩쿠키" src="/resources/img/side/img_sides_03.jpg"></label> 
				<input type="checkbox" class="hide" id="더블초코칩쿠키" name="sideRef" value="2">
				<label for="초코칩쿠키"><img alt="초코칩쿠키" src="/resources/img/side/img_sides_04.jpg"></label> 
				<input type="checkbox" class="hide" id="초코칩쿠키" name="sideRef" value="3">
				<label for="오트밀레이즌"><img alt="오트밀레이즌" src="/resources/img/side/img_sides_05.jpg"></label> 
				<input type="checkbox" class="hide" id="오트밀레이즌" name="sideRef" value="4">
				<label for="라즈베리치즈케익"><img alt="라즈베리치즈케익" src="/resources/img/side/img_sides_06.jpg"></label> 
				<input type="checkbox" class="hide" id="라즈베리치즈케익" name="sideRef" value="5">
				<label for="화이트초코마카다미아"><img alt="화이트초코마카다미아" src="/resources/img/side/img_sides_07.jpg"></label> 
				<input type="checkbox" class="hide" id="화이트초코마카다미아" name="sideRef" value="6">
				<label for="칩스"><img alt="칩스" src="/resources/img/side/img_sides_08.jpg"></label> 
				<input type="checkbox" class="hide" id="칩스" name="sideRef" value="7">
				<label for="웨지포테이토"><img alt="웨지포테이토" src="/resources/img/side/img_sides_09.jpg"></label> 
				<input type="checkbox" class="hide" id="웨지포테이토" name="sideRef" value="8">
				<label for="탄산음료"><img alt="탄산음료" src="/resources/img/side/img_drink_01.jpg"></label> 
				<input type="checkbox" class="hide" id="탄산음료" name="sideRef" value="9">
				<input type="hidden" name="side" value="">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>세트</legend>
				<label for="단품"><span>단품</span></label><input type="radio" id="단품" name="set" value="-1">
				<label for="감자칩세트"><span>감자칩세트</span></label><input type="radio" id="감자칩세트" name="set" value="0"> 
				<label for="쿠키세트"><span>쿠키세트</span></label><input type="radio" id="쿠키세트" name="set" value="1">
			</fieldset>
			<div id="test" style="width:100%; height:150px; background-color:white;">
				<h3>장바구니 영역</h3>
				<div id="orderAjax">
					<span id="ajaxMain"></span>&nbsp;<span id="ajaxBread"></span>&nbsp;<span id="ajaxIs15"></span>
					&nbsp;<span id="ajaxCheese"></span>&nbsp;<span id="ajaxTopping"></span>&nbsp;<span id="ajaxIsOvened"></span>
					&nbsp;<span id="ajaxVegi"></span>&nbsp;<span id="ajaxSource"></span>&nbsp;<span id="ajaxSide"></span>&nbsp;<span id="ajaxSet"></span>
					<br>
					<select class="hide">
						<option>수량</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
					</select>
				</div>
				<div id="costWrapper"><span id="totalCost"></span><br></div>
				<div id="btn-wrapper" style="width:400px; margin-left:400px; background-color:orange;">
					<button type="submit">주문</button>
					<button type="button">추가주문</button>
				</div>
			</div>
		</form>
	</div>
</section>
<!-- 이 스크립트는 아래에 있어야 작동함 -->
<script src="/resources/js/hor.js" type="text/javascript"></script> 
<script src="/resources/js/cusOrderAjax.js" type="text/javascript"></script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />