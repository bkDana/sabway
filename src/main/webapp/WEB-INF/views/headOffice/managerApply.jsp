<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->
<title>가맹점 신청</title>
</head>

<style>
	/* 테이블 테두리 black, 가운데정렬 */
	table,th,tr,td{
		border: 1px solid black; 
		text-align: center;
	}
	/* 글씨 black, 밑줄 제거 */
	a{
		text-decoration: none;
		color:black;
	}
</style>

<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<div class="common-tbl-box">
			<h1 class="comm-content-tit">신청 목록</h1>
			<table class="comm-tbl">
				<tr>
					<th>신청자</th><th>제목</th><th>연락처</th><th>지역</th><th>신청일</th><th>승인여부</th>
				</tr>
				<c:forEach items="${list }" var="apply">
					<!-- 가맹점 신청(status == 0)인 경우 출력 -->
					<c:if test="${apply.applyStatus eq 0 }">
						<tr>
							<td name="applyName">${apply.applyName }</td>
							<!-- 해달 게시글 상세보기 -->
							<td><a href="/applyView.do?applyNo=${apply.applyNo }">${apply.applyTitle }</a></td>
							<td>${apply.applyPhone }</td>
							<td name="applyArea">${apply.applyArea }</td>
							<td>${apply.applyDate }</td>
							<!-- 신청 승인여부에 따라 정보 전달 : 0(default:신청),1(승인),2(거절) -->
							<td>
								<!-- 승인/거절 클릭하면 applyName(공통), applyStatus(개별) 전달 -->
								<input type="hidden" id="applyName" value="${apply.applyName }">
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
			</table>
			<br><br><hr>
			<h1 class="comm-content-tit">처리한 목록</h1>
			<table class="comm-tbl">
				<tr>
					<th>신청자</th><th>제목</th><th>연락처</th><th>지역</th><th>신청일</th><th>승인여부</th>
				</tr>
				<c:forEach items="${list }" var="apply">
					<!-- 승인/거절(status==1or2) 되면 테이블 출력 위치 변경 -->
					<c:if test="${apply.applyStatus eq 1 || apply.applyStatus eq 2 }">
						<tr id="tr">
							<td>${apply.applyName }</td>
							<td>${apply.applyTitle }</td>
							<td>${apply.applyPhone }</td>
							<td>${apply.applyArea }</td>
							<td>${apply.applyDate }</td>
							<!-- 상태값을 가져와서 승인/거절로 출력 -->
							<c:if test="${apply.applyStatus eq 1 }">
								<td>승인</td>
							</c:if>
							<c:if test="${apply.applyStatus eq 2 }">
								<td>거절</td>
							</c:if>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</section>
<!-- 페이지 전환 없이 승인/거부 -->
<script type="text/javascript">
	//승인 클릭 시 applyName과 applyArea를 enrollMgr.do에 전달
	//MgrService의 enrollMgr 메소드에서 ApplyDao의 applyManagerUpdate 메소드 태워서 승인(applyStatus의 값 1로 변경) 처리
	//승인
	$('[name=apply]').click(function(){
		var applyArea = $(this).parent().prev().prev().html();
		var applyName = $(this).parent().parent().children().html();
		location.href="/enrollMgr.do?applyArea="+applyArea+"&applyName="+applyName;
	});
	//거절 클릭 시 /apply.do"로 applyName과 applyStatus전달
	$('[name=reject]').click(function(){
		var applyName = $(this).parent().parent().children().html();
		var applyStatus = $('[name=rejectStatus]').val();
		if(applyStatus == 2) {
			if(confirm("거절하시겠습니까?")){
				$.ajax({
					url : "/apply.do",
					type : "get",
					data : {applyName:applyName , applyStatus:applyStatus},
					dataType : "json",
					success : function(data){
						if(data.result == 0){
							location.href="/managerApply.do";
						}
					},
					error : function(){
						alert("에러발생");
					}
				});
			}
		}
	});
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />