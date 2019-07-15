
$(document).ready(function() {
	
	var typeStatus = 0;
});
//// 정엄이가 쓴거
//메인 재료 선택된 거에 따라서 추천 소스 보여주기

	var cost = Number(0);
	var kcal = Number(0);
	var breadCheck=0;
	function delay(gap){ /* gap is in millisecs */ 
	  var then,now; 
	  then=new Date().getTime(); 
	  now=then; 
	  while((now-then)<gap){ 
	    now=new Date().getTime();  // 현재시간을 읽어 함수를 불러들인 시간과의 차를 이용하여 처리 
	  } 
	} 
	$('.select-many').click(function(){
		if($(this).hasClass("selects")){
			$(this).bind("mouseleave",function(){
				$(this).find('img').css("display","block");
				$(this).find('p').css("display","none");
				$(this).find('button').css("display","none");
				$(this).css("background-color","#fff");
			});
		}else{
			$(this).unbind("mouseleave");
		}
			
		$(this).toggleClass("selects");
	});
	$('.img-box').mouseover(function(){
		if($(this).hasClass("selects")===false){
			$(this).find('img').css("display","none");
			$(this).find('p').css("display","block");
			$(this).find('button').css("display","block");
			$(this).css("background-color","#009223");
		}
	});
	leavefn = $('.img-box').mouseleave(function(){
		if($(this).hasClass("selects")===false){
			$(this).find('img').css("display","block");
			$(this).find('p').css("display","none");
			$(this).find('button').css("display","none");
			$(this).css("background-color","#fff");
		}
	});
	$('.bread').find('button').mouseover(function(){
		$(this).css("color","#009223");
	});
	$('.bread').find('button').mouseleave(function(event){
		$(this).css("color","#fff");
	});
	$('.type').click(function(){
		var typeIdx = $('.type').index(this)+1;
		if(typeIdx==1){
			$('.next-step').css("display","none");
			$('.bread').css("display","block");
			$('input[name=bucIsSalad]').val("샌드위치");
			$(".step").eq(1).trigger("click");
		}else if(typeIdx==2){
			$('input[name=bucIsSalad]').val("샐러드");
			$('input[name=bucBread]').val("선택안함");
			$(".step").eq(2).trigger("click");
		}
	});
	$('.bread-amount').click(function(){
		$(this).addClass('selected');
		var breadIdx = $(this).parent().prev().text();
		var amountIdx = -1;
		if(($('.bread-amount').index(this)+1)%2 == 1) {
			amountIdx = 15;
			kcal += Number($(this).parent().parent().find('input').eq(0).val());
			breadCheck=1;
		} else {
			amountIdx = 30;
			kcal +=  Number($(this).parent().parent().find('input').eq(0).val())*2;
			breadCheck=2;
		}
		var str = breadIdx+','+amountIdx;
		
		$('input[name=bucBread]').val(str);
		console.log(str);
		$(".step").eq(2).trigger("click");
	});
	$('.main').click(function(){
		var str = $(this).find('p').text();
		if(breadCheck==1){
			cost +=  Number($(this).find('input').eq(1).val());
			kcal +=  Number($(this).find('input').eq(0).val());
		}else if(breadCheck==2){
			cost +=  Number($(this).find('input').eq(2).val());
			kcal +=  Number($(this).find('input').eq(0).val())*2;
		}
		$('input[name=bucMain]').val(str);
		$(".step").eq(3).trigger("click");
	});
	$('.cheeze').click(function(){
		var str = $(this).find('p').text();
		if(breadCheck==1){
			kcal +=  Number($(this).find('input').eq(0).val());
		}else if(breadCheck==2){
			kcal +=  Number($(this).find('input').eq(0).val())*2;
		}
		$('input[name=bucCheese]').val(str);
		$(".step").eq(4).trigger("click");
	});
	$('.topping-check').click(function(){
		var str = "";
		for(var i = 1; i<$('.topping').length;i++){
			if($('.topping').eq(i).hasClass("selects")){
				str += '1';
				if(breadCheck==1){
					cost += Number($('.topping').eq(i).find('input').eq(1).val());
					kcal += Number($('.topping').eq(i).find('input').eq(0).val());
				}else if(breadCheck==2){
					cost += Number($('.topping').eq(i).find('input').eq(2).val());
					kcal += Number($('.topping').eq(i).find('input').eq(0).val())*2;
				}
			}else{
				str += '0'; 
			}
		}
		$('input[name=bucTopping]').val(str);
		console.log($('input[name=bucTopping]').val());
		$(".step").eq(5).trigger("click");
	});
	$('.topping.img-box.select-none').click(function(){
		for(var i = 1; i<$('.topping').length;i++){
			if($('.topping').eq(i).hasClass("selects")){
				$('.topping').eq(i).removeClass("selects");
				$('.topping').eq(i).find('img').css("display","block");
				$('.topping').eq(i).find('p').css("display","none");
				$('.topping').eq(i).find('button').css("display","none");
				$('.topping').eq(i).css("background-color","#fff");
				$('.topping').eq(i).bind("mouseleave",function(){
					$(this).find('img').css("display","block");
					$(this).find('p').css("display","none");
					$(this).find('button').css("display","none");
					$(this).css("background-color","#fff");
				});
			}
		}
	});
	$('.oven').click(function(){
		var idx = $('.oven').index(this);
		$('input[name=bucIsOvened]').val(idx);
		//0이 오븐하는거임
		$(".step").eq(6).trigger("click");
	});
	
	$('.vegi').click(function(){
		if($(this).hasClass("selects")){
			$(this).bind("mouseleave",function(){
				$(this).find('img').css("display","block");
				$(this).find('p').css("display","none");
				$(this).find('button').css("display","none");
				$(this).css("background-color","#fff");
			});
		}else{
			$(this).unbind("mouseleave");
		}
		$(this).toggleClass("selects");
	})
	$('.vegi-amount').click(function(){
		if($(this).parent().parent().hasClass("selects")===false){
			$(this).parent().parent().addClass("selects")
		}
		var idx = $(this).parent().find("button").index(this);
		for(var i = 0; i<4; i++){
			if(i!=idx){
				$(this).parent().find("button").eq(i).removeClass("select-vegi");
			}else{
				$(this).parent().find("button").eq(i).addClass("select-vegi");
			}
		}
		event.stopPropagation();
	});
	
	$('.vegi-check').click(function(){
		var str = "";
		for(var i = 0; i<$('.vegi').length;i++){
			if($('.vegi').eq(i).hasClass("selects")){
				for(var k=0; k<4; k++){
					if($('.vegi').eq(i).find("button").eq(k).hasClass("select-vegi")){
						str += k;
						kcal += Number($('.vegi').eq(i).find("input").val());
					}
				}
			}else{
				str += '2';
			}
		}
		$('input[name=bucVegi]').val(str);
		console.log($('input[name=bucVegi]').val());
		$(".step").eq(7).trigger("click");
	});
	
	$('.source.img-box.select-none').click(function(){
		for(var i = 1; i<$('.source').length;i++){
			if($('.source').eq(i).hasClass("selects")){
				$('.source').eq(i).removeClass("selects");
				$('.source').eq(i).find('img').css("display","block");
				$('.source').eq(i).find('p').css("display","none");
				$('.source').eq(i).find('button').css("display","none");
				$('.source').eq(i).css("background-color","#fff");
				$('.source').eq(i).bind("mouseleave",function(){
					$(this).find('img').css("display","block");
					$(this).find('p').css("display","none");
					$(this).find('button').css("display","none");
					$(this).css("background-color","#fff");
				});
			}
		}
	});
	
	$('.source-check').click(function(){
		var str = "";
		for(var i = 1; i<$('.source').length;i++){
			if($('.source').eq(i).hasClass("selects")){
				str += '1';
				if(breadCheck==1){
					kcal += Number($('.source').eq(i).find('input').eq(0).val());
				}else if(breadCheck==2){
					kcal += Number($('.source').eq(i).find('input').eq(0).val())*2;
				}
			}else{
				str += '0';
			}
		}
		$('input[name=bucSource]').val(str);
		console.log($('input[name=bucSource]').val());
		$(".step").eq(8).trigger("click");
	});
	
	$('.order-check').click(function(){
		var str='';
		for(var i = 1; i<$('.sidemenu').length;i++){
			if($('.sidemenu').eq(i).hasClass("selects")){
				str += "1";
				cost += Number($('.sidemenu').eq(i).find('input').eq(1).val());
				kcal += Number($('.sidemenu').eq(i).find('input').eq(0).val());
			}else{
				str += '0';
			}
		}
		console.log(str);
		$('input[name=bucSide]').val(str);
		$('input[name=bucCost]').val(cost);
		$('input[name=bucKcal]').val(kcal);
		$('input[name=bucQuantity]').val('1');
//		serialize()
		var form = $("form[name=feedbackform]")[0];
//		console.log(queryString);
		var data = new FormData(form);
		console.log(data);
        $.ajax({
        	url : "/tempOrder.do",
            type : 'post',
            data : data,
            enctype: 'multipart/form-data',
            processData: false,
            contentType: false,
            cache: false,
            dataType : 'json',
//            error: function(xhr, status, error){
//                alert("error");
//            },
            success : function(json){
                alert("임시저장 성공");
                var orderCheckStr = "<tr>";
        		for(var i=0; i<10; i++){
        			orderCheckStr += "<td>"+$('.orderInput').eq(i).val()+"</td>";
        		}
        		orderCheckStr += "</tr>";
        		console.log(orderCheckStr);
        		$('.comm-tbl type2').append(orderCheckStr);
            },
        });
	});
	$('.sidemenu.img-box.select-none').click(function(){
		for(var i = 1; i<$('.sidemenu').length;i++){
			if($('.sidemenu').eq(i).hasClass("selects")){
				$('.sidemenu').eq(i).removeClass("selects");
				$('.sidemenu').eq(i).find('img').css("display","block");
				$('.sidemenu').eq(i).find('p').css("display","none");
				$('.sidemenu').eq(i).find('button').css("display","none");
				$('.sidemenu').eq(i).css("background-color","#fff");
				$('.sidemenu').eq(i).bind("mouseleave",function(){
					$(this).find('img').css("display","block");
					$(this).find('p').css("display","none");
					$(this).find('button').css("display","none");
					$(this).css("background-color","#fff");
				});
			}
		}
	});
	////추가
//	jQuery.fn.serializeObject = function() {
//
//        var obj = null;
//        try {
//            // this[0].tagName이 form tag일 경우
//            if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
//            var arr = this.serializeArray();
//                if(arr){
//                    obj = {};    
//                    jQuery.each(arr, function() {
//                        // obj의 key값은 arr의 name, obj의 value는 value값
//                        obj[this.name] = this.value;
//                    });
//                }
//            }
//        }catch(e) {
//
//            alert(e.message);
//
//        }
//            return obj;
//
//        };
        ///
	$('.set').click(function(){
		var str = $(this).find('p').text();
		cost += Number($('.set').eq(i).find('input').eq(1).val());
		kcal += Number($('.set').eq(i).find('input').eq(0).val());
		$('input[name=bucSet]').val(str);
		$(".step").eq(9).trigger("click");
	});
	
	$('.sidemenu').click(function() {
		$('#itemStatus').html($('input[name=bucMain]').val() + " " + $('input[name=bucIsSalad]').val() + " " + $('input[name=bucSet]').val());
	});
	
	$('#bucketArea').click(function() {
		var d = new Date();
		var date = d.getFullYear()+''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
		$('input[name=bucCusoIdx]').val(date);
		$('#feedbackform').attr('action','/loadBucket.do'); 
		$('#feedbackform').attr('method','post');
		$('#feedbackform').submit();
	});

	


