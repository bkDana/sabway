/**
 * 
 */
/* switch(ingreType) {
case 'main' : ingreType = "메인재료"; break;
case 'bread' : ingreType = "빵"; break;
case 'cheese' : ingreType = "치즈"; break;
case 'toppingRef' : ingreType = "추가토핑"; break;
case 'sourceRef' : ingreType = "소스"; break;
case 'sideRef' : ingreType = "사이드메뉴"; break;
} */
appendStr = ''; // 공용

$(document).on('click', '#main input[name=main]', function(){
	var ingreId = $(this).attr('id');
	var ingreType = "메인재료";
	var ingre = {
			ingreId : ingreId,
			ingreType : ingreType
	};
	console.log(ingreId + " " + ingreType);
	$.ajax({
		url : "/ingreManage/selectOneIngre.do",
		type : "get",
		data : ingre,
		dataType : "json",
		success : function(resp) {
			$('#ajaxMain').empty();
			console.log(resp.ingreLabel);
			$('#ajaxMain').html(resp.ingreLabel);
		},
		error : function() {
			console.log("error occured");
		}
	});
});

$(document).on('click', '#main input[name=bread]', function(){
	var ingreId = $(this).attr('id');
	var ingreType = "빵";
	var ingre = {
			ingreId : ingreId,
			ingreType : ingreType
	};
	console.log(ingreId + " " + ingreType);
	$.ajax({
		url : "/ingreManage/selectOneIngre.do",
		type : "get",
		data : ingre,
		dataType : "json",
		success : function(resp) {
			$('#ajaxBread').empty();
			console.log(resp.ingreLabel);
			$('#ajaxBread').html(resp.ingreLabel);
		},
		error : function() {
			console.log("error occured");
		}
	});
});


/* 여기여기 */
$(document).on('click', '#main input[name=is15]', function() {
	var ingreVal = $(this).val();
	if(ingreVal == 1) {
		$('#ajaxIs15').empty();
		$('#ajaxIs15').html("15Cm");
		$('#')
	} else {
		$('#ajaxIs15').empty();
		$('#ajaxIs15').html("30Cm");
	}

});

$('input[name=cheese]').click(function(){
	var ingreId = $(this).attr('id');
	$('#ajaxCheese').empty();
	console.log(ingreId);
	$('#ajaxCheese').html(ingreId);
});

$('input[name=toppingRef]').change(function(){
	var ingreId = $(this).attr('id');
	var ingreType = "추가토핑";
	var ingre = {
			ingreId : ingreId,
			ingreType : ingreType
	};
	console.log(ingreId + " " + ingreType);
	if(ingreId == '선택안함') {
		$('#ajaxTopping').empty();
		appendStr = '';
	} else {
		if($(this).is(':checked')) {
			$.ajax({
				url : "/ingreManage/selectOneIngre.do",
				type : "get",
				data : ingre,
				dataType : "json",
				success : function(resp) {
					console.log(resp.ingreLabel);
					appendStr += resp.ingreLabel + " ";
					$('#ajaxTopping').html(appendStr);
				},
				error : function() {
					console.log("error occured");
				}
			});
		} else {
			appendStr.replace("\'"+ingreId+"\'",'');
		}
		
	}
});

$(function(){
	///* 여기여기 */
	$(document).on('click', '#main input[name=is15]', function() {
		var ingreVal = $(this).val();
		var ingreId = $(this).attr('id');
		var ingreType = "메인재료";
		var ingre = {
				ingreId : ingreId,
				ingreType : ingreType
		};
		if(ingreVal == 1) {
			$.ajax({
				url : "/ingreManage/selectMainList.do",
				type : "get",
				data : ingre,
				dataType : "json",
				success : function(main) {
					for(var index in main) {
						
					}
				}
			});
		} else {
			
		}
	
	});
});