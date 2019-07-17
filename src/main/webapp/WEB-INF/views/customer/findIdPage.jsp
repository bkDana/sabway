<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<section id="content-wrapper">
	<div class="area">
		<form action="/findId.do" method="post">
			<div class="login-tbl-box">
				<table class="comm-tbl login-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>
					<tr>
						<th>이름</th>
						<td><input type="text" name="customerName"></td>
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
						<th>생년월일</th>
						<td><input type="text" name="birthday" placeholder='등록된 생년월일을 입력해주세요.'></td>
					</tr>
				</table>
			</div>
			<div class="common-tbl-btn-group" style="padding-top:35px;text-align:center">
				<button type="submit" class="btn-style1">찾기</button>
			</div>
		</form>
	</div>
</section>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />