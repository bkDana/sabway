<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<script type="text/javascript" src="/resources/js/admin-notice.js"></script>
<script type="text/javascript" src="/resources/js/search.js"></script>

<%-- Content --%>
<section id="content-wrapper" class="clearfix">

	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 게시판관리 > Q&A/신고</div>
			
		<div class="board-search-box order-search">
			<form action="/board/boardList.do" method="post" name="search">
				<input type="hidden" name="reqPage" value="1">
				<input type="hidden" name="type" value="${search.type }">
				<input type="hidden" name="orderBy" value="${search.orderBy }">

				<select name="searchType" data-val="${search.searchType }">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input placeholder="검색어를 입력해주세요." type="search" name="searchVal" class="search-word" value="${search.searchVal }">
				<button type="submit" class="bbs-search-btn" title="검색"><img src="/resources/img/icon_search.png"></button>

			</form>
		</div>
		<br>
		<p class="order-list-comment">
			<select id="order" data-val="${search.orderBy }">
				<option value="new">최신등록순</option>
				<option value="old">오래된...순</option>
			</select>
		</p>
		
		<table class="comm-tbl type2">
			<colgroup>
				<col width="3%">
				<col width="5%">
				<col width="7%">
				<col width="10%">
				<col width="/">
				<col width="10%">
			</colgroup>
			<tr>
				<th><input type="checkbox" class="allcbox"></th>
				<th>번호</th>
				<th>카테고리</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty pd.qnaList }">
				<tr><td colspan="5">검색 결과가 없습니다.</td></tr>
			</c:if>
			<c:forEach items="${pd.qnaList}" var="qna">
				<tr class="normal">
					<td><input type="checkbox" class="cbox" data-idx="${qna.qnaNo }"></td>
					<td>${qna.rnum }</td>
					<td>${qna.qnaCategory }</td>
					<td>${qna.qnaWriter }</td>
					<td style="display:none;">${qna.qnaNo }</td>
					<td class="move-one-qna">${qna.qnaTitle }</td>
					<td>${qna.qnaDate }</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 관리자는 작성이 필요없지 않을까요?
		<div class="common-tbl-btn-group" style="text-align: right;">
			<button class="btn-style2 insert-qna">작성하기</button>
		</div>
		 -->
		 <div class="common-tbl-btn-group" style="text-align: right;">
			<button class="btn-style3" id="del-button">삭제</button>
		</div>
		
		<div class="paging">${pd.pageNavi }</div>
	</div>
</section>


<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />