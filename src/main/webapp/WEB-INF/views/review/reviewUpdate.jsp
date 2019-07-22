<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" />


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/editor.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">

<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<h1 class="board-tit">리뷰</h1>
		<div class="common-tbl-box">
			<form action="/reviewUpdate.do" method="post" name="write" enctype="multipart/form-data">
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
				        	<input type="hidden" name="reviewNo" value="${review.reviewNo }">
				        	<input type="text" name="reviewTitle" value="${review.reviewTitle }">
				        </td>
				        <td>
				        	작성자
				        </td>
				        <td>
				        	<input type="text" name="reviewWriter" value="테스트이름" readonly="readonly"><!-- 세션으로 불러오기 세개다 -->
				        	<input type="hidden" name="reviewGender" value="남자">
				        	<input type="hidden" name="reviewBirthday" value="테스트생일">
				        </td>
				    </tr>
			    	<tr>
				        <td>
				        	리뷰상품
				        </td>
				        <td>
				        	<input type="text" name="reviewItem" value="${review.reviewItem }">
				        </td>
				        <td>
				        	상품별점
				        	<span class="common-tbl-btn-group">
				        		<button class="btn-style2 supersmall" type="button" onclick="optionStatus(1);">별점주기</button>
				        	</span>
				        </td>
				        <td>
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
				        	&nbsp;&nbsp;&nbsp;<span id="starpoint1">${review.reviewStarItem }</span>
				        	<input type="hidden" id="reviewStarpoint1" name="reviewStarItem" value="${review.reviewStarItem }">
				        </td>
				    </tr>
				    <tr>
				        <td>
				        	지점
				        </td>
				        <td>
				        	<input type="text" name="reviewBranch" value="${review.reviewBranch }">
				        </td>
				        <td>
				        	지점별점
				        	<span class="common-tbl-btn-group">
				        		<button class="btn-style2 supersmall" type="button" onclick="optionStatus(2);">별점주기</button>
				        	</span>
				        </td>
				        <td>
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
				        	&nbsp;&nbsp;&nbsp;<span id="starpoint2">${review.reviewStarBranch }</span>
				        	<input type="hidden" id="reviewStarpoint2" name="reviewStarBranch" value="${review.reviewStarBranch }">
				        </td>
				    </tr>
				    <tr>
				        <td>
				        	해시태그
				        </td>
				        <td colspan="3">
				        	<input type="text" name="reviewHashtag" id="hashtag" onkeydown="return captureReturnKey(event)" value="${review.reviewHashtag}" placeholder="태그단어 입력후 스페이스키를 누르세요.(띄어쓰기로 태그를 구분할 수 있습니다.)">
				        </td>
				    </tr>
			        <tr>
				        <td colspan="4">
				        	<div id="testContent" class="editor-content" contentEditable="true">${review.reviewContent }</div>
				        	<input type="hidden" name="reviewContent" id="reviewContent">
				        	<input type="hidden" name="filename" id="reviewFilename">
				        	<input type="hidden" name="filepath" id="reviewFilepath" value="${review.filepath }">
				        	<input type="hidden" name="oldpath" value="${review.filepath }">
				        </td>
				        <td style="display:none;" id="filepath">${review.filepath }</td>
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
					<button onclick="updateBtn();" type="button" class="btn-style2 small">수정하기</button>
				</div>
			</form> 
		</div>
	</div>
</section>
<script>
$(document).ready(function(){
	var content = $('#testContent').html();
	var filepaths = $('#filepath').text().split(',');
	console.log(content);
	for(var i=0; i<filepaths.length-1; i++){
		content = content.replace("changeIMG","<img class='resize-img' width='100%' height='100%' src='/resources/upload/review/"+filepaths[i]+"'>");
	}
	console.log(content);
	$('#testContent').html(content);
	var itemstar = $('#starpoint1').text().split('.');
	var branchstar = $('#starpoint2').text().split('.');
	if(itemstar.length==1){
		for(var i=0;i<itemstar[0];i++){
			$('.star-img1').eq(i).attr("src","/resources/img/fullstar.png");
		}
	}else{
		for(var i=0;i<itemstar[0];i++){
			$('.star-img1').eq(i).attr("src","/resources/img/fullstar.png");
			if(i==itemstar[0]-1){
				$('.star-img1').eq(i).attr("src","/resources/img/halfstar.png");
			}
		}
	}
	if(branchstar.length==1){
		for(var i=0;i<branchstar[0];i++){
			$('.star-img2').eq(i).attr("src","/resources/img/fullstar.png");
		}
	}else{
		for(var i=0;i<branchstar[0];i++){
			$('.star-img2').eq(i).attr("src","/resources/img/fullstar.png");
			if(i==branchstar[0]-1){
				$('.star-img2').eq(i).attr("src","/resources/img/halfstar.png");
			}
		}
	}
	var filename = "${review.filename }";
	var filenames = filename.split(',');
	for(var i=0; i<filenames.length-1; i++){
		rowIndex++;
		var innerOnload ="<tr><td colspan='3'>" +
	    "<input class='submit-file' type='text' id='fileName" + rowIndex + "' readonly='readonly' value='"+filenames[i]+"'>" +
		"<label for='editor-file-upload" + rowIndex + "'>" +
		"<img width='30px' height='30px' src='/resources/img/plusimg.PNG'></label>" +
		"<input type='file' class='editor-file-upload' id='editor-file-upload"+rowIndex+"' name='fileName' size=25 " +
		"onchange='onChangeImg(this,"+rowIndex+")' value="+filepaths[i]+"></td>" +
		"<td colspan='1'><input type='button' value='삭제' onClick='deleteFile(this,"+rowIndex+")' style='cursor:hand'></td></tr>";
		$('#insertTable').append(innerOnload);
	}
});
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />