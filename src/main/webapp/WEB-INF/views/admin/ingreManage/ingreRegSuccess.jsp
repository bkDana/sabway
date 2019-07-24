<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />


<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 재료 관리 > 재료 등록 완료</div>

		<h2 class="comm-content-tit">재료 등록 완료</h2>
			<div class="common-tbl-box">
				<table class="comm-tbl">
					<colgroup>
						<col width="35%">
						<col width="/">
					</colgroup>
					<tr>
						<th>카테고리</th>
						<td>${iv.ingreType}</td>
					</tr>
					<tr>
						<th>재료명</th>
						<td>${iv.ingreLabel}</td>
					</tr>
					<tr>
						<th>판매 가격</th>
						<td>${care[1]}
							15cm : ${iv.ingreCost15}원<br>
							30cm : ${iv.ingreCost30}원 
						</td>
					</tr>
					<tr>
						<th>재료 이미지</th>
						<td><img src="/resources/upload/ingredients/${iv.ingreFilepath}" style="width:150px;"></td>
					</tr>
				</table>
				<div class="common-tbl-btn-group">
					<button type="button" class="btn-style1" onclick="location.href='/ingreManage/goIngreReg.do'" style="font-size:15px;">추가 등록하기</button>
					<button type="button" class="btn-style2" onclick="location.href='/ingreManage/ingreList.do?reqPage=1'" style="font-size:15px;">메뉴 관리 페이지로</button>
				</div>
			</div>




	</div>
</section>


<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />