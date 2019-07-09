/**수평 단계별 폼 입력 양식
 * 
 */

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

/* 초기화(숨김 적용, 체크박스용 배열 초기화) */
$(document).ready(function() {
	//$('.hide').hide();
	
	$toppingArr = ['0','0','0','0','0','0','0','0'];
	$('input[name=topping]').val($toppingArr.join(""));
	
	$vegiArr = ['2','2','2','2','2','2','2','2'];
	$('input[name=vegi]').val($vegiArr.join(""));
	
	$sourceArr = ['0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0'];
	$('input[name=source]').val($sourceArr.join(""));
	
	$sideArr = ['0','0','0','0','0','0','0','0','0','0'];
	$('input[name=side]').val($sideArr.join(""));
});

/* 샌드위치나 샐러드 선택 시 */
$('input[name=isSalad]').click(function(){
	if($(this).val() == "0") {
		/* 샌드위치 or 샐러드 상세 선택 메뉴 교체 */
		$('#main').empty();
		$('#main').append(tagSandwich);
	} else if($(this).val() == "1") {
		/* 샌드위치 or 샐러드 상세 선택 메뉴 교체 */
		$('#main').empty();
		$('#main').append(tagSalad);
	}
	//$('.hide').hide();
});

/* 추가토핑 데이터 처리 */
$('input[name=toppingRef]').eq(0).change(function() {
	if($(this).is(":checked")) {														//if:초기 선택자가 checked이면
		$("input[name=toppingRef]:checkbox").each(function(index,item) {				//foreach 시작
			$(this).prop("checked", false);												//foreach 선택자들의 선택 프로퍼티 비활성화
			$toppingArr[index] = "0"; 													//문자열로 쓸 배열 초기화
		});																				//foreach 끝
		$(this).prop("checked", true);													//초기 선택자의 선택 프로퍼티 활성화
		$(this).siblings().filter($('input[name=toppingRef]')).attr("disabled",true);	//초기선택자 제외 나머지 선택 비활성화
		$('input[name=topping]').val($toppingArr.join("")); 							//컨트롤러로 보낼 문자열 초기화
	} else {																			//else:초기 선택자가 checked가 아니면
		$(this).siblings().filter($('input[name=toppingRef]')).attr("disabled",false);	//초기선택자 제외 나머지 선택 활성화	
	}
});
$('input[name=toppingRef]:gt(0)').change(function(){									
	refVal = $(this).val();																//초기선택자의 value
	console.log(refVal);//test
	if($(this).is(":checked")) {														//if:초기 선택자가 checked이면
		for(var index in $toppingArr) {													//forin 시작($toppingArr사용)
			if(index == refVal) {														//	if: index == refVal
				$toppingArr[index] = "1";												//$toppingArr[index]에 "1"
			}
		}																				// for-in ends
		$('input[name=topping]').val($toppingArr.join(""));								//컨트롤러로 보낼 문자열 입력
	} else {																			//else:초기 선택자가 checked가 아니면
		for(var index in $toppingArr) {
			if(index == refVal) {														//	if: index == refVal
				$toppingArr[index] = "0";												//$toppingArr[index]에 "0"
			}
		}// for-in ends
		$('input[name=topping]').val($toppingArr.join(""));								//컨트롤러로 보낼 문자열 입력
	}
	console.log($('input[name=topping]').val());//test
});

/* 채소 데이터 처리 */
/* 각 야채들의 요구량을 숫자스트링으로 받아 처리, 나머지 버튼 중 하나를 누르면 '그대로'체크 해제 */
// '그대로'눌렀을 때 default처리 필요
$('.vegiRef').filter($('input[type=checkbox]')).change(function(){
	if($(this).is(":checked")) {
		for(var index in $vegiArr) {
			$vegiArr[index] = "2"; 														//문자열용 배열 초기화
//			var chgStr = "vegiRef[name="+(+index+1)+"]";								//The unary plus operator
		}
		$('input[name=vegi]').val($vegiArr.join(""));
		console.log($('input[name=vegi]').val());										//컨트롤러로 보낼 문자열 입력
	}
});
$('.vegiRef').filter($('input[type=radio]')).click(function(){
	$('.vegiRef').filter($('input[type=checkbox]')).prop("checked",false);				//'그대로'체크 해제
	refName = $(this).attr('name');
	for(var index in $vegiArr) {
		if(index == refName -1) {
			$vegiArr[index] = $(this).val();											//문자열용 배열 입력
		}
	} // for-in ends
	$('input[name=vegi]').val($vegiArr.join(""));
	console.log($('input[name=vegi]').val());											//컨트롤러로 보낼 문자열 입력
});

/* 소스 데이터 처리 */
$('input[name=sourceRef]').eq(0).change(function() {
	if($(this).is(":checked")) {														//if:초기 선택자가 checked이면
		$("input[name=sourceRef]:checkbox").each(function(index,item) {					//foreach 시작
			$(this).prop("checked", false);												//foreach 선택자들의 선택 프로퍼티 비활성화
			$sourceArr[index] = "0"; 													//문자열로 쓸 배열 초기화
		});																				//foreach 끝
		$(this).prop("checked", true);													//초기 선택자의 선택 프로퍼티 활성화
		$(this).siblings().filter($('input[name=sourceRef]')).attr("disabled",true);	//초기선택자 제외 나머지 선택 비활성화
		$('input[name=source]').val($sourceArr.join("")); 								//컨트롤러로 보낼 문자열 초기화
		console.log($('input[name=source]').val());
	} else {																			//else:초기 선택자가 checked가 아니면
		$(this).siblings().filter($('input[name=sourceRef]')).attr("disabled",false);	//초기선택자 제외 나머지 선택 활성화	
	}
});
$('input[name=sourceRef]:gt(0)').change(function(){									
	refVal = $(this).val();																//초기선택자의 value
	console.log(refVal);//test
	if($(this).is(":checked")) {														//if:초기 선택자가 checked이면
		for(var index in $sourceArr) {													//forin 시작($sourceArr사용)
			if(index == refVal) {														//	if: index == refVal
				$sourceArr[index] = "1";												//$toppingArr[index]에 "1"
			}
		}																				// for-in ends
		$('input[name=source]').val($sourceArr.join(""));								//컨트롤러로 보낼 문자열 입력
	} else {																			//else:초기 선택자가 checked가 아니면
		for(var index in $sourceArr) {
			if(index == refVal) {														//	if: index == refVal
				$sourceArr[index] = "0";												//$sourceArr[index]에 "0"
			}
		}// for-in ends
		$('input[name=source]').val($sourceArr.join(""));								//컨트롤러로 보낼 문자열 입력
	}
	console.log($('input[name=source]').val());//test
});

/* 사이드 데이터 처리 */
$('input[name=sideRef]').eq(0).change(function() {
	if($(this).is(":checked")) {														//if:초기 선택자가 checked이면
		$("input[name=sideRef]:checkbox").each(function(index,item) {					//foreach 시작
			$(this).prop("checked", false);												//foreach 선택자들의 선택 프로퍼티 비활성화
			$sideArr[index] = "0"; 													//문자열로 쓸 배열 초기화
		});																				//foreach 끝
		$(this).prop("checked", true);													//초기 선택자의 선택 프로퍼티 활성화
		$(this).siblings().filter($('input[name=sideRef]')).attr("disabled",true);	//초기선택자 제외 나머지 선택 비활성화
		$('input[name=side]').val($sideArr.join("")); 								//컨트롤러로 보낼 문자열 초기화
		console.log($('input[name=side]').val());
	} else {																			//else:초기 선택자가 checked가 아니면
		$(this).siblings().filter($('input[name=sideRef]')).attr("disabled",false);	//초기선택자 제외 나머지 선택 활성화	
	}
});
$('input[name=sideRef]:gt(0)').change(function(){									
	refVal = $(this).val();																//초기선택자의 value
	console.log(refVal);//test
	if($(this).is(":checked")) {														//if:초기 선택자가 checked이면
		for(var index in $sideArr) {													//forin 시작($sourceArr사용)
			if(index == refVal) {														//	if: index == refVal
				$sideArr[index] = "1";												//$toppingArr[index]에 "1"
			}
		}																				// for-in ends
		$('input[name=side]').val($sideArr.join(""));								//컨트롤러로 보낼 문자열 입력
	} else {																			//else:초기 선택자가 checked가 아니면
		for(var index in $sideArr) {
			if(index == refVal) {														//	if: index == refVal
				$sideArr[index] = "0";												//$sourceArr[index]에 "0"
			}
		}// for-in ends
		$('input[name=source]').val($sideArr.join(""));								//컨트롤러로 보낼 문자열 입력
	}
	console.log($('input[name=side]').val());//test
});


/* 샌드위치/샐러드 주재료 태그문자열 */
tagSandwich = '<h3>메인재료</h3> \
	<label for="이탈리안비엠티1"><img alt="이탈리안비엠티" src="/resources/img/sandwich/sandwich_cl01.jpg"></label> \
	<input type="radio" class="hide" id="이탈리안비엠티1" name="main" value="0"> \
	<label for="비엘티1"><img alt="비엘티" src="/resources/img/sandwich/sandwich_cl02.jpg"></label> \
	<input type="radio" class="hide" id="비엘티1" name="main" value="1"> \
	<label for="미트볼1"><img alt="미트볼" src="/resources/img/sandwich/sandwich_cl03.jpg"></label> \
	<input type="radio" class="hide" id="미트볼1" name="main" value="2"> \
	<label for="햄1"><img alt="햄" src="/resources/img/sandwich/sandwich_cl04.jpg"></label> \
	<input type="radio" class="hide" id="햄1" name="main" value="3"> \
	<label for="참치1"><img alt="참치" src="/resources/img/sandwich/sandwich_cl05.jpg"></label> \
	<input type="radio" class="hide" id="참치1" name="main" value="4"> \
	<label for="에그마요1"><img alt="에그마요" src="/resources/img/sandwich/sandwich_cl06.jpg"></label> \
	<input type="radio" class="hide" id="에그마요1" name="main" value="5"> \
	<label for="로티세리1"><img alt="로티세리" src="/resources/img/sandwich/sandwich_fl01.jpg"></label> \
	<input type="radio" class="hide" id="로티세리1" name="main" value="6"> \
	<label for="로스트치킨1"><img alt="로스트치킨" src="/resources/img/sandwich/sandwich_fl02.jpg"></label> \
	<input type="radio" class="hide" id="로스트치킨1" name="main" value="7> \
	<label for="로스트비프1"><img alt="로스트비프" src="/resources/img/sandwich/sandwich_fl03.jpg"></label> \
	<input type="radio" class="hide" id="로스트비프1" name="main" value="8"> \
	<label for="사브웨이클럽1"><img alt="사브웨이클럽" src="/resources/img/sandwich/sandwich_fl04.jpg"></label> \
	<input type="radio" class="hide" id="사브웨이클럽1" name="main" value="9"> \
	<label for="터키1"><img alt="터키" src="/resources/img/sandwich/sandwich_fl05.jpg"></label> \
	<input type="radio" class="hide" id="터키1" name="main" value="10"> \
	<label for="베지1"><img alt="베지" src="/resources/img/sandwich/sandwich_fl06.jpg"></label> \
	<input type="radio" class="hide" id="베지1" name="main" value="11"> \
	<label for="스테이크&치즈1"><img alt="스테이크&치즈" src="/resources/img/sandwich/sandwich_pm01.jpg"></label> \
	<input type="radio" class="hide" id="스테이크&치즈1" name="main" value="12"> \
	<label for="터키베이컨아보카도1"><img alt="터키베이컨아보카도" src="/resources/img/sandwich/sandwich_pm02.jpg"></label> \
	<input type="radio" class="hide" id="터키베이컨아보카도1" name="main" value="13"> \
	<label for="치킨베이컨랜치1"><img alt="치킨베이컨랜치" src="/resources/img/sandwich/sandwich_pm03.jpg"></label> \
	<input type="radio" class="hide" id="치킨베이컨랜치1" name="main" value="14"> \
	<label for="사브웨이멜트1"><img alt="사브웨이멜트" src="/resources/img/sandwich/sandwich_pm04.jpg"></label> \
	<input type="radio" class="hide" id="사브웨이멜트1" name="main" value="15"> \
	<label for="터키베이컨1"><img alt="터키베이컨" src="/resources/img/sandwich/sandwich_pm05.jpg"></label> \
	<input type="radio" class="hide" id="터키베이컨1" name="main" value="16"> \
	<label for="스파이시이탈리안1"><img alt="스파이시이탈리안" src="/resources/img/sandwich/sandwich_pm06.jpg"></label> \
	<input type="radio" class="hide" id="스파이시이탈리안1" name="main" value="17"> \
	<label for="치킨데리야끼1"><img alt="치킨데리야끼" src="/resources/img/sandwich/sandwich_pm07.jpg"></label> \
	<input type="radio" class="hide" id="치킨데리야끼1" name="main" value="18"> \
	<label for="풀드포크1"><img alt="풀드포크" src="/resources/img/sandwich/sandwich_pm08.jpg"></label> \
	<input type="radio" class="hide" id="풀드포크1" name="main" value="19"> \
	<label for="쉬림프1"><img alt="쉬림프" src="/resources/img/sandwich/sandwich_pm10.jpg"></label> \
	<input type="radio" class="hide" id="쉬림프1" name="main" value="20"> \
	<label for="쉬림프아보카도1"><img alt="쉬림프아보카도" src="/resources/img/sandwich/sandwich_pm11.jpg"></label> \
	<input type="radio" class="hide" id="쉬림프아보카도1" name="main" value="21"> \
	<input type="hidden" name="main" value=""> \
	<h3>빵</h3> \
	<span>15cm</span><input type="radio" name="is15" value="1" required><span>30cm</span><input type="radio" name="is15" value="0" required><br> \
	<label for="허니오트"><img alt="허니오트" src="/resources/img/recipe/img_recipe_b01.jpg"></label> \
	<input type="radio" class="hide" id="허니오트" name="bread" value="0"> \
	<label for="하티"><img alt="하티" src="/resources/img/recipe/img_recipe_b02.jpg"></label> \
	<input type="radio" class="hide" id="하티" name="bread" value="1"> \
	<label for="위트"><img alt="위트" src="/resources/img/recipe/img_recipe_b03.jpg"></label> \
	<input type="radio" class="hide" id="위트" name="bread" value="2"> \
	<label for="파마산오레가노"><img alt="파마산오레가노" src="/resources/img/recipe/img_recipe_b04.jpg"></label> \
	<input type="radio" class="hide" id="파마산오레가노" name="bread" value="3"> \
	<label for="화이트"><img alt="화이트" src="/resources/img/recipe/img_recipe_b05.jpg"></label> \
	<input type="radio" class="hide" id="화이트" name="bread" value="4"> \
	<label for="플랫브레드"><img alt="플랫브레드" src="/resources/img/recipe/img_recipe_b06.jpg"></label> \
	<input type="radio" class="hide" id="플랫브레드" name="bread" value="5"> \
	<input type="hidden" name="bread" value="">';
tagSalad = '<h3>메인재료</h3> \
	<input type="hidden" name=is15 value="-1"><input type="hidden" name="bread" value="-1"> \
	<label for="이탈리안비엠티2"><img alt="이탈리안비엠티" src="/resources/img/salad/salad_cl01.jpg"></label> \
	<input type="radio" class="hide" id="이탈리안비엠티2" name="main" value="0"> \
	<label for="비엘티2"><img alt="비엘티" src="/resources/img/salad/salad_cl02.jpg"></label> \
	<input type="radio" class="hide" id="비엘티2" name="main" value="1"> \
	<label for="미트볼2"><img alt="미트볼" src="/resources/img/salad/salad_cl03.jpg"></label> \
	<input type="radio" class="hide" id="미트볼2" name="main" value="2"> \
	<label for="햄2"><img alt="햄" src="/resources/img/salad/salad_cl04.jpg"></label> \
	<input type="radio" class="hide" id="햄2" name="main" value="3"> \
	<label for="참치2"><img alt="참치" src="/resources/img/salad/salad_cl05.jpg"></label> \
	<input type="radio" class="hide" id="참치2" name="main" value="4"> \
	<label for="에그마요2"><img alt="에그마요" src="/resources/img/salad/salad_cl06.jpg"></label> \
	<input type="radio" class="hide" id="에그마요2" name="main" value="5"> \
	<label for="로티세리2"><img alt="로티세리" src="/resources/img/salad/salad_fl01.jpg"></label> \
	<input type="radio" class="hide" id="로티세리2" name="main" value="6"> \
	<label for="로스트치킨2"><img alt="로스트치킨" src="/resources/img/salad/salad_fl02.jpg"></label> \
	<input type="radio" class="hide" id="로스트치킨2" name="main" value="7"> \
	<label for="로스트비프2"><img alt="로스트비프" src="/resources/img/salad/salad_fl03.jpg"></label> \
	<input type="radio" class="hide" id="로스트비프2" name="main" value="8"> \
	<label for="사브웨이클럽2"><img alt="사브웨이클럽" src="/resources/img/salad/salad_fl04.jpg"></label> \
	<input type="radio" class="hide" id="사브웨이클럽2" name="main" value="9"> \
	<label for="터키2"><img alt="터키" src="/resources/img/salad/salad_fl05.jpg"></label> \
	<input type="radio" class="hide" id="터키2" name="main" value="10"> \
	<label for="베지2"><img alt="베지" src="/resources/img/salad/salad_fl06.jpg"></label> \
	<input type="radio" class="hide" id="베지2" name="main" value="11"> \
	<label for="스테이크&치즈2"><img alt="스테이크&치즈" src="/resources/img/salad/salad_pm01.jpg"></label> \
	<input type="radio" class="hide" id="스테이크&치즈2" name="main" value="12"> \
	<label for="터키베이컨아보카도2"><img alt="터키베이컨아보카도" src="/resources/img/salad/salad_pm02.jpg"></label> \
	<input type="radio" class="hide" id="터키베이컨아보카도2" name="main" value="13"> \
	<label for="치킨베이컨랜치2"><img alt="치킨베이컨랜치" src="/resources/img/salad/salad_pm03.jpg"></label> \
	<input type="radio" class="hide" id="치킨베이컨랜치2" name="main" value="14"> \
	<label for="사브웨이멜트2"><img alt="사브웨이멜트" src="/resources/img/salad/salad_pm04.jpg"></label> \
	<input type="radio" class="hide" id="사브웨이멜트2" name="main" value="15"> \
	<label for="터키베이컨2"><img alt="터키베이컨" src="/resources/img/salad/salad_pm05.jpg"></label> \
	<input type="radio" class="hide" id="터키베이컨2" name="main" value="16"> \
	<label for="스파이시이탈리안2"><img alt="스파이시이탈리안" src="/resources/img/salad/salad_pm06.jpg"></label> \
	<input type="radio" class="hide" id="스파이시이탈리안2" name="main" value="17"> \
	<label for="치킨데리야끼2"><img alt="치킨데리야끼" src="/resources/img/salad/salad_pm07.jpg"></label> \
	<input type="radio" class="hide" id="치킨데리야끼2" name="main" value="18"> \
	<label for="풀드포크2"><img alt="풀드포크" src="/resources/img/salad/salad_pm08.jpg"></label> \
	<input type="radio" class="hide" id="풀드포크2" name="main" value="19"> \
	<label for="쉬림프2"><img alt="쉬림프" src="/resources/img/salad/salad_pm10.jpg"></label> \
	<input type="radio" class="hide" id="쉬림프2" name="main" value="20"> \
	<label for="쉬림프아보카도2"><img alt="쉬림프아보카도" src="/resources/img/salad/salad_pm11.jpg"></label> \
	<input type="radio" class="hide" id="쉬림프아보카도2" name="main" value="21"> \
	<input type="hidden" name="main" value="">';