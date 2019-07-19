<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<style>
	.board-search-box{
		position: static;
	}
	#link{
		float:left;
		position: static;
	}
	#allList,#mainLink,#slash{
		font-size:20px;
		color:black;
	}
	.onBtn,.offBtn {
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
	.onBtn {
		background-color: #f8585b;
	}
	.offBtn {
		background-color: #122322;
	}
	.pageNavi{
		color:black;
		text-align:center;
		margin-top:35px;
		font-size: 15px;
		font-weight: bold;
	}
	/* form ::: search */
   .form_searchM {border:2px solid #dddddd; height:41px;width:15%; display:block; vertical-align:middle; position:relative; padding-right:42px; }
   .form_searchM input{border:0; height:41px; width:100%; text-indent:14px; color:#292929; font-size:16px;}
   .form_searchM input::placeholder{color:#bbbbbb; font-size:16px;font-family:font_ns, sans-serif;}
   .form_searchM .btn_searchM{background:url(http://subway.co.kr/images/common/icon_search.png) 50% 50% no-repeat; width:41px; height:41px; position:absolute; right:0; top:0;}
   .form_searchM .btn_searchM:after{content:''; position:absolute; left:-2px; top:13px; width:2px; height:16px; background-color:#e5e5e5;}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 매장관리 > 가맹점 목록<br></div>
		<h1 class="comm-content-tit">가맹점</h1>
		<div class="board-search-box">
	 		<select name="statusGroup">
	 			<c:if test="${status == 1 || status == 2 || status == 3 }">
			 		<option selected="selected" disabled="disabled" value="${status }">
						<c:choose>
							<c:when test="${status == 1 }">준비</c:when>
							<c:when test="${status == 2 }">영업</c:when>
							<c:when test="${status == 3 }">폐업</c:when>
						</c:choose>
					</option>
	 			</c:if>
				<c:if test="${status != 1 && status != 2 && status != 3  }">
					<option selected="selected" disabled="disabled">상태분류</option>
				</c:if>
				<option id="open" value=2>영업</option>
				<option id="prepare" value=1>준비</option>
				<option id="close" value=3>폐업</option>
			</select>&nbsp;
			<select name="selectKeyword">
				<option id="name">이름</option>
				<option id="addr">주소</option>
			</select>&nbsp;
			<input type="text" maxlength="30" placeholder="가맹점 검색" value="${text }"style="height:34px; padding-left:5px;">
			<button type="button" class="bbs-search-btn" name="searchBtn">검색</button><br>
			<span id="link">
				<a href="/admin.do" id="mainLink">메인으로</a>
				<span id="slash">/</span>
				<a href="/managerList.do?currentPage=''" id="allList">상품 전체보기</a>
			</span>
		</div>
		<table class="comm-tbl" style="max-width:100%">
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
			<c:forEach items="${pd.list }" var="mgr" varStatus="i">
				<c:if test="${mgr.mgrLevel != 1}">
				<!-- 본점 제외하고 가맹점만 출력 -->
					<tr>
						<td style="text-align:center;">${mgr.rnum }</td>
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
			<c:if test="${pd.totalCount <= 0 }">
				<tr>
					<td colspan="9">신청 목록이 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<c:if test="${pd.totalCount <= 0 }">
			<div class="pageNavi">1</div>
		</c:if>
		<div class="pageNavi">
			${pd.pageNavi }
		</div>
	</div> 
</section>
<script type="text/javascript">
	$(document).ready(function(){
		//상태변경(오픈)
		$(".onBtn").click(function(){
			var mgrStatus = $(this).val();
			var mgrName = $(this).parent().parent().children().eq(3).html();
			if(confirm("변경하시겠습니까?")){
				location.href="/mgrUpdate.do?mgrStatus="+mgrStatus+"&mgrName="+mgrName+"&currentPage=''";
			}
		});
		//상태변경(폐점)
		$(".offBtn").click(function(){
			var mgrStatus = $(this).val();
			var mgrName = $(this).parent().parent().children().eq(3).html();
			if(confirm("변경하시겠습니까?")){
				location.href="/mgrUpdate.do?mgrStatus="+mgrStatus+"&mgrName="+mgrName+"&currentPage=''";
			}
		});
		//가맹점 검색
		$("[name=searchBtn]").click(function(){
			var keyword = $(this).prev().prev().val();
			var text = $(this).prev().val();
			var status1 = $(this).prev().prev().prev().val();			
			if(status1 == null){
				var status1 = -1;
			}
			location.href="/searchKeyword.do?keyword="+keyword+"&text="+text+"&status1="+status1+"&currentPage=''";
		});
 		//상태별 분류
		$("[name=statusGroup]").on("change",function(){
			var status1 = $(this).val();
			var keyword = $(this).next().val();
			var text = $(this).next().next().val();
			if(status1 == null){
				var status1 = -1;
			}
			location.href="/searchKeyword.do?status1="+status1+"&keyword="+keyword+"&text="+text+"&currentPage=''";
		});
	});
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />