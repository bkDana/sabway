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
		font-size: 15px;
		font-weight: bold;
	}
	/* form ::: search */
   .form_searchM {border:2px solid #dddddd; height:41px;width:15%; display:block; vertical-align:middle; position:relative; padding-right:42px; }
   .form_searchM input{border:0; height:41px; width:100%; text-indent:14px; color:#292929; font-size:16px;}
   .form_searchM input::placeholder{color:#bbbbbb; font-size:16px;font-family:font_ns, sans-serif;}
   .form_searchM .btn_searchM{background:url(http://subway.co.kr/images/common/icon_search.png) 50% 50% no-repeat; width:41px; height:41px; position:absolute; right:0; top:0;}
   .form_searchM .btn_searchM:after{content:''; position:absolute; left:-2px; top:13px; width:2px; height:16px; background-color:#e5e5e5;}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 매장관리 > 가맹점 처리 목록</div>
		<h1 class="comm-content-tit">처리된 목록</h1>
		<table class="comm-tbl" style="max-width: 100%;">
			<tr>
				<th>신청자</th><th>제목</th><th>연락처</th><th>지역</th><th>신청일</th><th>승인여부</th>
			</tr>
			<c:if test="${cpd.totalCount > 0 }">
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
			</c:if>
			<c:if test="${cpd.totalCount <= 0 }">
				<tr>
					<td>신청 목록이 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<c:if test="${cpd.totalCount <= 0 }">
			<div class="pageNavi">1</div>
		</c:if>
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