<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Header --%>
<link rel="stylesheet" type="text/css" href="/resources/css/formwizard.css?after" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="/resources/js/formwizard.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>

<!-- 모든 한글로 쓰인 attribute : 실재 EL로 바꿔야함 -->
<script type="text/javascript">
var myform=new formtowizard({
	formid: 'feedbackform',
	persistsection: true,
	revealfx: ['slide', 300]
})
</script>
<%-- content--%>
<section id="content-wrapper">
	<div class="area">
		<h1>온라인 주문 예약</h1><br>
		<form id="feedbackform"> 
			<fieldset class="sectionwrap">
				<legend>샌드위치 / 샐러드</legend>
				<label for="샌드위치"><img alt="샌드위치"src="/resources/img//sandwich/sandwich_fl04.jpg"></label> 
				<input type="radio" class="hide" id="샌드위치" name="isSalad" value="샌드위치"> 
				<label for="샐러드"><img alt="샐러드" src="/resources/img/salad/salad_fl04.jpg"></label> 
				<input type="radio" class="hide" id="샐러드" name="isSalad" value="샐러드">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>주 재료</legend>
				<div id="main"></div>
			</fieldset>
			
			<fieldset class="sectionwrap">
				<legend>치즈</legend>
				<label for="아메리칸"><img alt="아메리칸" src="/resources/img/recipe/img_recipe_c01.jpg"></label> 
				<input type="radio" class="hide" id="아메리칸" name="cheese" value="아메리칸">
				
				<label for="슈레드"><img alt="슈레드" src="/resources/img/recipe/img_recipe_c02.jpg"></label> 
				<input type="radio" class="hide" id="슈레드" name="cheese" value="슈레드">
				
				<label for="선택안함"><span>선택안함</span></label> 
				<input type="radio" id="선택안함" name="cheese" value="선택안함">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>추가토핑</legend>
				<label for="선택안함"><span>선택안함</span></label> 
				<input type="checkbox" id="선택안함" name="topping" value="선택안함"> 
				<label for="더블업"><img alt="더블업" src="/resources/img/topping/img_toppping_01.jpg"></label>
				<input type="checkbox" class="hide" id="더블업" name="topping" value="더블업"> 
				<label for="쉬림프더블업"><img alt="쉬림프더블업" src="/resources/img/topping/img_toppping_03.jpg"></label>
				<input type="checkbox" class="hide" id="쉬림프더블업" name="topping" value="쉬림프더블업"> 
				<label for="에그마요"><img alt="에그마요" src="/resources/img/topping/img_toppping_04.jpg"></label> 
				<input type="checkbox" class="hide" id="에그마요" name="topping" value="에그마요">
				<label for="오믈렛"><img alt="오믈렛" src="/resources/img/topping/img_toppping_05.jpg"></label> 
				<input type="checkbox" class="hide" id="오믈렛" name="topping" value="오믈렛">
				<label for="아보카도"><img alt="아보카도" src="/resources/img/topping/img_toppping_06.jpg"></label> 
				<input type="checkbox" class="hide" id="아보카도" name="topping" value="아보카도">
				<label for="베이컨"><img alt="베이컨" src="/resources/img/topping/img_toppping_07.jpg"></label> 
				<input type="checkbox" class="hide" id="베이컨" name="topping" value="베이컨">
				<label for="페퍼로니"><img alt="페퍼로니" src="/resources/img/topping/img_toppping_08.jpg"></label> 
				<input type="checkbox" class="hide" id="페퍼로니" name="topping" value="페퍼로니">
				<label for="더블치즈"><img alt="더블치즈" src="/resources/img/topping/img_toppping_09.jpg"></label> 
				<input type="checkbox" class="hide" id="더블치즈" name="topping" value="더블치즈">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>오븐</legend>
				<span>Yes</span><input type="radio" name="isOvened" value="1"required>
			<span>Nope</span><input type="radio" name="isOvened" value="0" required><br>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>채소</legend>
				<p>채소의 양을 정하세요(없음 - 적게 - 기본 - 많이)</p>
				<label for="default"><span>그대로</span></label> 
				<input type="checkbox" id="default" name="vegiRef" value="default">
				<label for="양상추"><img alt="양상추" src="/resources/img/recipe/img_recipe_v01.jpg"></label> 
				<input type="range" min="0" max="3" id="양상추" class="vegiRef" value="2">
				<label for="토마토"><img alt="토마토" src="/resources/img/recipe/img_recipe_v02.jpg"></label> 
				<input type="range" min="0" max="3" id="토마토" class="vegiRef" value="2">
				<label for="오이"><img alt="오이" src="/resources/img/recipe/img_recipe_v03.jpg"></label> 
				<input type="range" min="0" max="3" id="오이" class="vegiRef" value="2">
				<label for="피망"><img alt="피망" src="/resources/img/recipe/img_recipe_v04.jpg"></label> 
				<input type="range" min="0" max="3" id="피망" class="vegiRef" value="2">
				<label for="양파"><img alt="양파" src="/resources/img/recipe/img_recipe_v05.jpg"></label> 
				<input type="range" min="0" max="3" id="양파" class="vegiRef" value="2">
				<label for="피클"><img alt="피클" src="/resources/img/recipe/img_recipe_v06.jpg"></label> 
				<input type="range" min="0" max="3" id="피클" class="vegiRef" value="2">
				<label for="올리브"><img alt="올리브" src="/resources/img/recipe/img_recipe_v07.jpg"></label> 
				<input type="range" min="0" max="3" id="올리브" class="vegiRef" value="2">
				<label for="할라피뇨"><img alt="할라피뇨" src="/resources/img/recipe/img_recipe_v08.jpg"></label> 
				<input type="range" min="0" max="3" id="할라피뇨" class="vegiRef" value="2">
				<input type="hidden" name="vegi" value="">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>소스</legend>
				<label for="선택안함"><span>선택안함</span></label> <input type="checkbox" id="선택안함" name="nothingElse" value="선택안함"> 
				<label for="랜치"><img alt="랜치" src="/resources/img/recipe/img_recipe_s01.jpg"></label> 
				<input type="checkbox" class="hide" id="랜치" name="source" value="랜치">
				<label for="마요"><img alt="마요" src="/resources/img/recipe/img_recipe_s02.jpg"></label> 
				<input type="checkbox" class="hide" id="마요" name="source" value="마요">
				<label for="스윗어니언"><img alt="스윗어니언" src="/resources/img/recipe/img_recipe_s03.jpg"></label> 
				<input type="checkbox" class="hide" id="스윗어니언" name="source" value="스윗어니언"> 
				<label for="허니머스타드"><img alt="허니머스타드" src="/resources/img/recipe/img_recipe_s04.jpg"></label>
				<input type="checkbox" class="hide" id="허니머스타드" name="source" value="허니머스타드"> 
				<label for="스위트칠리"><img alt="스위트칠리" src="/resources/img/recipe/img_recipe_s05.jpg"></label>
				<input type="checkbox" class="hide" id="스위트칠리" name="source" value="스위트칠리">
				<label for="핫칠리"><img alt="핫칠리" src="/resources/img/recipe/img_recipe_s06.jpg"></label> 
				<input type="checkbox" class="hide" id="핫칠리" name="source" value="핫칠리">
				<label for="사우스웨스트"><img alt="사우스웨스트" src="/resources/img/recipe/img_recipe_s07.jpg"></label> 
				<input type="checkbox" class="hide" id="사우스웨스트" name="source" value="사우스웨스트"> 
				<label for="머스타드"><img alt="머스타드" src="/resources/img/recipe/img_recipe_s08.jpg"></label> 
				<input type="checkbox" class="hide" id="" name="source" value="머스타드">
				<label for="홀스래디쉬"><img alt="홀스래디쉬" src="/resources/img/recipe/img_recipe_s09.jpg"></label> 
				<input type="checkbox" class="hide" id="홀스래디쉬" name="source" value="홀스래디쉬"> 
				<label for="사우전아일랜드"><img alt="사우전아일랜드" src="/resources/img/recipe/img_recipe_s10.jpg"></label>
				<input type="checkbox" class="hide" id="사우전아일랜드" name="source" value="사우전아일랜드"> 
				<label for="이탈리안드레싱"><img alt="이탈리안드레싱" src="/resources/img/recipe/img_recipe_s11.jpg"></label>
				<input type="checkbox" class="hide" id="이탈리안드레싱" name="source" value="이탈리안드레싱"> 
				<label for="올리브오일"><img alt="올리브오일" src="/resources/img/recipe/img_recipe_s12.jpg"></label>
				<input type="checkbox" class="hide" id="올리브오일" name="source" value="올리브오일"> 
				<label for="레드와인식초"><img alt="레드와인식초" src="/resources/img/recipe/img_recipe_s13.jpg"></label>
				<input type="checkbox" class="hide" id="레드와인식초" name="source" value="레드와인식초"> 
				<label for="스모크BBQ"><img alt="스모BBQ" src="/resources/img/recipe/img_recipe_s14.jpg"></label>
				<input type="checkbox" class="hide" id="스모크BBQ" name="source" value="스모크BBQ"> 
				<label for="소금"><img alt="소금" src="/resources/img/recipe/img_recipe_s15.jpg"></label> 
				<input type="checkbox" class="hide" id="소금" name="source" value="소금">
				<label for="후추"><img alt="후추" src="/resources/img/recipe/img_recipe_s16.jpg"></label> 
				<input type="checkbox" class="hide" id="후추" name="source" value="후추">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>사이드메뉴</legend>
				<label for="브로콜리체다수프수프"><img alt="브로콜리체다수프" src="/resources/img/side/img_sides_01.jpg"></label> 
				<input type="checkbox" class="hide" id="브로콜리체다수프" name="side" value="브로콜리체다수프">
				<label for="베이크포테이토수프"><img alt="베이크포테이토수프" src="/resources/img/side/img_sides_02.jpg"></label> 
				<input type="checkbox" class="hide" id="베이크포테이토수프" name="side" value="베이크포테이토수프">
				<label for="더블초코칩쿠키"><img alt="더블초코칩쿠키" src="/resources/img/side/img_sides_03.jpg"></label> 
				<input type="checkbox" class="hide" id="더블초코칩쿠키" name="side" value="더블초코칩쿠키">
				<label for="초코칩쿠키"><img alt="초코칩쿠키" src="/resources/img/side/img_sides_04.jpg"></label> 
				<input type="checkbox" class="hide" id="초코칩쿠키" name="side" value="초코칩쿠키">
				<label for="오트밀레이즌"><img alt="오트밀레이즌" src="/resources/img/side/img_sides_05.jpg"></label> 
				<input type="checkbox" class="hide" id="오트밀레이즌" name="side" value="오트밀레이즌">
				<label for="라즈베리치즈케익"><img alt="라즈베리치즈케익" src="/resources/img/side/img_sides_06.jpg"></label> 
				<input type="checkbox" class="hide" id="라즈베리치즈케익" name="side" value="라즈베리치즈케익">
				<label for="화이트초코마카다미아"><img alt="화이트초코마카다미아" src="/resources/img/side/img_sides_07.jpg"></label> 
				<input type="checkbox" class="hide" id="화이트초코마카다미아" name="side" value="화이트초코마카다미아">
				<label for="칩스"><img alt="칩스" src="/resources/img/side/img_sides_08.jpg"></label> 
				<input type="checkbox" class="hide" id="칩스" name="side" value="칩스">
				<label for="웨지포테이토"><img alt="웨지포테이토" src="/resources/img/side/img_sides_09.jpg"></label> 
				<input type="checkbox" class="hide" id="웨지포테이토" name="side" value="웨지포테이토">
				<label for="탄산음료"><img alt="탄산음료" src="/resources/img/side/img_drink_01.jpg"></label> 
				<input type="checkbox" class="hide" id="탄산음료" name="side" value="탄산음료">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>세트</legend>
				<span class="hide">단품</span><input type="radio" class="hide" name="whichSet" value="0">
				<span class="hide">감자칩 세트</span><input type="radio" class="hide" name="whichSet" value="1"> 
				<span class="hide">쿠키세트</span><input type="radio" class="hide" name="whichSet" value="2">
			</fieldset>
			<div id="test" style="width:100%; height:150px; background-color:red;">
				<h3>장바구니 영역</h3>
				<div id="btn-wrapper" style="background-color:orange;">
					<button type="submit">주문</button>
					<button type="button">추가주문</button>
				</div>
			</div>
		</form>
	</div>
</section>
<script src="/resources/js/cusOrder.js" type="text/javascript"></script> <!-- 아래에 있어야 작동함 -->
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />