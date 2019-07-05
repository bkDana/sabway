<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/editor.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">

<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<div class="common-tbl-box">
			<form action="#" name="write">
			    <table id="insertTable" class="comm-tbl editor-container-navi">
				    <colgroup>
						<col width="15%">
						<col width="35%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<tr>
				        <td>
				        	제목
				        </td>
				        <td>
				        	<input type="text" name="reviewTitle">
				        </td>
				        <td>
				        	작성자
				        </td>
				        <td>
				        	<input type="text" name="reviewWriter" value="${sessionScope.customerId }" readonly="readonly">
				        </td>
				    </tr>
			    	<tr>
				        <td>
				        	리뷰상품
				        </td>
				        <td>
				        	<input type="text" name="reviewItem">
				        </td>
				        <td>
				        	상품별점
				        	<span class="common-tbl-btn-group">
				        		<button class="btn-style2 supersmall" type="button" onclick="optionStatus(1);">별점주기</button>
				        	</span>
				        </td>
				        <td>
				        	<input type="hidden" name="reviewStarItem">
			        		<img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star1">
						    <map name="star1">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,1)" onmouseenter="enterHalf(this,1)" onmouseleave="leaveHalf(this,1)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,1)" onmouseenter="enterFull(this,1)" onmouseleave="leaveFull(this,1)">
						    </map>
						    <img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star2">
						    <map name="star2">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,1)" onmouseenter="enterHalf(this,1)" onmouseleave="leaveHalf(this,1)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,1)" onmouseenter="enterFull(this,1)" onmouseleave="leaveFull(this,1)">
						    </map>
						    <img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star3">
						    <map name="star3">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,1)" onmouseenter="enterHalf(this,1)" onmouseleave="leaveHalf(this,1)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,1)" onmouseenter="enterFull(this,1)" onmouseleave="leaveFull(this,1)">
						    </map>
						    <img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star4">
						    <map name="star4">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,1)" onmouseenter="enterHalf(this,1)" onmouseleave="leaveHalf(this,1)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,1)" onmouseenter="enterFull(this,1)" onmouseleave="leaveFull(this,1)">
						    </map>
						    <img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star5">
						    <map name="star5">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,1)" onmouseenter="enterHalf(this,1)" onmouseleave="leaveHalf(this,1)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,1)" onmouseenter="enterFull(this,1)" onmouseleave="leaveFull(this,1)">
						    </map>
				        	<span id="starpoint1"></span>
				        	<input type="hidden" id="reviewStarpoint1" name="reviewStarpoint1" value="0">
				        </td>
				    </tr>
				    <tr>
				        <td>
				        	지점
				        </td>
				        <td>
				        	<input type="text" name="reviewBranch">
				        </td>
				        <td>
				        	지점별점
				        	<span class="common-tbl-btn-group">
				        		<button class="btn-style2 supersmall" type="button" onclick="optionStatus(2);">별점주기</button>
				        	</span>
				        </td>
				        <td>
				        	<input type="hidden" name="reviewStarBranch">
			        		<img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star6">
						    <map name="star6">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,2)" onmouseenter="enterHalf(this,2)" onmouseleave="leaveHalf(this,2)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,2)" onmouseenter="enterFull(this,2)" onmouseleave="leaveFull(this,2)">
						    </map>
						    <img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star7">
						    <map name="star7">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,2)" onmouseenter="enterHalf(this,2)" onmouseleave="leaveHalf(this,2)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,2)" onmouseenter="enterFull(this,2)" onmouseleave="leaveFull(this,2)">
						    </map>
						    <img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star8">
						    <map name="star8">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,2)" onmouseenter="enterHalf(this,2)" onmouseleave="leaveHalf(this,2)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,2)" onmouseenter="enterFull(this,2)" onmouseleave="leaveFull(this,2)">
						    </map>
						    <img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star9">
						    <map name="star9">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,2)" onmouseenter="enterHalf(this,2)" onmouseleave="leaveHalf(this,2)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,2)" onmouseenter="enterFull(this,2)" onmouseleave="leaveFull(this,2)">
						    </map>
						    <img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png" usemap="#star0">
						    <map name="star0">
						        <area shape="rect" coords="0,0,15,30" onclick="changeHalf(this,2)" onmouseenter="enterHalf(this,2)" onmouseleave="leaveHalf(this,2)">
						        <area shape="rect" coords="15,0,30,30" onclick="changeFull(this,2)" onmouseenter="enterFull(this,2)" onmouseleave="leaveFull(this,2)">
						    </map>
				        	<span id="starpoint2"></span>
				        	<input type="hidden" id="reviewStarpoint2" name="reviewStarpoint2" value="0">
				        </td>
				    </tr>
				    <tr>
				        <td>
				        	해시태그
				        </td>
				        <td colspan="3">
				        	<input type="text" name="reviewHashtag" id="hashtag" onkeydown="return captureReturnKey(event)" placeholder="태그단어 입력후 스페이스키를 누르세요.(띄어쓰기로 태그를 구분할 수 있습니다.)">
				        </td>
				    </tr>
			        <tr>
				        <td colspan="4">
				        	<div id="testContent" class="editor-content" contentEditable="true"></div>
				        </td>
				    </tr>
				    <tr>
			        	<td colspan="4">
			        		<div class="common-tbl-btn-group">
			        			<button type="button" class="btn-style2 small" onClick='addFile(this.form)'>사진 첨부하기</button>
			        		</div>
			        	</td>
			        </tr>
			    </table>
			    <input type="hidden" name="rowCount" value="1">
			    <div class="common-tbl-btn-group">
					<button type="submit" class="btn-style2 small">리뷰 등록</button>
				</div>
			</form> 
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />