<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section id="content-wrapper">
	<div class="area">
	<h1 class="comm-content-tit">회원정보</h1>
		<form id="enrollForm" action="/enroll.do" method="post">
			<div class="common-tbl-box">
		    	<input type="hidden" id="isChk" value="0">
	      
			    <table class="comm-tbl type2">
			         <tr>
			            <td><label for="userId">아이디</label></td>
			            <td><input class="inputBox" type="text" id="customerId" name="customerId"  maxlength="16" value="${customer.customerId }" readonly="readonly"></td>
			         </tr>
			         <tr>
			            <td><label for="userPw">비밀번호</label></td>
			            <td><input class="inputBox" type="password" id="customerPw" name="customerPw"  maxlength="16" ><br><span id="pwMsg"></span><p style="font-size: 12px; height: 20px;">※ 영문+숫자+특수문자 조합하여 8~16자로 입력해 주세요. 사용 가능한 특수기호: ~!@$%^&*/?#+_-</p></td>
			         </tr>
			         <tr>
			            <td><label for="userPwre">비밀번호 확인</label></td>
			            <td><input class="inputBox" type="password" id="customerPwre" name="customerPwre"  maxlength="16"><br><span id="pwreMsg"></span></td>
			         </tr>
			         <tr>
			            <td><label for="userName">이름</label></td>
			            <td><input class="inputBox" type="text" id="customerName" name="customerName"  maxlength="16" value="${customer.customerName }" readonly="readonly"></td>
			         </tr>
			         <tr>
			            <td><label for="userNick">닉네임</label></td>
			            <td><input class="inputBox" type="text" id="customerNick" name="customerNick"  maxlength="16" value="${customer.customerNick }"><button type="button" id="nickChk" class="doubleChk" >중복확인</button><br><span id="nickMsg"></span></td>
			         </tr>
			         <tr>
			            <td>
			               <label for="email">E-Mail</label>
			            </td>
			            <td>
			               	<input class="inputBox" type="text" id="email" name="email" style="width:50%" maxlength="20" value="${customer.email }">
			               	<button type="button" class="emailBtn1" id="emailChkBtn" disabled="disabled">인증</button><br>
			              	<span class="joinErrorMsg" id="emailMsg"></span>
							<span id="eTxt" style="color:blue"></span>
			            </td>            
			         </tr>
			         <tr>
			            <td><label for="phone">휴대폰</label></td>
			            <td>
			               <select name="phone" id="phone" style="width:10%; height:35px">
			                    <option value="">선택</option>
			                     <option value="010">010</option>
			                     <option value="011">011</option>
			                     <option value="016">016</option>
			                     <option value="017">017</option>
			                     <option value="019">019</option>
			                 </select>
			                 <span style="margin:0 5px 0 5px; color:black;" > - </span><input type="text" id="phone1" name="phone1" style="width:10%" maxlength="4">
			                 <span style="margin:0 5px 0 5px; color:black;"> - </span><input type="text" id="phone2" name="phone2" style="width:10%" maxlength="4"><br> 
			                 <span id="phoneMsg"></span>
			              </td>
			         </tr>
			         <tr>
			            <td><label for="year">생년월일</label></td>
			            <td>
			               <input type="text" name="birthday" id="birthday"  maxlength="6" placeholder="950810" value="${customer.birthday }"><br><span id="birthdayMsg"></span>
			            </td>
			         </tr>

			         <tr>
			            <td colspan="3" style="text-align: center;" ><button type="button" id="btnSubmit" class="join-btn">가입하기</button></td>
			         </tr>
			      </table>
			</div>
		</form>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />