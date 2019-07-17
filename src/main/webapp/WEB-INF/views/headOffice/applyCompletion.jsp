<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->
<title>가맹점 신청</title>
</head>
<style>
	.pageNavi{
		color:black;
		text-align:center;
		margin-top:35px;
		font-size: 20px;
		font-weight: bold;
	}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 매장관리 > 가맹점 처리 목록</div>
		<h1 class="comm-content-tit">처리된 목록</h1>
		<table class="comm-tbl">
			<tr>
				<th>신청자</th><th>제목</th><th>연락처</th><th>지역</th><th>신청일</th><th>승인여부</th>
			</tr>
				<c:forEach items="${cpd.applyList }" var="apply">
					<!-- 가맹점 신청(status == 1or2)인 경우 출력 -->
					<c:if test="${apply.applyStatus eq 1 || apply.applyStatus eq 2 }">
						<tr>
							<td style="display:none;" name="applyNo">${apply.applyNo }1</td>
							<td name="applyName">${apply.applyName }</td>
							<!-- 해달 게시글 상세보기 -->
							<td><a href="/applyView.do?applyNo=${apply.applyNo }">${apply.applyTitle }</a></td>
							<td>${apply.applyPhone }</td>
							<td name="applyArea">${apply.applyArea }</td>
							<td>${apply.applyDate }</td>
							<!-- status에 따라 한글로 변환 1(승인),2(거절) -->
							<td>
								<c:if test="${apply.applyStatus == 1 }">
									승인
								</c:if>
								<c:if test="${apply.applyStatus == 2 }">
									거절
								</c:if>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			<c:if test="${cpd.totalCount <= 0 }">
				<tr>
					<td>신청 목록이 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<div class="pageNavi">
			${cpd.pageNavi }
		</div>
		<div class="common-tbl-btn-group">
			<button class="btn-style2" style="font-size:15px;" id="applyLink">신청 목록</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn-style2" style="font-size:15px;" id="adminLink">목록으로</button>
		</div>
	</div>
</section>
<script type="text/javascript">
	//신청 목록으로 이동
	$('#applyLink').click(function(){
		location.href="managerApply.do?currentPage=''";
	});
	//목록으로 이동
	$("#adminLink").click(function(){
		location.href="/admin.do";
	});
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />