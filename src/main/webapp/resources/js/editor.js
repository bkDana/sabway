//첨부파일 추가
var rowIndex = 0;
$(document).ready(function(){
	
	$('#testContent').keyup(function(event) {
		if ( event.keyCode === 8 || event.keyCode === 46) {
	    	for(var i=1;i<rowIndex+1; i++){
	    		if($("#testContent").html().indexOf("fileDiv"+i) == -1) {
	    			$("#fileName"+i).parent().parent().remove();
	    		}
	    	}
		}
		
	});
	
	$('#hashtag').keydown(function(event){
		if (event.keyCode === 32) {
			var string = $(this).val();
			var stringArr = string.split(' ');
			var arrLength = stringArr.length;
			
		    	if(stringArr[arrLength-1].indexOf('#') == -1){
		    		stringArr[arrLength-1] = '#'+stringArr[arrLength-1];
		    	}
			
			string="";
			for(var i=0;i<arrLength;i++){
				if(i != arrLength-1){
					string += stringArr[i]+','; 
				}else{
					string += stringArr[i];
				}
			}
			$(this).val(string);
		}
	});
});
	function captureReturnKey(e){
		if(e.keyCode ===13){
			return false;
		}
	}
	$(document).on("dragstart","#testContent",function(e){
	    console.log("d"+e);
	    return false;
	});
	$(document).on("click",".resize-div",function(){		
		$(this).css("resize", "both");
	});

	function addFile(form){
		if($("#fileName"+rowIndex).val()==""){
			return;
		}
	    rowIndex++;
//	    var getTable = document.getElementById("insertTable");
//		var oCurrentRow = getTable.insertRow(getTable.rows.length);
//	    var oCurrentCell = oCurrentRow.insertCell(0);
//	    oCurrentCell.innerHTML = 
	    var inner ="<tr><td colspan='3'>" +
		    "<input class='submit-file' type='text' id='fileName" + rowIndex + "' readonly='readonly'>" +
			"<label for='editor-file-upload" + rowIndex + "'>" +
			"<img width='30px' height='30px' src='/resources/img/plusimg.PNG'></label>" +
			"<input type='file' class='editor-file-upload' id='editor-file-upload"+rowIndex+"' name='fileName' size=25 " +
			"onchange='onChangeImg(this,"+rowIndex+")'"
			+"></td>" +
			"<td colspan='1'><input type='button' value='삭제' onClick='deleteFile(this,"+rowIndex+")' style='cursor:hand'></td></tr>";
	    $('#insertTable').append(inner);
	} 
	
	//첨부파일 삭제
	function deleteFile(f,Index){
			$("#fileDiv"+Index).remove();
			$(f).parent().parent().remove();
	}
	
	function onChangeImg(f,Index){
		if($("#fileName"+Index).val()==""){
			rowIndex++;
//		    var getTable = document.getElementById("insertTable");
//			var oCurrentRow = getTable.insertRow(getTable.rows.length);
//		    var oCurrentCell = oCurrentRow.insertCell(0);
//		    oCurrentCell.innerHTML = 
			var inner = "<tr><td colspan='3'>" +
			    "<input class='submit-file' type='text' id='fileName" + rowIndex + "' readonly='readonly'>" +
				"<label for='editor-file-upload" + rowIndex + "'>" +
				"<img width='30px' height='30px' src='/resources/img/plusimg.PNG'></label>" +
				"<input type='file' class='editor-file-upload' id='editor-file-upload"+rowIndex+"' name='fileName' size=25 " +
				"onchange='onChangeImg(this,"+rowIndex+")'"
				+"></td>" +
				"<td colspan='1'><input type='button' value='삭제' onClick='deleteFile(this,"+rowIndex+")' style='cursor:pointer'></td></tr>";
		    $('#insertTable').append(inner);
		}else{
			$("#fileName"+Index).val(f.value);
//			$("#fileDiv"+Index).remove();
		}
	    
		if(f.files.length!=0 && f.files[0]!=0){ //f.file -> 선택한 파일을 가져옴 (배열형태로) , f.files[0] -> 0번재 파일의 크기
			$("#fileName"+Index).val(f.value.split('/').pop().split('\\').pop());
			var innerContent = $("#testContent").html();
			var reader = new FileReader();	//JS의 FileReader 객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
			reader.readAsDataURL(f.files[0]);	//선택한 파일의 경로를 읽어옴
			console.log(f.files[0]);
			reader.onload = function(e){
				console.log($('#fileDiv'+Index).length);
				if($('#fileDiv'+Index).length>0){
					$('#fileDiv'+Index).html("<img class='resize-img' width='100%' height='100%' src='"+e.target.result+"'>");
					console.log("있는데 바뀔때"+Index);
				}else{
					innerContent += "<div id='fileDiv" + Index + "' class='resize-div' contentEditable='false'>"
					+"<img class='resize-img' width='100%' height='100%' src='"+e.target.result+"'></div>";
					$("#testContent").html(innerContent);
					console.log("없는데 넣을때"+$('#fileDiv'+Index).length);
				}
				
			}
		} else{ //파일을 뺄 경우
			$("#fileName"+Index).val(f.value);
			$("#fileName"+Index).parent().parent().remove();
			$("#fileDiv"+Index).remove();
		}
	}
	var clickCheck1 = 0;
	var clickCheck2 = 0;
	var optionStatus1 = 0;
	var optionStatus2 = 0;
	function optionStatus(status){
		if(status==1){
			optionStatus1 = 1;
			clickCheck1 = 0;
		}else if(status==2){
			optionStatus2 = 1;
			clickCheck2 = 0;
		}
	}
	function changeHalf(img, separator){
		if(optionStatus2 == 0){
			if(optionStatus1==0){
				return false;
			}else if(optionStatus1==1){
				$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
				$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/fullstar.png");
				$(img).parent().prev().attr("src","/resources/img/halfstar.png");
				var index = $('area').index(img);
				if(separator == 1){
					$("#starpoint1").html((index+1)/2);
					clickCheck1 = 1;
				}
				optionStatus1=0;
			}
		}
		
		if(optionStatus2==0){
			return false;
		}else if(optionStatus2==1){
			$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
			$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/fullstar.png");
			$(img).parent().prev().attr("src","/resources/img/halfstar.png");
			var index = $('area').index(img);
			if(separator == 2){
				$("#starpoint2").html((index-9)/2);
				clickCheck2 = 1;
			}
			optionStatus2=0;
		}
		
		
	}
	function enterHalf(img, separator){
		if(optionStatus2 == 0){
			if(optionStatus1==0){
				return false;
			}else if(optionStatus1==1){
				if(clickCheck1 == 0 && separator == 1){
					$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
					$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/fullstar.png");
					$(img).parent().prev().attr("src","/resources/img/halfstar.png");
					var index = $('area').index(img);
					$("#starpoint1").html((index+1)/2);
				}
			}
		}
		
		if(optionStatus2==0){
			return false;
		}else if(optionStatus2==1){
			if(clickCheck2 == 0 && separator == 2){
				$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
				$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/fullstar.png");
				$(img).parent().prev().attr("src","/resources/img/halfstar.png");
				var index = $('area').index(img);
				$("#starpoint2").html((index-9)/2);
			}
		}
	}
	function leaveHalf(img, separator){
		if(optionStatus2 == 0){
			if(optionStatus1==0){
				return false;
			}else if(optionStatus1==1){
				if(clickCheck1 == 0 && separator == 1){
					$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
					$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
					$(img).parent().prev().attr("src","/resources/img/emptystar.png");
					var index = $('area').index(img);
						$("#starpoint1").html("");
						clickCheck1 == 0;
				}
			}
		}
		
		if(optionStatus2==0){
			return false;
		}else if(optionStatus2==1){
			if(clickCheck2 == 0 && separator == 2){
				$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
				$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
				$(img).parent().prev().attr("src","/resources/img/emptystar.png");
				var index = $('area').index(img);
					$("#starpoint2").html("");
					clickCheck2 == 0;
			}
		}
	}
	
	function changeFull(img, separator){
		if(optionStatus2 == 0){
			if(optionStatus1==0){
				return false;
			}else if(optionStatus1==1){
				$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
				$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/fullstar.png");
				var index = $('area').index(img);
				if(separator == 1){
					$("#starpoint1").html((index+1)/2);
					clickCheck1 = 1;
				}
				optionStatus1 = 0;
			}
		}
		
		if(optionStatus2==0){
			return false;
		}else if(optionStatus2==1){
			$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
			$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/fullstar.png");
			var index = $('area').index(img);
			if(separator == 2){
				$("#starpoint2").html((index-9)/2);
				clickCheck2 = 1;
			}
			optionStatus2 = 0;
		}
	}
	function enterFull(img, separator){
		if(optionStatus2 == 0){
			if(optionStatus1==0){
				return false;
			}else if(optionStatus1==1){
				if(clickCheck1 == 0 && separator == 1){
					$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
					$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/fullstar.png");
					var index = $('area').index(img);
					$("#starpoint1").html((index+1)/2);
				}
			}
		}
		
		if(optionStatus2==0){
			return false;
		}else if(optionStatus2==1){
			if(clickCheck2 == 0 && separator == 2){
				$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
				$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/fullstar.png");
				var index = $('area').index(img);
				$("#starpoint2").html((index-9)/2);
			}
		}
	}
	function leaveFull(img, separator){
		if(optionStatus2 == 0){
			if(optionStatus1==0){
				return false;
			}else if(optionStatus1==1){
				if(clickCheck1 == 0 && separator == 1){
					$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
					$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
					var index = $('area').index(img);
					$("#starpoint1").html("");
					clickCheck1 == 0;
				}
			}
		}
		
		if(optionStatus2==0){
			return false;
		}else if(optionStatus2==1){
			if(clickCheck2 == 0 && separator == 2){
				$(img).parent().nextAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
				$(img).parent().prevAll().filter('.star-img'+separator).attr("src","/resources/img/emptystar.png");
				var index = $('area').index(img);
				$("#starpoint2").html("");
				clickCheck2 == 0;
			}
		}
	}
	
	function submitBtn(){
		var content = $('#testContent').html();
		$('#reviewContent').val(content);
		var filenameText = "";
		var count = $('.submit-file').length;
		if(count>0){
			for(var i=0;i<count-1;i++){
				if(i != count-2){
					filenameText += $('.submit-file').eq(i).val()+",";
				}else{
					filenameText += $('.submit-file').eq(i).val();
				}
			}
				
		}
		
		var matchContent = "<img [^<>]*>";
		var newContent;
		for(var i=0;i<count-1;i++){
			newContent = content.match(matchContent);
			var keyword = newContent[0];
			content = content.replace(keyword,"changeIMG");
		}
		
		$('#reviewContent').val(content);
		$('#reviewFilename').val(filenameText);
		$('#reviewStarpoint1').val($('#starpoint1').text());
		$('#reviewStarpoint2').val($('#starpoint2').text());
		
		if($('input[name=reviewTitle]').val()==''){
			alert('제목을 입력해주세요');
			return;
		}
		if($('input[name=reviewItem]').val()==''){
			alert('리뷰상품을 입력해주세요');
			return;
		}
		if($('input[name=reviewBranch]').val()==''){
			alert('지점을 입력해주세요');
			return;
		}
		if($('input[name=reviewStarItem]').val()==''){
			alert('별점을 입력해주세요');
			return;
		}
		if($('input[name=reviewStarBranch]').val()==''){
			alert('별점을 입력해주세요');
			return;
		}
		if($('input[name="reviewHashtag"]').val()==''){
			alert('태그를 입력해주세요');
			return;
		}
		if($('#reviewContent').val()==''){
			alert('내용을 입력해주세요');
			return;
		}
		
		var form = document.write;
		form.submit();
	}
	function updateBtn(){
		var content = $('#testContent').html();
		$('#reviewContent').val(content);
		var filenameText = "";
		var count = $('.submit-file').length;
		if(count>0){
			for(var i=0;i<count;i++){
					filenameText += $('.submit-file').eq(i).val()+",";
			}
				
		}
		
		var matchContent = "<img [^<>]*>";
		var newContent;
		for(var i=0;i<count;i++){
			newContent = content.match(matchContent);
			if(newContent!=null){
				var keyword = newContent[0];
			}
			
			content = content.replace(keyword,"changeIMG");
		}
		$('#reviewContent').val(content);
		$('#reviewFilename').val(filenameText);
		
		$('#reviewStarpoint1').val($('#starpoint1').text());
		$('#reviewStarpoint2').val($('#starpoint2').text());
		var form = document.write;
		form.submit();
	}
	