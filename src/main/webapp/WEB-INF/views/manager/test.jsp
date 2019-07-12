<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 매장관리 > 가맹점 목록</div>
		<table class="comm-tbl" style="max-width:1200px">
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
		<div class="common-tbl-btn-group">
			<input type="hidden" value="${total }" name="totalCount">
			<input type="hidden" value=${pn.lastPage } name="pageName">
			<button type="button" class="btn-style2 insert-review" name="more">더보기</button>
		</div>
		<br><br>
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
		//더보기
		$("[name=more]").on("click",function(){
			var total = Number($('[name=totalCount]').val());
			var firstPage = Number($('[name=pageName]').val());
			var length = firstPage+10;
			console.log(length);
			if(length <= total){
				$.ajax({
					url:"/mgrPageMore.do",
					data:{firstPage:firstPage},
					dataType:"json",
					success:function(data){
						var last = Number($('[name=pageName]').val())+10;
						Number($('[name=pageName]').val(last));
						for(var i=0;i<data.length;i++){
							if(data[i].mgrStatus == 1){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:green;'>"+"준비중"+"</td><td style='text-align:center;'><button type='button'>영업중</button></td></tr>";
							}else if(data[i].mgrStatus == 2){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:blue;'>"+"영업중"+"</td><td style='text-align:center;'><button type='button'></button></td></tr>";
							}else if(data[i].mgrStatus == 3){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:pink;'>"+"폐업"+"</td><td style='text-align:center;'><button type='button'></button></td></tr>";
							}
							$('table').append(str);
						}
						/*
						$('[name=pageName]').val(lastPage);
						var first = $('[name=pageName]').val(); 
						var noArr = (data.mgrNo).split(',');
						var idArr = (data.mgrId).split(',');
						var bossNameArr = (data.mgrBossName).split(',');
						var nameArr = (data.mgrName).split(',');
						var addrArr = (data.mgrAddr).split(',');
						var telArr = (data.mgrTel).split(',');
						var enrollDateArr = (data.mgrEnrollDate).split(',');
						var statusArr = (data.mgrStatus).split(',');
						for(var i=0;i<data.arrSize;i++){
							if(statusArr[i] == 1){
								var str = "<tr><td style='text-align:center;'>"+noArr[i]+"</td><td style='text-align:center;'>"+idArr[i]+"</td><td style='text-align:center;'>"+bossNameArr[i]+"</td><td style='text-align:center;'>"+nameArr[i]+"</td><td style='text-align:center;'>"+addrArr[i]+"</td><td style='text-align:center;'>"+telArr[i]+"</td><td style='text-align:center;'>"+enrollDateArr[i]+"</td><td style='text-align:center;color:green;'>"+"준비중"+"</td><td style='text-align:center;'><button </td></tr>";
							}else if(statusArr[i] == 2){
								var str = "<tr><td style='text-align:center;'>"+noArr[i]+"</td><td style='text-align:center;'>"+idArr[i]+"</td><td style='text-align:center;'>"+bossNameArr[i]+"</td><td style='text-align:center;'>"+nameArr[i]+"</td><td style='text-align:center;'>"+addrArr[i]+"</td><td style='text-align:center;'>"+telArr[i]+"</td><td style='text-align:center;'>"+enrollDateArr[i]+"</td><td style='text-align:center;color:blue;'>"+"영업중"+"</td><td style='text-align:center;'></td></tr>";
							}else if(statusArr[i] == 3){
								var str = "<tr><td style='text-align:center;'>"+noArr[i]+"</td><td style='text-align:center;'>"+idArr[i]+"</td><td style='text-align:center;'>"+bossNameArr[i]+"</td><td style='text-align:center;'>"+nameArr[i]+"</td><td style='text-align:center;'>"+addrArr[i]+"</td><td style='text-align:center;'>"+telArr[i]+"</td><td style='text-align:center;'>"+enrollDateArr[i]+"</td><td style='text-align:center;color:pink;'>"+"폐업"+"</td><td style='text-align:center;'></td></tr>";
							}
							$('table').append(str);
						}
						*/
					}
				});		
			}else{
				$.ajax({
					url:"/mgrPageMore.do",
					data:{firstPage:firstPage},
					dataType:"json",
					success:function(data){
						var last = Number($('[name=pageName]').val())+10;
						Number($('[name=pageName]').val(last));
						for(var i=0;i<data.length;i++){
							if(data[i].mgrStatus == 1){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:green;'>"+"준비중"+"</td><td style='text-align:center;'><button type='button'>영업중</button></td></tr>";
							}else if(data[i].mgrStatus == 2){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:blue;'>"+"영업중"+"</td><td style='text-align:center;'><button type='button'></button></td></tr>";
							}else if(data[i].mgrStatus == 3){
								var str = "<tr><td style='text-align:center;'>"+data[i].mgrNo+"</td><td style='text-align:center;'>"+data[i].mgrId+"</td><td style='text-align:center;'>"+data[i].mgrBossName+"</td><td style='text-align:center;'>"+data[i].mgrName+"</td><td style='text-align:center;'>"+data[i].mgrAddr+"</td><td style='text-align:center;'>"+data[i].mgrTel+"</td><td style='text-align:center;'>"+data[i].mgrEnrollDate+"</td><td style='text-align:center;color:pink;'>"+"폐업"+"</td><td style='text-align:center;'><button type='button'></button></td></tr>";
							}
							$('table').append(str);
						}
					}
				});		
				$("[name=more]").attr("style","display:none");
			}
		});
	});
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />