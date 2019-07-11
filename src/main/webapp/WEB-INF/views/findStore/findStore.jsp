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
</style>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- Map -->
<section id="content-wrapper">

   <div class="store_search_wrapper">
      <div class="store_search_layer">
         <h2>매장찾기</h2>
         <!-- 검색 -->
         <div class="form_search">
            <form id="mapFrm" method="POST" name="mapFrm" onsubmit="return shopMap.search()">
               <input id="keyword" maxlength="30" placeholder="지역 또는 매장명 입력" type="text" value="">
               <a class="btn_search" href="#" onclick="shopMap.search();return false;"></a>
            </form>
         </div>
         <!--// 검색 -->
         
         <!-- 검색결과 -->
         <div class="search_result_cont" id="uiReslutCont" style="display:none;">
            <p class="search_total">검색 결과 <strong id="uiResultCount">0</strong>건</p>
         
            <div class="store_list_scroll mCustomScrollbar _mCS_1 mCS_no_scrollbar"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 421px;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
               <ul id="uiResultList">
               </ul>
            </div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
         
            <!-- board 페이지 -->
            <div class="pagination" id="ui_pager"></div>
            <!--// board 페이지 -->
         </div>
         <!--// 검색결과 -->
      </div>
   </div>

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
											<li>
												<div class="region">서울특별시<strong>포이사거리</strong></div>
												<div class="state coming">Coming Soon</div>
											</li>
										</c:forEach>
									</ul>
								</li>
							</ul>
						</div>
						<div class="bx-controls bx-has-controls-direction bx-has-pager"><div class="bx-controls-direction"><a class="bx-prev disabled" href="">Prev</a><a class="bx-next disabled" href="">Next</a></div><div class="bx-pager bx-default-pager"><div class="bx-pager-item"><a href="" data-slide-index="0" class="bx-pager-link active">1</a></div></div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />