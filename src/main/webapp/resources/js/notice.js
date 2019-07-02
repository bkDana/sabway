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
		location.href="/notice.do";
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
});