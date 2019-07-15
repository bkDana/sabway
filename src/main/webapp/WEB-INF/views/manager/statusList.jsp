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
					<input type="hidden" value="${mgr.mgrStatus }">
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
		<div class="common-tbl-btn-group" name="moreDiv">
			<c:if test="${mgrSize+1 > mpd.lastPage && total > mpd.lastPage}">
				<hr>
				<button type="button" class="btn-style2 insert-review" name="more">더보기</button>
				<hr>
			</c:if>
			<input type="hidden" value="${mgrSize }" name="mgrSize">
			<input type="hidden" value="${total }" name="totalCount">
			<input type="hidden" value="${mpd.keyword }" name="keyword">
			<input type="hidden" value=${mpd.lastPage } name="pageName">
		</div>
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
			var status = $(this).parent().parent().children().eq(1).children().eq(1).children().eq(1).val();
			if(status==1){
				if(keyword == "이름"){
					location.href="/searchStatus.do?keyword="+keyword+"&text="+text+"&status="+status;
				}else if(keyword == "주소"){
					location.href="/searchStatus.do?keyword="+keyword+"&text="+text+"&status="+status;
				}
			}else if(status==2){
				if(keyword == "이름"){
					location.href="/searchStatus.do?keyword="+keyword+"&text="+text+"&status="+status;
				}else if(keyword == "주소"){
					location.href="/searchStatus.do?keyword="+keyword+"&text="+text+"&status="+status;
				}
			}else if(status==3){
				if(keyword == "이름"){
					location.href="/searchStatus.do?keyword="+keyword+"&text="+text+"&status="+status;
				}else if(keyword == "주소"){
					location.href="/searchStatus.do?keyword="+keyword+"&text="+text+"&status="+status;
				}
			}
		});
		//상태별 분류
		$("[name=statusGroup]").on("change",function(){
			var keyword = $(this).val();
			location.href="/selectStatus.do?keyword="+keyword;
		});
		//더보기(status)
		$("[name=more]").on("click",function(){
			var mgrSize = $('[name=mgrSize]').val();
			var keyword = $('[name=keyword]').val();
			var total = Number($('[name=totalCount]').val());
			var firstPage = Number($('[name=pageName]').val());
			var length = firstPage+10;
			console.log(length);
			//계산식들 추가해야 됨
			if(length <= total){
				$.ajax({
					url:"/mgrStatusMore.do",
					data:{firstPage:firstPage,keyword:keyword},
					dataType:"json",
					success:function(data){
						var last = Number($('[name=pageName]').val())+10;
						Number($('[name=pageName]').val(last));
						for(var i=0;i<data.length;i++){
							if(data[i].mgrStatus == 1){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:green;'>"+"준비중"+"</td><td style='text-align:center;'><button type='button' class='onBtn' name='mgrStatus' value='2'>영업</button>&nbsp;<button type='button' class='offBtn' name='mgrStatus' value='3'>폐업</button></td></tr>";
							}else if(data[i].mgrStatus == 2){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:blue;'>"+"영업중"+"</td><td style='text-align:center;'><button type='button' class='offBtn' name='mgrStatus' value='3'>폐업</button></td></tr>";
							}else if(data[i].mgrStatus == 3){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:pink;'>"+"폐업"+"</td><td style='text-align:center;'><button type='button'></button></td></tr>";
							}
							$('table').append(str);
						}
					}
				});		
			}else{
				$.ajax({
					url:"/mgrStatusMore.do",
					data:{firstPage:firstPage,keyword:keyword},
					dataType:"json",
					success:function(data){
						var last = Number($('[name=pageName]').val())+10;
						Number($('[name=pageName]').val(last));
						for(var i=0;i<data.length;i++){
							if(data[i].mgrStatus == 1){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:green;'>"+"준비중"+"</td><td style='text-align:center;'><button type='button' class='onBtn' name='mgrStatus' value='2'>영업</button>&nbsp;<button type='button' class='offBtn' name='mgrStatus' value='3'>폐업</button></td></tr>";
							}else if(data[i].mgrStatus == 2){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:blue;'>"+"영업중"+"</td><td style='text-align:center;'><button type='button' class='offBtn' name='mgrStatus' value='3'>폐업</button></td></tr>";
							}else if(data[i].mgrStatus == 3){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:pink;'>"+"폐업"+"</td><td style='text-align:center;'><button type='button'></button></td></tr>";
							}
							$('table').append(str);
						}
					}
				});		
				$("[name=moreDiv]").attr("style","display:none");
			}
		});
	});
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />