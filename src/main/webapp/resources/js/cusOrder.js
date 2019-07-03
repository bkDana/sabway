/**사브웨이 프로젝트 주문용 쿠키 생성, 조회, 삭제 및 기타 function
 * 
 */

/* 초기화 */
$(document).ready(function(){
	$('.hide').hide();
	$('#cheese').hide();
	$('#topping').hide();
	$('#isOvened').hide();
	$('#vegi').hide();
	$('#source').hide();
	$('#set').hide();
	$('#moreOrder').hide();
	$vegiArr = ['2','2','2','2','2','2','2','2'];
});



/* set cookie */
var setCookie = function(name, value, exp) {
	var date = new Date();
	date.setTime(date.getTime() + exp*24*60*60*1000);
	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
}

/* get cookie */
var getCookie = function(name) {
	  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	  return value? value[2] : null;
}

/* delete cookie */
var deleteCookie = function(name) {
	  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	}

/* delete all cookies */
function deleteAllCookies() {
    var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
	}
   	alert('cookies deleted');
}  

/* 클릭시 쿠키에 등록 */
$(document).on('click','input[type=radio]',function(){
	var name = $(this).attr('name');
	var value = $(this).attr('value');
	setCookie(name,value,1);
	console.log(document.cookie);
});
$(document).on('click','input[type=checkbox]',function(){
	var name = $(this).attr('name');
	var value = $(this).attr('value');
	setCookie(name,value,1);
	console.log(document.cookie);
});

/* 샌드위치나 샐러드 선택 시 */
$('input[name=isSalad]').click(function(){
	if($(this).val() == "샌드위치") {
		/* 샌드위치 or 샐러드 상세 선택 메뉴 교체 */
		if(!$('#cheese').is(':visible')) {
			$('.content-wrapper').eq(0).after('<div class="content-wrapper" id="sandwich"></div>');	
			$('.content-wrapper').eq(1).append(tagSandwich);
			$('#cheese').show();
		}else {
			$('.content-wrapper').eq(1).remove();
			$('.content-wrapper').eq(0).after('<div class="content-wrapper" id="sandwich"></div>');
			$('.content-wrapper').eq(1).append(tagSandwich);
		}
	} else if($(this).val() == "샐러드") {
		/* 샌드위치 or 샐러드 상세 선택 메뉴 교체 */
		if(!$('#cheese').is(':visible')) {
			$('.content-wrapper').eq(0).after('<div class="content-wrapper" id="salad"></div>');	
			$('.content-wrapper').eq(1).append(tagSalad);
			$('#cheese').show();
		}else {
			$('.content-wrapper').eq(1).remove();
			$('.content-wrapper').eq(0).after('<div class="content-wrapper" id="salad"></div>');	
			$('.content-wrapper').eq(1).append(tagSalad);
		}
	}
	$('.hide').hide();
});

/* 추가토핑 */
$('input[name=cheese]').click(function() {
	$('#topping').show();
})
$('#topping input[value=선택안함]').change(function() {
	if($(this).is(":checked")) {
		$("input[name=topping]:checkbox").each(function() {
			$(this).prop("checked", false);
		});
		$(this).parent().filter($('input[name=topping]')).attr("disabled",true);
	} else {
		$(this).parent().filter($('input[name=topping]')).attr("disabled",false);
	}
	
})

/* 오븐여부 */
$('input[name=topping]').click(function() {
	console.log($('#topping input[name=topping]:checked').length);
	$('#isOvened').show();
});
$('#topping input[name=nothingElse]').click(function() {
	console.log($('#topping input[name=topping]:checked').length);
	$('#isOvened').show();
});

/* 채소 */
$('input[name=isOvened]').click(function() {
	$('#vegi').show();
	$('.hide').hide();
});
$('.vegiRef').change(function() {
	$('.vegiRef').each(function(index,item){
		$vegiArr[index] = $(item).val();
	});
	$('input[name=vegi]').val($vegiArr.join(""));
	setCookie('vegi',$vegiArr,1);
	console.log($('input[name=vegi]').val()); // test 
});


/* 소스 */
$('input[name=vegiRef]').click(function() {
	$('#source').show();
});
$('#source input[value=선택안함]').change(function() {
	if($(this).is(":checked")) {
		$("input[name=source]:checkbox").each(function() {
			$(this).prop("checked", false);
		});
		$(this).parent().filter($('input[name=source]')).attr("disabled",true);
	} else {
		$(this).parent().filter($('input[name=source]')).attr("disabled",false);
	}
	
});

/* 세트여부 */
$('input[name=source]').click(function() {
	$('#set').show();
	$('.hide').hide();
});
/* 세트 구분하기 및 추가주문 받기 */
$('input[name=set]').click(function() {
	if($(this).val()==1) {
		 var $whichSet = $('input[name=whichSet]');
		$('#moreOrder').hide();
		$(this).siblings().filter($('.hide')).show();
		if($whichSet.is(":checked")) {
			console.log("아아");
			$('#moreOrder').show();
		}
	} else {
		$(this).siblings().filter($('.hide')).hide();
		$('#moreOrder').show();
	}
	
});

tagSandwich = '<h3>빵</h3> \
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
	<input type="radio" class="hide" id="플랫브레드" name="bread" value="플랫브레드"> \
<hr> \
<h3>메인재료</h3> \
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
	<input type="radio" class="hide" id="쉬림프아보카도1" name="main" value="쉬림프아보카도">';
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

