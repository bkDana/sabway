<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="left-menu">
	<%-- 재고관리 --%>
	<%if(request.getRequestURL().toString().split("/")[6].equals("managerOrder")){ %>
	<ul>
		<li><a href="/managerOrder/orderList.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("orderList.jsp")){%>on<%}%>">발주 리스트</a></li>
		<c:if test="${sessionScope.mgr.mgrLevel eq 0 }">
			<li><a href="/managerOrder/orderRegister.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("orderRegister.jsp")){%>on<%}%>">발주서 작성</a></li>
			<li><a href="/managerOrder/stockList.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("stockList.jsp")){%>on<%}%>">재고현황</a></li>
		</c:if>
	</ul>
	<%}%>
	
	<!-- 메뉴관리 -->
	<%if(request.getRequestURL().toString().split("/")[6].equals("ingreManage")){ %>
		<ul>
			<li><a href="/ingreManage/goIngreReg.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("ingreRegisterForm.jsp")){%>on<%}%>">메뉴 등록</a></li>
			<li><a href="/ingreManage/ingreList.do?reqPage=1" class="<%if(request.getRequestURL().toString().split("/")[7].equals("ingreList.jsp") || request.getRequestURL().toString().split("/")[7].equals("ingreUpdate.jsp")){%>on<%}%>">메뉴 관리</a></li>
			<%-- <li><a href="#" class="<%if(request.getRequestURL().toString().split("/")[7].equals("#")){%>on<%}%>">이벤트 / 할인</a></li> --%>
			<li><a href="/promotionSelect.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("SelectPromotion.jsp")){%>on<%}%>">이벤트 / 할인</a></li>
		</ul>
	<%}%>
	
	<!-- 매출 통계 -->
	<!-- 메뉴관리 -->
	<%if(request.getRequestURL().toString().split("/")[6].equals("salesStatics")){ %>
		<ul>
			<li><a href="/salesStatics/totalSales.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("totalSales.jsp")){%>on<%}%>">전체 매출 통계</a></li>
			<li><a href="/salesStatics/branchSales.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("branchSales.jsp")){%>on<%}%>">지점별 매출 통계</a></li>
			<li><a href="/salesStatics/menuSales.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("menuSales.jsp")){%>on<%}%>">메뉴별 매출 통계</a></li>
		</ul>
	<%}%>
	
	
	
	
</div>