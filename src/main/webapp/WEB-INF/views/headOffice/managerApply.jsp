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
<body>
	<fieldset>
		<legend>
			<h1>신청 목록</h1>
		</legend>
		<table>
			<tr>
				<th>신청자</th><th>연락처</th><th>지역</th><th>신청일</th><th>승인여부</th>
			</tr>
			<%-- <c:forEach items="" var=""> --%>
			<c:if test="status==0">
				<tr>
					<td>신청자</td>
					<td>연락처</td>
					<td>지역</td>
					<td>2019-06-28</td>
					<!-- 신청 승인여부에 따라 정보 전달 : 0(default),1(승인),2(거절) -->
					<td>
						<!-- 조건절(이름), 승인여부 변경 정보 받아오고 처리해야됨 -->
						<button type="button" name="apply" value="승인">승인</button>
						<input type="hidden" id="name" value="이름">
						/
						<button type="button" name="reject" value="거절">거절</button>
						<input type="hidden" id="status" value=2>
					</td>
				</tr>
			</c:if>
			<%-- </c:forEach> --%>
		</table>
	</fieldset>
		<fieldset>
		<legend>
			<h1>처리한 목록</h1>
		</legend>
		<table>
			<tr>
				<th>신청자2</th><th>연락처2</th><th>지역2</th><th>신청일2</th>
			</tr>
			<%-- <c:forEach items="" var=""> --%>
			<c:if test="status!=0">
				<tr>
					<td>신청자2</td>
					<td>연락처2</td>
					<td>지역2</td>
					<td>2019-06-28</td>
				</tr>
			</c:if>
			<%-- </c:forEach> --%>
		</table>
	</fieldset>
</body>
<!-- 페이지 전환 없이 승인/거부 -->
<script type="text/javascript">
	//승인, 이름을 조건으로 select하고 상태 변경
	$('[name=apply]').click(function(){
		var name = $('#name').val();
		if(confirm("승인하시겠습니까?")){
			$.ajax({
				url : "/apply.do",
				type: "get",
				data : {name : name},
				dataType : "json",
				success : function(data){
					if(data.result == 0){
						alert("승인 완료");
					}else{
						alert("실패");
					}
				},
				error : function(){
					alert("에러발생");
					location.href="/promotionSelect.do";
				}
			});
		}
	});
	//거절, 이름을 조건으로 select하고 상태 변경
	$('[name=reject]').click(function(){
		if(confirm("거부하시겠습니까?")){
			var status = $('#status').val();
			$.ajax({
				url : "/reject.do",
				type : "get",
				data : {status : status},
				dataType : "json",
				success : function(data){
					alert("거절 완료");
				},
				error : function(){
					alert("에러발생");
					location.href="/promotionSelect.do";
				}
			});
		}
	});
</script>
</html>