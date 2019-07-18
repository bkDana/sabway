/**
 * 
 */
$(document).ready(function(){
	/* 아임포트 */
    
    $('#sbmOrder').click(function(){
    	console.log(totalCost);
		var d = new Date();
		var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
		IMP.init('imp25889583');
		IMP.request_pay({
			pay_method : 'card',
			merchant_uid : $('.hiddenInfo').eq(0).find('.hiddenMain').val()+$('.hiddenInfo').eq(0).find('.hiddenIsSalad').val()+date,				//거래ID - 유니크 주려고 날짜까지 넣음
			name : $('.hiddenInfo').eq(0).find('.hiddenMain').val()+$('.hiddenInfo').eq(0).find('.hiddenIsSalad').val()+" 외",						//결재명
			buyer_name : sessionId,
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
				
				$('input[name=cusoTotalCost]').val(totalCost);
		    	$('input[name=cusoPhone]').val(sessionPhone);
		    	var d = new Date();
				var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
		    	$('input[name=cusoOrderNo]').val($('.hiddenInfo').eq(0).find('.hiddenMain').val()+date);

				$("#insertOrder").click();
			} else {
				alert('결재가 취소되었습니다');
			}
		});
	});
});
