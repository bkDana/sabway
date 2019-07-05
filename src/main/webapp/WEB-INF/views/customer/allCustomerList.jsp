<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
<%-- LEFT MENU --%>
<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
<style>
	.del-btn2{
		height: 30px;
	    padding: 0 10px;
	    border-radius: 5px;
	    background-color: #747474;
	    color: #fff;
	    margin-left: 5px;
	}
</style>
	<div class="area">
	<div class="sub-menu">※ 회원관리 &gt; 회원리스트</div>
		<table border="1" class="comm-tbl type2">
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>생년월일</th>
				<th>성별</th>
				<th>핸드폰 번호</th>
				<th>이메일</th>
				<th>회원 상태</th>
				<th>가입일</th>
				<th>마지막 로그인 날짜</th>
				<th></th>
			</tr>
			<c:forEach items="${list }" var="c">
				<tr>
					<td>${c.customerNo}</td>
					<td>${c.customerId}</td>
					<td>${c.customerName}</td>
					<td>${c.customerNick}</td>
					<td>${c.birthday}</td>
					<c:if test="${c.gender == 'M'}">
						<td>남자</td>
					</c:if>
					<c:if test="${c.gender == 'F'}">
						<td>여자</td>
					</c:if>
					<td>${c.phone}</td>
					<td>${c.email}</td>
					<c:if test="${c.customerState == 0}">
						<td style="color:#ffce32">휴면</td>
					</c:if>
					<c:if test="${c.customerState == 1}">
						<td style="color:#009223">회원</td>
					</c:if>
					<c:if test="${c.customerState == 2}">
						<td style="color:#d90f0f">탈퇴</td>
					</c:if>
					<td>${c.regDate}</td>
					<td>${c.lastLogDate}</td>
					<td>
						<c:choose>
							<c:when test="${c.customerState == 2}">
								<button type="button" class="del-btn2">탈퇴해제</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="del-btn">탈퇴</button>
							</c:otherwise>
						</c:choose>
					</td>	
				</tr>
			</c:forEach>
		</table>
	</div>
</section>
<script>

	//회원 탈퇴시키기
	$('.del-btn').click(function(){
		
		var customerNo =
			$(this).parent().parent().children(':eq(0)').html();
		
		$.ajax({
			type:"GET",
			url:"/adminCustomerDelete.do?customerNo="+customerNo,
			success : function(data){
				var result = data;
				if(result == 1){
					alert("변경완료");
					location.reload();
				}else{
					alert("실패")
				}
			}
		});
	})
		//회원 탈퇴 해제 시키기
	$('.del-btn2').click(function(){
		
		var customerNo =
			$(this).parent().parent().children(':eq(0)').html();
		
		$.ajax({
			type:"GET",
			url:"/adminCustomerDeleteCancle.do?customerNo="+customerNo,
			success : function(data){
				var result = data;
				if(result == 1){
					alert("회원 탈퇴 완료");
					location.reload();
				}else{
					alert("실패")
				}
			}
		});
	})
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />