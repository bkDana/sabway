<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<script type="text/javascript" src="/resources/js/admin-notice.js"></script>
<%-- Content --%>
<style>
	.move-pn-qna:hover,.move-all-qna:hover{
		cursor: pointer;
		color: #ffce32;
	}
</style>
<section id="content-wrapper" class="clearfix">
	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 게시판관리 > <a href="/board/boardList.do?type=qna">Q&A/신고</a></div>
		
		<div class="common-tbl-box">
			<table class="comm-tbl">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="60%">
					<col width="20%">
				</colgroup>
			 	<c:forEach items="${qnaList }" var="qna" varStatus="status">
			 		<c:if test="${qna.qnaNo eq qnaNo }">
			 		<c:set var = "currentIndex" value = "${status.index}"/>
						<tr>
							<th style="display:none;">${qna.qnaNo }</th>
							<th>${qna.qnaCategory }</th>
							<th>${qna.qnaWriter }</th>
							<th>${qna.qnaTitle }</th>
							<th>${qna.qnaDate }</th>
						</tr>
						<c:if test="${qna.filepath != null }">
							<c:forTokens items="${qna.filepath}" delims="," var="item">
								<tr>
									<td colspan="4">
										<img width="100%" src="/resources/upload/${item}">
									</td>
								</tr>
							</c:forTokens>
						</c:if>
						<tr>
							<td colspan="4">${qna.qnaContent }</td>
						</tr>
						<c:if test="${not empty qna.qnaComment }">
							<tr>
								<th>답변</th><td colspan="3">${qna.qnaComment }</td>
							</tr>
						</c:if>
						<c:if test="${empty qna.qnaComment }">
							<tr>
								<td colspan="4"><textarea name="qnaCommentContent" ></textarea><button type="button" class="add-btn" id="addComment">등록</button></td>
							</tr>
						</c:if>
					</c:if>
				</c:forEach>
				
			</table>

			<div class="common-tbl-btn-group">
				<button class="btn-style2 small move-all-qna">목록으로</button>
				<button class="btn-style2 small move-delete-qna">삭제하기</button>
			</div>
			
			<br><br>
			<table class="comm-tbl">
				<colgroup>
					<col width="15%">
					<col width="/">
				</colgroup>
			 	<c:forEach items="${qnaList }" var="qna" varStatus="status">
					<c:if test="${status.index eq currentIndex-1 }">
						<tr>
							<td style="display:none;">${qna.qnaNo }</td>
							<td colspan="2" class="move-pn-qna">
								△이전글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${qna.qnaTitle }
							</td>
						</tr>
					</c:if>
					<c:if test="${status.index eq currentIndex+1 }">
						<tr>
							<td style="display:none;">${qna.qnaNo }</td>
							<td colspan="2" class="move-pn-qna">
								▽다음글&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${qna.qnaTitle }
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</section>

<script>
$('#addComment').click(function(){
	var qnaComment = $('textarea[name=qnaCommentContent]').val();
	console.log(qnaComment);
	
	var qnaNo = '${param.qnaNo}';
	$.ajax({
		url : '/board/addComment.do',
		type : 'post',
		data : {qnaNo:qnaNo,qnaComment:qnaComment},
		dataType : 'json',
		success : function(res){
			if(res=='성공'){
				alert('답변 등록 완료');
				window.location.reload();
			}else{
				alert('답변 등록 실패');
			}
		},
		error : function(){
			console.log('실패');
		}
	});
	
});
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />