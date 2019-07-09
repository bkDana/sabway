<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<style>
	input {
		-webkit-box-shadow: 0 0 0 1000px white inset;
		outline-style: none;
		width:250px;
		height:30px;
		font-size:20px;
	}
	[name=searchBox]{
		text-align:center;
	}
	select{
		height:35px;
		font-size:15px;
	}
	.onBtn,.offBtn{
		width:50px;
	    border: none;
	    color:#fff;
	    padding: 5px 0;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    margin: 4px;
	    cursor: pointer;
	    height: 35px;
	}
	.onBtn{
		background-color: #f8585b;
	}
	.offBtn{
		background-color: #122322;
	}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
	<div class="sub-menu">※ 매장관리 > 가맹점 목록</div>
		<table class="comm-tbl" style="max-width:1200px">
			<colgroup>
				<col width="5%">
				<col width="10%">
				<col width="7%">
				<col width="14%">
				<col width="20%">
				<col width="10%">
				<col width="8%">
				<col width="6%">
				<col width="15%">
			</colgroup>	
			<tr>
				<th style="text-align:center;">번호</th>
				<th style="text-align:center;">아이디</th>
				<th style="text-align:center;">이름</th>
				<th style="text-align:center;">가게이름</th>
				<th style="text-align:center;">주소</th>
				<th style="text-align:center;">전화번호</th>
				<th style="text-align:center;">개업일</th>
				<th style="text-align:center;">상태</th>
				<th style="text-align:center;">상태변경</th>
			</tr>
			<c:forEach items="${list }" var="mgr" varStatus="i">
				<c:if test="${mgr.mgrLevel != 1}">
				<!-- 본점 제외하고 가맹점만 출력 -->
					<tr>
						<td style="text-align:center;">${i.count }</td>
						<td style="text-align:center;">${mgr.mgrId }</td>
						<td style="text-align:center;">${mgr.mgrBossName }</td>
						<td style="text-align:center;">${mgr.mgrName }</td>
						<td style="text-align:center;">${mgr.mgrAddr }</td>
						<td style="text-align:center;">${mgr.mgrTel }</td>
						<td style="text-align:center;">${mgr.mgrEnrollDate }</td>
						<c:if test="${mgr.mgrStatus eq 1 }">
							<td style="color:green; text-align:center;">준비중</td>
							<td style="text-align:center;">
								<button type="button" class="onBtn" name="mgrStatus" value="2">영업</button>
								&nbsp;
								<button type="button" class="offBtn" name="mgrStatus" value="3">폐업</button>
							</td>
						</c:if>
						<c:if test="${mgr.mgrStatus eq 2 }">
							<td style="color:blue; text-align:center;">영업중</td>
							<td style="text-align:center;">
								<button type="button" class="offBtn" name="mgrStatus" value="3">폐업</button>
							</td>
						</c:if>
						<c:if test="${mgr.mgrStatus eq 3 }">
							<td style="color:Hotpink;text-align:center;">폐업</td>
							<td></td>
						</c:if>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<div name="searchBox">
			<select name="selectKeyword">
				<option id="name">이름</option>
				<option id="addr">지역</option>
			</select>
			<input type="text">
			<button type="button" name="searchBtn">검색</button>
		</div>
	</div>
</section>
<script type="text/javascript">
	$(document).ready(function(){
		$(".onBtn").click(function(){
			var mgrStatus = $(this).val();
			var mgrName = $(this).parent().parent().children().eq(3).html();
			location.href="/mgrUpdate.do?mgrStatus="+mgrStatus+"&mgrName="+mgrName;
		});
		$(".offBtn").click(function(){
			var mgrStatus = $(this).val();
			var mgrName = $(this).parent().parent().children().eq(3).html();
			location.href="/mgrUpdate.do?mgrStatus="+mgrStatus+"&mgrName="+mgrName;
		});
		$("[name=searchBtn]").click(function(){
			var keyword = $(this).parent().children().eq(0).val();
			var text = $(this).prev().val();
			location.href="/searchKeyword.do?keyword="+keyword+"&text="+text;
		});
	});
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />