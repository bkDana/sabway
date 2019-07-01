<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />


<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 메뉴관리 > 메뉴등록</div>
		
			<form action="/menuRegister.do" method="post">
				<table class="comm-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>	
					<tr>
						<th>카테고리</th>
						<td></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td></td>
					</tr>
					<tr>
						<th>판매가격</th>
						<td></td>
					</tr>
					<tr>
						<th>활성화/비활성화</th>
						<td></td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td></td>
					</tr>
					<tr>
						<th>칼로리</th>
						<td></td>
					</tr>
					<tr>
						<th>이미지 등록</th>
						<td></td>
					</tr>
					<tr>
						<th>단위(unit)</th>
						<td></td>
					</tr>
					<tr>
						<th>할인률</th>
						<td></td>
					</tr>
				</table>
				<div class="common-tbl-btn-group">
					<button type="submit" class="btn-style1">메뉴등록</button>
					<button type="button" class="btn-style2" onclick="history.back();">취소</button>
				</div>
			</form>
		</div>
	
</section>



<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />