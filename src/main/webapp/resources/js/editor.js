//첨부파일 추가
var rowIndex = 0;
$(document).ready(function(){
	$('#testContent').keyup(function(event) {
		if ( event.keyCode === 8 || event.keyCode === 46) {
	    	for(var i=0;i<rowIndex; i++){
	    		if($("#testContent").html().indexOf("fileDiv"+i) == -1) {
	    			$("#fileName"+i).parent().remove();
	    		}
	    	}
		}

	});
});

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
	    var getTable = document.getElementById("insertTable");
		var oCurrentRow = getTable.insertRow(getTable.rows.length);
	    var oCurrentCell = oCurrentRow.insertCell(0);
	    oCurrentCell.innerHTML = "<tr><td valign=bottom>" +
		    "<input type='text' id='fileName" + rowIndex + "' readonly='readonly'>" +
			"<label for='editor-file-upload" + rowIndex + "'>" +
			"<img width='30px' height='30px' src='/resources/img/plusimg.PNG'></label>" +
			"<input type='file' class='editor-file-upload' id='editor-file-upload"+rowIndex+"' name='filename"+ rowIndex + "' size=25 " +
			"onchange='onChangeImg(this,"+rowIndex+")'"
			+"></td>" +
			"<td width=100><input type='button' value='삭제' onClick='deleteFile(this,"+rowIndex+")' style='cursor:hand'></td></tr>";
	} 
	
	//첨부파일 삭제
	function deleteFile(f,Index){
			$("#fileDiv"+Index).remove();
			$("#fileName"+Index).parent().remove();
	}
	
	function onChangeImg(f,Index){
		if($("#fileName"+Index).val()==""){
			rowIndex++;
		    var getTable = document.getElementById("insertTable");
			var oCurrentRow = getTable.insertRow(getTable.rows.length);
		    var oCurrentCell = oCurrentRow.insertCell(0);
		    oCurrentCell.innerHTML = "<tr><td valign=bottom>" +
			    "<input type='text' id='fileName" + rowIndex + "' readonly='readonly'>" +
				"<label for='editor-file-upload" + rowIndex + "'>" +
				"<img width='30px' height='30px' src='/resources/img/plusimg.PNG'></label>" +
				"<input type='file' class='editor-file-upload' id='editor-file-upload"+rowIndex+"' name='filename"+ rowIndex + "' size=25 " +
				"onchange='onChangeImg(this,"+rowIndex+")'"
				+"></td>" +
				"<td width=100><input type='button' value='삭제' onClick='deleteFile(this,"+rowIndex+")' style='cursor:pointer'></td></tr>";
		}else{
			$("#fileName"+Index).val(f.value);
			$("#fileDiv"+Index).remove();
		}
	    
		if(f.files.length!=0 && f.files[0]!=0){ //f.file -> 선택한 파일을 가져옴 (배열형태로) , f.files[0] -> 0번재 파일의 크기
			$("#fileName"+Index).val(f.value.split('/').pop().split('\\').pop());
			var innerContent = $("#testContent").html();
			var reader = new FileReader();	//JS의 FileReader 객체 -> 객체 내부의 result 속성에 파일 컨텐츠가 있음
			reader.readAsDataURL(f.files[0]);	//선택한 파일의 경로를 읽어옴
			console.log(f.files[0]);
			reader.onload = function(e){
				
				innerContent += "<div id='fileDiv" + Index + "' class='resize-div' contentEditable='false'>"
				+"<img class='resize-img' width='100%' height='100%' src='"+e.target.result+"'></div>\r\n";
				$("#testContent").html(innerContent);
			}
		} else{ //파일을 뺄 경우
			$("#fileName"+Index).val(f.value);
			$("#fileName"+Index).parent().remove();
			$("#fileDiv"+Index).remove();
		}
	}
	
	$('.starbox').click(function(){
		var index = $('.starbox').index(this);
		console.log(index);
		while(i<index){
			$('.fullstar').eq(i).css("display","block");
			i++;
		}
		
	});
	