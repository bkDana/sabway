<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
	.doubleChk{
		height: 30px;
	    padding: 0 10px;
	    border-radius: 5px;
	    background-color: #747474;
	    color: #fff;
	    margin-left: 5px;
	}
	.inquiry_wrapper {
	    background-color: #fff;
	    width: 1028px;
	    margin: 0 auto;
	    border: 1px solid #e8e8e8;
	    padding: 0 70px 49px;
	}
	.mypage_wrapper {
    	position: relative;
	}
	.mypage_wrapper th {
	    font-weight: 300;
	    color: #666666;
	    font-size: 16px;
	    height: 21px;
	    padding-top: 24px;
	    border-bottom: 1px solid #e8e8e8;
	    text-align: left;
	    vertical-align: top;
	}
	.mypage_wrapper td {
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
	.form_select1 {
	    display: inline-block;
	    vertical-align: middle;
	    overflow: hidden;
	    position: relative;
	    border: 2px solid #dddddd;
	}
 </style>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" /><!-- 서브메뉴 추가했습니다 -->
<section id="content-wrapper">
	<div class="area">
		<div class="inquiry_wrapper">
	<h1 class="board-tit">회원정보</h1><!-- 이거 바꿈 -->
			<form id="updateForm" action="/cusUpdate.do" method="post">
				<div class="mypage_wrapper">
			    	<input type="hidden" id="isChk" value="0">
				    <table style="width:1028px">
					    <colgroup>
					    	<col width= "130px">
					    	<col width="/">
					    	
					    </colgroup>
				         <tr>
				            <th scope="col"><label for="userId">아이디</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="text" id="customerId" name="customerId"  maxlength="16" value="${customer.customerId }" readonly="readonly"></span></td>
				         </tr>
				         <tr>
				            <th scope="col"><label for="userPw">비밀번호</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="password" id="customerPw" name="customerPw"  maxlength="16" ></span><br><span id="pwMsg"></span><p style="font-size: 12px; height: 20px;color: #999999;margin-left: 25px; margin-top: 15px;">※ 영문+숫자+특수문자 조합하여 8~16자로 입력해 주세요. 사용 가능한 특수기호: ~!@$%^&*/?#+_-</p></td>
				         </tr>
				         <tr>
				            <th scope="col"><label for="userPwre">비밀번호 확인</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="password" id="customerPwre" name="customerPwre"  maxlength="16"></span><br><span id="pwreMsg"></span></td>
				         </tr>
				         <tr>
				            <th scope="col"><label for="userName">이름</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="text" id="customerName" name="customerName"  maxlength="16" value="${customer.customerName }" readonly="readonly"></span></td>
				         </tr>
				         <tr>
				            <th scope="col"><label for="userNick">닉네임</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="text" id="customerNick" name="customerNick"  maxlength="16" value="${customer.customerNick }"></span><button type="button" id="nickChk" class="doubleChk" >중복확인</button><br><span id="nickMsg"></span></td>
				         </tr>
				         <tr>
				            <th scope="col">
				               <label for="email">E-Mail</label><span class="ess"></span>
				            </th>
				            <td>
					            <span class="form_text" style="width: 91%">
					               	<input class="inputBox" type="text" id="email" name="email" style="width:100%" maxlength="20" value="${customer.email }" readonly="readonly">
					            </span>
					            <span class="joinErrorMsg" id="emailMsg"></span>
								<span id="eTxt" style="color:blue"></span>
				            </td>            
				         </tr>
				         <tr>
				            <th scope="col"><label for="phone">휴대폰</label><span class="ess"></span></th>
				            <td>
				              
				                 <span style="margin:0 5px 0 5px; color:black;" > </span>
				                 <div class="form_select1" style="width:196px; height: 35px;">
				                 	<input type="text" id="phone" name="phone" style="width:100%;height: 100%;border: none;" maxlength="4" value="${customer.phone1 }">
				                 </div>
				                 <span style="margin:0 5px 0 5px; color:black;" > - </span>
				                 <div class="form_select1" style="width:196px; height: 35px;">
				                 	<input type="text" id="phone1" name="phone1" style="width:100%;height: 100%;border: none;" maxlength="4" value="${customer.phone2 }">
				                 </div>
				                 <span style="margin:0 5px 0 5px; color:black;"> - </span>
				                 <div class="form_select1" style="width:196px; height: 35px;">
				                 	<input type="text" id="phone2" name="phone2" style="width:100%;height: 100%;border: none;" maxlength="4" value="${customer.phone3 }"><br>
				                 </div> 
				                 <span id="phoneMsg"></span>
				              </td>
				         </tr>
				         <tr>
				            <th scope="col"><label for="year">생년월일</label><span class="ess"></span></th>
				            <td>
				            <span class="form_text" style="width: 91%">
				               <input type="text" name="birthday" id="birthday"  maxlength="6" placeholder="950810" value="${customer.birthday }" readonly="readonly">
				            </span>
				               <br><span id="birthdayMsg"></span>
				            </td>
				         </tr>
				      </table>
					<div class="common-tbl-btn-group" style="padding-top:35px;text-align:center">
						<button type="button" id="btnSubmit" class="btn-style1">변경하기</button>
						<button type="button" class="btn-style3" onclick="location.href='/cusDelete.do?customerNo=${customer.customerNo }'">탈퇴하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script>


//병경하기 버튼
$("#btnSubmit").click(function(){

		   
		   if(isChk()){
		         $("#updateForm").submit();

	   }
   
});


//유효성검사
function isChk(){
	
	// 비밀번호
    if(isEmpty($("#customerPwre").val())){
       alert("비밀번호를 입력해 주세요.");
       $("#customerPwre").focus();
       return false;
    }
	
 // 닉넴
    if(isEmpty($("#customerNick").val())){
       alert("닉네임을 입력해 주세요.");
       $("#customerNick").focus();
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
})

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
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />