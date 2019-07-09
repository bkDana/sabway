<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<style>
	input {
		-webkit-box-shadow: 0 0 0 1000px white inset;
		outline-style: none;
		width:250px;
		height:30px;
		font-size:20px;
	}
	[name=searchBox]{
		text-align:center;
	}
	select{
		height:35px;
		font-size:15px;
	}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 매장관리 > 가맹점 목록</div>
			<table class="comm-tbl" style="max-width:1200px">
					<colgroup>
						<col width="6%">
						<col width="10%">
						<col width="8%">
						<col width="20%">
						<col width="20%">
						<col width="10%">
						<col width="8%">
						<col width="6%">
					</colgroup>	
					<tr>
						<th>번호</th><th>아이디</th><th>이름</th><th>가게이름</th><th>주소</th><th>전화번호</th><th>개업일</th><th>상태</th>
					</tr>
					<c:forEach items="${list }" var="mgr" varStatus="i">
						<c:if test="${mgr.mgrLevel != 1}">
						<!-- 본점 제외하고 가맹점만 출력 -->
							<tr>
								<td>${i.count }</td>
								<td>${mgr.mgrId }</td>
								<td>${mgr.mgrBossName }</td>
								<td>${mgr.mgrName }</td>
								<td>${mgr.mgrAddr }</td>
								<td>${mgr.mgrTel }</td>
								<td>${mgr.mgrEnrollDate }</td>
								<c:if test="${mgr.mgrStatus eq 1 }">
									<td style="color:green;">준비중</td>
								</c:if>
								<c:if test="${mgr.mgrStatus eq 2 }">
									<td style="color:blue;">영업중</td>
								</c:if>
								<c:if test="${mgr.mgrStatus eq 3 }">
									<td style="color:Hotpink;">폐업</td>
								</c:if>
							</tr>
						</c:if>
					</c:forEach>
			</table>
			<div class="sub-menu" name="searchBox">
				<select name="selectKeyword">
					<option name="name">이름</option>
					<option name="addr">지역</option>
				</select>
				<input type="text" name="search"/>
				<button type="submit">검색</button>
			</div>
		</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />