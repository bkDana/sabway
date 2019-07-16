<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="/resources/img/subway_favicon.ico">

<!-- css -->
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css"> <!-- 태그 초기화 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/user-layout.css"> <!-- 레이아웃 css(민주) -->
<link rel="stylesheet" type="text/css" href="/resources/css/content.css"> <!-- 컨텐츠 css(민주) -->

<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<!--<script type="text/javascript" src="/resources/js/notice.js"></script> notice.js -->
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>

<%-- Content --%>
<section id="content-wrapper" style="background-color:#f8f8f8;height:100%;">
	<div class="area">
		<h2 class="comm-content-tit">관리자 로그인</h2>
		<div class="common-tbl-box" style="padding-bottom:50px;">
			<form action="/adminLogin.do" method="post">
				<div class="login-inner clearfix">
					<div class="login-tbl-box">
					<table class="comm-tbl login-tbl">
						<colgroup>
							<col width="20%">
							<col width="/">
						</colgroup>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="mgrId"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="mgrPw"></td>
						</tr>
					</table>
					<label>
	                   <input type="checkbox" id="saveId"><span>아이디 저장</span>
	                </label>
					</div>
					<div class="common-tbl-btn-group">
						<button type="submit" class="btn-style1">로그인</button>
						<button type="button" class="btn-style3" onclick="location.href='/'">메인 페이지로</button>
					</div>
				</div>
			</form>	
		</div>
	</div>
</section>

<script>
   /* 쿠키에 저장된 값이 있다면 세팅 */
   $("input[name=mgrId]").val(Cookies.get('key'));
   if($("input[name=mgrId]").val() != ""){
       $("#saveId").attr("checked", true);
   }
   
   /* 아이디 저장을 선택했을 때 쿠키에 저장ㄴ */
   $("#saveId").change(function(){
      if($("#saveId").is(":checked")){
          Cookies.set('key', $("input[name=mgrId]").val(), { expires: 7 });
      }else{
            Cookies.remove('key');
      }
   });
    
   $("input[name=mgrId]").keyup(function(){
      if($("#saveId").is(":checked")){
          Cookies.set('key', $("input[name=mgrId]").val(), { expires: 7 });
      }
   });
</script>

<%-- Footer --%>
<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> --%>