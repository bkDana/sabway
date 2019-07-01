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
				<th>신청자</th><th>연락처</th><th>지역</th><th>신청일</th><th>승인여부</th>
			</tr>
			<c:forEach items="${list }" var="apply">
				<c:if test="${apply.applyStatus eq 0 }">
					<tr>
						<td>${apply.applyName }</td>
						<td>${apply.applyPhone }</td>
						<td>${apply.applyArea }</td>
						<td>${apply.applyDate }</td>
						<!-- 신청 승인여부에 따라 정보 전달 : 0(default),1(승인),2(거절) -->
						<td>
							<!-- 조건절(이름), 승인여부 변경 정보 받아오고 처리해야됨 -->
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
				<th>신청자</th><th>연락처</th><th>지역</th><th>신청일</th><th>승인여부</th>
			</tr>
			<c:forEach items="${list }" var="apply">
				<c:if test="${apply.applyStatus eq 1 || apply.applyStatus eq 2 }">
					<tr id="tr">
						<td>${apply.applyName }</td>
						<td>${apply.applyPhone }</td>
						<td>${apply.applyArea }</td>
						<td>${apply.applyDate }</td>
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
	//승인, 이름을 조건으로 select하고 상태 변경
	$('[name=apply]').click(function(){
		var applyName = $('#applyName').val();
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
							alert("승인 완료");
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
							alert("거절 완료");
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
	/* //거절, 이름을 조건으로 select하고 상태 변경
	$('[name=reject]').click(function(){
		if(confirm("거부하시겠습니까?")){
			var applyName = $('#applyName').val();
			var applyStatus = $('#applyStatus').val();
			$.ajax({
				url : "/reject.do",
				type : "get",
				data : {applyName : applyName , applyStatus : applyStatus},
				dataType : "json",
				success : function(data){
					alert("거절 완료");
					location.href="/managerApply.do";
				},
				error : function(){
					alert("에러발생");
				}
			});
		}
	}); */
</script>
</html>