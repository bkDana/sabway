/* *******************************************************
 * filename : notice.js
 * description : notice List뷰
 * date : 2019-06-28
******************************************************** */

$(document).ready(function(){
	$(".move-one-notice").click(function(){
		var noticeNo = $(this).prev().text();
		location.href="/noticeOne.do?noticeNo="+noticeNo;
	});
	$(".move-pn-notice").click(function(){
		var noticeNo = $(this).prev().text();
		location.href="/noticeOne.do?noticeNo="+noticeNo;
	});
	$(".move-all-notice").click(function(){
		location.href="/notice.do?currentPage=1";
	});
	$(".insert-notice").click(function(){
		location.href="/moveNoticeInsert.do";
	});
	$(".move-update-notice").click(function(){
		var noticeNo = $('th').eq(0).text();
		location.href="/moveNoticeUpdate.do?noticeNo="+noticeNo;
	});
	$(".update-notice").click(function(){
		location.href="/noticeUpdate.do";
	});
	$(".move-delete-notice").click(function(){
		var noticeNo = $('th').eq(0).text();
		location.href="/noticeDelete.do?noticeNo="+noticeNo;
	});
	//QNA 부분
	$(".move-one-qna").click(function(){
		var qnaNo = $(this).prev().text();
		location.href="/qnaOne.do?qnaNo="+qnaNo;
	});
	$(".move-pn-qna").click(function(){
		var qnaNo = $(this).prev().text();
		location.href="/qnaOne.do?qnaNo="+qnaNo;
	});
	$(".move-all-qna").click(function(){
		location.href="/qna.do?currentPage=1";
	});
	$(".insert-qna").click(function(){
		location.href="/moveQnaInsert.do";
	});
	$(".move-update-qna").click(function(){
		var qnaNo = $('th').eq(0).text();
		location.href="/moveQnaUpdate.do?qnaNo="+qnaNo;
	});
	$(".update-qna").click(function(){
		location.href="/qnaUpdate.do";
	});
	$(".move-delete-qna").click(function(){
		var qnaNo = $('th').eq(0).text();
		location.href="/qnaDelete.do?qnaNo="+qnaNo;
	});
	$('#fileDelete').click(function(){
		$('#fileStatus').val('1');
		$(this).text("삭제완료");
	});
	///////review Part
	$(".move-one-review").click(function(){
		var reviewNo = $(this).prev().prev().text();
		location.href="/reviewOne.do?reviewNo="+reviewNo;
	});
	$(".move-pn-review").click(function(){
		var reviewNo = $(this).prev().text();
		location.href="/reviewOne.do?reviewNo="+reviewNo;
	});
	$(".move-all-review").click(function(){
		location.href="/review.do?currentPage=1";
	});
	$(".insert-review").click(function(){
		location.href="/moveReviewInsert.do";
	});
	$(".move-update-review").click(function(){
		var reviewNo = $('th').eq(0).text();
		location.href="/moveReviewUpdate.do?reviewNo="+reviewNo;
	});
	$(".update-review").click(function(){
		location.href="/reviewUpdate.do";
	});
	$(".move-delete-review").click(function(){
		var reviewNo = $('th').eq(0).text();
		location.href="/reviewDelete.do?reviewNo="+reviewNo;
	});
	
	$('#fileDelete').click(function(){
		$('#fileStatus').val('1');
		$(this).text("삭제완료");
	});
});