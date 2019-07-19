
$(document).ready(function() {
	$(".step").eq(0).trigger("click");
//	var innerHtml = getCookie("cookieHtml");
//	console.log(innerHtml);
//	$('.show-order').eq(addStatus).html(innerHtml);
	
	var typeStatus = 0;
});
//// 정엄이가 쓴거
//메인 재료 선택된 거에 따라서 추천 소스 보여주기
	var canAdd = 0;
	var totalCost = 0;
	var addStatus = 0;
	var cost = Number(0);
	var kcal = Number(0);
	var oneStatus = 0;
	var breadCheck=0;
	var typeIdx = 0;
	var canMoveBucket = 0;
	
	function delay(gap){ /* gap is in millisecs */ 
	  var then,now; 
	  then=new Date().getTime(); 
	  now=then; 
	  while((now-then)<gap){ 
	    now=new Date().getTime();  // 현재시간을 읽어 함수를 불러들인 시간과의 차를 이용하여 처리 
	  } 
	} 
	
	$('.prev-btn').click(function(){
		var stepIdx = $('.prev-btn').index(this);
		if((stepIdx)==1 && typeIdx==2){
			$(".step").eq(0).trigger("click");
		}else{
			$(".step").eq(stepIdx).trigger("click");			
		}
	});
	$('.next-btn').click(function(){
		var stepIdx = $('.next-btn').index(this)+1;
		if(!$('.orderInput').eq(stepIdx-1).val() && !$(this).hasClass("many")){
			alert("단계별로 선택해주세요");
			return;
		}
		if((stepIdx-1)==0 && typeIdx==2){
			$(".step").eq(2).trigger("click");
		}else{
			$(".step").eq(stepIdx).trigger("click");			
		}
	});
	
	$('.select-many').click(function(){
		if($(this).hasClass("selected")){
			$(this).bind("mouseleave",function(){
				$(this).find('img').css("display","block");
				$(this).find('p').css("display","none");
				if(breadCheck==1){
					$(this).find('pre').eq(0).css("display","block");				
				}else{
					$(this).find('pre').eq(1).css("display","block");
				}
				$(this).find('button').css("display","none");
				$(this).css("background-color","#fff");
			});
		}else{
			$(this).unbind("mouseleave");
		}
			
		$(this).toggleClass("selected");
	});
	$('.img-box').mouseover(function(){
		if($(this).hasClass("selected")===false){
			$(this).find('img').css("display","none");
			$(this).find('p').css("display","block");
			if(breadCheck==1){
				$(this).find('pre').eq(0).css("display","block");				
			}else{
				$(this).find('pre').eq(1).css("display","block");
			}
			$(this).find('button').css("display","block");
			$(this).css("background-color","#009223");
		}
	});
	leavefn = $('.img-box').mouseleave(function(){
		if($(this).hasClass("selected")===false){
			$(this).find('img').css("display","block");
			$(this).find('p').css("display","none");
			$(this).find('pre').eq(0).css("display","none");
			$(this).find('pre').eq(1).css("display","none");
			$(this).find('button').css("display","none");
			$(this).css("background-color","#fff");
		}
	});
	$('.bread').find('button').mouseover(function(){
		$(this).css("color","#009223");
	});
	btnleavefn = $('.bread').find('button').mouseleave(function(){
		$(this).css("color","#fff");
	});
	
	$('.vegi').find('button').mouseover(function(){
		$(this).css("color","#009223");
	});
	$('.vegi').find('button').mouseleave(function(){
		$(this).css("color","#fff");
	});
	clearAllfn = function clearAllfn(current){
		for(var all=current;all<$('.img-box').length;all++){
			if($('.img-box').eq(all).hasClass("selected")){
				$('.img-box').eq(all).removeClass("selected");
				$('.img-box').eq(all).find('img').css("display","block");
				$('.img-box').eq(all).find('p').css("display","none");
				$('.img-box').eq(all).find('button').css("display","none");
				$('.img-box').eq(all).find('pre').eq(0).css("display","none");
				$('.img-box').eq(all).find('pre').eq(1).css("display","none");
				$('.img-box').eq(all).css("background-color","#fff");
				$('.img-box').eq(all).bind("mouseleave",function(){
					if($(this).hasClass("selected")===false){
						$(this).find('img').css("display","block");
						$(this).find('p').css("display","none");
						$(this).find('pre').eq(0).css("display","none");
						$(this).find('pre').eq(1).css("display","none");
						$(this).find('button').css("display","none");
						$(this).css("background-color","#fff");
					}
				});
			}
			if($('.img-box').eq(all).hasClass("vegi")){
				$('.img-box').eq(all).find("button").eq(0).removeClass("select-vegi");
				$('.img-box').eq(all).find("button").eq(1).removeClass("select-vegi");
				$('.img-box').eq(all).find("button").eq(2).addClass("select-vegi");
				$('.img-box').eq(all).find("button").eq(2).css("color","#009223");
				$('.img-box').eq(all).find("button").eq(3).removeClass("select-vegi");
			}
		}
	}
	$('.type').click(function(){
		if($(this).hasClass("selected")){
			return;
		}
		if($('.show-order').eq(addStatus).find('.show-order-context').length==0){
			var showCostStr = "<td class='show-order-context'>"+cost+" 원</td>";
			$('.show-order').eq(addStatus).append(showCostStr);
		}
		
		clearAllfn(2);
		typeIdx = $('.type').index(this)+1;
		if(typeIdx==1){
			for(var mv=0; mv<$('.main').length;mv++){
				$('.main').eq(mv).css("display","block");
			}
			for(var mv=0; mv<$('.salad').length;mv++){
				$('.salad').eq(mv).css("display","none");
			}
			if($(this).hasClass("selected")){
				$(this).bind("mouseleave",function(){
					if($(this).hasClass("selected")===false){
						$(this).find('img').css("display","block");
						$(this).find('p').css("display","none");
						$(this).find('pre').eq(0).css("display","none");
						$(this).find('pre').eq(1).css("display","none");
						$(this).find('button').css("display","none");
						$(this).css("background-color","#fff");
					}
					
				});
			}else{
				$(this).unbind("mouseleave");
				if($('.type').eq(1).hasClass("selected")){
					$('.type').eq(1).removeClass("selected");
					$('.type').eq(1).find('img').css("display","block");
					$('.type').eq(1).find('p').css("display","none");
					$('.type').eq(1).find('button').css("display","none");
					$('.type').eq(1).css("background-color","#fff");
					$('.type').eq(1).bind("mouseleave",function(){
						if($(this).hasClass("selected")===false){
							$(this).find('img').css("display","block");
							$(this).find('p').css("display","none");
							$(this).find('pre').eq(0).css("display","none");
							$(this).find('pre').eq(1).css("display","none");
							$(this).find('button').css("display","none");
							$(this).css("background-color","#fff");
						}
						
					});
				}
			}
			$(this).toggleClass("selected");
			$('.bread').css("display","block");
			if($('.show-order').eq(addStatus).find('.show-order-type').length==0){
				var showOrderStr = "<td class='show-order-type'>샌드위치</button>";
				$('.show-order').eq(addStatus).append(showOrderStr);
			}else{
				$('.show-order').eq(addStatus).find('.show-order-type').eq(0).text("샌드위치");
			}
			
			
			$('input[name=bucIsSalad]').val("샌드위치");
			$('.salad').css("display","none");
		}else if(typeIdx==2){
			for(var mv=0; mv<$('.salad').length;mv++){
				$('.salad').eq(mv).css("display","block");
			}
			for(var mv=0; mv<$('.main').length;mv++){
				$('.main').eq(mv).css("display","none");
			}
			if($(this).hasClass("selected")){
				$(this).bind("mouseleave",function(){
					if($(this).hasClass("selected")===false){
						$(this).find('img').css("display","block");
						$(this).find('p').css("display","none");
						$(this).find('pre').eq(0).css("display","none");
						$(this).find('pre').eq(1).css("display","none");
						$(this).find('button').css("display","none");
						$(this).css("background-color","#fff");
					}
					
				});
			}else{
				$(this).unbind("mouseleave");
				if($('.type').eq(0).hasClass("selected")){
					$('.type').eq(0).removeClass("selected");
					$('.type').eq(0).find('img').css("display","block");
					$('.type').eq(0).find('p').css("display","none");
					$('.type').eq(0).find('button').css("display","none");
					$('.type').eq(0).css("background-color","#fff");
					$('.type').eq(0).bind("mouseleave",function(){
						if($(this).hasClass("selected")===false){
							$(this).find('img').css("display","block");
							$(this).find('p').css("display","none");
							$(this).find('pre').eq(0).css("display","none");
							$(this).find('pre').eq(1).css("display","none");
							$(this).find('button').css("display","none");
							$(this).css("background-color","#fff");
						}
						
					});
				}
			}
			
			if($('.show-order').eq(addStatus).find('.show-order-type').length==0){
				var showOrderStr = "<td class='show-order-type'>샐러드</td><td class='show-order-bread'>선택안함</td>";
				$('.show-order').eq(addStatus).append(showOrderStr);
			}else{
				$('.show-order').eq(addStatus).find('.show-order-type').eq(0).text("샐러드");
			}
			
			$(this).toggleClass("selected");
			$('input[name=bucIsSalad]').val("샐러드");
			$('input[name=bucBread]').val("선택안함");
			$('.salad').css("display","block");
			$('.main').css("display","none");
			$('.bread').css("display","none");
		}
	});
	
	////////////////////////////////////////////////////////////////////////////////////////////////////
	$('.bread-amount').click(function(){
		if($(this).hasClass("select-bread")){
			return;
		}
		var breadParent = $(this).parent().parent();
		var pareIdx = $('.bread').index(breadParent);
		var first = 2+$('.bread').length;
		clearAllfn(first);
		
		for(var t=0; t<$('.bread-amount').length; t++){
			if($('.bread-amount').eq(t).hasClass("select-bread")){
				if((t+1)%2 == 1) {
					kcal -= Number($('.bread-amount').eq(t).parent().parent().find('input').eq(0).val())*1;
				} else {
					kcal -=  Number($('.bread-amount').eq(t).parent().parent().find('input').eq(0).val())*2;
				}
			}
			
		}
		for(var i=0;i<$('.bread').length;i++){
			$('.bread').eq(pareIdx).unbind("mouseleave");
			$('.bread').eq(pareIdx).addClass("selected");
			if(($('.bread-amount').index(this)+1)%2 == 1) {
				$('.bread').eq(pareIdx).find("button").eq(1).removeClass("select-bread");
				$('.bread').eq(pareIdx).find("button").eq(1).css("color","#fff");
				$('.bread').eq(pareIdx).find("button").eq(1).bind("mouseleave",function(){
					$(this).css("color","#fff");
				});
			} else {
				$('.bread').eq(pareIdx).find("button").eq(0).removeClass("select-bread");
				$('.bread').eq(pareIdx).find("button").eq(0).css("color","#fff");
				$('.bread').eq(pareIdx).find("button").eq(0).bind("mouseleave",function(){
					$(this).css("color","#fff");
				});
			}
			//같은 img-box안에 버튼 눌럿을때 바인드 조건 걸어주기
			$(this).addClass("select-bread");
			$(this).unbind("mouseleave");
			if($('.bread').eq(i).hasClass("selected") && i!=pareIdx){
				$('.bread').eq(i).removeClass("selected");
				$('.bread').eq(i).find("button").eq(0).removeClass("select-bread");
				$('.bread').eq(i).find("button").eq(1).removeClass("select-bread");
				$('.bread').eq(i).find('img').css("display","block");
				$('.bread').eq(i).find('p').css("display","none");
				$('.bread').eq(i).find('button').css("display","none");
				$('.bread').eq(i).css("background-color","#fff");
				$('.bread').eq(i).bind("mouseleave",function(){
					if($(this).hasClass("selected")===false){
						$(this).find('img').css("display","block");
						$(this).find('p').css("display","none");
						$(this).find('pre').eq(0).css("display","none");
						$(this).find('pre').eq(1).css("display","none");
						$(this).find('button').css("display","none");
						$(this).css("background-color","#fff");
					}
					
				});
				$('.bread').eq(i).find("button").eq(0).bind("mouseleave",function(){
					$(this).css("color","#fff");
				});
				$('.bread').eq(i).find("button").eq(1).bind("mouseleave",function(){
					$(this).css("color","#fff");
				});
			}
		}
		var breadIdx = $(this).parent().prev().text();
		var amountIdx = -1;
		if(($('.bread-amount').index(this)+1)%2 == 1) {
			amountIdx = 15;
			kcal += Number($(this).parent().parent().find('input').eq(0).val())*1;
			breadCheck=1;
			console.log("15짜리 찍엇어");
		} else {
			amountIdx = 30;
			kcal +=  Number($(this).parent().parent().find('input').eq(0).val())*2;
			breadCheck=2;
			console.log("30짜리 찍엇어");
		}
		
		
		if($('.show-order').eq(addStatus).find('.show-order-bread').length==0){
			var showOrderStr = "<td class='show-order-bread'>"+breadIdx+"/"+amountIdx+"cm</td>";
			$('.show-order').eq(addStatus).append(showOrderStr);
		}else{
			$('.show-order').eq(addStatus).find('.show-order-bread').eq(0).text(breadIdx+"/"+amountIdx+"cm");
		}
		var str = breadIdx+','+amountIdx;
		console.log(cost);
		console.log(kcal);
		$('input[name=bucBread]').val(str);
		console.log(str);
	});
	
	$('.main').click(function(){
		if($(this).hasClass("selected")){
			return;
		}
		var str = $(this).find('p').text();
		var mainIdx = $('.main').index(this);
		var first = 2+$('.bread').length+$('.main').length+$('.salad').length;
		clearAllfn(first);
		for(var i=0; i<$('.main').length;i++){
			if(i!=mainIdx && $('.main').eq(i).hasClass("selected")){
				$('.main').eq(i).removeClass("selected");
				$('.main').eq(i).find('img').css("display","block");
				$('.main').eq(i).find('p').css("display","none");
				$('.main').eq(i).find('pre').eq(0).css("display","none");
				$('.main').eq(i).find('pre').eq(1).css("display","none");
				$('.main').eq(i).find('button').css("display","none");
				$('.main').eq(i).css("background-color","#fff");
			
				$('.main').eq(i).bind("mouseleave",function(){
					if($(this).hasClass("selected")===false){
						$(this).find('img').css("display","block");
						$(this).find('p').css("display","none");
						$(this).find('pre').eq(0).css("display","none");
						$(this).find('pre').eq(1).css("display","none");
						$(this).find('button').css("display","none");
						$(this).css("background-color","#fff");
					}
					
				});
			
				if(breadCheck==1){
					cost -=  Number($('.main').eq(i).find('input').eq(1).val())*1;
					kcal -=  Number($('.main').eq(i).find('input').eq(0).val())*1;
				}else if(breadCheck==2){
					cost -=  Number($('.main').eq(i).find('input').eq(2).val())*1;
					kcal -=  Number($('.main').eq(i).find('input').eq(0).val())*2;
				}
			}
		}
		
		
		
		if(breadCheck==1){
			cost +=  Number($(this).find('input').eq(1).val())*1;
			kcal +=  Number($(this).find('input').eq(0).val())*1;
		}else if(breadCheck==2){
			cost +=  Number($(this).find('input').eq(2).val())*1;
			kcal +=  Number($(this).find('input').eq(0).val())*2;
		}
		console.log(cost);
		console.log(kcal);
		$(this).unbind("mouseleave");
		$(this).addClass("selected");
		$('#recom-sauce').val($(this).find('input').eq(3).val());
		$('#recom-main').val(str);
		$('input[name=bucMain]').val(str);
		if($('.show-order').eq(addStatus).find('.show-order-main').length==0){
			var showOrderStr = "<td class='show-order-main'>"+str+"</td>";
			$('.show-order').eq(addStatus).append(showOrderStr);
		}else{
			$('.show-order').eq(addStatus).find('.show-order-main').eq(0).text(str);
		}
		
		$('.show-order-context').eq(0).text(cost+" 원");
	});
	
	$('.salad').click(function(){
		if($(this).hasClass("selected")){
			return;
		}
		var str = $(this).find('p').text();
		var mainIdx = $('.salad').index(this);
		var first = 2+$('.bread').length+$('.main').length+$('.salad').length;
		clearAllfn(first);
		for(var i=0; i<$('.salad').length;i++){
			if(i!=mainIdx && $('.salad').eq(i).hasClass("selected")){
				$('.salad').eq(i).removeClass("selected");
				$('.salad').eq(i).find('img').css("display","block");
				$('.salad').eq(i).find('p').css("display","none");
				$('.salad').eq(i).find('pre').eq(0).css("display","none");	
				$('.salad').eq(i).find('button').css("display","none");
				$('.salad').eq(i).css("background-color","#fff");
			
				$('.salad').eq(i).bind("mouseleave",function(){
					if($(this).hasClass("selected")===false){
						$(this).find('img').css("display","block");
						$(this).find('p').css("display","none");
						$(this).find('pre').eq(0).css("display","none");
						$(this).find('button').css("display","none");
						$(this).css("background-color","#fff");
					}
					
				});
			
				cost -=  Number($('.salad').eq(i).find('input').eq(1).val())*1;
				kcal -=  Number($('.salad').eq(i).find('input').eq(0).val())*1;
				
			}
		}
		
		
		cost +=  Number($(this).find('input').eq(1).val())*1;
		kcal +=  Number($(this).find('input').eq(0).val())*1;
	
		console.log(cost);
		console.log(kcal);
		$(this).unbind("mouseleave");
		$(this).addClass("selected");
		$('#recom-sauce').val($(this).find('input').eq(3).val());
		$('#recom-main').val(str);
		$('input[name=bucMain]').val(str);
		
		if($('.show-order').eq(addStatus).find('.show-order-main').length==0){
			var showOrderStr = "<td class='btn-style4 show-order-main'>"+str+"</td>";
			$('.show-order').eq(addStatus).append(showOrderStr);
		}else{
			$('.show-order').eq(addStatus).find('.show-order-main').eq(0).text(str);
		}
		
		$('.show-order-context').eq(0).text(cost+" 원");
//		$('.show-order').eq(addStatus).find('.show-order-context').eq(0).remove();
//		var showCostStr = "<td class='show-order-context'>"+cost+" 원</td>";
//		$('.show-order').eq(addStatus).prepend(showCostStr);
	});
	
	$('.cheese').click(function(){
		if($(this).hasClass("selected")){
			return;
		}
		var str = $(this).find('p').text();
		var mainIdx = $('.cheese').index(this);
		var first = 2+$('.bread').length+$('.main').length+$('.salad').length+$('.cheese').length;
		clearAllfn(first);
		for(var i=0; i<$('.cheese').length;i++){
			if(i!=mainIdx && $('.cheese').eq(i).hasClass("selected")){
				$('.cheese').eq(i).removeClass("selected");
				$('.cheese').eq(i).find('img').css("display","block");
				$('.cheese').eq(i).find('p').css("display","none");
				$('.cheese').eq(i).find('pre').eq(0).css("display","none");	
				$('.cheese').eq(i).find('button').css("display","none");
				$('.cheese').eq(i).css("background-color","#fff");
			
				$('.cheese').eq(i).bind("mouseleave",function(){
					if($(this).hasClass("selected")===false){
						$(this).find('img').css("display","block");
						$(this).find('p').css("display","none");
						$(this).find('pre').eq(0).css("display","none");
						$(this).find('button').css("display","none");
						$(this).css("background-color","#fff");
					}
				});
				if(breadCheck==1){
					kcal -=  Number($('.cheese').eq(i).find('input').eq(0).val())*1;
				}else if(breadCheck==2){
					kcal -=  Number($('.cheese').eq(i).find('input').eq(0).val())*2;
				}
				
			}
		}
		if(breadCheck==1){
			kcal +=  Number($(this).find('input').eq(0).val())*1;
		}else if(breadCheck==2){
			kcal +=  Number($(this).find('input').eq(0).val())*2;
		}
		console.log(kcal);
		$(this).unbind("mouseleave");
		$(this).addClass("selected");
		$('input[name=bucCheese]').val(str);
		
		if($('.show-order').eq(addStatus).find('.show-order-cheese').length==0){
			var showOrderStr = "<td class='show-order-cheese'>"+str+"</td>";
			$('.show-order').eq(addStatus).append(showOrderStr);
		}else{
			$('.show-order').eq(addStatus).find('.show-order-cheese').eq(0).text(str);
		}
		
	});
	
	$('.topping-check').click(function(){
		var str = "";
		var strKorea = "";
		var noCount = 0;
		for(var i = 1; i<$('.topping').length;i++){
			if($('.topping').eq(i).hasClass("selected")){
				noCount++;
				str += '1';
				strKorea += $('.topping').eq(i).find('p').text()+",";
				if(breadCheck==1){
					cost += Number($('.topping').eq(i).find('input').eq(1).val())*1;
					kcal += Number($('.topping').eq(i).find('input').eq(0).val())*1;
				}else if(breadCheck==2){
					cost += Number($('.topping').eq(i).find('input').eq(2).val())*1;
					kcal += Number($('.topping').eq(i).find('input').eq(0).val())*2;
				}
			}else{
				str += '0'; 
			}
		}
		
		if(noCount == 0){
			strKorea = "토핑 선택안함";
		}else{
			strKorea = strKorea.substr(0, strKorea.length -1);
		}
		console.log(cost);
		console.log(kcal);
		$('input[name=bucTopping]').val(str);
		console.log($('input[name=bucTopping]').val());
		
		if($('.show-order').eq(addStatus).find('.show-order-topping').length==0){
			var showOrderStr = "<td class='show-order-topping'>"+strKorea+"</td>";
			$('.show-order').eq(addStatus).append(showOrderStr);
		}else{
			$('.show-order').eq(addStatus).find('.show-order-topping').eq(0).text(strKorea);
		}
		$('.show-order-context').eq(0).text(cost+" 원");
		$(".step").eq(5).trigger("click");
	});
	$('.topping.img-box.select-none').click(function(){
		for(var i = 1; i<$('.topping').length;i++){
			if($('.topping').eq(i).hasClass("selected")){
				if(breadCheck==1){
					cost -= Number($('.topping').eq(i).find('input').eq(1).val())*1;
					kcal -= Number($('.topping').eq(i).find('input').eq(0).val())*1;
				}else if(breadCheck==2){
					cost -= Number($('.topping').eq(i).find('input').eq(2).val())*1;
					kcal -= Number($('.topping').eq(i).find('input').eq(0).val())*2;
				}
				$('.topping').eq(i).removeClass("selected");
				$('.topping').eq(i).find('img').css("display","block");
				$('.topping').eq(i).find('p').css("display","none");
				$('.topping').eq(i).find('button').css("display","none");
				$('.topping').eq(i).find('pre').eq(0).css("display","none");
				$('.topping').eq(i).find('pre').eq(1).css("display","none");
				$('.topping').eq(i).css("background-color","#fff");
				$('.topping').eq(i).bind("mouseleave",function(){
					$(this).find('img').css("display","block");
					$(this).find('p').css("display","none");
					$(this).find('pre').eq(0).css("display","none");
					$(this).find('pre').eq(1).css("display","none");
					$(this).find('button').css("display","none");
					$(this).css("background-color","#fff");
				});
			}
		}
	});
	$('.oven').click(function(){
		if($(this).hasClass("selected")){
			return;
		}
		var idx = $('.oven').index(this);
		var mainIdx = $('.oven').index(this);
		var first = 2+$('.bread').length+$('.main').length+$('.salad').length+$('.cheese').length+$('.topping').length+2;
		clearAllfn(first);
		for(var i=0; i<2;i++){
			if(i!=mainIdx && $('.oven').eq(i).hasClass("selected")){
				$('.oven').eq(i).removeClass("selected");
				$('.oven').eq(i).find('img').css("display","block");
				$('.oven').eq(i).find('p').css("display","none");
				$('.oven').eq(i).css("background-color","#fff");
			
				$('.oven').eq(i).bind("mouseleave",function(){
					if($(this).hasClass("selected")===false){
						$(this).find('img').css("display","block");
						$(this).find('p').css("display","none");
						$(this).css("background-color","#fff");
					}
				});
			}
		}
		$(this).unbind("mouseleave");
		$(this).addClass("selected");
		
		$('input[name=bucIsOvened]').val(idx);
		
		//0이 오븐하는거임
	});
	

	$('.vegi-amount').click(function(){
		if($(this).hasClass("select-vegi")){
			
			return;
		}
		var vegiParent = $(this).parent().parent();
		var pareIdx = $('.vegi').index(vegiParent);
		var first = 2+$('.bread').length+$('.main').length+$('.salad').length+$('.cheese').length+$('.topping').length+2+$('.vegi').length;
		clearAllfn(first);
		$('.vegi').eq(pareIdx).addClass("selected");	
		$('.vegi').eq(pareIdx).unbind("mouseleave");
		$(this).unbind("mouseleave");
		$(this).addClass("select-vegi");
			///////////////////////////////////////////////////////////////////////////////////////////////
		for(var v = 0; v<4; v++){
			if($('.vegi').eq(pareIdx).find("button").index(this)!=v) {
				console.log($('.vegi').eq(pareIdx).find("button").index(this)+"vegi run?"+v);
				$('.vegi').eq(pareIdx).find("button").eq(v).removeClass("select-vegi");
				$('.vegi').eq(pareIdx).find("button").eq(v).css("color","#fff");
				$('.vegi').eq(pareIdx).find("button").eq(v).bind("mouseleave",function(){
					$(this).css("color","#fff");
				});
			}
		}
	});
	
	////야채 한글로 보여줘야되냐...
	$('.vegi-check').click(function(){
		var str = "";
		for(var i = 0; i<$('.vegi').length;i++){
			if($('.vegi').eq(i).hasClass("selected")){
				for(var k=0; k<4; k++){
					if($('.vegi').eq(i).find("button").eq(k).hasClass("select-vegi")){
						str += k;
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
			if($('.source').eq(i).hasClass("selected")){
				if(breadCheck==1){
					kcal -= Number($('.source').eq(i).find('input').eq(0).val())*1;
				}else if(breadCheck==2){
					kcal -= Number($('.source').eq(i).find('input').eq(0).val())*2;
				}
				$('.source').eq(i).removeClass("selected");
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
	
	$('.source-recom').click(function(){
		var sauceStr = $('#recom-sauce').val();
		var arrSauce = sauceStr.split(',');
		console.log(arrSauce);
		for(var i=0; i<$('.source').length;i++){
			for(var k=0; k<arrSauce.length; k++){
				if($('.source').eq(i).find('p').text()===arrSauce[k]){
					console.log("k도냐"+k);
					$('.source').eq(i).unbind("mouseleave");
					$('.source').eq(i).find('img').css("display","none");
					$('.source').eq(i).find('p').css("display","block");
					$('.source').eq(i).find('button').css("display","block");
					$('.source').eq(i).css("background-color","#009223");
					$('.source').eq(i).toggleClass("selected");
				}
			}
		}
	});
	
	$('.source-check').click(function(){
		var str = "";
		var strKorea = "";
		var noCount = 0;
		for(var i = 1; i<$('.source').length;i++){
			if($('.source').eq(i).hasClass("selected")){
				noCount++;
				str += '1';
				strKorea += $('.source').eq(i).find('p').text()+",";
				if(breadCheck==1){
					kcal += Number($('.source').eq(i).find('input').eq(0).val())*1;
				}else if(breadCheck==2){
					kcal += Number($('.source').eq(i).find('input').eq(0).val())*2;
				}
			}else{
				str += '0';
			}
		}
		if(noCount == 0){
			strKorea = "소스 선택안함";
		}else{
			strKorea = strKorea.substr(0, strKorea.length -1);
		}
		console.log(kcal);
		$('input[name=bucSource]').val(str);
		console.log($('input[name=bucSource]').val());
		
		if($('.show-order').eq(addStatus).find('.show-order-source').length==0){
			var showOrderStr = "<td class='show-order-source'>"+strKorea+"</td>";
			$('.show-order').eq(addStatus).append(showOrderStr);
		}else{
			$('.show-order').eq(addStatus).find('.show-order-source').eq(0).text(strKorea);
		}
		
		$(".step").eq(8).trigger("click");
	});
	
	$('.set').click(function(){
		if($(this).hasClass("selected")){
			return;
		}
		var str = $(this).find('p').text();
		var mainIdx = $('.set').index(this);
		var first = 2+$('.set').length+$('.main').length+$('.salad').length+$('.cheese').length;
		clearAllfn(first);
		for(var i=0; i<$('.set').length;i++){
			if(i!=mainIdx && $('.set').eq(i).hasClass("selected")){
				$('.set').eq(i).removeClass("selected");
				$('.set').eq(i).find('img').css("display","block");
				$('.set').eq(i).find('p').css("display","none");
				$('.set').eq(i).find('pre').eq(0).css("display","none");	
				$('.set').eq(i).find('button').css("display","none");
				$('.set').eq(i).css("background-color","#fff");
			
				$('.set').eq(i).bind("mouseleave",function(){
					if($(this).hasClass("selected")===false){
						$(this).find('img').css("display","block");
						$(this).find('p').css("display","none");
						$(this).find('pre').eq(0).css("display","none");
						$(this).find('button').css("display","none");
						$(this).css("background-color","#fff");
					}
				});
				kcal -= Number($('.set').eq(i).find('input').eq(0).val());
				cost -= Number($('.set').eq(i).find('input').eq(1).val());
			}
		}
		kcal += Number($(this).find('input').eq(0).val());
		cost += Number($(this).find('input').eq(1).val());
		console.log(kcal);
		$(this).unbind("mouseleave");
		$(this).addClass("selected");
		
		if($('.show-order').eq(addStatus).find('.show-order-set').length==0){
			var showOrderStr = "<td class='show-order-set'>"+str+"</td>";
			$('.show-order').eq(addStatus).append(showOrderStr);
		}else{
			$('.show-order').eq(addStatus).find('.show-order-set').eq(0).text(str);
		}
		$('.show-order-context').eq(0).text(cost+" 원");
		
		$('input[name=bucSet]').val(str);
	});

	$('.sidemenu.img-box.select-none').click(function(){
		for(var i = 1; i<$('.sidemenu').length;i++){
			if($('.sidemenu').eq(i).hasClass("selected")){
				cost -= Number($('.sidemenu').eq(i).find('input').eq(1).val());
				kcal -= Number($('.sidemenu').eq(i).find('input').eq(0).val());
				$('.sidemenu').eq(i).removeClass("selected");
				$('.sidemenu').eq(i).find('img').css("display","block");
				$('.sidemenu').eq(i).find('p').css("display","none");
				$('.sidemenu').eq(i).find('button').css("display","none");
				$('.sidemenu').eq(i).find('pre').eq(0).css("display","none");
				$('.sidemenu').eq(i).find('pre').eq(1).css("display","none");
				$('.sidemenu').eq(i).css("background-color","#fff");
				$('.sidemenu').eq(i).bind("mouseleave",function(){
					$(this).find('img').css("display","block");
					$(this).find('p').css("display","none");
					$(this).find('button').css("display","none");
					$(this).find('pre').eq(0).css("display","none");
					$(this).find('pre').eq(1).css("display","none");
					$(this).css("background-color","#fff");
				});
			}
		}
	});

	var getCookie = function(name) {
		  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		  return value? value[2] : null;			//현재 쿠키가 3개 생성되어 있음, [2]번째가 커스텀 쿠키
	};

	
	$('.order-check').click(function(){
		if(canAdd==1){
			var plusIdx = $('.plusOption').length-1;
			$(".plusOption").eq(plusIdx).trigger("click");
			return;
		}
		
		var str='';
		var strKorea = "";
		var noCount = 0;
		for(var i = 1; i<$('.sidemenu').length;i++){
			if($('.sidemenu').eq(i).hasClass("selected")){
				console.log("해즈클래스");
				noCount++;
				str += "1";
				strKorea += $('.sidemenu').eq(i).find('p').text()+",";
				cost += Number($('.sidemenu').eq(i).find('input').eq(1).val());
				kcal += Number($('.sidemenu').eq(i).find('input').eq(0).val());
			}else{
				console.log("논클래스");
				str += '0';
			}
		}
		if(noCount == 0){
			strKorea = "사이드 선택안함";
		}else{
			strKorea = strKorea.substr(0, strKorea.length -1);
		}
		console.log(cost);
		console.log(kcal);
		console.log(str);
		
		if($('.show-order').eq(addStatus).find('.show-order-sidemenu').length==0){
			var showOrderStr = "<td class='show-order-sidemenu'>"+strKorea+"</td>";
			$('.show-order').eq(addStatus).append(showOrderStr);
		}else{
			$('.show-order').eq(addStatus).find('.show-order-sidemenu').eq(0).text(strKorea);
		}
		$('.show-order-context').eq(0).text(cost+" 원");
		
		$('input[name=bucSide]').val(str);
		$('input[name=bucCost]').val(cost);
		$('input[name=bucKcal]').val(kcal);
		$('input[name=bucQuantity]').val('1');
		for(var i=0; i<13; i++){
			if(!$('.orderInput').eq(i).val()){
				alert("주문절차를 확인해주세요.");
				clearAllfn(0);
				$('.show-order').last().remove();
				var newTr = "<tr class='show-order'></tr>";
		    	$('.order-view-tbl').append(newTr);
				$('.step').eq(0).trigger("click");
				return;
			}				
    	}
		var cookieVal = getCookie('noneCustomer');
		$('#cookie').val(cookieVal);
		console.log($('#cookie').val());
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
            success : function(data){
                alert(data);
                var orderCheckStr = "";
                canMoveBucket = 1;
//        		for(var i=0; i<9; i++){
//        			if(i<7){
//        				orderCheckStr += "<td>"+$('.show-order').eq(addStatus).find('button').eq(i+1).text()+"</td>";        				
//        			}else if(i==7){
//        				orderCheckStr += "<td><button class='quantityChange type1' type='button' onclick='quantityChange(0,this);'>-</button>&nbsp;&nbsp;&nbsp;<span>"
//        					+$('.orderInput').eq(8).val()+"</span>&nbsp;&nbsp;&nbsp;<button class='quantityChange type2' type='button' onclick='quantityChange(1,this);'>+</button></td>";
//        			}else if(i==8){
//        				orderCheckStr += "<td>"+$('.orderInput').eq(9).val()+"원</td>";      
//        			}
//        		}
                orderCheckStr += "<td><button class='quantityChange type1' type='button' onclick='quantityChange(0,this);'>-</button>&nbsp;&nbsp;&nbsp;<span>"
                				+$('.orderInput').eq(10).val()+"</span>&nbsp;&nbsp;&nbsp;<button class='quantityChange type2 plusOption' type='button' onclick='quantityChange(1,this);'>+</button></td>";
        		orderCheckStr += "<td><button type='button' style='font-size:18px;color:red;' onclick='deleteOrder(this)'>취소</button>";
        		orderCheckStr += "<input type='hidden' class='idxHidden' value='"+data+"'></td>";
        		
        		console.log(orderCheckStr);
        		$('.show-order').eq(addStatus).append(orderCheckStr);
        		canAdd=1;
        		totalCost += cost;
        		$('.show-total-cost').eq(0).text("Total : "+totalCost+" 원");
            },
        });
//        var cookieHtml = $('.show-order').eq(addStatus).html();
//		setCookiee(cookieHtml);
	});
	
	
	
	function quantityChange(changeIdx,btn){
		var value = Number($(btn).parent().find('span').text());
		var idx = $(btn).parent().next().find('input').val();
		var addCostStr = $(btn).parent().parent().find('td').eq(0).text();
		var addCost = Number(addCostStr.substr(0, addCostStr.length-2));
		console.log(addCost);
		console.log(addCostStr);
		if(changeIdx==0){
			if(value==1){
				return;
			}
			value--;
			totalCost -= addCost;
		}else{
			value++;
			totalCost += addCost;
		}
		$.ajax({
        	url : "/updateQuantity.do",
            type : 'get',
            data : {value:value,idx:idx},
            success : function(){
            	$(btn).parent().find('span').text(value);
            },
        });
		$('.show-total-cost').eq(0).text("Total : "+totalCost+" 원");
//			var cookieHtml = $('.show-order').eq(addStatus).html();
//    		setCookiee(cookieHtml);
	}
	
	function deleteOrder(idx){
		var delCostStr = $(idx).parent().parent().find('td').eq(0).text();
		var delCost = Number(delCostStr.substr(0, delCostStr.length-2));
		
		clearAllfn(0);
		var delIdx = $(idx).next().val();
		$.ajax({
        	url : "/tempOrderDelete.do",
            type : 'get',
            data : {delIdx:delIdx},
            success : function(){
                $(idx).parent().parent().remove();
                
            },
        });
		var newTr = "<tr class='show-order'></tr>";
    	$('.order-view-tbl').append(newTr);
		totalCost -= delCost;
		$('.show-total-cost').eq(0).text("Total : "+totalCost+" 원");
		var offset = $("strong").eq(0).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
		$('.step').eq(0).trigger("click");
	}
	function addOrderfn(){
    	if(canMoveBucket==0){
			return;
		}
    	canAdd=0;
    	clearAllfn(0);
    	for(var i=0; i<13; i++){
			$('.orderInput').eq(i).val("");				
    	}
    	var newTr = "<tr class='show-order'></tr>";
    	$('.order-view-tbl').append(newTr);
    	addStatus++;
    	cost=0;
    	kcal=0;
    	var offset = $("strong").eq(0).offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    	$(".step").eq(0).trigger("click");
	}
	
	$('.load-bucket').click(function() {
		if(canMoveBucket==0){
			alert("주문내역이 없습니다.");
			return;
		}
		location.href="/loadBucket.do"
	});


