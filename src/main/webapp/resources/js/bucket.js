
function deleteOrder(idx){
	var delIdx = $('.hiddenBucIdx').val();
	$.ajax({
    	url : "/tempOrderDelete.do",
        type : 'get',
        data : {delIdx:delIdx},
        success : function(){
            $(idx).parent().parent().remove();
        },
    });
}
var getCookie = function(name) {
	  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	  return value? value[2] : null;			//현재 쿠키가 3개 생성되어 있음, 3번째가 커스텀 쿠키
	};

$(document).ready(function(){
    var sessionPhone = $('#sessionContainer').val(); // 주문할 때 쓰임
    var cookieVal = getCookie('noneCustomer');	// 헤더에서 쓰임
    console.log(sessionPhone);
    console.log(cookieVal);
    
    /* bucket.jsp로 이동 */
    $('#bucket').click(function() {
        location.href="/loadBucket.do"
    });
    
    /* 체크박스형 자료들 표시용 */
    $toppingArr = new Array();
    $vegiArr = new Array();
    $sourceArr = new Array();
    $sideArr = new Array();

    /* 주문 상품 갯수만큼 반복 */
    for(var i=0; i<$('.hiddenInfo').length; i++) {
    	var topping = $('.hiddenInfo').eq(i).find('.hiddenTopping').val();
	    $toppingArr = topping.split("");
	    
	    var vegi = $('.hiddenInfo').eq(i).find('.hiddenVegi').val();
	    $vegiArr = vegi.split("");
	    
	    var source = $('.hiddenInfo').eq(i).find('.hiddenSource').val();
	    $sourceArr = source.split("");
	    
	    var side = $('.hiddenInfo').eq(i).find('.hiddenSide').val();
	    $sideArr = side.split("");
	    
	    var oven = $('.hiddenInfo').eq(i).find('.hiddenOvened').val();
	    var intoOven = "";
	    
	    var intoTopping = "추가토핑 : "; 
	    var intoVegi = "채소 특이사항 : ";
	    var intoOven = "";
	    var intoSource = "소스 : ";
	    var intoSide = "사이드메뉴 : ";
	    switch(oven) {
	    case 0 : 
	    	intoOven = "오븐 : O";
	    	$('.bucketOption').eq(i).find('#oven').html(intoOven);
	    	intoOven = "";
	    	break;
	    default :
	    	intoOven = "오븐 : X";
	    	$('.bucketOption').eq(i).find('#oven').html(intoOven);
	    	intoOven = "";
	    	break;
	    }
	    
	    /* 토핑 순서 */
	    for(var j = 0; j<$toppingArr.length; j++) {
	    	if($toppingArr[j] == "1") {
		    	switch(j) {
		    	case 0 : 
		    		intoTopping += "더블업 ";
		    		($('.bucketOption').eq(i).find('#topping').html(intoTopping) ) ; 
		    		break;
		    	case 1 : 
		    		intoTopping += "쉬림프 ";
		    		($('.bucketOption').eq(i).find('#topping').html(intoTopping) ) ; 
		    		break;
		    	case 2 : 
		    		intoTopping += "에그마요 ";
		    		($('.bucketOption').eq(i).find('#topping').html(intoTopping) ) ; 
		    		break;
		    	case 3 : 
		    		intoTopping += "오믈렛 ";
		    		($('.bucketOption').eq(i).find('#topping').html(intoTopping) ) ; 
		    		break;
		    	case 4 : 
		    		intoTopping += "아보카도 ";
		    		($('.bucketOption').eq(i).find('#topping').html(intoTopping) ) ; 
		    		break;
		    	case 5 : 
		    		intoTopping += "베이컨 ";
		    		($('.bucketOption').eq(i).find('#topping').html(intoTopping) ) ; 
		    		break;
		    	case 6 : 
		    		intoTopping += "페퍼로니 ";
		    		($('.bucketOption').eq(i).find('#topping').html(intoTopping) ) ; 
		    		break;
		    	case 7 : 
		    		intoTopping += "더블치즈";
		    		($('.bucketOption').eq(i).find('#topping').html(intoTopping) ) ; 
		    		break;
		    	}
	    	}
	    }
	    
	    /*채소 순서*/
	    for(var j = 0; j<$vegiArr.length; j++) {
	    	if($vegiArr[j] != "2") {
	    		switch(j) {
	    		case 0 :
	    			switch($vegiArr[j]) {
	    			case "0" : 
	    				intoVegi += "양상추선택안함 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "1" : 
	    				intoVegi += "양상추적게 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "3" : 
	    				intoVegi += "양상추많이 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			}
	    			break;
	    		case 1 :
	    			switch($vegiArr[j]) {
	    			case "0" : 
	    				intoVegi += "오이선택안함 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "1" : 
	    				intoVegi += "오이적게 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "3" : 
	    				intoVegi += "오이많이 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			}
	    			break;
	    		case 2 :
	    			switch($vegiArr[j]) {
	    			case "0" : 
	    				intoVegi += "피망선택안함 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "1" : 
	    				intoVegi += "피망적게 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "3" : 
	    				intoVegi += "피망많이 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			}
	    			break;
	    		case 3 :
	    			switch($vegiArr[j]) {
	    			case "0" : 
	    				intoVegi += "양파선택안함 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "1" : 
	    				intoVegi += "양파적게 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "3" : 
	    				intoVegi += "양파많이 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			}
	    			break;
	    		case 4 :
	    			switch($vegiArr[j]) {
	    			case "0" : 
	    				intoVegi += "올리브선택안함 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "1" : 
	    				intoVegi += "올리브적게 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "3" : 
	    				intoVegi += "올리브많이 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			}
	    			break;
	    		case 5 :
	    			switch($vegiArr[j]) {
	    			case "0" : 
	    				intoVegi += "피클선택안함 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "1" : 
	    				intoVegi += "피클적게 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "3" : 
	    				intoVegi += "피클많이 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			}
	    			break;
	    		case 6 :
	    			switch($vegiArr[j]) {
	    			case "0" : 
	    				intoVegi += "아보카도선택안함 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "1" : 
	    				intoVegi += "아보카도적게 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "3" : 
	    				intoVegi += "아보카도많이 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			}
	    			break;
	    		case 7 :
	    			switch($vegiArr[j]) {
	    			case "0" : 
	    				intoVegi += "피클선택안함 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "1" : 
	    				intoVegi += "피클적게 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "3" : 
	    				intoVegi += "피클많이 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			}
	    			break;
	    		case 8 :
	    			switch($vegiArr[j]) {
	    			case "0" : 
	    				intoVegi += "토마토선택안함 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "1" : 
	    				intoVegi += "토마토적게 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			case "3" : 
	    				intoVegi += "토마토많이 ";
	    				($('.bucketOption').eq(i).find('#vegi').html(intoVegi) ) ;
	    				break;
	    			}
	    			break;
	    		
	    		}
	    	} 
	    }
	    
	    /* 소스 순서 */
	    for(var j = 0; j<$sourceArr.length; j++) {
	    	if($sourceArr[j] == "1") {
		    	switch(j) {
		    	case 0 : 
		    		intoSource += "렌치 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 1 : 
		    		intoSource += "허니머스타드 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 2 : 
		    		intoSource += "스위트칠리 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 3 : 
		    		intoSource += "핫칠리 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 4 : 
		    		intoSource += "사우스웨스트 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 5 : 
		    		intoSource += "홀스래디쉬 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 6 : 
		    		intoSource += "사우전아일랜드 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 7 : 
		    		intoSource += "이탈리안드레싱 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 8 : 
		    		intoSource += "올리브오일 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 9 : 
		    		intoSource += "레드와인식초 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 10 : 
		    		intoSource += "스모크바비큐 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 11 : 
		    		intoSource += "소금 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 12 : 
		    		intoSource += "후추 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 13 : 
		    		intoSource += "머스타드 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	case 14 : 
		    		intoSource += "마요네즈 ";
		    		($('.bucketOption').eq(i).find('#source').html(intoSource) ) ; 
		    		break;
		    	}
	    	} 
	    }
	    
	    /* 사이드 순서 */
	    for(var j = 0; j<$sideArr.length; j++) {
	    	if($sideArr[j] == "1") {
		    	switch(j) {
		    	case 0 : 
		    		intoSide += "웨지포테이토 ";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	case 1 : 
		    		intoSide += "브로콜리체다수프 ";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	case 2 : 
		    		intoSide += "베이크포테이토수프 ";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	case 3 : 
		    		intoSide += "더블초코칩쿠키 ";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	case 4 : 
		    		intoSide += "초코칩쿠키 ";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	case 5 : 
		    		intoSide += "오트밀레이즌 ";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	case 6 : 
		    		intoSide += "라즈베리치즈케익 ";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	case 7 : 
		    		intoSide += "화이트초코마카다미아 ";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	case 8 : 
		    		intoSide += "칩스";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	case 9 : 
		    		intoSide += "탄산음료";
		    		($('.bucketOption').eq(i).find('#side').html(intoSide) ) ; 
		    		break;
		    	}
	    	} 
	    } //for using var 'j' ends
	    

	    
    } //for using var 'i' ends
  
    /* 아임포트 */
    $('#sbmOrder').click(function(){
    	var price = Number(0);
    	for(var i = 0; i<$('.cost').length; i++){
    		price += Number($('.cost').html());
    	};
    	console.log(price);
		var d = new Date();
		var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
		IMP.init('imp25889583');
		IMP.request_pay({
			pay_method : 'card',
			merchant_uid : $('#main').html()+date,			//거래ID - 유니크 주려고 날짜까지 넣음
			name : $('#main').html()+"외",					//결재명
			amount : price,									//결재 금액
			buyer_tel : sessionPhone
			
		},function(response){
			if(response.success){
				var msg = "결재가 완료되었습니다.";
				var info1 = "고유 ID : "+response.imp_uid;
				var info2 = "결재 금액 : "+response.paid_amount;
				var info3 = "카드 승인 번호 : "+response.apply_num;
				$("#paymentResult").html(msg+"<br>"+info1+"<br>"+info2+"<br>"+info3);
			} else {
				$("#patmentResult").html('에러 내용 : '+response.error_mgs+date);
			}
		});
	});

    
});




