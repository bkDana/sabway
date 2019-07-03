<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="content-wrapper">
	<center>
		<h1>가맹신청/문의</h1>
		<form action="/insertApply.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td><label for="applyName">이름</label></td>
					<td><input type="text" id="applyName" name="applyName" maxlength="16" style="width:1000px"></td>
				</tr>
				<tr>
					<td><label for="applyPhone">연락처</label></td>
					<td><input type="text" id="applyPhone" name="applyPhone" maxlength="16" style="width:1000px"></td>
				</tr>
				<tr>
			    	<td>
			        	<label for="email">E-Mail</label>
			        </td>
			       	<td>
			        	<input class="inputBox" type="text" id="email" name="email"  maxlength="20">@
			               
			            <input class="inputBox" type="text" id="email2" name="email2" maxlength="20">
			               
			            <select name="emailEx" id="emailEx" style="width:100px; height:20px">
				            <option value="">직접입력</option>
				            <option value="naver.com">naver.com</option>
				            <option value="hanmail.net">hanmail.net</option>
				            <option value="gmail.com">gmail.com</option>
			       		</select>
			                <button type="button" id="emailChk">중복확인안돼</button>
			    	</td>            
				</tr>
				<tr>
					<td><label for="applyArea">지역</label></td>
					<td>
						<select name="applyArea1" id="applyArea1">
							<option value="">시/도</option>
							<option value="서울특별시">서울특별시</option>
							<option value="경기도">경기도</option>
							<option value="인천광역시">인천광역시</option>
							<option value="대전광역시">대전광역시</option>
							<option value="세종특별자치시">세종특별자치시</option>
							<option value="충청남도">충청남도</option>
							<option value="경상남도">경상남도</option>
							<option value="울산광역시">울산광역시</option>
							<option value="부산광역시">부산광역시</option>
							<option value="대구광역시">대구광역시</option>
							<option value="제주특별자치도">제주특별자치도</option>
							<option value="전라북도">전라북도</option>
							<option value="충청북도">충청북도</option>
							<option value="광주광역시">광주광역시</option>
							<option value="전라남도">전라남도</option>
							<option value="경상북도">경상북도</option>
							<option value="강원도">강원도</option>
						</select>
						<select name="applyArea2">
							<option value="">시/군/구</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="applyTitle">제목</label></td>
					<td><input type="text" id="applyTitle" name="applyTitle" maxlength="16" style="width:1000px"></td>
				</tr>
				<tr>
					<td><label for="applyContent">내용</label></td>
					<td>
					<textarea name="applyContent" id="applyContent" rows="3" cols="40" style="width:1050px;overflow:visible"></textarea>
					</td>
				</tr>
				<tr>
					<td><label for="applyFilename">첨부파일</label></td>
					<td>
						<input data-maxsize="2" data-maxupload="1" id="applyFilename" name="applyFilename"type="file" />
						<span class="file_note">※ 등록 가능 확장자 : pdf,docx,pptx,xlsx,jpg,gif,png / 최대 2MB</span>
					</td>
				</tr>
				<tr style="text-align: center;">
					<th colspan="2">
						<button type="submit" class="btn btn-outline-primary" style="color: #f69b02;border-color: #f69b02">등록하기</button>
					</th>
				</tr>
			</table>
			
		</form>
	</center>
	</section>
</body>
<script>
	$(document).ready(function(){
		$("#applyArea1").change(function(){
			var area = $("#applyArea1 option:selected").val()
			console.log(area);
			if(area == "서울특별시"){
				$("#applyArea2").append("<option value='강남구'>강남구</option>");
			}	
		})
	})
			
	
	
	
	
</script>
</html>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />



