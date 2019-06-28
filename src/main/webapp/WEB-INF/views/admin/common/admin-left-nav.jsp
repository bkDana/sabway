<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="left-menu">
	<%-- 재고관리 --%>
	<%if(request.getRequestURL().toString().split("/")[6].equals("managerOrder")){ %>
	<ul>
		<li><a href="/managerOrder/orderRegister.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("orderRegister.jsp")){%>on<%}%>">발주서 작성</a></li>
		<li><a href="/managerOrder/orderList.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("orderList.jsp")){%>on<%}%>">발주 리스트</a></li>
		<li><a href="/managerOrder/stockList.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("stockList.jsp")){%>on<%}%>">재고현황</a></li>
	</ul>
	<%}%>
</div>