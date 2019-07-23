<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
<%-- LEFT MENU --%>
<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
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


	<div class="area">
		<div class="sub-menu">※ 매장정보</div>
		<div class="inquiry_wrapper">
			<form id="updateForm" action="/mgrProfileUpdate.do" method="post">
				<div class="mypage_wrapper">
			    	<input type="hidden" id="isChk" value="0">
				    <table style="width:1028px">
					    <colgroup>
					    	<col width= "130px">
					    	<col width="/">
					    </colgroup>
				         <tr>
				            <th scope="col"><label for="userId">아이디</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="text" id="mgrId" name="mgrId"  maxlength="16" value="${mgr.mgrId }" readonly="readonly"></span></td>
				         </tr>
				         <tr>
				            <th scope="col"><label for="userPw">비밀번호</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="password" id="mgrPw" name="mgrPw"  maxlength="16" ></span><br><span id="pwMsg"></span><p style="font-size: 12px; height: 20px;color: #999999;margin-left: 25px; margin-top: 15px;">※ 영문+숫자+특수문자 조합하여 8~16자로 입력해 주세요. 사용 가능한 특수기호: ~!@$%^&*/?#+_-</p></td>
				         </tr>
				         <tr>
				            <th scope="col"><label for="userPwre">비밀번호 확인</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="password" id="mgrPwre" name="mgrPwre"  maxlength="16"></span><br><span id="pwreMsg"></span></td>
				         </tr>
				         <tr>
				            <th scope="col"><label for="userName">매장이름</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="text" id="mgrName" name="mgrName"  maxlength="16" value="${mgr.mgrName }" readonly="readonly"></span></td>
				         </tr>
				         <tr>
				            <th scope="col"><label for="userNick">대표자</label><span class="ess"></span></th>
				            <td><span class="form_text" style="width: 91%"><input class="inputBox" type="text" id="mgrBossName" name="mgrBossName"  maxlength="16" value="${mgr.mgrBossName }"></span><br><span id="nickMsg"></span></td>
				         </tr>
				         <tr>
				            <th scope="col">
				               <label for="email">TEL</label><span class="ess"></span>
				            </th>
				            <td>
					            <span class="form_text" style="width: 91%">
					               	<input class="inputBox" type="text" id="tel" name="tel" style="width:100%" maxlength="20" value="${mgr.mgrTel }" readonly="readonly">
					            </span>
					            <span class="joinErrorMsg" id="emailMsg"></span>
								<span id="eTxt" style="color:blue"></span>
				            </td>            
				         </tr>
				      </table>
					<div class="common-tbl-btn-group" style="padding-top:35px;text-align:center">
						<button type="button" id="btnSubmit" class="btn-style1">변경하기</button>
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
	function isChk(){
		// 비밀번호
	    if(isEmpty($("#mgrPwre").val())){
	       alert("변경할 비밀번호를 입력해 주세요.");
	       $("#mgrPwre").focus();
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
		 var mgrPw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		 
			// 비밀번호1 = 비밀번호2
		     $('#mgrPwre').focusout(function(){
		         if($('#mgrPwre').val() == $('#mgrPw').val() && !($('#mgrPwre').val() == "")){
		             $('#pwreMsg').css("color","gray");
		             $('#pwreMsg').text("입력한 비밀번호가 일치합니다.");
		         }else{
		             $('#pwreMsg').css("color","red");
		             $('#pwreMsg').text("비밀번호가 일치하지 않습니다.");
		             $(this).val("");
		         }
		     });
		   // 비밀번호 검사
		     $('#mgrPw').focusout(function(){
		         if(!managerPw.test($('#mgrPw').val())){
		             $('#pwMsg').css("color","red");
		             $('#pwMsg').text("[사용불가] 비밀번호 기준에 맞지 않습니다.");
		             $(this).val("");
		         }else if(managerPw.test($('#mgrPw').val())&&$('#mgrPw').val().length>10){
		             $('#pwMsg').css("color","blue");
		             $('#pwMsg').text("[안전] 사용 가능 비밀번호입니다.");
		         }else{
		             $('#pwMsg').css("color","gray");
		             $('#pwMsg').text("[보통] 적정수준의 비밀번호입니다.");
		         }
		     });
		
	})
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />