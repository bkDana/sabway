<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>행사 상품 선택 view</title>
</head>
<style>
	table tr>th
	,table tr>td {
		height:50px;
	}
	div > table {
		width:100%;
	}
	[name=table] th,[name=table] td  {
		text-align:center;
		border:1px solid black;
	}
</style>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp"/>
<body>
	<form action="/selectPromotion.do" method="get">
		<div>
			<table name="table" style="border:1px solid black; text-align:center;">
				<tr>
					<th>상품명</th>
					<th>판매가</th>
					<th>행사</th>
				</tr>
				<%-- <c:forEach items="" var=""> --%>
					<tr>
						<!-- Menu의 db 정보 사용 -->
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
			<input type="submit" value="적용">
		</div>
	</form>
</body>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp"/>
</html>