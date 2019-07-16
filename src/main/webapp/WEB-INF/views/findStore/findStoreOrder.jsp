<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.new_store_content{
	    background-color: #f6f6f6;
	    padding: 96px 0 100px;
	    margin-bottom: 95px;
	}
	.content {
	    max-width: 1170px;
	    margin: 0 auto;
	    position: relative;
	}
	.h_title {
	    font-size: 28px;
	    color: #292929;
	    font-weight: bold;
	    letter-spacing: -0.05em;
	    padding-bottom: 38px;
	}
	.new_store_content .new_store_slider_wrapper {
    	position: relative;
	}
	.search_result_cont{
		margin: 0;
	    padding: 0;
	    line-height: 120%;
	}
	#uiResultList li{
	    position: relative;
	    padding: 26px 0 17px 40px;
	    /* border-bottom: 1px solid #dddddd; */
	    border-top: 1px solid #dddddd;
	    cursor: pointer;
	}
	#uiResultList li:last-child{
		border-bottom: 1px solid #dddddd;
	}
	.uiResultSpan{
		color: #999999;
	    font-size: 13px;
	    line-height: 23px;
	    margin-bottom: 15px;
	}
	.search_result_cont .store_list_scroll {
	    margin-top: 18px;
	    height: 421px;
	    border-top: 1px solid #dddddd;
	    overflow: hidden;
	}
	.mCustomScrollBox {
	    position: relative;
	    overflow: hidden;
	    height: 100%;
	    max-width: 100%;
	    outline: 0;
	    direction: ltr;
	    clear:both;
	}
	#uiResultList li a span strong{
		color: #292929;
	    font-size: 18px;
	    font-weight: bold;
	    padding-bottom: 14px;
	    display: block;
	}
	.store_search_wrapper .store_search_layer .search_result_cont ul li {
	    position: relative;
	    padding: 26px 0 17px 40px;
	    border-bottom: 1px solid #dddddd;
	    cursor: pointer;
	}
	.comm-tbl.type2 th {
	    color: #009223;
	}
	
	
	
	
	
	
	/* board list */
	.board_list_wrapper{position:relative; overflow:hidden; padding-bottom:127px;}
	.board_list_wrapper p{color:#999999; letter-spacing:-0.045em; float:left; margin-top:17px; margin-bottom:10px; width:340px;}
	.board_list_wrapper p strong{font-weight:bold; color:#009223; display:inline-block; margin:0 0 0 3px;}
	.board_list_wrapper .cont_right{float:right; margin-bottom:10px;}
	.board_list_wrapper .cont_right .form_search{width:224px; display:inline-block; vertical-align:middle;}
	.board_list_wrapper table{clear:both; border-top:4px solid #009223;}
	.board_list_wrapper table th{color:#009223; font-size:16px; font-weight:300; height:69px; border-bottom:1px solid #009223; text-align:center;}
	.board_list_wrapper table th.hide{font-size:0}
	.board_list_wrapper table td{height:69px; border-bottom:1px solid #dddddd; text-align:center; color:#292929; font-size:16px;}
	.board_list_wrapper table td .title{text-align:left; letter-spacing:-0.04em}
	.board_list_wrapper table td .date{color:#bbbbbb; font-family:font_sw;}
	.board_list_wrapper table td .icon_file{display:inline-block; width:20px; height:20px; background:url(../images/common/icon_file.png) 0 0 no-repeat;}
	.board_list_wrapper table td .icon_notice{display:inline-block; width:20px; height:14px; background:url(../images/common/icon_notice.png) 0 0 no-repeat;}
	.board_list_wrapper table td .num{color:#ffc300; font-family:font_sw; font-weight:bold;}
	.board_list_wrapper table td .service span{display:inline-block; font-size:13px; color:#bbb; border:1px solid #bbb; border-radius:30px; height:23px; line-height:23px; padding:0 8px;}
	.board_list_wrapper table td .service span.on{font-weight:300; color:#666; border-color:#666}
	.board_list_wrapper table td .tel{color:#bbbbbb; font-family:font_sw;}
	.board_list_wrapper table td .coming{color:#009223; font-family:font_sw; font-size:13px; font-weight:bold; background-color:#ffce32; height:25px; line-height:22px; width:110px; margin:0 auto; text-align:center; border-radius:15px}
	.board_list_wrapper table tr.notice td{background-color:#f8f8f8}
	.board_list_wrapper table tr.notice td .title a{color:#009223; font-weight:bold;}
	.cont_right {
	    float: right;
	    margin-bottom: 10px;
	}
	.form_select {
	    display: inline-block;
	    vertical-align: middle;
	    overflow: hidden;
	    position: relative;
	    border: 2px solid #dddddd;
	}
	.form_select select {
	    width: 100%;
	    border: 0;
	    height: 41px;
	    line-height: 41px;
	    font-size: 16px;
	    color: #999999;
	    position: relative;
	    z-index: 1;
	    text-indent: 9px;
	}
	.store_search_wrapper {
   	 	padding-top: 60px;
	}
	.store_search_wrapper .store_map {
	    height: 700px;
	    position: relative;
	}
	.store_map_layer {
	    width: 298px;
	    height: 236px;
	    border: 1px solid #000000;
	    background-color: #fff;
	    position: absolute;
	    left: 50%;
	    top: 50%;
	    margin: -234px 0 0 -150px;
	    z-index: 0;
	}
	.store_map_layer .head {
	    background-color: #ffce32;
	    position: relative;
	    height: 54px;
	}
	.store_map_layer .info {
	    margin: 0 24px;
	    border-bottom: 1px solid #dddddd;
	    height: 133px;
	}
	.store_map_layer .head strong {
	    color: #292929;
	    font-size: 18px;
	    font-weight: bold;
	    display: block;
	    padding: 17px 0 0 23px;
	    letter-spacing: -0.03em;
	}
	.store_map_layer .info dl {
	    overflow: hidden;
	    padding-top: 23px;
	}
	.store_map_layer .info dt {
	    color: #292929;
	    font-size: 13px;
	    float: left;
	    height: 21px;
	    padding-left: 2px;
	    position: relative;
	    margin-bottom: 4px;
	    letter-spacing: -0.04em;
	}
	.store_map_layer .info dd {
	    color: #999999;
	    font-size: 13px;
	    line-height: 21px;
	    margin: 0 0 4px 76px;
	    position: relative;
	    top: -3px;
	    letter-spacing: -0.03em;
	    min-height: 21px;
	}
	.foot{
		img src="/resources/img/logo_w.png" style="max-height:68px;
	}
</style>
<script>
	var dataList;
		function searchBtnOrder(){
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
						$("#uiResultList").append("<li id='searchData"+i+"'><a href='#' onclick='detailMarket("+i+");'><span><strong>"+data[i].mgrAddr+"</strong></span>"+"<br><span class='uiResultSpan'>"+data[i].mgrName+"</span><br><span class='uiResultSpan'>"+data[i].mgrTel+"</span></a></li>");
					}
					
					mapXyInfo(data[0]);
				}
			});
		    
		 }
	// 주문하기 클릭
	function detailMarket2(idx){
		location.href ="/cusOrder.do?mgrNo="+idx;
	}
	// 지점 클릭
	function detailMarket(num){
		mapXyInfo(dataList[num]);
	}
</script>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- Map -->
<section id="content-wrapper" style="height: 133%">
   	<div class="store_search_wrapper">
      <div class="store_search_layer">
         <h2>매장찾기</h2>
          <!-- 검색 -->
         <div class="form_search">
			<input id="keyword" name="keyword" maxlength="30" placeholder="지역 또는 매장명 입력" type="text" value=""  onkeypress="if(event.keyCode == 13){ searchBtnOrder(); return; }">
			<button class="btn_search" onclick="searchBtnOrder();"></button>
         </div>
         <!--// 검색 -->
         
         <!-- 검색결과 -->
         <div class="board_list_wrapper">
         	<div class="content">
	            <p class="board_total">검색 결과 <strong id="pageCount">0</strong>건</p>
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
      </div>
   </div>
<!-- 	맵 불러오기 -->
	<div class="store_map" style="width:100%;height:700px;">
		<jsp:include page="/WEB-INF/views/map/map2.jsp" />
	</div>
	</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />