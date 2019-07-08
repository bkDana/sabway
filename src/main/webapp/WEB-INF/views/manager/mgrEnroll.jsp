<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	/* 테이블 테두리 black */
	table,th,tr,td{
		border: 1px solid black; 
	}
	/* 글씨 black, 밑줄 제거 */
	a{
		text-decoration: none;
		color:black;
	}
	/* Content 세로 설정 */
	[name=contentTd]{
		height:200px;
	}
</style>
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->
<c:set var="addr" value="${mgrAddr }"/>
<c:set var="subStr" value="${fn:substringAfter(addr, ' ')}"/>

<c:choose>
	<c:when test="${fn:endsWith(subStr,'구') }">
		<c:set var="d" value="${fn:replace(subStr, '구', '')}"/>
	</c:when>
	<c:when test="${fn:endsWith(subStr,'군') }">
		<c:set var="d" value="${fn:replace(subStr, '군', '')}"/>
	</c:when>
	<c:when test="${fn:endsWith(subStr,'시') }">
		<c:set var="d" value="${fn:replace(subStr, '시', '')}"/>
	</c:when>
</c:choose>



<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<!-- 가맹점 신청 승인 시  -->
		<div class="common-tbl-box">
			<h1 class="comm-content-tit">신청 목록</h1>
			<form action="/mgrEnroll.do" method="post">
				<input type="hidden" name="mgrStatus" value="1"><!-- 영업상태: 준비중(Default) -->
				<input type="hidden" name="mgrLevel" value="0"><!-- 0: 가맹점 고정 -->
				<input type="hidden" name="applyName" value="${applyName }"><!-- 신청자 이름 전달용 -->
				<input type="hidden" name="mgrAddrType" value="${mgrAddrType }"><!-- 지역 전달 -->
				<table class="comm-tbl">
					<tr>
						<th>아이디</th>
						<!-- 아이디 뒤에 정해놓은 지역코드 + -->
						<td><input type="text" name="mgrId" value="manager${mgrAddrType }"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<!-- 비밀번호 기본값 1234 생성 후 각자 변경 -->
						<td><input type="password" name="mgrPw" value="1234" readonly></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="mgrName" value="SabWay ${d}점"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="mgrTel" value="${mgrTel }" readonly></td>
					</tr>
					<tr style="display:none;">
						<th>우편번호</th>
						<td><input type="text" name="mgrPost" value="04537"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="mgrAddr" value="${mgrAddr }" readonly></td>
					</tr>
				</table>
				<div class="common-tbl-btn-group">
					<button class="btn-style2" type="submit">가맹점 등록</button>
					<button class="btn-style2" type="button"><a href="/admin.do">메인으로</a></button>
				</div>
			</form>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />