<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="left-menu">
	<!-- 메뉴관리 -->
	
<%
String[] pname = request.getRequestURL().toString().split("/");
String p6 = "";
String p7 = "";
if(pname.length==7){
	p6 = pname[6];
}

if(pname.length==8){
	p7 = pname[7];
}

%>
	<%if(request.getRequestURL().toString().split("/")[6].equals("ingreManage")||(request.getRequestURL().toString().split("/")[5].equals("headOffice")&& p6.equals("SelectPromotion.jsp"))){ %>
		<ul>
			<li><a href="/ingreManage/goIngreReg.do" class="<%if(p7.equals("ingreRegisterForm.jsp")){%>on<%}%>">메뉴 등록</a></li>
			<li><a href="/ingreManage/ingreList.do?reqPage=1" class="<%if(p7.equals("ingreList.jsp") || p7.equals("ingreUpdate.jsp")){%>on<%}%>">메뉴 관리</a></li>
			<li><a href="/promotionSelect.do?currentPage=''" class="<%if(request.getRequestURL().toString().split("/")[6].equals("SelectPromotion.jsp")){%>on<%}%>">이벤트 / 할인</a></li>
		</ul>
	<%}%>
	
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
	
	<%-- 게시판 관리 --%>
	<%if(request.getRequestURL().toString().split("/")[6].equals("board")){ %>
	<ul>
		<%-- <c:if test="${sessionScope.mgr.mgrLevel eq 1 }"> --%>
			<li><a href="/board/boardList.do?type=notice" class="<%if(request.getRequestURL().toString().split("/")[7].equals("notice")){%>on<%}%>">공지사항/이벤트</a></li>
			<li><a href="/board/boardList.do?type=qna" class="<%if(request.getRequestURL().toString().split("/")[7].equals("qna")){%>on<%}%>">Q&A/신고</a></li>
			<li><a href="/board/boardList.do?type=review" class="<%if(request.getRequestURL().toString().split("/")[7].equals("review")){%>on<%}%>">리뷰</a></li>	
		<%-- </c:if> --%>
	</ul>
	<%}%>
	
	<!-- 매출 통계 -->
	<%if(request.getRequestURL().toString().split("/")[6].equals("salesStatics")){ %>
		<ul>
			<li><a href="/salesStatics/goTotalSales.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("totalSales.jsp")){%>on<%}%>">전체 매출 통계</a></li>
			<c:if test="${sessionScope.mgr.mgrLevel eq 1}">	<!-- 최고관리자 -->
				<li><a href="/salesStatics/goBranchSales.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("branchSales.jsp")){%>on<%}%>">지점별 매출 통계</a></li>
			</c:if>
			<c:if test="${sessionScope.mgr.mgrLevel eq 0}"> <!-- 지점 매니저 -->
			<li><a href="/salesStatics/goBranchSales2.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("branchSales2.jsp")){%>on<%}%>">${sessionScope.mgr.mgrName} 매출 통계</a></li>
			</c:if>
			<%-- <li><a href="/salesStatics/goMenuSales.do" class="<%if(request.getRequestURL().toString().split("/")[7].equals("menuSales.jsp")){%>on<%}%>">메뉴별 매출 통계</a></li> --%>
		</ul>
	<%}%>

		<!-- 회원 관리 -->
	<%if(request.getRequestURL().toString().split("/")[5].equals("customer")){ %>
		<ul>
			<li><a href="allCustomerList.do" class="<%if(request.getRequestURL().toString().split("/")[6].equals("allCustomerList.jsp")){%>on<%}%>">회원 리스트</a></li>
		</ul>
	<%}%>
	
	<!-- 매장 정보 -->
	<%if(request.getRequestURL().toString().split("/")[5].equals("manager")||(request.getRequestURL().toString().split("/")[5].equals("headOffice")&& !p6.equals("SelectPromotion.jsp"))){ %>
		<ul>
			<li><a href="/managerProfile.do" class="<%if(request.getRequestURL().toString().split("/")[6].equals("managerProfile.jsp")){%>on<%}%>">매장 정보변경</a></li>
			<c:if test="${sessionScope.mgr.mgrId eq 'admin'}">
				<li><a href="/managerList.do?currentPage=''" class="<%if(request.getRequestURL().toString().split("/")[6].equals("managerList.jsp")){%>on<%}%>">매장 리스트</a></li>
				<li><a href="/managerApply.do?currentPage=''" class="<%if(request.getRequestURL().toString().split("/")[6].equals("managerApply.jsp")){%>on<%}%>">신청 리스트</a></li>
			</c:if>
		</ul>
	<%}%>
	
	<!-- 주문 관리 -->
	<%if(request.getRequestURL().toString().split("/")[5].equals("customerOrder")){ %>
		<ul>
			<li><a href="/cusOrderList.do?currentPage=''" class="<%if(request.getRequestURL().toString().split("/")[6].equals("cusOrderList.jsp")){%>on<%}%>">주문 리스트</a></li>
		</ul>
	<%}%>
	
	
	
	
</div>