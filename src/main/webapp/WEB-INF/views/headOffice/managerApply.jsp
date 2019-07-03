<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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
<body>
	<fieldset>
		<legend>
			<h1>신청 목록</h1>
		</legend>
		<table>
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
						<!-- 신청 승인여부에 따라 정보 전달 : 0(default),1(승인),2(거절) -->
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
	</fieldset>
	<fieldset>
		<legend>
			<h1>처리한 목록</h1>
		</legend>
		<table>
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
	</fieldset>
</body>
<!-- 페이지 전환 없이 승인/거부 -->
<script type="text/javascript">
	//승인||거절 클릭 시 name과 status를 apply.do에 전달, status 값에 따라 메소드를 따로 태움  
	//승인
	$('[name=apply]').click(function(){
		var applyArea = $(this).parent().prev().prev().html();
		var applyName = $(this).parent().parent().children().html();
		var applyStatus = $('[name=applyStatus]').val();
		if(applyStatus == 1){
			if(confirm("승인하시겠습니까?")){
				$.ajax({
					url : "/apply.do",
					type: "get",
					data : {applyName:applyName , applyStatus:applyStatus},
					dataType : "json",
					success : function(data){
						if(data.result == 0){
							$(document).ready(function(){
								location.href="/enrollMgr.do?applyArea="+applyArea;
							})
						}
					},
					error : function(){
						alert("에러발생");
					}
				});
			}
		}
	});
	//거절
	$('[name=reject]').click(function(){
		var applyName = $('#applyName').val();
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
</html>