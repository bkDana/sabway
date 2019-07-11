<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->
<style>
	.move-pn-review:hover,.move-all-review:hover{
		cursor: pointer;
		color: #ffce32;
	}
</style>
<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		
		<div class="common-tbl-box">
		<div class="like-img-box">
			<div class="like-inner-box">1000<br><br>Likes</div>
			<div class="like-inner-box"><img class="like-img" src="/resources/img/emptyheart.png"></div>
		</div>
			<table class="comm-tbl">
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			
			 	<c:forEach items="${reviewList }" var="review" varStatus="status">
			 		<c:if test="${review.reviewNo eq reviewNo }">
			 		<c:set var = "currentIndex" value = "${status.index}"/>
						<tr>
							<th style="display:none;">${review.reviewNo }</th>
							<th>${review.reviewWriter }</th>
							<th>${review.reviewTitle }</th>
							<th>${review.reviewLike }</th>
							<th>${review.reviewHashtag }</th>
						</tr>
						<tr>
							<td>${review.reviewItem }</td>
							<td id="reviewStarItem">
								<img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png">
								<img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png">
								<img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png">
								<img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png">
								<img class="star-img1" width="30px" height="30px" src="/resources/img/emptystar.png">
								${review.reviewStarItem }
							</td>
							<td>${review.reviewBranch }</td>
							<td id="reviewStarBranch">
								<img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png">
								<img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png">
								<img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png">
								<img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png">
								<img class="star-img2" width="30px" height="30px" src="/resources/img/emptystar.png">
								${review.reviewStarBranch }
							</td>
						</tr>
						<tr>
							<td colspan="4"><div id="reviewContent" class="editor-content">${review.reviewContent }</div></td>
							<td style="display:none;" id="filepath">${review.filepath }</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>

				<div class="common-tbl-btn-group">
					<button class="btn-style2 small move-all-review">목록으로</button>
					<button class="btn-style2 small move-delete-review">삭제하기</button>
					<button class="btn-style2 small move-update-review">수정하기</button>
					<c:if test="${sessionScope.member.memberId eq 'admin' }">
						<button class="btn-style2 small move-update-review">수정하기</button>
						<button class="btn-style2 small move-delete-review">삭제하기</button>
					</c:if>
				</div>
			
			<br><br>
			<table class="comm-tbl">
			<colgroup>
				<col width="15%">
				<col width="/">
			</colgroup>
			 	<c:forEach items="${reviewList }" var="review" varStatus="status">
					<c:if test="${status.index eq currentIndex-1}">
						<tr>
							<td style="display:none;">${review.reviewNo }</td>
							<td colspan="2" class="move-pn-review">
								△이전글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${review.reviewTitle }
							</td>
						</tr>
					</c:if>
					<c:if test="${status.index eq currentIndex+1}">
						<tr>
							<td style="display:none;">${review.reviewNo }</td>
							<td colspan="2" class="move-pn-review">
								▽다음글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${review.reviewTitle }
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</section>
<<script type="text/javascript">
<!--content 이미지 바꾸는 로직//-->
	$(document).ready(function(){
		var content = $('#reviewContent').html();
		var filepaths = $('#filepath').text().split(',');
		console.log(content);
		for(var i=0; i<filepaths.length-1; i++){
			content = content.replace("changeIMG","<img class='resize-img' width='100%' height='100%' src='/resources/upload/review/"+filepaths[i]+"'>");
		}
		console.log(content);
		$('#reviewContent').html(content);
		var itemstar = $('#reviewStarItem').text().split('.');
		var branchstar = $('#reviewStarBranch').text().split('.');
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
		$('.like-img').click(function(){
			if($('.like-img').attr("src")=="/resources/img/emptyheart.png"){
				$('.like-img').attr("src","/resources/img/fullheart.png");
				$.ajax({
					url: "/likeInsert.do", // 클라이언트가 요청을 보낼 서버의 URL 주소

				    data: { likeCount: "홍길동" },                // HTTP 요청과 함께 서버로 보낼 데이터

				    type: "GET",                             // HTTP 요청 방식(GET, POST)

				    dataType: "json"                         // 서버에서 보내줄 데이터의 타입
				});
			}else{
				$('.like-img').attr("src","/resources/img/emptyheart.png");
			}
			
		});
	});
	
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />