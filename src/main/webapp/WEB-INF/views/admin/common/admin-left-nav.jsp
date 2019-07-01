<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="left-menu">
	<%-- 재고관리 --%>
	<%if(request.getRequestURL().toString().split("/")[6].equals("managerOrder")){ %>
	<ul>
		<li><a href="/managerOrder/orderRegister.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("orderRegister.jsp")){%>on<%}%>">발주서 작성</a></li>
		<li><a href="/managerOrder/orderList.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("orderList.jsp")){%>on<%}%>">발주 리스트</a></li>
		<li><a href="/managerOrder/stockList.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("stockList.jsp")){%>on<%}%>">재고현황</a></li>
	</ul>
	<%}%>
	
	<!-- 메뉴관리 -->
	<%if(request.getRequestURL().toString().split("/")[6].equals("menuManage")){ %>
		<ul>
			<li><a href="/goMenuReg.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("menuRegisterForm.jsp")){%>on<%}%>">메뉴 등록</a></li>
			<li><a href="#" class="<%if(request.getRequestURL().toString().split("/")[7].equals("#")){%>on<%}%>">메뉴 관리</a></li>
			<li><a href="#" class="<%if(request.getRequestURL().toString().split("/")[7].equals("#")){%>on<%}%>">이벤트 / 할인</a></li>
		</ul>
	<%}%>
	
	
	
</div>