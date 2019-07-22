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
<style>
input{
	background-color: #dde3ec;
    height: 43px;
    color: #8290a3;
    border: 1px solid #dde3ec;
    outline: 0!important;
    padding: 6px 12px;
    transition-duration: 0.2s;
    width: 100%;
    margin-bottom: 10px;
}

.admin-login-btn{
	width: 100%;
    cursor: pointer;
    font-size: 14px;
    line-height: 1.44;
    color: #FFF;
    background-color: #32c5d2;
    border-color: #32c5d2;
    border: 0;
    outline: 0;
    font-weight: 600;
    padding: 10px 20px!important;
}
</style>
<%-- Content --%>
<section id="content-wrapper" style="background-color:#364150;height:100%;">
	<div class="area">
		<p style="text-align: center;"><a href="/"><img src="/resources/img/logo_w.png" width="100px" ></a></p>
		<div class="" style="background-color: #eceef1;width: 460px;margin: 40px auto 10px;padding: 10px 30px 30px;overflow: hidden;position: relative;box-sizing: border-box;">
			<p style="color: #32c5d2!important;margin: 20px 0 25px;text-align: center;font-size: 20px;font-weight: bold;">SABWAY 매장관리자 사이트 로그인</p>
			<form action="/adminLogin.do" method="post">
				<div class="">
					<div class="">
						<input type="text" name="mgrId" placeholder="아이디">
						<input type="password" name="mgrPw" placeholder="비밀번호">
						 <br>
						<label><input type="checkbox" id="saveId"><span>아이디 저장</span></label>
						
						<button type="submit" class="admin-login-btn">로그인</button>
							<!-- <button type="button" class="btn-style3" onclick="location.href='/'">메인 페이지로</button> -->
						
						<p style="font-weight: 600;font-size: 13px;color: #7d91aa!important;line-height: 1.5;margin-top: 15px;">
							본 시스템은 등록된 관리자에 한하여 사용하실 수 있습니다.
							불법적인 접근 및 사용 시 관련 법규에 의해 처벌 될 수 있습니다.
						</p>
					</div>
				</div>
			</form>	
		</div>
		<p style="text-align: center;margin: 0 auto 30px 0;padding: 10px;color: #7a8ca5;font-size: 13px;">© 2019 JungUm’s Associates Inc. SABWAY® is a registered trademark of JungUm’s Associates Inc.. All rights reserved.</p>
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
