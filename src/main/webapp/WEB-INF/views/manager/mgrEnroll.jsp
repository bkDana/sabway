<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	/* 테이블 테두리 black */
	table,th,tr,td{
		border: 1px solid black; 
	}
	/* 글씨 black, 밑줄 제거 */
	a{
		text-decoration: none;
		color:black;
	}
	/* Content 세로 설정 */
	[name=contentTd]{
		height:200px;
	}
</style>
<body>
	<!-- 가맹점 신청 승인 시  -->
	<h1>가맹점 계정 등록</h1>
	<hr>
	<form action="/mgrEnroll.do" method="post">
		<input type="hidden" name="mgrStatus" value="1"><!-- 영업상태: 준비중(Default) -->
		<input type="hidden" name="mgrLevel" value="0"><!-- 0: 가맹점 고정 -->
		<input type="hidden" name="applyName" value="${applyName }"><!-- 신청자 이름 전달용 -->
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mgrId" value="manager${mgrAddr }"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<!-- 비밀번호 기본값 1234 생성 후 각자 변경 -->
				<td><input type="password" name="mgrPw" value="1234" readonly></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mgrName" value="SabWay "></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="mgrTel" value="${mgrTel }" readonly></td>
			</tr>
			<tr style="display:none;">
				<th>우편번호</th>
				<td><input type="text" name="mgrPost" value="04537"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="mgrAddr" value="${mgrAddr }" readonly></td>
			</tr>
		</table>
		<button type="submit">가맹점 등록</button>
		<button type="button"><a href="/admin.do">메인으로</a></button>
	</form>
</body>
</html>