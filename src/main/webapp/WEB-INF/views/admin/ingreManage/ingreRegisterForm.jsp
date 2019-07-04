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
		
			<form action="/ingreRegister.do" method="post" enctype="multipart/form-data">
				<table class="comm-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>	
					<tr>
						<th>카테고리</th>
						<td>
							<select name="ingreType" id="ingreType" class="short" required>
								<option value="">== 카테고리 ==</option>
								<option value="메인메뉴">메인메뉴</option>
								<option value="빵">빵</option>
								<option value="추가토핑">추가토핑</option>
								<option value="치즈">치즈</option>
								<option value="채소">채소</option>
								<option value="소스">소스</option>
								<option value="사이드메뉴">사이드메뉴</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td>
							<input type="text" name="ingreLabel" id="ingreLabel" required>
						</td>
					</tr>
					<tr>
						<th>판매가격</th>
						<td>
							15cm : <input type="text" name="ingreCost15" id="ingreCost15" class="short" value="0" required style="text-align:right;"> 원 &nbsp;&nbsp;
							30cm : <input type="text" name="ingreCost30" id="ingreCost30" class="short" value="0" required style="text-align:right;"> 원
						</td>
					</tr>
					<tr>
						<th>활성화/비활성화</th>
						<td>
							<select name="ingreActive" id="ingreActive" class="short">
								<option value="1" selected>활성화</option>
								<option value="0">비활성화</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td>
							<textarea rows="5" cols="100" name="ingreDescription"></textarea>
						</td>
					</tr>
					<tr>
						<th>칼로리</th>
						<td>
							<input type="text" name="ingreKcal" class="short" required style="text-align:right;"> Kcal
						</td>
					</tr>
					<tr>
						<th>이미지 등록</th>
						<td>
							<input type="file" name="filepath" required>
						</td>
					</tr>
					<tr>
						<th>단위(unit)</th>
						<td>
							<select name="ingreUnit" class="short" required>
								<option value="box">box</option>
								<option value="kg">kg</option>
								<option value="통">통</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>할인률</th>
						<td>
							<input type="text" name="ingreDis" class="short2" value="0" style="text-align:right;"> %
							select로 바꾸기
						</td>
					</tr>
				</table>
				<div class="common-tbl-btn-group">
					<button type="submit" class="btn-style1">메뉴등록</button>
					<button type="button" class="btn-style2" onclick="history.back();">취소</button>
				</div>
			</form>
		</div>
	
</section>
<!-- <script>
	$(document).ready(function(){
		if($())
	});
</script> -->


<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />