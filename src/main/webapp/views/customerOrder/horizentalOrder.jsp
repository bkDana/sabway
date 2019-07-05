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
				<input type="radio" onclick="deleteCookie('main')" class="hide" id="샌드위치" name="isSalad" value="샌드위치"> 
				<label for="샐러드"><img alt="샐러드" src="/resources/img/salad/salad_fl04.jpg"></label> 
				<input type="radio" onclick="deleteCookie('bread'),deleteCookie('is15'),deleteCookie('main')" class="hide" id="샐러드" name="isSalad" value="샐러드">
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>주 재료</legend>
				<label for="이탈리안비엠티1"><img alt="이탈리안비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg"></label>
				<input type="radio" class="hide" id="이탈리안비엠티1" name="main" value="이탈리안비엠티">
				<label for="비엠티1"><img alt="비엠티" src="/resources/img/sandwich/sandwich_cl02.jpg"></label>
				<input type="radio" class="hide" id="비엠티1" name="main" value="비엠티">
				<label for="미트볼1"><img alt="미트볼" src="/resources/img/sandwich/sandwich_cl03.jpg"></label>
				<input type="radio" class="hide" id="미트볼1" name="main" value="미트볼">
				<label for="햄1"><img alt="햄" src="/resources/img/sandwich/sandwich_cl04.jpg"></label>
				<input type="radio" class="hide" id="햄1" name="main" value="햄">
				<label for="참치1"><img alt="참치" src="/resources/img/sandwich/sandwich_cl05.jpg"></label>
				<input type="radio" class="hide" id="참치1" name="main" value="참치">
				<label for="에그마요1"><img alt="에그마요" src="/resources/img/sandwich/sandwich_cl06.jpg"></label>
				<input type="radio" class="hide" id="에그마요1" name="main" value="에그마요">
				<label for="로티세리1"><img alt="로티세리" src="/resources/img/sandwich/sandwich_fl01.jpg"></label>
				<input type="radio" class="hide" id="로티세리1" name="main" value="로티세리">
				<label for="로스트치킨1"><img alt="로스트치킨" src="/resources/img/sandwich/sandwich_fl02.jpg"></label>
				<input type="radio" class="hide" id="로스트치킨1" name="main" value="로스트치킨">
				<label for="로스트비프1"><img alt="로스트비프" src="/resources/img/sandwich/sandwich_fl03.jpg"></label>
				<input type="radio" class="hide" id="로스트비프1" name="main" value="로스트비프">
				<label for="사브웨이클럽1"><img alt="사브웨이클럽" src="/resources/img/sandwich/sandwich_fl04.jpg"></label>
				<input type="radio" class="hide" id="사브웨이클럽1" name="main" value="사브웨이클럽">
				<label for="터키1"><img alt="터키" src="/resources/img/sandwich/sandwich_fl05.jpg"></label>
				<input type="radio" class="hide" id="터키1" name="main" value="터키">
				<label for="베지1"><img alt="베지" src="/resources/img/sandwich/sandwich_fl06.jpg"></label>
				<input type="radio" class="hide" id="베지1" name="main" value="베지">
				<label for="스테이크&치즈1"><img alt="스테이크&치즈" src="/resources/img/sandwich/sandwich_pm01.jpg"></label>
				<input type="radio" class="hide" id="스테이크&치즈1" name="main" value="스테이크&치즈">
				<label for="터키베이컨아보카도1"><img alt="터키베이컨아보카도" src="/resources/img/sandwich/sandwich_pm02.jpg"></label>
				<input type="radio" class="hide" id="터키베이컨아보카도1" name="main" value="터키베이컨아보카도">
				<label for="치킨베이컨랜치1"><img alt="치킨베이컨랜치" src="/resources/img/sandwich/sandwich_pm03.jpg"></label>
				<input type="radio" class="hide" id="치킨베이컨랜치1" name="main" value="치킨베이컨랜치">
				<label for="사브웨이멜트1"><img alt="사브웨이멜트" src="/resources/img/sandwich/sandwich_pm04.jpg"></label>
				<input type="radio" class="hide" id="사브웨이멜트1" name="main" value="사브웨이멜트">
				<label for="터키베이컨1"><img alt="터키베이컨" src="/resources/img/sandwich/sandwich_pm05.jpg"></label>
				<input type="radio" class="hide" id="터키베이컨1" name="main" value="터키베이컨">
				<label for="스파이시이탈리안1"><img alt="스파이시이탈리안" src="/resources/img/sandwich/sandwich_pm06.jpg"></label>
				<input type="radio" class="hide" id="스파이시이탈리안1" name="main" value="스파이시이탈리안">
				<label for="치킨데리야끼1"><img alt="치킨데리야끼" src="/resources/img/sandwich/sandwich_pm07.jpg"></label>
				<input type="radio" class="hide" id="치킨데리야끼1" name="main" value="치킨데리야끼">
				<label for="풀드포크1"><img alt="풀드포크" src="/resources/img/sandwich/sandwich_pm08.jpg"></label>
				<input type="radio" class="hide" id="풀드포크1" name="main" value="풀드포크">
				<label for="쉬림프1"><img alt="쉬림프" src="/resources/img/sandwich/sandwich_pm10.jpg"></label>
				<input type="radio" class="hide" id="쉬림프1" name="main" value="쉬림프">
				<label for="쉬림프아보카도1"><img alt="쉬림프아보카도" src="/resources/img/sandwich/sandwich_pm11.jpg"></label>
				<input type="radio" class="hide" id="쉬림프아보카도1" name="main" value="쉬림프아보카도">
				<h3>빵</h3>
				<span>15cm</span><input type="radio" name="is15" value="1" required><span>30cm</span><input type="radio" name="is15" value="0" required><br>
				<label for="허니오트"><img alt="허니오트" src="/resources/img/recipe/img_recipe_b01.jpg"></label>
				<input type="radio" class="hide" id="허니오트" name="bread" value="허니오트">
				<label for="하티"><img alt="하티" src="/resources/img/recipe/img_recipe_b02.jpg"></label>
				<input type="radio" class="hide" id="하티" name="bread" value="하티">
				<label for="위트"><img alt="위트" src="/resources/img/recipe/img_recipe_b03.jpg"></label>
				<input type="radio" class="hide" id="위트" name="bread" value="위트">
				<label for="파마산오레가노"><img alt="파마산오레가노" src="/resources/img/recipe/img_recipe_b04.jpg"></label>
				<input type="radio" class="hide" id="파마산오레가노" name="bread" value="파마산오레가노">
				<label for="화이트"><img alt="화이트" src="/resources/img/recipe/img_recipe_b05.jpg"></label>
				<input type="radio" class="hide" id="화이트" name="bread" value="화이트">
				<label for="플랫브레드"><img alt="플랫브레드" src="/resources/img/recipe/img_recipe_b06.jpg"></label>
				<input type="radio" class="hide" id="플랫브레드" name="bread" value="플랫브레드">
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
				Any additional instructions:<br /> <textarea id="feedback" style="width:350px;height:150px"></textarea>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>채소</legend>
				Any additional instructions:<br /> <textarea id="feedback" style="width:350px;height:150px"></textarea>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>소스</legend>
				Any additional instructions:<br /> <textarea id="feedback" style="width:350px;height:150px"></textarea>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>사이드메뉴</legend>
				Any additional instructions:<br /> <textarea id="feedback" style="width:350px;height:150px"></textarea>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>세트</legend>
				Any additional instructions:<br /> <textarea id="feedback" style="width:350px;height:150px"></textarea>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>추가주문?</legend>
				Any additional instructions:<br /> <textarea id="feedback" style="width:350px;height:150px"></textarea>
			</fieldset>
			<div id="test" style="width:100%; height:150px; background-color:red;">
				<h3>장바구니 영역</h3>
			</div>
		</form>
	</div>
	<script>
	$(document).ready(function() {
		$('.hide').hide();
	});
	
	/* test */
	$('.hide').click(function(){
		var name = $(this).attr('name');
		var value = $(this).attr('value');
		setCookie(name,value,1);
		console.log(document.cookie);
	});
	
	/* set cookie */
	var setCookie = function(name, value, exp) {
		var date = new Date();
		date.setTime(date.getTime() + exp*24*60*60*1000);
		document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
	};
	
	/* delete cookie */
	function deleteCookie( name ) {
		document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	}
</script>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />