<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" />

<style>
	.doubleChk{
		margin-top: 10px;
		height: 30px;
	    padding: 0 10px;
	    border-radius: 5px;
	    float: right;
	    background-color: #747474;
	    color: #fff;
	    margin-left: 5px;
	}
	.emailBtn1{
		margin-top: 10px;
		width: 67px;
		height: 30px;
	    padding: 0 10px;
	    border-radius: 5px;
	    float: right;
	    background-color: #747474;
	    color: #fff;
	    margin-left: 5px;
	}
	.join-btn{
		height: 30px;
	    padding: 0 10px;
	    border-radius: 5px;
	    background-color: #009223;
	    color: #fff;
	    margin-left: 5px;
	}
	.area1 {
	    max-width: 1900px;
	    margin: 0px auto;
	}
	.inquiry_wrapper {
	    background-color: #fff;
	    width: 1028px;
	    margin: 0 auto;
	    border: 1px solid #e8e8e8;
	    padding: 0 70px 49px;
	}
	.enroll_wrapper {
    	position: relative;
	}
	.enroll_wrapper th {
	    font-weight: 300;
	    color: #666666;
	    font-size: 16px;
	    height: 21px;
	    padding-top: 24px;
	    border-bottom: 1px solid #e8e8e8;
	    text-align: left;
	    vertical-align: top;
	}
	label {
    	cursor: pointer;
	}
	.enroll_wrapper th .ess {
	    background: url(/resources/img/main/icon_ess.png) 0 0 no-repeat;
	    width: 7px;
	    height: 6px;
	    display: inline-block;
	    vertical-align: middle;
	    position: relative;
	    margin-left: 4px;
	    top: -2px;
	}
	.enroll_wrapper td {
	    height: 45px;
	    padding: 12px 0;
	    border-bottom: 1px solid #e8e8e8;
	}
	.form_text {
	    background-color: #f8f8f8;
	    display: inline-block;
	}
	.form_text input {
	    width: 100%;
	    border: 0;
	    background: transparent;
	    height: 45px;
	    color: #292929;
	    font-size: 16px;
	    text-indent: 15px;
	}
	.form_select {
	    display: inline-block;
	    vertical-align: middle;
	    overflow: hidden;
	    position: relative;
	    border: 2px solid #dddddd;
	}
	.form_select1 {
	    display: inline-block;
	    vertical-align: middle;
	    overflow: hidden;
	    position: relative;
	    border: 2px solid #dddddd;
	}
	.form_select select {
	    width: 100%;
	    border: 0;
	    height: 41px;
	    line-height: 41px;
	    font-size: 16px;
	    color: #999999;
	    position: relative;
	    z-index: 1;
	    text-indent: 9px;
	    -webkit-appearance: none;
	}
	.form_select:before {
	    content: '';
	    position: absolute;
	    right: 13px;
	    top: 18px;
	    width: 12px;
	    height: 7px;
	    background: url(/resources/img/main/icon_select_arr.png) 0 0 no-repeat;
	    z-index: 3;
	}
	.join-btn {
	    background-color: #009223;
	    color: #fff;
	    font-size: 18px;
	    font-weight: bold;
	    text-align: center;
	    display: inline-block;
	    vertical-align: middle;
	    border-radius: 30px;
	    transition-duration: 0.2s;
	    margin-top: 2%;
    	margin-bottom: -2%;
	}
</style>


<section id="content-wrapper">
	<div class="area1">
		<div class="inquiry_wrapper">
	<h1 class="comm-content-tit" style="margin-top: 50px;">회원가입</h1>
		<form id="enrollForm" action="/enroll.do" method="post">
			<div class="enroll_wrapper">
		    	<input type="hidden" id="isChk" value="0">
	      
			    <table style="width:1028px">
				    <colgroup>
				    	<col width= "130px">
				    	<col width="/">
				    	
				    </colgroup>
			         <tr>
			            <th scope="col"><label for="userId">아이디</label><span class="ess"></span></th>
			            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="text" id="customerId" name="customerId"  maxlength="16"></span><button type="button" id="idChk" class="doubleChk">중복확인</button><br><span id="idMsg"></span></td>
			         </tr>
			         <tr>
			            <th scope="col"><label for="userPw">비밀번호</label><span class="ess"></span></th>
			            <td>
				            <span class="form_text" style="width: 100%"><input class="inputBox" type="password" id="customerPw" name="customerPw"  maxlength="16"></span><br><span id="pwMsg"></span>
				            <p style="font-size: 13px; height: 20px;color: #999999;margin-left: 25px; margin-top: 15px;">
				            ※ 영문+숫자+특수문자 조합하여 8~16자로 입력해 주세요. 사용 가능한 특수기호: ~!@$%^&*/?#+_-
				            </p>
			            </td>
			         </tr>
			         <tr>
			            <th scope="col"><label for="userPwre">비밀번호 확인</label><span class="ess"></span></th>
			            <td><span class="form_text" style="width: 100%"><input class="inputBox" type="password" id="customerPwre" name="customerPwre"  maxlength="16"></span><br><span id="pwreMsg"></span></td>
			         </tr>
			         <tr>
			            <th scope="col"><label for="userName">이름</label><span class="ess"></span></th>
			            <td><span class="form_text" style="width: 100%"><input class="inputBox" type="text" id="customerName" name="customerName"  maxlength="16"></span><br><span id="nameMsg"></span></td>
			         </tr>
			         <tr>
			            <th scope="col"><label for="userNick">닉네임</label><span class="ess"></span></th>
			            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="text" id="customerNick" name="customerNick"  maxlength="16"></span><button type="button" id="nickChk" class="doubleChk" >중복확인</button><br><span id="nickMsg"></span></td>
			         </tr>
			         <tr>
			            <th scope="col">
			               <label for="email">E-Mail</label>
			               <span class="ess"></span>
			            </th>
			            <td>
			            	<span class="form_text" style="width: 91%">
			               		<input class="inputBox" type="text" id="email" name="email" style="width:100%" maxlength="20">
			               	</span>
			               	<button type="button" class="emailBtn1" id="emailChkBtn" disabled="disabled">인증</button><br>
			              	<span class="joinErrorMsg" id="emailMsg"></span>
							<span id="eTxt" style="color:blue"></span>
			            </td>            
			         </tr>
			         <tr>
			            <th scope="col"><label for="phone">휴대폰</label><span class="ess"></span></th>
			            <td>
			            	<div class="form_select" style="width:196px;">
				               <select name="phone" id="phone" style="width:100%; height:35px">
				                    <option value="">선택</option>
				                     <option value="010">010</option>
				                     <option value="011">011</option>
				                     <option value="016">016</option>
				                     <option value="017">017</option>
				                     <option value="019">019</option>
				                 </select>
			                 </div>
			                 <span style="margin:0 5px 0 5px; color:black;" > - </span>
			                 <div class="form_select1" style="width:196px; height: 35px;">
			                 	<input type="text" id="phone1" name="phone1" style="width:100%; height: 100%;border: none;" maxlength="4">
			                 </div>
			                 <span style="margin:0 5px 0 5px; color:black;"> - </span>
			                 <div class="form_select1" style="width:196px; height: 35px;">
			                 	<input type="text" id="phone2" name="phone2" style="width:100%; height: 100%;border: none;" maxlength="4">
			                 </div>
			                 	<br> 
			                 <span id="phoneMsg"></span>
			              </td>
			         </tr>
			         <tr>
			            <th scope="col"><label for="year">생년월일</label><span class="ess"></span></th>
			            <td>
			           		<span class="form_text" style="width: 100%">
			               		<input type="text" name="birthday" id="birthday"  maxlength="6" placeholder="950810">
			               	</span>
			               	<br><span id="birthdayMsg"></span>
			            	
			            </td>
			         </tr>
			         <tr>
			            <th scope="col"><label for="gender">성별</label><span class="ess"></span></th>
			            <td>
			            	<div class="form_select" style="width:196px; height: 35px;">
				               <select id="gender" name="gender">
				                    <option>성별</option>
				                    <option value="M">남자</option>
				                      <option value="F">여자</option>
				                 </select>
				            </div>
			                  <span id="genderMsg"></span>
			              </td>
			         </tr>
			         <tr>
			            <td colspan="3" style="text-align: center; border-bottom: none;" ><button type="button" id="btnSubmit" class="join-btn" style="width: 170px; height: 50px;">가입하기</button></td>
			         </tr>
			      </table>
			</div>
		</form>
		</div>
	</div>
</section>

<script>

// 이메일 인증
	$("#emailChkBtn").click(function(){
		   var email = $("#email").val();
		   console.log(email);
		   var url="/emailAuth.do";
		   var pop=window.open("emailAuth.jsp","emailAuth","width=400,height=300");
		   pop.location.href=url+"?email="+email;
		})
///////////////////////////////중복확인
   //아이디 중복확인
   $("#idChk").click(function(){
      var id = $("#customerId").val();
      
      if(isEmpty(id)){
         alert("아이디를 입력해주세요.");
         return;
      }
      
      $.ajax({
         url:"/idCheck.do",
         data:{customerId:id},
         type:"get",
         success:function(data){
            if(data==1){
               alert("현재사용중인 아이디입니다.");
               $("#isChk").val("0");
            }else{
               alert("사용가능한 아이디입니다.");
               $("#idChk").css("background","#009223");
               $("#isChk").val("1");
            }
         },
         error:function(){
            console.log("실패");
         }
      });
   });
   
   //닉네임 중복확인
      $("#nickChk").click(function(){
         var nick = $("#customerNick").val();
         
         if(isEmpty(nick)){
            alert("닉네임을 입력해주세요.");
            return;
         }
         
         $.ajax({
            url:"/nickCheck.do",
            data:{customerNick:nick},
            type:"get",
            success:function(data){
               if(data==1){
                  alert("현재사용중인 닉네임입니다.");
                  $("#isChk").val("0");
               }else{
                  alert("사용가능한 닉네임입니다.");
                  $("#nickChk").css("background","#009223");
                  $("#isChk").val("1");
               }
            },
            error:function(){
               console.log("실패");
            }
      });
   });
   
   
   // 가입하기 버튼
   $("#btnSubmit").click(function(){
	   if($('#eTxt').hasClass("checkSuccess")){
		   
		   if(isChk()){
		         $("#enrollForm").submit();
		   }
	   }else{
		   alert("인증되지 않은 이메일입니다.");
	   }
      
   });
   
   $("#emailEx").change(function(){
      if(isEmpty($("#emailEx").val())){
           $("#email2").attr("readonly",false);
           $("#email2").val("");
           $("#email2").focus();
      }else{
           $("#email2").attr("readonly",true);
         $("#email2").val($("#emailEx").val());
      }
   });
        
   //유효성검사
   function isChk(){
      
      // 아이디 중복체크
      if("1" != $("#isChk").val()){
         alert("아이디 중복체크를 해주세요.");
         return false;
      }

      // 비밀번호
      if(isEmpty($("#customerPwre").val())){
         alert("비밀번호를 입력해 주세요.");
         $("#customerPwre").focus();
         return false;
      }
      
      // 이름
      if(isEmpty($("#customerName").val())){
         alert("이름을 입력해 주세요.");
         $("#customerName").focus();
         return false;
      }
      
      // 닉넴
      if(isEmpty($("#customerNick").val())){
         alert("닉네임을 입력해 주세요.");
         $("#customerNick").focus();
         return false;
      }
      
      // 이메일
      if(isEmpty($("#email").val())){
         alert("이메일 입력해 주세요.");
         $("#email").focus();
         return false;
      }
      
      //휴대폰
      if(isEmpty($("#phone").val())){
         alert("휴대폰번호 입력해 주세요.");
         $("#phone").focus();
         return false;
      }
      if(isEmpty($("#phone1").val())){
         alert("휴대폰번호 입력해 주세요.");
         $("#phone1").focus();
         return false;
      }
      if(isEmpty($("#phone2").val())){
         alert("휴대폰번호 입력해 주세요.");
         $("#phone2").focus();
         return false;
      }
      return true;
   }
   
   // 빈값 체크
   function isEmpty(text){
      if(text != null && text != ""){
         return false;
      }else{
         return true;
      }
   }
   
   $(document).ready(function(){
	  var customerName = /^[가-힣]([가-힣]{1,3})$/;
      var customerPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
      var birthday = /^[0-9]*$/;
      var phone = /^[0-9]*$/;
      
      // 이름 검사
      $('#customerName').focusout(function(){
        	if(!customerName.test($('#customerName').val())){
        		 $('#nameMsg').css("color","red");
                 $('#nameMsg').text("한글만 입력 가능합니다.");
                 $(this).val("");
        	}else{
                $('#nameMsg').text(""); 
            } 
         });
      
      // 비밀번호1 = 비밀번호2
        $('#customerPwre').focusout(function(){
            if($('#customerPwre').val() == $('#customerPw').val() && !($('#customerPwre').val() == "")){
                $('#pwreMsg').css("color","gray");
                $('#pwreMsg').text("입력한 비밀번호가 일치합니다.");
            }else{
                $('#pwreMsg').css("color","red");
                $('#pwreMsg').text("비밀번호가 일치하지 않습니다.");
                $(this).val("");
            }
        });
      // 비밀번호 검사
        $('#customerPw').focusout(function(){
            if(!customerPw.test($('#customerPw').val())){
                $('#pwMsg').css("color","red");
                $('#pwMsg').text("[사용불가] 비밀번호 기준에 맞지 않습니다.");
                $(this).val("");
            }else if(customerPw.test($('#customerPw').val())&&$('#customerPw').val().length>10){
                $('#pwMsg').css("color","blue");
                $('#pwMsg').text("[안전] 사용 가능 비밀번호입니다.");
            }else{
                $('#pwMsg').css("color","gray");
                $('#pwMsg').text("[보통] 적정수준의 비밀번호입니다.");
            }
        });
      //휴대폰1 검사
      $("#phone1").focusout(function(){
         if(!phone.test($('#phone1').val()) || $("#phone1").val().length<4){
              $('#phoneMsg').css("color","red");
              $('#phoneMsg').text("재확인 해주십시오.");
              $(this).val("");
         }else{
            $('#phoneMsg').text("");
         }
      });
      //휴대폰2 검사
      $("#phone2").focusout(function(){
         if(!phone.test($('#phone2').val()) || $("#phone2").val().length<4){
              $('#phoneMsg').css("color","red");
              $('#phoneMsg').text("재확인 해주십시오.");
              $(this).val("");
         }else{
            $('#phoneMsg').text("");
         }
      });
      //생년월일 검사
      $('#birthday').focusout(function(){
         if(!birthday.test($('#birthday').val()) || $('#birthday').val().length<6){
             $('#birthdayMsg').css("color","red");
             $('#birthdayMsg').text("재확인 해주십시오.");
             $(this).val("");
         }else{
            $('#birthdayMsg').text("");
         }
      });
      //이메일 검사
      $('#email').focusout(function(){
          checkEmail();
      });
   });
 //이메일
	function checkEmail(){
	   var email=$("#email").val();
	   var emailchk=/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	   
	   if (!emailchk.test(email)) {//이메일 형식 오류
	      $("#emailMsg").html("이메일 주소가 올바르지 않습니다");
	      $("#emailMsg").css("color", "red");
	      $(".emailBtn1").prop("disabled", true);
	      return;
	   }
	   if (emailchk.test(email)) {
	      $.ajax({
	         type:"post",
	         url:"/emailCheck.do",
	         data:{email:email},
	         success : function(data) {
	               if (data == 1) {//이메일 중복 없음
	            	   
	            	   $("#emailMsg").html("중복된 이메일입니다");
		               $("#emailMsg").css("color", "gray");
		               $("#isChk").val("1");
	               }else{
	            	   $("#emailMsg").html("사용가능한 이메일 입니다");
		               $("#emailMsg").css("color", "green");
		               $(".emailBtn1").prop("disabled", false);
	   
	                  return;
	               }
	            },
	            error : function () {
	               alert("에러 발생")
	               }
	         })
	      }
	}
</script>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />