/**수평 단계별 폼 입력 양식 js
 * 
 */

$(document).ready(function() {
	//$('.hide').hide();
});
//
///* test */
//$('.hide').click(function(){
//	var name = $(this).attr('name');
//	var value = $(this).attr('value');
//	setCookie(name,value,1);
//	console.log(document.cookie);
//});
//
///* set cookie */
//var setCookie = function(name, value, exp) {
//	var date = new Date();
//	date.setTime(date.getTime() + exp*24*60*60*1000);
//	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
//};
//
///* delete cookie */
//function deleteCookie( name ) {
//	document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
//}

/* 샌드위치나 샐러드 선택 시 */
$('input[name=isSalad]').click(function(){
	console.log($(this).val());
	if($(this).val() == "샌드위치") {
		/* 샌드위치 or 샐러드 상세 선택 메뉴 교체 */
		$('#main').empty();
		$('#main').append(tagSandwich);
	} else if($(this).val() == "샐러드") {
		/* 샌드위치 or 샐러드 상세 선택 메뉴 교체 */
		$('#main').empty();
		$('#main').append(tagSalad);
	}
	$('.hide').hide();
});

/* 채소 */
$('.vegiRef').change(function() {
	$('.vegiRef').each(function(index,item){
		$vegiArr[index] = $(item).val();
	});
	$('input[name=vegi]').val($vegiArr.join(""));
	console.log($('input[name=vegi]').val()); // test 
});


/* 샌드위치/샐러드 주재료 태그문자열 */
tagSandwich = '<h3>메인재료</h3> \
	<label for="이탈리안비엠티1"><img alt="이탈리안비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg"></label> \
	<input type="radio" class="hide" id="이탈리안비엠티1" name="main" value="이탈리안비엠티"> \
	<label for="비엠티1"><img alt="비엠티" src="/resources/img/sandwich/sandwich_cl02.jpg"></label> \
	<input type="radio" class="hide" id="비엠티1" name="main" value="비엠티"> \
	<label for="미트볼1"><img alt="미트볼" src="/resources/img/sandwich/sandwich_cl03.jpg"></label> \
	<input type="radio" class="hide" id="미트볼1" name="main" value="미트볼"> \
	<label for="햄1"><img alt="햄" src="/resources/img/sandwich/sandwich_cl04.jpg"></label> \
	<input type="radio" class="hide" id="햄1" name="main" value="햄"> \
	<label for="참치1"><img alt="참치" src="/resources/img/sandwich/sandwich_cl05.jpg"></label> \
	<input type="radio" class="hide" id="참치1" name="main" value="참치"> \
	<label for="에그마요1"><img alt="에그마요" src="/resources/img/sandwich/sandwich_cl06.jpg"></label> \
	<input type="radio" class="hide" id="에그마요1" name="main" value="에그마요"> \
	<label for="로티세리1"><img alt="로티세리" src="/resources/img/sandwich/sandwich_fl01.jpg"></label> \
	<input type="radio" class="hide" id="로티세리1" name="main" value="로티세리"> \
	<label for="로스트치킨1"><img alt="로스트치킨" src="/resources/img/sandwich/sandwich_fl02.jpg"></label> \
	<input type="radio" class="hide" id="로스트치킨1" name="main" value="로스트치킨"> \
	<label for="로스트비프1"><img alt="로스트비프" src="/resources/img/sandwich/sandwich_fl03.jpg"></label> \
	<input type="radio" class="hide" id="로스트비프1" name="main" value="로스트비프"> \
	<label for="사브웨이클럽1"><img alt="사브웨이클럽" src="/resources/img/sandwich/sandwich_fl04.jpg"></label> \
	<input type="radio" class="hide" id="사브웨이클럽1" name="main" value="사브웨이클럽"> \
	<label for="터키1"><img alt="터키" src="/resources/img/sandwich/sandwich_fl05.jpg"></label> \
	<input type="radio" class="hide" id="터키1" name="main" value="터키"> \
	<label for="베지1"><img alt="베지" src="/resources/img/sandwich/sandwich_fl06.jpg"></label> \
	<input type="radio" class="hide" id="베지1" name="main" value="베지"> \
	<label for="스테이크&치즈1"><img alt="스테이크&치즈" src="/resources/img/sandwich/sandwich_pm01.jpg"></label> \
	<input type="radio" class="hide" id="스테이크&치즈1" name="main" value="스테이크&치즈"> \
	<label for="터키베이컨아보카도1"><img alt="터키베이컨아보카도" src="/resources/img/sandwich/sandwich_pm02.jpg"></label> \
	<input type="radio" class="hide" id="터키베이컨아보카도1" name="main" value="터키베이컨아보카도"> \
	<label for="치킨베이컨랜치1"><img alt="치킨베이컨랜치" src="/resources/img/sandwich/sandwich_pm03.jpg"></label> \
	<input type="radio" class="hide" id="치킨베이컨랜치1" name="main" value="치킨베이컨랜치"> \
	<label for="사브웨이멜트1"><img alt="사브웨이멜트" src="/resources/img/sandwich/sandwich_pm04.jpg"></label> \
	<input type="radio" class="hide" id="사브웨이멜트1" name="main" value="사브웨이멜트"> \
	<label for="터키베이컨1"><img alt="터키베이컨" src="/resources/img/sandwich/sandwich_pm05.jpg"></label> \
	<input type="radio" class="hide" id="터키베이컨1" name="main" value="터키베이컨"> \
	<label for="스파이시이탈리안1"><img alt="스파이시이탈리안" src="/resources/img/sandwich/sandwich_pm06.jpg"></label> \
	<input type="radio" class="hide" id="스파이시이탈리안1" name="main" value="스파이시이탈리안"> \
	<label for="치킨데리야끼1"><img alt="치킨데리야끼" src="/resources/img/sandwich/sandwich_pm07.jpg"></label> \
	<input type="radio" class="hide" id="치킨데리야끼1" name="main" value="치킨데리야끼"> \
	<label for="풀드포크1"><img alt="풀드포크" src="/resources/img/sandwich/sandwich_pm08.jpg"></label> \
	<input type="radio" class="hide" id="풀드포크1" name="main" value="풀드포크"> \
	<label for="쉬림프1"><img alt="쉬림프" src="/resources/img/sandwich/sandwich_pm10.jpg"></label> \
	<input type="radio" class="hide" id="쉬림프1" name="main" value="쉬림프"> \
	<label for="쉬림프아보카도1"><img alt="쉬림프아보카도" src="/resources/img/sandwich/sandwich_pm11.jpg"></label> \
	<input type="radio" class="hide" id="쉬림프아보카도1" name="main" value="쉬림프아보카도"> \
	<h3>빵</h3> \
	<span>15cm</span><input type="radio" name="is15" value="1" required><span>30cm</span><input type="radio" name="is15" value="0" required><br> \
	<label for="허니오트"><img alt="허니오트" src="/resources/img/recipe/img_recipe_b01.jpg"></label> \
	<input type="radio" class="hide" id="허니오트" name="bread" value="허니오트"> \
	<label for="하티"><img alt="하티" src="/resources/img/recipe/img_recipe_b02.jpg"></label> \
	<input type="radio" class="hide" id="하티" name="bread" value="하티"> \
	<label for="위트"><img alt="위트" src="/resources/img/recipe/img_recipe_b03.jpg"></label> \
	<input type="radio" class="hide" id="위트" name="bread" value="위트"> \
	<label for="파마산오레가노"><img alt="파마산오레가노" src="/resources/img/recipe/img_recipe_b04.jpg"></label> \
	<input type="radio" class="hide" id="파마산오레가노" name="bread" value="파마산오레가노"> \
	<label for="화이트"><img alt="화이트" src="/resources/img/recipe/img_recipe_b05.jpg"></label> \
	<input type="radio" class="hide" id="화이트" name="bread" value="화이트"> \
	<label for="플랫브레드"><img alt="플랫브레드" src="/resources/img/recipe/img_recipe_b06.jpg"></label> \
	<input type="radio" class="hide" id="플랫브레드" name="bread" value="플랫브레드">';
tagSalad = '<h3>메인재료</h3> \
	<label for="이탈리안비엠티2"><img alt="이탈리안비엠티" src="/resources/img/salad/salad_cl01.jpg"></label> \
	<input type="radio" class="hide" id="이탈리안비엠티2" name="main" value="이탈리안비엠티"> \
	<label for="비엠티2"><img alt="비엠티" src="/resources/img/salad/salad_cl02.jpg"></label> \
	<input type="radio" class="hide" id="비엠티2" name="main" value="비엠티"> \
	<label for="미트볼2"><img alt="미트볼" src="/resources/img/salad/salad_cl03.jpg"></label> \
	<input type="radio" class="hide" id="미트볼2" name="main" value="미트볼"> \
	<label for="햄2"><img alt="햄" src="/resources/img/salad/salad_cl04.jpg"></label> \
	<input type="radio" class="hide" id="햄2" name="main" value="햄"> \
	<label for="참치2"><img alt="참치" src="/resources/img/salad/salad_cl05.jpg"></label> \
	<input type="radio" class="hide" id="참치2" name="main" value="참치"> \
	<label for="에그마요2"><img alt="에그마요" src="/resources/img/salad/salad_cl06.jpg"></label> \
	<input type="radio" class="hide" id="에그마요2" name="main" value="에그마요"> \
	<label for="로티세리2"><img alt="로티세리" src="/resources/img/salad/salad_fl01.jpg"></label> \
	<input type="radio" class="hide" id="로티세리2" name="main" value="로티세리"> \
	<label for="로스트치킨2"><img alt="로스트치킨" src="/resources/img/salad/salad_fl02.jpg"></label> \
	<input type="radio" class="hide" id="로스트치킨2" name="main" value="로스트치킨"> \
	<label for="로스트비프2"><img alt="로스트비프" src="/resources/img/salad/salad_fl03.jpg"></label> \
	<input type="radio" class="hide" id="로스트비프2" name="main" value="로스트비프"> \
	<label for="사브웨이클럽2"><img alt="사브웨이클럽" src="/resources/img/salad/salad_fl04.jpg"></label> \
	<input type="radio" class="hide" id="사브웨이클럽2" name="main" value="사브웨이클럽"> \
	<label for="터키2"><img alt="터키" src="/resources/img/salad/salad_fl05.jpg"></label> \
	<input type="radio" class="hide" id="터키2" name="main" value="터키"> \
	<label for="베지2"><img alt="베지" src="/resources/img/salad/salad_fl06.jpg"></label> \
	<input type="radio" class="hide" id="베지2" name="main" value="베지"> \
	<label for="스테이크&치즈2"><img alt="스테이크&치즈" src="/resources/img/salad/salad_pm01.jpg"></label> \
	<input type="radio" class="hide" id="스테이크&치즈2" name="main" value="스테이크&치즈"> \
	<label for="터키베이컨아보카도2"><img alt="터키베이컨아보카도" src="/resources/img/salad/salad_pm02.jpg"></label> \
	<input type="radio" class="hide" id="터키베이컨아보카도2" name="main" value="터키베이컨아보카도"> \
	<label for="치킨베이컨랜치2"><img alt="치킨베이컨랜치" src="/resources/img/salad/salad_pm03.jpg"></label> \
	<input type="radio" class="hide" id="치킨베이컨랜치2" name="main" value="치킨베이컨랜치"> \
	<label for="사브웨이멜트2"><img alt="사브웨이멜트" src="/resources/img/salad/salad_pm04.jpg"></label> \
	<input type="radio" class="hide" id="사브웨이멜트2" name="main" value="사브웨이멜트"> \
	<label for="터키베이컨2"><img alt="터키베이컨" src="/resources/img/salad/salad_pm05.jpg"></label> \
	<input type="radio" class="hide" id="터키베이컨2" name="main" value="터키베이컨"> \
	<label for="스파이시이탈리안2"><img alt="스파이시이탈리안" src="/resources/img/salad/salad_pm06.jpg"></label> \
	<input type="radio" class="hide" id="스파이시이탈리안2" name="main" value="스파이시이탈리안"> \
	<label for="치킨데리야끼2"><img alt="치킨데리야끼" src="/resources/img/salad/salad_pm07.jpg"></label> \
	<input type="radio" class="hide" id="치킨데리야끼2" name="main" value="치킨데리야끼"> \
	<label for="풀드포크2"><img alt="풀드포크" src="/resources/img/salad/salad_pm08.jpg"></label> \
	<input type="radio" class="hide" id="풀드포크2" name="main" value="풀드포크"> \
	<label for="쉬림프2"><img alt="쉬림프" src="/resources/img/salad/salad_pm10.jpg"></label> \
	<input type="radio" class="hide" id="쉬림프2" name="main" value="쉬림프"> \
	<label for="쉬림프아보카도2"><img alt="쉬림프아보카도" src="/resources/img/salad/salad_pm11.jpg"></label> \
	<input type="radio" class="hide" id="쉬림프아보카도2" name="main" value="쉬림프아보카도">';