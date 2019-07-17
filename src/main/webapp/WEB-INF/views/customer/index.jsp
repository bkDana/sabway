<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<section id="content-wrapper">
	<div class="area">
		<h1 class="comm-content-tit">LOGIN</h1>
		<div class="common-tbl-box">
			<c:choose>
				<c:when test="${not empty sessionScope.customer }">
					[${sessionScope.customer.customerName }]<br>
					<a href="/mypage.do">회원정보</a>
					<a href="/logout.do">로그아웃</a>
				</c:when>
				<c:otherwise>
					<form action="/login.do" method="post">
						<div class="login-inner clearfix">
							<div class="login-tbl-box">
								<table class="comm-tbl login-tbl">
									<colgroup>
										<col width="20%">
										<col width="/">
									</colgroup>
									<tr>
										<th>아이디</th>
										<td><input type="text" name="customerId"></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" name="customerPw"></td>
									</tr>
								</table>

							</div>
							<div class="common-tbl-btn-group" style="padding-top:35px;text-align:center">
								<button type="submit" class="btn-style1">로그인</button>
								<button type="button" class="btn-style3" onclick="location.href='/enrollPage.do'">회원가입</button>

							</div>
							<div style="text-align: center;">
								<button type="button" class="btn-style1" onclick="location.href='/findIdPage.do'">아이디 찾기</button>
								<button type="button" class="btn-style3" onclick="location.href='/findPwPage.do'">비번 찾기</button>
							</div>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />