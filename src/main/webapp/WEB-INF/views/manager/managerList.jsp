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
		margin-left: 20%;
	}
	select{
		height:36px;
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
	[name=searchBtn]{
		background-color: gray;
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
	[name=selectBox]{
		width:100px;
		margin-left: 10.6%;
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
				<th style="text-align:center;">가입일</th>
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
							<td style="color:Hotpink;text-align:center;" name="mgrStatus" value="3">폐업</td>
							<td></td>
						</c:if>
					</tr>
				</c:if>
			</c:forEach>
		</table>
		<br>
		<hr>
		<%-- <c:if test="${mgr.size }"> --%>
		<div style="text-align:center;"><button type="button" name="more" >더보기(More)</button></div>
		<%-- </c:if> --%>
		<hr>
		<br>
		<span name="selectBox">
			<select name="statusGroup">
				<option selected="selected" disabled="disabled">상태 분류</option>
				<option id="open">영업</option>
				<option id="prepare">준비</option>
				<option id="close">폐업</option>
			</select>&nbsp;
		</span>
		<span name="searchBox">
			<select name="selectKeyword">
				<option id="name">이름</option>
				<option id="addr">주소</option>
			</select>&nbsp;
			<input type="text">
			<button type="button" name="searchBtn">검색</button>
		</span>
	</div>
</section>
<script type="text/javascript">
	$(document).ready(function(){
		//상태변경(오픈)
		$(".onBtn").click(function(){
			var mgrStatus = $(this).val();
			var mgrName = $(this).parent().parent().children().eq(3).html();
			if(confirm("변경하시겠습니까?")){
				location.href="/mgrUpdate.do?mgrStatus="+mgrStatus+"&mgrName="+mgrName;
			}
		});
		//상태변경(폐점)
		$(".offBtn").click(function(){
			var mgrStatus = $(this).val();
			var mgrName = $(this).parent().parent().children().eq(3).html();
			if(confirm("변경하시겠습니까?")){
				location.href="/mgrUpdate.do?mgrStatus="+mgrStatus+"&mgrName="+mgrName;
			}
		});
		//가맹점 검색
		$("[name=searchBtn]").click(function(){
			var keyword = $(this).parent().children().eq(0).val();
			var text = $(this).prev().val();
			if(keyword == "이름"){
				location.href="/searchKeyword.do?keyword="+keyword+"&text="+text;
			}else if(keyword == "주소"){
				location.href="/searchKeyword.do?keyword="+keyword+"&text="+text;
			}
		});
		//상태별 분류
		$("[name=statusGroup]").on("change",function(){
			var keyword = $(this).val();
			location.href="/selectStatus.do?keyword="+keyword;
		});
		$("[name=more]").on("click",function(){
			$.ajax({
				url:"",
				data:{},
				success:function(){
					
				}
			});
		});
	});
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />