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
		            <div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 421px;" tabindex="0">
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
	<div class="map_wrap" style="width:100%;height:700px;">
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
													
													<div class="region">${m.mgrAddr }<strong>${m.mgrName }</strong></div>
														
													<div class="state coming">Coming Soon</div>
													
												</li>
											</c:if>
										</c:forEach>
										
										<c:forEach items="${list }" var="m" varStatus="status">
											<c:if test="${m.mgrStatus == '2' }">
											<c:forEach items="${listDate }" var="num">
												<c:if test="${num == status.index}">
													<li>
															
														<div class="region">${m.mgrAddr }<strong>${m.mgrName }</strong></div>
																
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
	
		<p class="search_total">총 <strong id="uiResultCount">${totalCnt}</strong>개 매장이 있습니다.</p>
	<table border="1" name="subMenu" class="comm-tbl type2">
		<tr style="height:60px">
			<th>NO</th>
			<th>매장명</th>
			<th>매장주소</th>
			<th>대표자</th>
			<th>연락처</th>
		</tr>
		<c:forEach items="${listS }" var="s">
			<tr style="height:60px">
				<td style="color:#ffc300;font-weight: bold;">${s.rnum }</td>
				<td>${s.mgrName }</td>
				<td>${s.mgrAddr }</td>
				<td>${s.mgrBossName }</td>
				<td>${s.mgrTel }</td>
			</tr>
		</c:forEach>
		
	</table>
	<div class="paging">${pageNavi }</div>
</div>
<script>
	var dataList;
	
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
				'keyword' : keyword
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
	
	
	
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />