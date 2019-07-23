<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<style>
#content-wrapper11{position:relative;min_height:100%;}
.sub-visual{width:100%; height:200px; background:url(/resources/img/main/Fruits-and-vegetables-1920.jpg) center center no-repeat; background-size:cover;}
.area11{width:768px;margin:0 auto;min-height:515px;}
#content11{width:460px;margin:0 auto;padding-bottom:30px;padding-left: 10%;}
.cont_login{position: relative;float: left;width: 350px;min-height: 250px; margin-top: 50px;padding: 21px 19px 74px;border: 1px solid #ddd;border-radius:10px;}
h3{display: block;font-size: 18px;margin-block-start: 1em;margin-block-end: 1em; margin-inline-start: 0px;margin-inline-end: 0px;font-weight: bold;text-align:center;}
.tit_login{margin_bottom:23px;}
fieldset{border:0 none;}
.cont_login .login_inp{position: relative;height: 38px;margin: 0 2px 8px 0;border: 1px solid #ddd;z-index: 1;border-radius:5px;}
.screen_out{overflow:hidden;position:absolute;width:0;heigh:0;line_heigh:0;text-indente:-9999px;}
.login_inp .login_email{padding:0 40px 0 10px;}
.login_inp .inp_login{display:block;min-width:268px;width:100%;height:100%;border:1px solid transparent;border-radius:5px;line-height:25px;box-sizing:border-box;padding-left:5px;}
/* 로그인상태유지 */
.cont_login .set_login{position:relative;margin-top:10px;line-heigth:20px;}
.set_login .inp_check{position:absolute;top:4px;left:0;width:12px;height:12px;opacity:0;}
.set_login input[type=checkbox] {vertical-align:middle;}
.set_login .lab_check{display:inline-block;padding-left:3px;margin-top:5px;vertical-align:top;}

.lab_check{display:inline-block; cursor:pointer; overflow:hidden; position:relative; vertical-align:middle; color:#292929; font-size:13px; line-height:20px; letter-spacing:-0.05em;}
.lab_check input[type="checkbox"]{height:0; opacity:0; width:0; position:absolute; left:-10px;}
.lab_check .icon{width:20px; height:20px; border:2px solid #dddddd; border-radius:50px; display:inline-block; position:relative; vertical-align:middle; margin-right:3px;}
.lab_check .icon:before{content:''; width:0; height:20px; background:url(/resources/img/main/icon_checkbox.png) 0 0 no-repeat; position:absolute; bottom:3px; transition-duration:0.2s;}
.lab_check input[type="checkbox"]:checked+.icon:before{width:20px;}
/* 로그인버튼 */
.cont_login .btn_login{display: block;width: 100%;height: 46px;margin-top: 15px;border-radius: 4px;font-size: 17px;color: #222;background: #ffce32;font-weight: bold;}
/* 회원가입, 아이디/비번찾기 */
.cont_login .info_user {position: absolute;left: 25px;right: 25px;bottom: 18px;padding-top: 7px;margin-right: 2px;border-top: 1px solid #e0e0e0;letter-spacing: -1px;}
.info_user .join_user{float:left;}
.info_user .list_user{float:right;}
.info_user .list_user li{float:left;}
.info_user .list_user .txt_bar{margin:0 4px;}
.txt_bar{display:inline-block;font-size:11px;color:#d4d4d4;};




</style>    
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" />

<section id="content-wrapper11">
	<div class="sub-visual"></div>
	<div class="area11">
	
		<div id="content11">
			<div class="cont_login">
	            <h3 class="tit_login">
	            	LOGIN<br><br>
	            </h3>
	            <form method="post" action="login.do">
				  <fieldset>
					    <!-- id field -->
					    <div class="login_inp" id="loginEmailField">
					      <label for="loginEmail" class="screen_out">아이디</label>
					      <input type="text" id="loginEmail" class="inp_login inp_email" name="customerId" value="" autocomplete="off" placeholder="아이디">
					    </div>
					    <!-- password -->
					    <div class="login_inp">
					      <label for="loginPw" class="screen_out">비밀번호</label>
					      <input type="password" id="loginPw" class="inp_login" name="customerPw" autocomplete="off" placeholder="비밀번호" validator="password" data-error-empty="카카오계정 비밀번호를 입력해주세요.(영문자/숫자/특수문자)" data-error-invalid="비밀번호가 올바르지 않습니다.">
					    </div>
					    <!-- stay logged in 값 default로 checked 상태로 변경-->
					    <div class="set_login ">
						    <label class="lab_check" for="staySignedIn">
						      <input type="checkbox" id="staySignedIn" name="stay_signed_in" value="true" class="inp_check">
						      <span class="icon"></span>로그인 상태 유지
						    </label>
					    </div>
					    <button type="submit" class="btn_login submit btn_disabled btn_type2">로그인</button>
					    
					    <div class="info_user">
						      <div class="join_user">
						        	<a href="/enrollPage.do" id="signUp">회원가입</a>
						      </div>
						      <ul class="list_user">
							        <li>
							          <a href="/findIdPage.do">아이디 찾기</a><span class="txt_bar">|</span>
							        </li>
							        <li>
							          <a href="/findPwPage.do">비밀번호 찾기</a>
							        </li>
						      </ul>
					    </div>
				  </fieldset>
				</form>
            </div>
		</div>
		
	</div>
</section>

<script>
	/* 쿠키에 저장된 값이 있다면 세팅 */
   $("input[name=customerId]").val(Cookies.get('key1'));
   if($("input[name=customerId]").val() != ""){
       $("#staySignedIn").attr("checked", true);
   }
   
   /* 아이디 저장을 선택했을 때 쿠키에 저장 */
   $("#staySignedIn").change(function(){
      if($("#staySignedIn").is(":checked")){
          Cookies.set('key1', $("input[name=customerId]").val(), { expires: 7 });
      }else{
            Cookies.remove('key1');
      }
   });
    
   $("input[name=customerId]").keyup(function(){
      if($("#staySignedIn").is(":checked")){
          Cookies.set('key1', $("input[name=customerId]").val(), { expires: 7 });
      }
   });
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />