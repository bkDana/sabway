<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="/resources/js/notice.js"></script><!-- notice.js -->
<style>
	table tr>th
	,table tr>td {
		height:50px;
	}
	div > table {
		width:100%;
		text-align:center;
	}
	[name=table] th,[name=table] td  {
		text-align:center;
		border:1px solid black;
	}
</style>

<%-- Content --%>
<section id="content-wrapper">
	<div class="area">
		<div class="common-tbl-box">
			<h1 class="comm-content-tit">신청 목록</h1>
			<form action="/selectPromotion.do" method="get">
				<table class="comm-tbl">
					<tr>
						<th>상품명</th>
						<th>판매가</th>
						<th>행사</th>
					</tr>
					<%-- <c:forEach items="" var=""> --%>
						<tr>
							<!-- Menu의 db 정보 사용 -->
							<!-- 예시 -->
							<td>
								<input type="hidden" name="prdName" value="베지샐러드">
								베지샐러드
							</td>
							<td>
								<input type="hidden" name="price" value=5000>
								5000원
							</td>	
							<td>
								<!-- 선택한 promotion으로 DB update -->
								<select name="promotion"><!-- 상품 할인 유/무 & 할인율 선택 -->
									<option value=1.0>적용안함</option>
									<option value=0.9>10% 할인</option>
									<option value=0.8>20% 할인</option>
									<option value=0.7>30% 할인</option>
								</select>
							</td>
						</tr>
					<%-- </c:forEach> --%>
				</table>
				<div class="common-tbl-btn-group">
					<button class="btn-style2" type="submit">적용</button>
					<button class="btn-style2" type="button"><a href="/admin.do">메인으로</a></button>
				</div>
			</form>
		</div>
	</div>
</section>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />