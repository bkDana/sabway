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
		<div class="sub-menu">※ 매장관리 > 가맹점 신청 목록</div>
		<h1 class="comm-content-tit">신청 목록</h1>
		<table class="comm-tbl" style="max-width: 100%;">
			<tr>
				<th>신청자</th><th>제목</th><th>연락처</th><th>지역</th><th>신청일</th><th>승인여부</th>
			</tr>
			<c:if test="${pd.totalCount > 0 }">
				<c:forEach items="${pd.applyList }" var="apply">
					<!-- 가맹점 신청(status == 0)인 경우 출력 -->
					<c:if test="${apply.applyStatus eq 0 }">
						<tr>
							<td style="display:none;" name="applyNo">${apply.applyNo }</td>
							<td name="applyName">${apply.applyName }</td>
							<!-- 해달 게시글 상세보기 -->
							<td><a href="/applyView.do?applyNo=${apply.applyNo }">${apply.applyTitle }</a></td>
							<td>${apply.applyPhone }</td>
							<td name="applyArea">${apply.applyArea }</td>
							<td>${apply.applyDate }</td>
							<!-- 신청 승인여부에 따라 정보 전달 : 0(default:신청),1(승인),2(거절) -->
							<td>
								<!-- 승인/거절 클릭하면 applyName(공통), applyStatus(개별) 전달 -->
								<a href="#" name="apply">
									승인
									<input type="hidden" name="applyStatus" value=1>
								</a>
								/
								<a href="#" name="reject">
									거절
									<input type="hidden" name="rejectStatus" value=2>
								</a>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${pd.totalCount <= 0 }">
				<tr>
					<td colspan="6" style="text-align:center;font-size:15px;">신청 목록이 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<c:if test="${pd.totalCount <= 0 }">
			<div class="pageNavi">1</div>
		</c:if>
		<div class="pageNavi">
			${pd.pageNavi }
		</div>
		<div class="common-tbl-btn-group">
			<button class="btn-style2" style="font-size:15px;" id="completionLink">처리된 목록</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn-style2" style="font-size:15px;" id="adminLink">목록으로</button>
		</div>
	</div>
</section>
<script type="text/javascript">
	//처리된 목록으로 이동
	$('#completionLink').click(function(){
		location.href="applyCompletion.do?currentPage=''";
	});
	//승인 클릭 시 applyName과 applyArea를 enrollMgr.do에 전달
	//MgrService의 enrollMgr 메소드에서 ApplyDao의 applyManagerUpdate 메소드 태워서 승인(applyStatus의 값 1로 변경) 처리
	//승인
	$('[name=apply]').click(function(){
		var applyArea = $(this).parent().prev().prev().html();
		var applyName = $(this).parent().parent().children().eq(1).html();
		var applyNo = $(this).parent().parent().children().eq(0).html();
		location.href="/enrollMgr.do?applyArea="+applyArea+"&applyName="+applyName+"&applyNo="+applyNo;
	});
	//거절 클릭 시 /apply.do"로 applyName과 applyStatus전달
	$('[name=reject]').click(function(){
		var applyName = $(this).parent().parent().children().eq(1).html();
		var applyStatus = $(this).children().val();
		var applyNo = $(this).parent().parent().children().eq(0).html();
		if(applyStatus == 2) {
			if(confirm("거절하시겠습니까?")){
				$.ajax({
					url : "/apply.do",
					type : "get",
					data : {applyName:applyName , applyStatus:applyStatus , applyNo:applyNo},
					dataType : "json",
					success : function(data){
						if(data.result == 0){
							alert("수정 완료.");
						}
					},
					error : function(){
						alert("에러발생. 다시 시도해주세요.");
					}
				});
			}
		}
	});
	//목록으로 이동
	$("#adminLink").click(function(){
		location.href="/admin.do";
	});
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />