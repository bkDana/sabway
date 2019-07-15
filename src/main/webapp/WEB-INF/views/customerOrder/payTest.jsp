<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
	</div>
</section>


<script>
$(function() {

	$('.pay button').click(function() {
		
		event.preventDefault();
		
		var prdName = $('#prdName').html();
		var price = $('input[name=pay]').val();
		var name = $('input[name=name]').val();
		if(name==''){
			alert('필수입력항목이 누락되었습니다');
			$('input[name=name]').focus();
			return false;
		}
		var phone = $('input[name=phone1]').val()+'-'+$('input[name=phone2]').val()+'-'+$('input[name=phone3]').val();
		
		
		
		var method = $('input[name=payMethod]:checked').val();

		var d = new Date();
		var date = d.getFullYear() + '' + (d.getMonth() + 1) + '' + d.getDate() + '' + d.getHours() + '' + d.getMinutes() + '' + d.getSeconds();
		$('input[name=orderNo]').val(date);
		IMP.init('imp20013985');
		IMP.request_pay({
			merchant_uid : prdName+"_"+ date,
			name : prdName,
			amount : price, 
			buyer_name : name,
			buyer_tel : phone,
			buyer_email : email,
			buyer_addr : addr,
			buyer_postcode : post,
			pay_method : method,
			escrow: true,
			vbank_due : d.getFullYear() + '' + (d.getMonth() + 1) + '' + (d.getDate()+3)
		}, function(response) {
			if (response.success) {
				
				if(method=='vbank'){
					$('input[name=vbankName]').val(response.vbank_name);
					$('input[name=vbankNum]').val(response.vbank_num);
					$('input[name=vbankHolder]').val(response.vbank_holder);
					$('input[name=vbankDate]').val(response.vbank_date);
				}
				var form = $('#orderForm')[0];
				var data = new FormData(form);
				$.ajax({
					url : "/orderIng",
					type : "post",
					data : data,
					enctype : "multipart/form-data",
					processData: false,
		            contentType: false,
					success : function(data){
						if(data=='fail'){
							console.log('결제실패ㅐ패패패패패ㅐ패패ㅐ주문실패');
						}else{
							location.href=data;
						}
						
					},
					error : function(){
						console.log("실패");
					}
				});
			} else {
				alert('결제를 취소하셨습니다.');
				console.log("에러 : "+response.error_msg);
			}
		});	
		
	});
	
});
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />