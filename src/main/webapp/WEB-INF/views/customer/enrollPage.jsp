<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<style>
</style>
<body>
<%-- Header --%>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<section id="content-wrapper">
	<div class="area">
	<h1 class="comm-content-tit">회원가입</h1>
		<form id="enrollForm" action="/enroll.do" method="post">
			<div class="common-tbl-box">
		    	<input type="hidden" id="isChk" value="0">
	      
			    <table class="comm-tbl type2">
			         <tr>
			            <td><label for="userId">아이디</label></td>
			            <td><input class="inputBox" type="text" id="customerId" name="customerId"  maxlength="16"><span id="idMsg"></span><button type="button" id="idChk">중복확인</button></td>
			         </tr>
			         <tr>
			            <td><label for="userPw">비밀번호</label></td>
			            <td><input class="inputBox" type="password" id="customerPw" name="customerPw"  maxlength="16"><span id="pwMsg"></span><p style="font-size: 12px; height: 20px;">※ 영문+숫자+특수문자 조합하여 8~16자로 입력해 주세요. 사용 가능한 특수기호: ~!@$%^&*/?#+_-</p></td>
			         </tr>
			         <tr>
			            <td><label for="userPwre">비밀번호 확인</label></td>
			            <td><input class="inputBox" type="password" id="customerPwre" name="customerPwre"  maxlength="16"><span id="pwreMsg"></span></td>
			         </tr>
			         <tr>
			            <td><label for="userName">이름</label></td>
			            <td><input class="inputBox" type="text" id="customerName" name="customerName"  maxlength="16"><span id="nameMsg"></span></td>
			         </tr>
			         <tr>
			            <td><label for="userNick">닉네임</label></td>
			            <td><input class="inputBox" type="text" id="customerNick" name="customerNick"  maxlength="16"><span id="nickMsg"></span><button type="button" id="nickChk">중복확인</button></td>
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
			            <td><label for="phone">휴대폰</label></td>
			            <td>
			               <select name="phone" id="phone" style="width:70px; height:40px">
			                    <option value="">선택</option>
			                     <option value="010">010</option>
			                     <option value="011">011</option>
			                     <option value="016">016</option>
			                     <option value="017">017</option>
			                     <option value="019">019</option>
			                 </select>
			                 <span style="margin:0 5px 0 5px; color:black;" > - </span><input type="text" id="phone1" name="phone1"  maxlength="4">
			                 <span style="margin:0 5px 0 5px; color:black;"> - </span><input type="text" id="phone2" name="phone2"  maxlength="4"> 
			                 <span id="phoneMsg"></span>
			              </td>
			         </tr>
			         <tr>
			            <td><label for="year">생년월일</label></td>
			            <td>
			               <input type="text" name="birthday" id="birthday"  maxlength="6" placeholder="950810"><span id="birthdayMsg"></span>
			            </td>
			         </tr>
			         <tr>
			            <td><label for="gender">성별</label></td>
			            <td>
			               <select id="gender" name="gender">
			                    <option>성별</option>
			                    <option value="M">남자</option>
			                      <option value="F">여자</option>
			                 </select>
			                  <span id="genderMsg"></span>
			              </td>
			         </tr>
			         <tr>
			            <td colspan="3" style="text-align: center;" ><button type="button" id="btnSubmit" class="btnjoin">가입하기</button></td>
			         </tr>
			      </table>
			</div>
		</form>
	</div>
	</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />
</body>
<script>
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
                  $("#isChk").val("1");
               }
            },
            error:function(){
               console.log("실패");
            }
      });
   });
   
   //이메일 중복확인
//         $("#emailChk").click(function(){
//          var nick = $("#email").val();
         
//          if(isEmpty(email)){
//             alert("이메일을 입력해주세요.");
//             return;
//          }
         
//          $.ajax({
//             url:"/emailCheck.do",
//             data:{email:email},
//             type:"get",
//             success:function(data){
//                if(data==1){
//                   alert("가입된 이메일입니다.");
//                   $("#isChk").val("0");
//                }else{
//                   alert("사용가능 이메일입니다.");
//                   $("#isChk").val("1");
//                }
//             },
//             error:function(){
//                console.log("실패");
//             }
//          });
//    });
   
   // 가입하기 버튼
   $("#btnSubmit").click(function(){
      if(isChk()){
         $("#enrollForm").submit();
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
      var customerPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
      var birthday = /^[0-9]*$/;
      var phone = /^[0-9]*$/;
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
   });
</script>
</html>