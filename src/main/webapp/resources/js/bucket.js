

var getCookie = function(name) {
	  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
	  return value? value[2] : null;			//현재 쿠키가 3개 생성되어 있음, [2]번째가 커스텀 쿠키
	};

$(document).ready(function(){
	
	/* 나만의메뉴 추가된거 표시 */
	for(var i = 0; i<$('.hiddenChkMM').length; i++) {
		var bool = $('.hiddenChkMM').eq(i).val();
		if(bool == 'true') {
			$('.insertMyMenu').eq(i).html('추가 완료');
			$('.insertMyMenu').eq(i).css('color','grey').css('cursor','default').attr('disabled',true);
		} 
		if($('#sessionNick').val() == "") {
			console.log("비회원임");
			$('.insertMyMenu').eq(i).html('회원만<br>선택가능합니다');
			$('.insertMyMenu').eq(i).css('color','grey').css('cursor','default').attr('disabled',true);
		}

	}
	
	
	/* 가격 초기화 - 버킷 및 나만의 메뉴 */
	var totalCost = Number(0); // 결재할 때 쓰임
	console.log($('.cost').eq(0));
	for(var i = 0; i<$('.hiddenInfo').length; i++) {
		var bucCost = Number($('.hiddenCost').eq(i).val());
		var mainCost = Number($('.originalMainCost').eq(i).val());
		var discntRate = Number($('.hiddenDiscntRate').eq(i).val());
		var quantity = Number($('.hiddenQuantity').eq(i).val());
		var viewCost = Math.floor((bucCost - mainCost*discntRate*0.01)*0.01)*100*quantity;
		console.log(bucCost + " / " + mainCost + " / " + discntRate + " / " + quantity);
		console.log("viewCost : " + viewCost);
		$('.cost').eq(i).html(viewCost);
		totalCost += Number($('.cost').eq(i).html());
		console.log(i+"번째상품 가격" + $('.cost').eq(i).html());
	}
	
	/* 전체주문체크박스 */
	//초기화
	$('.addAll').attr('checked',true);
	for(var i = 0; i<$('.addOrder').length; i++) {
		$('.branch').eq(i).addClass('checked');
	}
	//로드 이후 눌렀을 때
	$('.addAll').change(function() {
		if($(this).is(":checked")) {
			for(var i = 0; i<$('.addOrder').length; i++) {
				$('.branch').eq(i).addClass('checked');
				$('.addOrder').prop('checked',true);
				totalCost += Number($('.cost').eq(i).html());
				console.log(totalCost);
			}
		}else {
			for(var i = 0; i<$('.addOrder').length; i++) {
				$('.branch').eq(i).removeClass('checked');
				$('.addOrder').prop('checked',false);
				totalCost = Number(0);
				console.log(totalCost);
			}
		}
	});
	
	/* 개별 주문체크박스 */
	//초기화
	for(var i = 0; i<$('.addOrder').length; i++) {
		$('.addOrder').prop('checked',true);
	}
	//로드이후 하나 뺐을때
	$('.addOrder').change(function() {
		var idx = $('.addOrder').index(this);
		if(!$(this).is(":checked")) {
			$('.branch').eq(idx).removeClass('checked');
			console.log($('.cost').eq(idx).html());
			totalCost -= Number($('.cost').eq(idx).html());
			console.log(totalCost);
		} else {
			$('.branch').eq(idx).addClass('checked');
			console.log($('.cost').eq(idx).html());
			totalCost += Number($('.cost').eq(idx).html());
			console.log(totalCost);
		}
	});
	
	
    var sessionPhone = $('#sessionPhone').val(); // 결재할 때 쓰임
    if(!$('#sessionPhone').val()) {
    	sessionPhone = "010-0000-0000";
    }
    var sessionNick = $('#sessionNick').val();
    if($('#sessionNick').val() == "") {
    	sessionNick = "비회원";
    }
    var cookieVal = getCookie('sabwayNoneCustomer');	// 헤더에서 쓰임.
    
    console.log(sessionPhone);
    console.log(cookieVal);
    console.log(sessionNick);


    /* 주문 상품 갯수만큼 반복 */
    for(var i=0; i<$('.hiddenInfo').length; i++) {
    	var topping = $('.hiddenInfo').eq(i).find('.hiddenTopping').val();
    	($('.bucketOption').eq(i).find('.topping').html(topping) ) ;
	    
	    var vegi = $('.hiddenInfo').eq(i).find('.hiddenVegi').val();
	    ($('.bucketOption').eq(i).find('.vegi').html(vegi) ) ;
	    
	    var source = $('.hiddenInfo').eq(i).find('.hiddenSource').val();
	    ($('.bucketOption').eq(i).find('.source').html(source) ) ; 
	    
	    var side = $('.hiddenInfo').eq(i).find('.hiddenSide').val();
	    ($('.bucketOption').eq(i).find('.side').html(side) ) ;
	    
	    var oven = $('.hiddenInfo').eq(i).find('.hiddenOvened').val();
	    var intoOven = "";
	    switch(oven) {
	    case 0 : 
	    	intoOven = "오븐 : O";
	    	$('.bucketOption').eq(i).find('.oven').html(intoOven);
	    	intoOven = "";
	    	break;
	    default :
	    	intoOven = "오븐 : X";
	    	$('.bucketOption').eq(i).find('.oven').html(intoOven);
	    	intoOven = "";
	    	break;
	    }
	    
	  
    } //for using var 'i' ends
  
    $('.deleteBucket').click(function(){
    	var listIdx = $('.deleteBucket').index(this);
    	var chkMM = $('.hiddenChkMM').eq(listIdx).val();
    	var delIdx = $('.hiddenBucIdx').eq(listIdx).val();
    	var deleteMenu = confirm("선택하신 메뉴를 삭제하시겠습니까?");
    	
    	if(deleteMenu) {
    		if(chkMM == 'true') { // 나만의메뉴에 추가된 경우 - 버킷리스트에서만 숨기고 데이터는 지우지않음(나만의메뉴에서 써야함)
    			$.ajax({
        	    	url : "/hideFromBucketList.do",
        	        type : 'get',
        	        data : {delIdx:delIdx},
        	        success : function(){
        	            $('.deleteBucket').eq(listIdx).parent().parent().remove();
        	        }
        	    });
        	} else { // 나만의 메뉴에 없는경우 - 해당 항목 삭제
        		$.ajax({
        	    	url : "/tempOrderDelete.do",
        	        type : 'get',
        	        data : {delIdx:delIdx},
        	        success : function(){
        	            $('.deleteBucket').eq(listIdx).parent().parent().remove();
        	        }
        	    });
        	}
    	}
    });
    
    $('.deleteMyMenu').click(function(){
    	var listIdx = $('.deleteMyMenu').index(this);
    	var delIdx = $('.hiddenBucIdx').eq(listIdx).val();
    	console.log(listIdx);
    	console.log(delIdx);
    	var deleteMenu = confirm("나만의 메뉴를 삭제하시겠습니까?");
    	if(deleteMenu) {
    		$.ajax({
    	    	url : "/tempOrderDelete.do",
    	        type : 'get',
    	        data : {delIdx:delIdx},
    	        success : function(){
    	        	alert("나만의메뉴가 삭제되었습니다");
    	            $('.deleteMyMenu').eq(listIdx).parent().parent().remove();
    	        }
    	    });

    	}
    });
    $('.insertMyMenu').click(function(){
    	var itemIndex = $('.insertMyMenu').index(this);
    	var createMenu = confirm("선택하신 메뉴를 나만의 메뉴로 만드시겠습니까?");
    	if(createMenu) {
    		var form = $(".myMenuInsert")[itemIndex];
    		var data = new FormData(form);
    		console.log(data);
            $.ajax({
            	url : "/insertMyMenu.do",
                type : 'post',
                data : data,
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                cache: false,
                dataType : 'text',
                success : function(){
                    alert("나만의 메뉴 추가 완료되었습니다. '마이페이지 - 나만의 메뉴'에서 확인");
                    $('.insertMyMenu').eq(itemIndex).html('추가 완료');
                    $('.insertMyMenu').eq(itemIndex).css('color','grey').css('cursor','default').attr('disabled',true);
                },
                error : function() {
                	alert("나만의 메뉴 추가 실패");
                }
            });
    	}
    });
    
    /* 아임포트 */
    
    $('#sbmOrder').click(function(){
    	console.log($('.checked'));
    	var check = false;
    	for(var i = 0; i<$('.checked').length; i++) {
    		console.log($('.checked').eq(i).html());
    		if($('.checked').eq(i).html() == $('.checked').eq(0).html()) {
    			check = true;
    		} else {
    			alert("같은 지점에서만 주문 가능합니다");
    			check = false;
    		}
    	}
    	if(check) {
    		$('input[name=cusoBranchName]').val($('.checked').html());


    		var d = new Date();
    		var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
    		IMP.init('imp25889583');
    		IMP.request_pay({
    			pay_method : 'card',
    			merchant_uid : date,				//거래ID - 유니크 주려고 날짜까지 넣음
    			name : $('.hiddenInfo').eq(0).find('.hiddenMain').val()+" 외",						//결재명
    			buyer_name : sessionNick,
    			buyer_email : '',
    			amount : totalCost,									//결재 금액
    			buyer_tel : sessionPhone
    			
    		},function(response){
    			if(response.success){
    				var msg = "결재가 완료되었습니다.";
    				var info1 = "고유 ID : "+response.imp_uid;
    				var info2 = "결재 금액 : "+response.paid_amount;
    				var info3 = "카드 승인 번호 : "+response.apply_num;
    				console.log(msg+"<br>"+info1+"<br>"+info2+"<br>"+info3);
    	    		$('input[name=cusoCallBy]').val(sessionNick);
    	    		$('input[name=cusoTotalCost]').val(totalCost);
    	        	$('input[name=cusoPhone]').val(sessionPhone);		    	
    	        	$('input[name=cusoOrderNo]').val(date);
    	    		$("#insertOrder").submit();
    			} else {
    				alert('결재가 취소되었습니다');
    			}
    		});
//    		var d = new Date();
//    		var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
//    		$('input[name=cusoCallBy]').val(sessionNick);
//    		$('input[name=cusoTotalCost]').val(totalCost);
//        	$('input[name=cusoPhone]').val(sessionPhone);		    	
//        	$('input[name=cusoOrderNo]').val(date);
//    		$("#insertOrder").submit();
    	}

	});
    
    
    $('.orderMyMenu').click(function(){
    	var i = $('.orderMyMenu').index(this);
    	$('.sCost').val($('.hiddenCost').eq(i).val());
    	$('[name=cusoTotalCost]').val($('.hiddenCost').eq(i).val());
    	$('.customerIdx').val($('.hiddenBucCustomerIdx').eq(i).val());
    	$('.bread').val($('.hiddenBread').eq(i).val());
    	$('.main').val($('.hiddenMain').eq(i).val());
    	$('.vegi').val($('.hiddenVegi').eq(i).val());
    	$('.cheese').val($('.hiddencheese').eq(i).val());
    	$('.topping').val($('.hiddenTopping').eq(i).val());
    	$('.source').val($('.hiddenSource').eq(i).val());
    	$('.isSalad').val($('.hiddenIsSalad').eq(i).val());
    	$('.isOvened').val($('.hiddenIsOvened').eq(i).val());
    	$('.set').val($('.hiddenSet').eq(i).val());
    	$('.side').val($('.hiddenSide').eq(i).val());
    	$('.kcal').val($('.hiddenKcal').eq(i).val());
    	$('.quantity').val($('.hiddenQuantity').eq(i).val());

    	var popupX = (window.screen.width / 2) - (200 / 2);
    	var popupY= (window.screen.height / 2) - (300 / 2);
    	var option="width=600px, height=500px, top=-100px, left='+ popupX + ', top='+ popupY"
    	cldwin = window.open("loadSearchStorePopup.do","searchChild",option);	
    	
    	cldwin.focus();
    });
    

});


