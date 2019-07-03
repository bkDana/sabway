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
						<select name="applyArea2" id="applyArea2">
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

























//지역 selectBox
	$(document).ready(function(){
		$("#applyArea1").change(function(){
		console.log($(this).val())
			
		 	if($(this).val() == "서울특별시"){
		 		$("#applyArea2").find("option").remove();
		 		$("#applyArea2").append("<option value=''>시/군/구</option>");
				$("#applyArea2").append("<option value='강남구'>강남구</option>");
				$("#applyArea2").append("<option value='강동구'>강동구</option>");
				$("#applyArea2").append("<option value='강북구'>강북구</option>");
				$("#applyArea2").append("<option value='강북구'>강서구</option>");
				$("#applyArea2").append("<option value='강북구'>구로구</option>");
				$("#applyArea2").append("<option value='강북구'>금천구</option>");
				$("#applyArea2").append("<option value='강북구'>노원구</option>");
				$("#applyArea2").append("<option value='강북구'>도봉구</option>");
				$("#applyArea2").append("<option value='강북구'>동대문구</option>");
				$("#applyArea2").append("<option value='강북구'>동작구</option>");
				$("#applyArea2").append("<option value='강북구'>마포구</option>");
				$("#applyArea2").append("<option value='강북구'>서초구</option>");
				$("#applyArea2").append("<option value='강북구'>성동구</option>");
				$("#applyArea2").append("<option value='강북구'>성북구</option>");
				$("#applyArea2").append("<option value='강북구'>송파구</option>");
				$("#applyArea2").append("<option value='강북구'>양천구</option>");
				$("#applyArea2").append("<option value='강북구'>영등포구</option>");
				$("#applyArea2").append("<option value='강북구'>용산구</option>");
				$("#applyArea2").append("<option value='강북구'>은평구</option>");
				$("#applyArea2").append("<option value='강북구'>종로구</option>");
				$("#applyArea2").append("<option value='강북구'>중구</option>");
				$("#applyArea2").append("<option value='강북구'>중랑구</option>");
				
				
			}
		 	
		 	else if($(this).val() == "경기도"){
		 		
				$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
				$("#applyArea2").append("<option value='가평군'>가평군</option>");
				$("#applyArea2").append("<option value='덕양구'>고양시 덕양구</option>");
				$("#applyArea2").append("<option value='일산동구'>고양시 일산동구</option>");
				$("#applyArea2").append("<option value='일산서구'>고양시 일산서구</option>");
				$("#applyArea2").append("<option value='과천시'>과천시</option>");
				$("#applyArea2").append("<option value='광명시'>광명시</option>");
				$("#applyArea2").append("<option value='광주시'>광주시</option>");
				$("#applyArea2").append("<option value='구리시'>구리시</option>");
				$("#applyArea2").append("<option value='군포시'>군포시</option>");
				$("#applyArea2").append("<option value='김포시'>김포시</option>");
				$("#applyArea2").append("<option value='남양주시'>남양주시</option>");
				$("#applyArea2").append("<option value='동두천시'>동두천시</option>");
				$("#applyArea2").append("<option value='부천시'>부천시</option>");
				$("#applyArea2").append("<option value='분당구'>성남시 분당구</option>");
				$("#applyArea2").append("<option value='수정구'>성남시 수정구</option>");
				$("#applyArea2").append("<option value='중원구'>성남시 중원구</option>");
				$("#applyArea2").append("<option value='권선구'>수원시 권선구</option>");
				$("#applyArea2").append("<option value='영통구'>수원시 영통구</option>");
				$("#applyArea2").append("<option value='장안구'>수원시 장안구</option>");
				$("#applyArea2").append("<option value='팔달구'>수원시 팔달구</option>");
				$("#applyArea2").append("<option value='시흥시'>시흥시</option>");
				$("#applyArea2").append("<option value='단원구'>안산시 단원구</option>");
				$("#applyArea2").append("<option value='상록구'>안산시 상록구</option>");
				$("#applyArea2").append("<option value='안성시'>안성시</option>");
				$("#applyArea2").append("<option value='만안구'>안양시 만안구</option>");
				$("#applyArea2").append("<option value='동안구'>안양시 동안구</option>");
				$("#applyArea2").append("<option value='양주시'>양주시</option>");
				$("#applyArea2").append("<option value='양평군'>양평군</option>");
				$("#applyArea2").append("<option value='여주시'>여주시</option>");
				$("#applyArea2").append("<option value='연천군'>연천군</option>");
				$("#applyArea2").append("<option value='오산시'>오산시</option>");
				$("#applyArea2").append("<option value='팔달구'>수원시 팔달구</option>");
				$("#applyArea2").append("<option value='기흥구'>용인시 기흥구</option>");
				$("#applyArea2").append("<option value='수지구'>용인시 수지구</option>");
				$("#applyArea2").append("<option value='처인구'>용인시 처인구</option>");
				$("#applyArea2").append("<option value='의왕시'>의왕시</option>");
				$("#applyArea2").append("<option value='의정부시'>의정부시</option>");
				$("#applyArea2").append("<option value='이천시'>이천시</option>");
				$("#applyArea2").append("<option value='파주시'>파주시</option>");
				$("#applyArea2").append("<option value='평택시'>평택시</option>");
				$("#applyArea2").append("<option value='포천시'>포천시</option>");
				$("#applyArea2").append("<option value='하남시'>하남시</option>");
				$("#applyArea2").append("<option value='화성시'>화성시</option>");

			}
			
		 	else if($(this).val() == "인천광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강화군'>강화군</option>");
				$("#applyArea2").append("<option value='계양구'>계양구</option>");
				$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='남동구'>남동구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='부평구'>부평구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='연수구'>연수구</option>");
				$("#applyArea2").append("<option value='옹진군'>옹진군</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
		 	}

		 	else if($(this).val() == "대전광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='대덕구'>대덕구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='유성구'>유성구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
				
		 	}

		 	else if($(this).val() == "충청남도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='계룡시'>계룡시</option>");
				$("#applyArea2").append("<option value='공주시'>공주시</option>");
				$("#applyArea2").append("<option value='금산군'>금산군</option>");
				$("#applyArea2").append("<option value='논산시'>논산시</option>");
				$("#applyArea2").append("<option value='당진시'>당진시</option>");
				$("#applyArea2").append("<option value='보령시'>보령시</option>");
				$("#applyArea2").append("<option value='부여군'>부여군</option>");
				$("#applyArea2").append("<option value='서산시'>서산시</option>");
				$("#applyArea2").append("<option value='서천군'>서천군</option>");
				$("#applyArea2").append("<option value='아산시'>아산시</option>");
				$("#applyArea2").append("<option value='예산군'>예산군</option>");
				$("#applyArea2").append("<option value='천안시 동남구'>천안시 동남구</option>");
				$("#applyArea2").append("<option value='천안시 서북구'>천안시 서북구</option>");
				$("#applyArea2").append("<option value='청양군'>청양군</option>");
				$("#applyArea2").append("<option value='태안군'>태안군</option>");
				$("#applyArea2").append("<option value='홍성군'>홍성군</option>");
				
		 	}

		 	else if($(this).val() == "경상남도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='거제시'>거제시</option>");
				$("#applyArea2").append("<option value='거창군'>거창군</option>");
				$("#applyArea2").append("<option value='고성군'>고성군</option>");
				$("#applyArea2").append("<option value='김해시'>김해시</option>");
				$("#applyArea2").append("<option value='남해군'>남해군</option>");
				$("#applyArea2").append("<option value='밀양시'>밀양시</option>");
				$("#applyArea2").append("<option value='사천시'>사천시</option>");
				$("#applyArea2").append("<option value='산청군'>산청군</option>");
				$("#applyArea2").append("<option value='양산시'>양산시</option>");
				$("#applyArea2").append("<option value='의령군'>의령군</option>");
				$("#applyArea2").append("<option value='진주시'>진주시</option>");
				$("#applyArea2").append("<option value='창녕군'>창녕군</option>");
				$("#applyArea2").append("<option value='창원시 마산합포구'>창원시 마산합포구</option>");
				$("#applyArea2").append("<option value='창원시 마산회원구'>창원시 마산회원구</option>");
				$("#applyArea2").append("<option value='창원시 성산구'>창원시 성산구</option>");
				$("#applyArea2").append("<option value='창원시 의창구'>창원시 의창구</option>");
				$("#applyArea2").append("<option value='창원시 진해구'>창원시 진해구</option>");
				$("#applyArea2").append("<option value='통영시'>통영시</option>");
				$("#applyArea2").append("<option value='하동군'>하동군</option>");
				$("#applyArea2").append("<option value='함안군'>함안군</option>");
				$("#applyArea2").append("<option value='함양군'>함양군</option>");
				$("#applyArea2").append("<option value='합천군'>합천군</option>");
				
				
		 	}
		
			else if($(this).val() == "울산광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='울주군'>울주군</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
			
		 	}

			else if($(this).val() == "부산광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강서구'>강서구</option>");
				$("#applyArea2").append("<option value='금정구'>금정구</option>");
				$("#applyArea2").append("<option value='기장군'>기장군</option>");
				$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='동래구'>동래구</option>");
				$("#applyArea2").append("<option value='부산진구'>부산진구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='사상구'>사상구</option>");
				$("#applyArea2").append("<option value='사하구'>사하구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='수영구'>수영구</option>");
				$("#applyArea2").append("<option value='연제구'>연제구</option>");
				$("#applyArea2").append("<option value='영도구'>영도구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
				$("#applyArea2").append("<option value='해운대구'>해운대구</option>");
			
		 	}

			else if($(this).val() == "대구광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='달서구'>달서구</option>");
				$("#applyArea2").append("<option value='달성군'>달성군</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='수성구'>수성구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
			
		 	}
		
			else if($(this).val() == "제주특별자치도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='서귀포시'>서귀포시</option>");
				$("#applyArea2").append("<option value='제주시'>제주시</option>");		
		 	}

			else if($(this).val() == "전라북도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='고창군'>고창군</option>");
				$("#applyArea2").append("<option value='군산시'>군산시</option>");
				$("#applyArea2").append("<option value='김제시'>김제시</option>");
				$("#applyArea2").append("<option value='남원시'>남원시</option>");
				$("#applyArea2").append("<option value='무주군'>무주군</option>");
				$("#applyArea2").append("<option value='부안군'>부안군</option>");
				$("#applyArea2").append("<option value='순창군'>순창군</option>");
				$("#applyArea2").append("<option value='완주군'>완주군</option>");
				$("#applyArea2").append("<option value='익산시'>익산시</option>");
				$("#applyArea2").append("<option value='임실군'>임실군</option>");
				$("#applyArea2").append("<option value='장수군'>장수군</option>");
				$("#applyArea2").append("<option value='전주시 덕진구'>전주시 덕진구</option>");
				$("#applyArea2").append("<option value='전주시 완산구'>전주시 완산구</option>");
				$("#applyArea2").append("<option value='정읍시'>정읍시</option>");
				$("#applyArea2").append("<option value='진안군'>진안군</option>");
			
		 	}

			else if($(this).val() == "충청북도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='괴산군'>괴산군</option>");
				$("#applyArea2").append("<option value='단양군'>단양군</option>");
				$("#applyArea2").append("<option value='보은군'>보은군</option>");
				$("#applyArea2").append("<option value='영동군'>영동군</option>");
				$("#applyArea2").append("<option value='옥천군'>옥천군</option>");
				$("#applyArea2").append("<option value='음성군'>음성군</option>");
				$("#applyArea2").append("<option value='제천시'>제천시</option>");
				$("#applyArea2").append("<option value='증평군'>증평군</option>");
				$("#applyArea2").append("<option value='진천군'>진천군</option>");
				$("#applyArea2").append("<option value='청주시 상당구'>청주시 상당구</option>");
				$("#applyArea2").append("<option value='청주시 서원구'>청주시 서원구</option>");
				$("#applyArea2").append("<option value='청주시 청원구'>청주시 청원구</option>");
				$("#applyArea2").append("<option value='청주시 흥덕구'>청주시 흥덕구</option>");
				$("#applyArea2").append("<option value='충주시'>충주시</option>");
			
		 	}
		
			else if($(this).val() == "광주광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='광산구'>광산구</option>");
				$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
			
		 	}

			else if($(this).val() == "전라남도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강진군'>강진군</option>");
				$("#applyArea2").append("<option value='고흥군'>고흥군</option>");
				$("#applyArea2").append("<option value='곡성군'>곡성군</option>");
				$("#applyArea2").append("<option value='광양시'>광양시</option>");
				$("#applyArea2").append("<option value='구례군'>구례군</option>");
				$("#applyArea2").append("<option value='나주시'>나주시</option>");
				$("#applyArea2").append("<option value='담양군'>담양군</option>");
				$("#applyArea2").append("<option value='목포시'>목포시</option>");
				$("#applyArea2").append("<option value='무안군'>무안군</option>");
				$("#applyArea2").append("<option value='보성군'>보성군</option>");
				$("#applyArea2").append("<option value='순천시'>순천시</option>");
				$("#applyArea2").append("<option value='신안군'>신안군</option>");
				$("#applyArea2").append("<option value='여수시'>여수시</option>");
				$("#applyArea2").append("<option value='영광군'>영광군</option>");
				$("#applyArea2").append("<option value='영암군'>영암군</option>");
				$("#applyArea2").append("<option value='완도군'>완도군</option>");
				$("#applyArea2").append("<option value='장성군'>장성군</option>");
				$("#applyArea2").append("<option value='장흥군'>장흥군</option>");
				$("#applyArea2").append("<option value='진도군'>진도군</option>");
				$("#applyArea2").append("<option value='함평군'>함평군</option>");
				$("#applyArea2").append("<option value='해남군'>해남군</option>");
				$("#applyArea2").append("<option value='화순군'>화순군</option>");
			
		 	}

			else if($(this).val() == "경상북도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='경산시'>경산시</option>");
				$("#applyArea2").append("<option value='경주시'>경주시</option>");
				$("#applyArea2").append("<option value='고령군'>고령군</option>");
				$("#applyArea2").append("<option value='구미시'>구미시</option>");
				$("#applyArea2").append("<option value='군위군'>군위군</option>");
				$("#applyArea2").append("<option value='김천시'>김천시</option>");
				$("#applyArea2").append("<option value='문경시'>문경시</option>");
				$("#applyArea2").append("<option value='봉화군'>봉화군</option>");
				$("#applyArea2").append("<option value='상주시'>상주시</option>");
				$("#applyArea2").append("<option value='성주군'>성주군</option>");
				$("#applyArea2").append("<option value='안동시'>안동시</option>");
				$("#applyArea2").append("<option value='영덕군'>영덕군</option>");
				$("#applyArea2").append("<option value='영양군'>영양군</option>");
				$("#applyArea2").append("<option value='영주시'>영주시</option>");
				$("#applyArea2").append("<option value='영천시'>영천시</option>");
				$("#applyArea2").append("<option value='예천군'>예천군</option>");
				$("#applyArea2").append("<option value='울릉군'>울릉군</option>");
				$("#applyArea2").append("<option value='울진군'>울진군</option>");
				$("#applyArea2").append("<option value='의성군'>의성군</option>");
				$("#applyArea2").append("<option value='청도군'>청도군</option>");
				$("#applyArea2").append("<option value='청송군'>청송군</option>");
				$("#applyArea2").append("<option value='칠곡군'>칠곡군</option>");
				$("#applyArea2").append("<option value='포항시 남구'>포항시 남구</option>");
				$("#applyArea2").append("<option value='포항시 북구'>포항시 북구</option>");
			
		 	}

			else if($(this).val() == "강원도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강릉시'>강릉시</option>");
				$("#applyArea2").append("<option value='고성군'>고성군</option>");
				$("#applyArea2").append("<option value='동해시'>동해시</option>");
				$("#applyArea2").append("<option value='삼척시'>삼척시</option>");
				$("#applyArea2").append("<option value='속초시'>속초시</option>");
				$("#applyArea2").append("<option value='양구군'>양구군</option>");
				$("#applyArea2").append("<option value='양양군'>양양군</option>");
				$("#applyArea2").append("<option value='영월군'>영월군</option>");
				$("#applyArea2").append("<option value='원주시'>원주시</option>");
				$("#applyArea2").append("<option value='인제군'>인제군</option>");
				$("#applyArea2").append("<option value='정선군'>정선군</option>");
				$("#applyArea2").append("<option value='철원군'>철원군</option>");
				$("#applyArea2").append("<option value='춘천시'>춘천시</option>");
				$("#applyArea2").append("<option value='태백시'>태백시</option>");
				$("#applyArea2").append("<option value='평창군'>평창군</option>");
				$("#applyArea2").append("<option value='홍천군'>홍천군</option>");
				$("#applyArea2").append("<option value='화천군'>화천군</option>");
				$("#applyArea2").append("<option value='횡성군'>횡성군</option>");
			
		 	}
		
		})
	})
			
	
	
	
	
</script>
</html>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />



