<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- 모든 한글로 쓰인 attribute : 실재 EL로 바꿔야함 -->
	<h1>온라인 주문 예약</h1>
	<br>
	<form action="/submitCusOrder.do" method="post">
		<input type="button" onclick="deleteAllCookies()" value="모든 쿠키삭제">
		<hr>
		<div class="content-wrapper" id="selectBranch">
			<h3>지점 골라</h3>
			<select>
				<option></option>
			</select>
		</div>
		<div class="content-wrapper" id="selectSandOrSalad">
			<h3>샌드위치 or 샐러드</h3>
			<label for="샌드위치"><img alt="샌드위치" src="/resources/img//sandwich/sandwich_fl04.jpg"></label>
			<input type="radio" onclick="deleteCookie('main')" class="hide" id="샌드위치" name="isSalad" value="샌드위치">
			<label for="샐러드"><img alt="샐러드" src="/resources/img/salad/salad_fl04.jpg"></label>
			<input type="radio" onclick="deleteCookie('bread'),deleteCookie('is15'),deleteCookie('main')" class="hide" id="샐러드" name="isSalad" value="샐러드">
		</div>
		<div class="content-wrapper" id="cheese">
			<h3>치즈</h3>
			<label for="아메리칸"><img alt="아메리칸" src="/resources/img/recipe/img_recipe_c01.jpg"></label>
			<input type="radio" class="hide" id="아메리칸" name="cheese" value="아메리칸">
			<label for="슈레드"><img alt="슈레드" src="/resources/img/recipe/img_recipe_c02.jpg"></label>
			<input type="radio" class="hide" id="슈레드" name="cheese" value="슈레드">
			<label for="선택안함"><span>선택안함</span></label>
			<input type="radio" id="선택안함" name="cheese" value="선택안함">
		</div>
		<div class="content-wrapper" id="topping">
			<h3>추가토핑</h3>
			<label for="선택안함"><span>선택안함</span></label>
			<input type="checkbox" id="선택안함" name="topping" value="선택안함">
			<label for="더블업"><img alt="더블업" src="/resources/img/topping/img_toppping_01.jpg"></label>
			<input type="checkbox" class="hide" id="더블업" name="topping" value="더블업">
			<label for="베이컨비츠"><img alt="베이컨비츠" src="/resources/img/topping/img_toppping_02.jpg"></label>
			<input type="checkbox" class="hide" id="베이컨비츠" name="topping" value="베이컨비츠">
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
		</div>
		<div class="content-wrapper" id="isOvened">
			<h3>오븐 하실래요?</h3>
			<span>Yes</span><input type="radio" name="isOvened" value="1" required><span>Nope</span><input type="radio" name="isOvened" value="0" required><br>
		</div>
		<div class="content-wrapper" id="vegi">
			<h3>채소</h3>
			<p>채소의 양을 정하세요(없음 - 적게 - 기본 - 많이)</p>
			<label for="그대로"><span>그대로</span></label>
			<input type="checkbox" id="그대로" name="vegiRef" value="그대로">
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
		</div>
		<div class="content-wrapper" id="source">
			<h3>소스</h3>
			<label for="선택안함"><span>선택안함</span></label>
			<input type="checkbox" id="선택안함" name="nothingElse" value="선택안함">
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
		</div>
		<div class="content-wrapper" id="set">
			<h3>세트 하실래요?</h3>
			<span>Yes</span><input type="radio" name="set" value="1" required><span>Nope</span><input type="radio" name="set" value="0" required><br>
			<h3 class="hide">어떤 세트를 고르시겠습니까?</h3>
			<span class="hide">감자칩 세트</span><input type="radio" class="hide" name="whichSet" value="1" required><span class="hide">쿠키 세트</span><input type="radio" class="hide" name="whichSet" value="2" required><br>
		</div>
		<div class="content-wrapper" id="moreOrder">
			<span>결재하기</span> <span>장바구니 추가</span>
			
		</div>
	</form>	
	<script src="/resources/js/cusOrder.js" type="text/javascript"></script><!-- 아래에 있어야 라디오 가려짐 -->
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />