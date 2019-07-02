<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>본점 관리자 등록</h1>
	<hr>
	<form action="enrollMgr.do" method="post">
		<input type="hidden" name="mgrLevel" value="1">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mgrId" value="admin"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mgrPw" placeholder="비밀번호를 입력하세요."></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mgrName"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="mgrAddr" value="서울시 서초구 강남대로 535 프린스빌딩 15층" readonly></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="mgrTel" value="02-797-5036" readonly></td>
			</tr>
			<tr style="display:none;">
				<th>구분</th>
				<td><input type="text" name="mgrLevel" value="1">본점</td>
			</tr>
			<tr style="display:none;">
				<th>우편번호</th>
				<td><input type="text" name="mgrPost" value="04537"></td>
			</tr>
		</table>
	</form>
</body>
</html>