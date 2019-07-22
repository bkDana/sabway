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
	    font-size: 16px;
	    float: left;
	    height: 21px;
	    padding-left: 2px;
	    position: relative;
	    margin-bottom: 4px;
	    letter-spacing: -0.04em;
	}
	.store_map_layer .info dd {
	    color: #999999;
	    font-size: 14px;
	    line-height: 21px;
	    margin: 0 0 4px 76px;
	    position: relative;
	    top: -3px;
	    letter-spacing: -0.03em;
	    min-height: 21px;
	}
	#searchViewTbl td {
		font-size: 16px;
	}
	.store_map_layer .foot {
	    text-align: center;
	    padding-top: 17px;
	}
	.store_map_layer .foot a {
	    display: inline-block;
	    color: #292929;
	    font-size: 16px;
	    font-weight: 300;
	    letter-spacing: -0.045em;
	}
	.addrFont{
		font-size: 15px;
	}
</style>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- Map -->
<section id="content-wrapper" style="height: 133%">
   	<div class="store_search_wrapper">
      <div class="store_search_layer">
         <h2>매장찾기</h2>
          <!-- 검색 -->
         <div class="form_search">
			<input id="keyword" name="keyword" maxlength="30" placeholder="지역 또는 매장명 입력" type="text" value=""  onkeypress="if(event.keyCode == 13){ searchBtn(); return; }">
			<button class="btn_search" onclick="searchBtn();"></button>
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
	<div class="new_store_content">
		<div class="content">
			<h3 class="h_title">신규매장안내</h3>
			<div class="new_store_slider_wrapper">
				<div class="new_store_slider_cont">
					<div class="bx-wrapper" style="max-width: 100%;">
						<div class="bx-viewport" aria-live="polite" style="width: 100%; overflow: hidden; position: relative; height: 374px;">
							<ul class="new_store_slider" id="ui_new_franchise_list" style="width: 1215%; position: relative; transition-duration: 0s; transform: translate3d(0px, 0px, 0px);">
								<li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 1170px;">
									<ul class="store_list">
										<c:forEach items="${list }" var="m">
											<c:if test="${m.mgrStatus == '1' }">
												<li>
													
													<div class="region"><strong>${m.mgrName }</strong><br><a class="addrFont">${m.mgrAddr }</a></div>
														
													<div class="state coming">Coming Soon</div>
													
												</li>
											</c:if>
										</c:forEach>
										
										<c:forEach items="${list }" var="m" varStatus="status">
											<c:if test="${m.mgrStatus == '2' }">
											<c:forEach items="${listDate }" var="num">
												<c:if test="${num == status.index}">
													<li>
															
														<div class="region"><strong>${m.mgrName }</strong><br><a class="addrFont">${m.mgrAddr }</a></div>
																
														<div class="state open" id="date">open<strong> ${m.mgrOpenDate }</strong></div>
										
													</li>
 												</c:if>
 											</c:forEach>
											</c:if>
										</c:forEach>
									</ul>
								</li>
							</ul>
						</div>
						<div class="bx-controls bx-has-controls-direction bx-has-pager">
						<div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next disabled" href="">Next</a></div>
						<div class="bx-pager bx-default-pager"><div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link active">1</a></div></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<div class="area">
	<div class="sub-menu" style="font-size: 30px">전체매장</div>
	
		<p class="search_total">총 <strong id="uiResultCount">${totalCnt }</strong>개 매장이 있습니다.</p>
		
		<div class="cont_right">
			<div class="form_select" style="width:196px;">
				<select class="inputBox" name="applyArea" id="applyArea" style="width:100%">
					<option value="">시/도</option>
					<option value="서울특별시">서울특별시</option>
					<option value="경기도">경기도</option>
					<option value="인천광역시">인천광역시</option>
					<option value="대전광역시">대전광역시</option>
					<option value="세종특별자치시">세종특별자치시</option>
					<option value="충청남도">충청남도</option>
					<option value="경상남도">경상남도</option>
					<option value="울산광역시">울산광역시</option>
					<option value="부산광역시">부산광역시</option>
					<option value="대구광역시">대구광역시</option>
					<option value="제주특별자치도">제주특별자치도</option>
					<option value="전라북도">전라북도</option>
					<option value="충청북도">충청북도</option>
					<option value="광주광역시">광주광역시</option>
				</select>
			</div>
			<div class="form_select" style="width:196px;">
				<select name="applyArea2" id="applyArea2" style="width:100%">
					<option value="">시/군/구</option>
				</select>
			</div>
		</div>
		
	<table border="1" name="subMenu" class="comm-tbl type2" id="searchViewTbl">
		<tr style="height:60px" class="searchList">
			<th>NO</th>
			<th>매장명</th>
			<th>매장주소</th>
			<th>대표자</th>
			<th>연락처</th>
		</tr>
		<c:forEach items="${listS }" var="s">
			<tr style="height:60px" class="searchTr">
				<td style="color:#ffc300;font-weight: bold;">${s.rnum }</td>
				<td>${s.mgrName }</td>
				<td>${s.mgrAddr }</td>
				<td>${s.mgrBossName }</td>
				<td style="color: #bbbbbb;">${s.mgrTel }</td>
			</tr>
		</c:forEach>
	</table>
	<div class="paging">${pageNavi }</div>
</div>
<script>
	var dataList;
	//지도 api 매장찾기
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
				mapXyInfo(data[0]);
			}
		});
	    
	 }
	
	//전체매장 select 필터
	function applyArea(area,currPage,type){
		
		$.ajax({
			url : "/allSearchKeyword.do",
			data : {area:area,currentPage:currPage,type:type},
			dataType : "json",
			success : function(data){
					
				$(".searchTr").remove();
				$(".searchList").next().text("");
				
				var index = data.storeList.length;
				console.log(index);
				if(index == 0){
					$("#storeTr").remove();
					$("#uiResultCount").text(index);
					$("#searchViewTbl").append("<tr id='storeTr'><td colspan='5'>검색 결과가 없습니다.</td></tr>");
					return;
				}
				$("#uiResultCount").text(data.totalCnt);
					
				for(var i=0; i<data.storeList.length; i++){
					$("#searchViewTbl").append("<tr style='height:60px' class='searchTr'><td style='color:#ffc300;font-weight: bold;'id='search"+i+"'>"+data.storeList[i].rnum+"</td><td>"+data.storeList[i].mgrName+"</td><td>"+data.storeList[i].mgrAddr+"</td><td>"+data.storeList[i].mgrBossName+"</td><td style='color:#bbbbbb'>"+data.storeList[i].mgrTel+"</td></tr>");
				}
				$(".paging").html(data.pageNavi);
			}
			
		});
	}
	
	
	
	$(document).ready(function(){
	/* 	$("#applyArea").change(function(){
			
			

			var area = $("#applyArea").val() + "%" +$("#applyArea2").val() + "%";

			applyArea(area,1,1);

		}) */
		
		$("#applyArea2").change(function(){
			
			var area = $("#applyArea").val() + "%" +$("#applyArea2").val() + "%";

			/* var area = $(this).val();*/
			applyArea(area,1,2); 
		})
		
	})
	// 주문하기 클릭
	function detailMarket2(idx){
		location.href ="/cusOrder.do?mgrNo="+idx;
	}
	// 지점 클릭
	function detailMarket(num){
		mapXyInfo(dataList[num]);
	}
	
	$("[name=searchData]").click(function(){
		var addr = $(this).text();
		//naverMap.searchXy(addr);
		alert(addr);
		mapXyInfo(addr);
	});
	
	
	//지역 selectBox
	$(document).ready(function(){
		$("#applyArea").change(function(){
		
			
		 	if($(this).val() == "서울특별시"){
		 		$("#applyArea2").find("option").remove();
		 		$("#applyArea2").append("<option value=''>시/군/구</option>");
				$("#applyArea2").append("<option value='강남구'>강남구</option>");
				$("#applyArea2").append("<option value='강동구'>강동구</option>");
				$("#applyArea2").append("<option value='강북구'>강북구</option>");
				$("#applyArea2").append("<option value='강서구'>강서구</option>");
				$("#applyArea2").append("<option value='구로구'>구로구</option>");
				$("#applyArea2").append("<option value='금천구'>금천구</option>");
				$("#applyArea2").append("<option value='노원구'>노원구</option>");
				$("#applyArea2").append("<option value='도봉구'>도봉구</option>");
				$("#applyArea2").append("<option value='동대문구'>동대문구</option>");
				$("#applyArea2").append("<option value='동작구'>동작구</option>");
				$("#applyArea2").append("<option value='마포구'>마포구</option>");
				$("#applyArea2").append("<option value='서초구'>서초구</option>");
				$("#applyArea2").append("<option value='성동구'>성동구</option>");
				$("#applyArea2").append("<option value='성북구'>성북구</option>");
				$("#applyArea2").append("<option value='송파구'>송파구</option>");
				$("#applyArea2").append("<option value='양천구'>양천구</option>");
				$("#applyArea2").append("<option value='영등포구'>영등포구</option>");
				$("#applyArea2").append("<option value='용산구'>용산구</option>");
				$("#applyArea2").append("<option value='은평구'>은평구</option>");
				$("#applyArea2").append("<option value='종로구'>종로구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
				$("#applyArea2").append("<option value='중랑구'>중랑구</option>");
				
				
			}
		 	
		 	else if($(this).val() == "경기도"){
		 		
				$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
				$("#applyArea2").append("<option value='가평군'>가평군</option>");
				$("#applyArea2").append("<option value='덕양구'>고양시 덕양구</option>");
				$("#applyArea2").append("<option value='일산동구'>고양시 일산동구</option>");
				$("#applyArea2").append("<option value='일산서구'>고양시 일산서구</option>");
				$("#applyArea2").append("<option value='과천시'>과천시</option>");
				$("#applyArea2").append("<option value='광명시'>광명시</option>");
				$("#applyArea2").append("<option value='광주시'>광주시</option>");
				$("#applyArea2").append("<option value='구리시'>구리시</option>");
				$("#applyArea2").append("<option value='군포시'>군포시</option>");
				$("#applyArea2").append("<option value='김포시'>김포시</option>");
				$("#applyArea2").append("<option value='남양주시'>남양주시</option>");
				$("#applyArea2").append("<option value='동두천시'>동두천시</option>");
				$("#applyArea2").append("<option value='부천시'>부천시</option>");
				$("#applyArea2").append("<option value='분당구'>성남시 분당구</option>");
				$("#applyArea2").append("<option value='수정구'>성남시 수정구</option>");
				$("#applyArea2").append("<option value='중원구'>성남시 중원구</option>");
				$("#applyArea2").append("<option value='권선구'>수원시 권선구</option>");
				$("#applyArea2").append("<option value='영통구'>수원시 영통구</option>");
				$("#applyArea2").append("<option value='장안구'>수원시 장안구</option>");
				$("#applyArea2").append("<option value='팔달구'>수원시 팔달구</option>");
				$("#applyArea2").append("<option value='시흥시'>시흥시</option>");
				$("#applyArea2").append("<option value='단원구'>안산시 단원구</option>");
				$("#applyArea2").append("<option value='상록구'>안산시 상록구</option>");
				$("#applyArea2").append("<option value='안성시'>안성시</option>");
				$("#applyArea2").append("<option value='만안구'>안양시 만안구</option>");
				$("#applyArea2").append("<option value='동안구'>안양시 동안구</option>");
				$("#applyArea2").append("<option value='양주시'>양주시</option>");
				$("#applyArea2").append("<option value='양평군'>양평군</option>");
				$("#applyArea2").append("<option value='여주시'>여주시</option>");
				$("#applyArea2").append("<option value='연천군'>연천군</option>");
				$("#applyArea2").append("<option value='오산시'>오산시</option>");
				$("#applyArea2").append("<option value='팔달구'>수원시 팔달구</option>");
				$("#applyArea2").append("<option value='기흥구'>용인시 기흥구</option>");
				$("#applyArea2").append("<option value='수지구'>용인시 수지구</option>");
				$("#applyArea2").append("<option value='처인구'>용인시 처인구</option>");
				$("#applyArea2").append("<option value='의왕시'>의왕시</option>");
				$("#applyArea2").append("<option value='의정부시'>의정부시</option>");
				$("#applyArea2").append("<option value='이천시'>이천시</option>");
				$("#applyArea2").append("<option value='파주시'>파주시</option>");
				$("#applyArea2").append("<option value='평택시'>평택시</option>");
				$("#applyArea2").append("<option value='포천시'>포천시</option>");
				$("#applyArea2").append("<option value='하남시'>하남시</option>");
				$("#applyArea2").append("<option value='화성시'>화성시</option>");

			}
			
		 	else if($(this).val() == "인천광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강화군'>강화군</option>");
				$("#applyArea2").append("<option value='계양구'>계양구</option>");
				$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='남동구'>남동구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='부평구'>부평구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='연수구'>연수구</option>");
				$("#applyArea2").append("<option value='옹진군'>옹진군</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
		 	}

		 	else if($(this).val() == "대전광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='대덕구'>대덕구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='유성구'>유성구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
				
		 	}

		 	else if($(this).val() == "충청남도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='계룡시'>계룡시</option>");
				$("#applyArea2").append("<option value='공주시'>공주시</option>");
				$("#applyArea2").append("<option value='금산군'>금산군</option>");
				$("#applyArea2").append("<option value='논산시'>논산시</option>");
				$("#applyArea2").append("<option value='당진시'>당진시</option>");
				$("#applyArea2").append("<option value='보령시'>보령시</option>");
				$("#applyArea2").append("<option value='부여군'>부여군</option>");
				$("#applyArea2").append("<option value='서산시'>서산시</option>");
				$("#applyArea2").append("<option value='서천군'>서천군</option>");
				$("#applyArea2").append("<option value='아산시'>아산시</option>");
				$("#applyArea2").append("<option value='예산군'>예산군</option>");
				$("#applyArea2").append("<option value='천안시 동남구'>천안시 동남구</option>");
				$("#applyArea2").append("<option value='천안시 서북구'>천안시 서북구</option>");
				$("#applyArea2").append("<option value='청양군'>청양군</option>");
				$("#applyArea2").append("<option value='태안군'>태안군</option>");
				$("#applyArea2").append("<option value='홍성군'>홍성군</option>");
				
		 	}

		 	else if($(this).val() == "경상남도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='거제시'>거제시</option>");
				$("#applyArea2").append("<option value='거창군'>거창군</option>");
				$("#applyArea2").append("<option value='고성군'>고성군</option>");
				$("#applyArea2").append("<option value='김해시'>김해시</option>");
				$("#applyArea2").append("<option value='남해군'>남해군</option>");
				$("#applyArea2").append("<option value='밀양시'>밀양시</option>");
				$("#applyArea2").append("<option value='사천시'>사천시</option>");
				$("#applyArea2").append("<option value='산청군'>산청군</option>");
				$("#applyArea2").append("<option value='양산시'>양산시</option>");
				$("#applyArea2").append("<option value='의령군'>의령군</option>");
				$("#applyArea2").append("<option value='진주시'>진주시</option>");
				$("#applyArea2").append("<option value='창녕군'>창녕군</option>");
				$("#applyArea2").append("<option value='창원시 마산합포구'>창원시 마산합포구</option>");
				$("#applyArea2").append("<option value='창원시 마산회원구'>창원시 마산회원구</option>");
				$("#applyArea2").append("<option value='창원시 성산구'>창원시 성산구</option>");
				$("#applyArea2").append("<option value='창원시 의창구'>창원시 의창구</option>");
				$("#applyArea2").append("<option value='창원시 진해구'>창원시 진해구</option>");
				$("#applyArea2").append("<option value='통영시'>통영시</option>");
				$("#applyArea2").append("<option value='하동군'>하동군</option>");
				$("#applyArea2").append("<option value='함안군'>함안군</option>");
				$("#applyArea2").append("<option value='함양군'>함양군</option>");
				$("#applyArea2").append("<option value='합천군'>합천군</option>");
				
				
		 	}
		
			else if($(this).val() == "울산광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='울주군'>울주군</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
			
		 	}

			else if($(this).val() == "부산광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강서구'>강서구</option>");
				$("#applyArea2").append("<option value='금정구'>금정구</option>");
				$("#applyArea2").append("<option value='기장군'>기장군</option>");
				$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='동래구'>동래구</option>");
				$("#applyArea2").append("<option value='부산진구'>부산진구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='사상구'>사상구</option>");
				$("#applyArea2").append("<option value='사하구'>사하구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='수영구'>수영구</option>");
				$("#applyArea2").append("<option value='연제구'>연제구</option>");
				$("#applyArea2").append("<option value='영도구'>영도구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
				$("#applyArea2").append("<option value='해운대구'>해운대구</option>");
			
		 	}

			else if($(this).val() == "대구광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='달서구'>달서구</option>");
				$("#applyArea2").append("<option value='달성군'>달성군</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='수성구'>수성구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
			
		 	}
		
			else if($(this).val() == "제주특별자치도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='서귀포시'>서귀포시</option>");
				$("#applyArea2").append("<option value='제주시'>제주시</option>");		
		 	}

			else if($(this).val() == "전라북도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='고창군'>고창군</option>");
				$("#applyArea2").append("<option value='군산시'>군산시</option>");
				$("#applyArea2").append("<option value='김제시'>김제시</option>");
				$("#applyArea2").append("<option value='남원시'>남원시</option>");
				$("#applyArea2").append("<option value='무주군'>무주군</option>");
				$("#applyArea2").append("<option value='부안군'>부안군</option>");
				$("#applyArea2").append("<option value='순창군'>순창군</option>");
				$("#applyArea2").append("<option value='완주군'>완주군</option>");
				$("#applyArea2").append("<option value='익산시'>익산시</option>");
				$("#applyArea2").append("<option value='임실군'>임실군</option>");
				$("#applyArea2").append("<option value='장수군'>장수군</option>");
				$("#applyArea2").append("<option value='전주시 덕진구'>전주시 덕진구</option>");
				$("#applyArea2").append("<option value='전주시 완산구'>전주시 완산구</option>");
				$("#applyArea2").append("<option value='정읍시'>정읍시</option>");
				$("#applyArea2").append("<option value='진안군'>진안군</option>");
			
		 	}

			else if($(this).val() == "충청북도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='괴산군'>괴산군</option>");
				$("#applyArea2").append("<option value='단양군'>단양군</option>");
				$("#applyArea2").append("<option value='보은군'>보은군</option>");
				$("#applyArea2").append("<option value='영동군'>영동군</option>");
				$("#applyArea2").append("<option value='옥천군'>옥천군</option>");
				$("#applyArea2").append("<option value='음성군'>음성군</option>");
				$("#applyArea2").append("<option value='제천시'>제천시</option>");
				$("#applyArea2").append("<option value='증평군'>증평군</option>");
				$("#applyArea2").append("<option value='진천군'>진천군</option>");
				$("#applyArea2").append("<option value='청주시 상당구'>청주시 상당구</option>");
				$("#applyArea2").append("<option value='청주시 서원구'>청주시 서원구</option>");
				$("#applyArea2").append("<option value='청주시 청원구'>청주시 청원구</option>");
				$("#applyArea2").append("<option value='청주시 흥덕구'>청주시 흥덕구</option>");
				$("#applyArea2").append("<option value='충주시'>충주시</option>");
			
		 	}
		
			else if($(this).val() == "광주광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='광산구'>광산구</option>");
				$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
			
		 	}

			else if($(this).val() == "전라남도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강진군'>강진군</option>");
				$("#applyArea2").append("<option value='고흥군'>고흥군</option>");
				$("#applyArea2").append("<option value='곡성군'>곡성군</option>");
				$("#applyArea2").append("<option value='광양시'>광양시</option>");
				$("#applyArea2").append("<option value='구례군'>구례군</option>");
				$("#applyArea2").append("<option value='나주시'>나주시</option>");
				$("#applyArea2").append("<option value='담양군'>담양군</option>");
				$("#applyArea2").append("<option value='목포시'>목포시</option>");
				$("#applyArea2").append("<option value='무안군'>무안군</option>");
				$("#applyArea2").append("<option value='보성군'>보성군</option>");
				$("#applyArea2").append("<option value='순천시'>순천시</option>");
				$("#applyArea2").append("<option value='신안군'>신안군</option>");
				$("#applyArea2").append("<option value='여수시'>여수시</option>");
				$("#applyArea2").append("<option value='영광군'>영광군</option>");
				$("#applyArea2").append("<option value='영암군'>영암군</option>");
				$("#applyArea2").append("<option value='완도군'>완도군</option>");
				$("#applyArea2").append("<option value='장성군'>장성군</option>");
				$("#applyArea2").append("<option value='장흥군'>장흥군</option>");
				$("#applyArea2").append("<option value='진도군'>진도군</option>");
				$("#applyArea2").append("<option value='함평군'>함평군</option>");
				$("#applyArea2").append("<option value='해남군'>해남군</option>");
				$("#applyArea2").append("<option value='화순군'>화순군</option>");
			
		 	}

			else if($(this).val() == "경상북도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='경산시'>경산시</option>");
				$("#applyArea2").append("<option value='경주시'>경주시</option>");
				$("#applyArea2").append("<option value='고령군'>고령군</option>");
				$("#applyArea2").append("<option value='구미시'>구미시</option>");
				$("#applyArea2").append("<option value='군위군'>군위군</option>");
				$("#applyArea2").append("<option value='김천시'>김천시</option>");
				$("#applyArea2").append("<option value='문경시'>문경시</option>");
				$("#applyArea2").append("<option value='봉화군'>봉화군</option>");
				$("#applyArea2").append("<option value='상주시'>상주시</option>");
				$("#applyArea2").append("<option value='성주군'>성주군</option>");
				$("#applyArea2").append("<option value='안동시'>안동시</option>");
				$("#applyArea2").append("<option value='영덕군'>영덕군</option>");
				$("#applyArea2").append("<option value='영양군'>영양군</option>");
				$("#applyArea2").append("<option value='영주시'>영주시</option>");
				$("#applyArea2").append("<option value='영천시'>영천시</option>");
				$("#applyArea2").append("<option value='예천군'>예천군</option>");
				$("#applyArea2").append("<option value='울릉군'>울릉군</option>");
				$("#applyArea2").append("<option value='울진군'>울진군</option>");
				$("#applyArea2").append("<option value='의성군'>의성군</option>");
				$("#applyArea2").append("<option value='청도군'>청도군</option>");
				$("#applyArea2").append("<option value='청송군'>청송군</option>");
				$("#applyArea2").append("<option value='칠곡군'>칠곡군</option>");
				$("#applyArea2").append("<option value='포항시 남구'>포항시 남구</option>");
				$("#applyArea2").append("<option value='포항시 북구'>포항시 북구</option>");
			
		 	}

			else if($(this).val() == "강원도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강릉시'>강릉시</option>");
				$("#applyArea2").append("<option value='고성군'>고성군</option>");
				$("#applyArea2").append("<option value='동해시'>동해시</option>");
				$("#applyArea2").append("<option value='삼척시'>삼척시</option>");
				$("#applyArea2").append("<option value='속초시'>속초시</option>");
				$("#applyArea2").append("<option value='양구군'>양구군</option>");
				$("#applyArea2").append("<option value='양양군'>양양군</option>");
				$("#applyArea2").append("<option value='영월군'>영월군</option>");
				$("#applyArea2").append("<option value='원주시'>원주시</option>");
				$("#applyArea2").append("<option value='인제군'>인제군</option>");
				$("#applyArea2").append("<option value='정선군'>정선군</option>");
				$("#applyArea2").append("<option value='철원군'>철원군</option>");
				$("#applyArea2").append("<option value='춘천시'>춘천시</option>");
				$("#applyArea2").append("<option value='태백시'>태백시</option>");
				$("#applyArea2").append("<option value='평창군'>평창군</option>");
				$("#applyArea2").append("<option value='홍천군'>홍천군</option>");
				$("#applyArea2").append("<option value='화천군'>화천군</option>");
				$("#applyArea2").append("<option value='횡성군'>횡성군</option>");
			
		 	}
		 	
		 	
		 	var area = $("#applyArea").val() + "%";

			applyArea(area,1,1);
		
		})
	})
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />