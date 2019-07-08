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
	$(".move-qna-notice").click(function(){
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
	
});