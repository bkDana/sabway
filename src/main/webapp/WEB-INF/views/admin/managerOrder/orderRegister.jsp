<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>

<section id="content-wrapper" class="clearfix">
	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 재고관리 > 발주서 작성</div>

		<table class="comm-tbl">
			<colgroup>
				<col width="20%">
				<col width="">
			</colgroup>
			<tr>
				<td>날짜</td><td><input type="text" name=""></td>
			</tr>
			<tr>
				<td>지점명</td><td><input type="text" name=""></td>
			</tr>
			<tr>
				<td>상품 선택</td>
				<td>
					<select class="middle"><option>-- 1차분류 --</option></select>&nbsp;
					<select class="middle"><option>-- 상품 --</option></select>
					<button class="add-btn">추가</button>
				</td>
			</tr>
		</table>
		<br><br><br><br><br><br>
		<h1>물품 내역</h1>
		<table class="comm-tbl type2">
			<colgroup>
				<col width="60%">
				<col width="">
				<col width="">
			</colgroup>
			<thead>
				<tr>
					<th>물품명</th><th>단위별 수량</th><th>기능</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>에그마요</td><td><input type="text" name="" class="short"></td><td><button class="del-btn">삭제</button></td>
				</tr>
				<tr>
					<td>로티세리</td><td><input type="text" name="" class="short"></td><td><button class="del-btn">삭제</button></td>
				</tr>
				<tr>
					<td>아보카도</td><td><input type="text" name="" class="short"></td><td><button class="del-btn">삭제</button></td>
				</tr>
			</tbody>
			
		</table>
		<div class="common-tbl-btn-group">
			<button class="btn-style2">발주서 등록</button>
		</div>
	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />