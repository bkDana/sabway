/* *******************************************************
 * filename : admin-notice.js
 * description : admin-notice List뷰
 * date : 2019-07-17
******************************************************** */

$(document).ready(function(){
	/* ********
	 * 공지사항
	********* */
	$(".move-one-notice").css('cursor','pointer');
	$(".move-one-notice").click(function(){
		var noticeNo = $(this).data('idx');
		location.href="/board/noticeOne.do?noticeNo="+noticeNo;
	});
	$(".move-pn-notice").click(function(){
		var noticeNo = $(this).prev().text();
		location.href="/board/noticeOne.do?noticeNo="+noticeNo;
	});
	$(".move-all-notice").click(function(){
		location.href="/board/boardList.do?type=notice";
	});
	$(".insert-notice").click(function(){
		location.href="/board/moveNoticeInsert.do";
	});
	$(".move-update-notice").click(function(){
		var noticeNo = $('th').eq(0).text();
		location.href="/board/moveNoticeUpdate.do?noticeNo="+noticeNo;
	});
	$(".update-notice").click(function(){
		location.href="/board/noticeUpdate.do";
	});
	$(".move-delete-notice").click(function(){
		var noticeNo = $('th').eq(0).text();
		location.href="/board/noticeDelete.do?noticeNo="+noticeNo;
	});
	
	/* ********
	 * Q&A
	********* */
	$(".move-one-qna").css('cursor','pointer');
	$(".move-one-qna").click(function(){
		var qnaNo = $(this).prev().text();
		location.href="/board/qnaOne.do?qnaNo="+qnaNo;
	});
	$(".move-pn-qna").click(function(){
		var qnaNo = $(this).prev().text();
		location.href="/board/qnaOne.do?qnaNo="+qnaNo;
	});
	$(".move-all-qna").click(function(){
		location.href="/board/boardList.do?type=qna";
	});
	$(".insert-qna").click(function(){
		location.href="/board/moveQnaInsert.do";
	});
	$(".move-update-qna").click(function(){
		var qnaNo = $('th').eq(0).text();
		location.href="/board/moveQnaUpdate.do?qnaNo="+qnaNo;
	});
	$(".update-qna").click(function(){
		location.href="/board/qnaUpdate.do";
	});
	$(".move-delete-qna").click(function(){
		var qnaNo = $('th').eq(0).text();
		location.href="/board/qnaDelete.do?qnaNo="+qnaNo;
	});
	$('#fileDelete').click(function(){
		$('#fileStatus').val('1');
		$(this).text("삭제완료");
	});
	
	
	/* ********
	 * 리뷰
	********* */
	$(".move-one-review").css('cursor','pointer');
	$(".move-one-review").click(function(){
		var reviewNo = $(this).prev().prev().text();
		location.href="/board/reviewOne.do?reviewNo="+reviewNo;
	});
	$(".move-pn-review").click(function(){
		var reviewNo = $(this).prev().text();
		location.href="/board/reviewOne.do?reviewNo="+reviewNo;
	});
	$(".move-all-review").click(function(){
		location.href="/board/boardList.do?type=review";
	});
	$(".insert-review").click(function(){
		location.href="/board/moveReviewInsert.do";
	});
	$(".move-update-review").click(function(){
		var reviewNo = $('th').eq(0).text();
		location.href="/board/moveReviewUpdate.do?reviewNo="+reviewNo;
	});
	$(".update-review").click(function(){
		location.href="/board/reviewUpdate.do";
	});
	$(".move-delete-review").click(function(){
		var reviewNo = $('th').eq(0).text();
		location.href="/board/reviewDelete.do?reviewNo="+reviewNo;
	});
	
	$('#fileDelete').click(function(){
		$('#fileStatus').val('1');
		$(this).text("삭제완료");
	});
});