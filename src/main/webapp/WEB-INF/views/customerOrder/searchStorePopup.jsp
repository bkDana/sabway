<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css"> <!-- 태그 초기화 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/user-layout.css"> <!-- 레이아웃 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/content.css"> <!-- 컨텐츠 css(민주) -->
<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="resources/css/searchpopup.css">
<title>매장 찾기</title>
</head>
<body>
	<input type="hidden" id="idx" value="">
	<br>
	<h2 style="margin-left:10px;">매장찾기</h2>
          <!-- 검색 -->
         <div style="margin-top:10px; margin-left:10px;" class="form_search">
			<input id="keyword" name="keyword" maxlength="30" placeholder="지역 또는 매장명 입력" type="text" value=""  onkeypress="if(event.keyCode == 13){ searchBtn(); return; }">
			<button class="btn_search" onclick="searchBtn();">검색</button>
         </div>
         <!--// 검색 -->
         
         <!-- 검색결과 -->
         <div class="board_list_wrapper">
         	<div class="content">
	            <p style="margin-left:10px;" class="board_total">검색 결과 <strong id="pageCount">0</strong>건</p>
	            <div class="store_list_scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar">
		            <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 421px; overflow:auto; overflow-x:hidden" tabindex="0">
			            <div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
				            <ul id="uiResultList">
				            </ul>
			            </div>
			            <div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;">
				            <div class="mCSB_draggerContainer">
					            <div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;">
					            	<div class="mCSB_dragger_bar" style="line-height: 30px;"></div>
					            </div>
					            <div class="mCSB_draggerRail"></div>
				            </div>
			            </div>
		            </div>
	            </div>
	            <!-- board 페이지 -->
	            <div class="pagination" id="ui_pager"></div>
            </div>
            <!--// board 페이지 -->
         </div>
         <!--// 검색결과 -->
     <script type="text/javascript">
     var dataList;
     
	// 지점 클릭시 부모페이지에 지점명 추가
	function detailMarket(num){
		console.log($('strong').eq(num+1).html());
		var bool = confirm($('strong').eq(num+1).html() + "에서 주문하시겠습니까?");
		if(bool) {
			$(opener.document).find('[name=cusoBranchName]').val($('strong').eq(num+1).html());
			$(opener.document).find('.branchName').val($('strong').eq(num+1).html());
			setTimeout(function(){
				$(opener.document).find('#mmBuc').click();
				window.close();
			},500);
		}

	}
 	// 매장찾기
 	function searchBtn(){
 	    var keyword = $("#keyword").val();
 	    $("#uiResultList").html("");
 	    
 	    if(keyword.length < 2){
 	    	alert("두글자 이상");
 	    	return;
 	    }
 	    
 	    $.ajax({
 			url : "/searchKeyword.do",
 			data : {
 				keyword : keyword
 			},
 			dataType : "json",
 			success : function(data){
 				var size = data.length;
 				dataList = '';
 				dataList = data;
 				$("#pageCount").text(size);
 				
 				if(size == 0){
 					alert('검색결과가 없습니다 ㅎ');
 					return;
 				}
 				
 				for(var i=0; i<data.length; i++){
 					$("#uiResultList").append("<li id='searchData"+i+"'><a href='#' onclick='detailMarket("+i+");'><span><strong>"+data[i].mgrName+"</strong></span>"+"<br><span class='uiResultSpan'>"+data[i].mgrAddr+"</span><br><span class='uiResultSpan'>"+data[i].mgrTel+"</span></a></li>");

 				}
 			}
 		});

 	    
 	 }

     </script>    
</body>
</html>