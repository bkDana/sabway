<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />
<style>
	.pageNavi{
		color:black;
		text-align:center;
		margin-top:35px;
		font-size: 15px;
		font-weight: bold;
	}
	#mainLink{
		background-color: gray;
		width:70px;
	    border: none;
	    color:#fff;
	    padding: 5px 0;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 15px;
	    margin: 4px;
	    cursor: pointer;
	}
	#searchOrder{
		height:36px;
		width:100px;
		margin-left: 10.6%;
	    text-align: center;
	}
	#searchBtn{
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
	#keyword {
		-webkit-box-shadow: 0 0 0 1000px white inset;
		outline-style: none;
		width:250px;
		height:30px;
		font-size:20px;
	}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">
			※ 메뉴관리 > 이벤트 / 할인<br>
			<button type="button" id="mainLink">메인으로</button>
		</div>
		<div class="common-tbl-box">
			<h1 class="comm-content-tit">프로모션</h1>
			<select id="searchOrder">
				<option>상품명</option>
			</select>
			<input type="text" id="keyword" placeholder="">
			<button type="button" id="searchBtn">검색</button>
			<br><br>
			<table class="comm-tbl" style="max-width: 1200px;">
				<tr>
					<td>No.</td>
					<td>상품명</td>
					<td>15cm</td>
					<td>30cm</td>
					<th>행사</th>
					<td>할인 후 가격</td>
				</tr>
				<c:forEach items="${pd.list }" var="ingre" varStatus="i">
					<input type="hidden" value="${ingre.ingreType }">
					<input type="hidden" value="${ingre.ingreIdx }">
					<c:if test="${ingre.ingreType == '메인재료'}">
 						<tr>
 							<td><span>${ingre.rnum }</span></td>
							<td><span>${ingre.ingreLabel }</span></td>
 							<td><span>${ingre.ingreCost15 }</span></td>
 							<td><span>${ingre.ingreCost30 }</span></td>
 							<td>
								<!-- 선택한 promotion으로 DB update -->
								<select name="ingreDiscntRate"><!-- 상품 할인 유/무 & 할인율 선택 -->
									<option selected="selected" disabled="disabled">
										<c:choose>
											<c:when test="${ingre.ingreDiscntRate != 0 }">${ingre.ingreDiscntRate }% 할인</c:when>
											<c:otherwise>할인선택</c:otherwise>
										</c:choose>
									</option>
									<option value=1.0>적용안함</option>
									<option value=0.9>10% 할인</option>
									<option value=0.8>20% 할인</option>
									<option value=0.7>30% 할인</option>
								</select>
							</td>
 							<td>
 								<span></span>
 							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<div class="pageNavi">${pd.pageNavi }</div>
		</div>
	</div>
	<script type="text/javascript">
	//선택한 할인율에 따른 가격 변경
	$('[name=ingreDiscntRate]').on('change',function(){
		var ingreIdx = $(this).parent().parent().prev().val();
		var ingreType = $(this).parent().parent().prev().prev().val();
		var ingreCost15 = $(this).parent().prev().prev().children().html();
		var ingreCost30 = $(this).parent().prev().children().html();
		var discntRate = $(this).val();
		//화면 출력용
		var ingreCost15Discnt = Math.round(discntRate*ingreCost15);
		var ingreCost30Discnt = Math.round(discntRate*ingreCost30);
		$(this).parent().next().children().html('15cm : '+ingreCost15Discnt+'<br>30cm : '+ingreCost30Discnt);
		//할인율 선택하면 바로 적용
		$.ajax({
			url:"/selectPromotion.do?currentPage=''",
			dataType:"json",
			data:{ingreIdx:ingreIdx,ingreType:ingreType,discntRate:discntRate},
			success:function(){
				alert("적용이 완료되었습니다.");
			},
			error:function(){
				alert("에러발생. 다시 시도해주세요.");
			}
		});
	});
	//메인페이지 이동 버튼
	$("#mainLink").click(function(){
		location.href="/admin.do";
	});
	//상품명 검색 리스트 가져오기
	$("#searchBtn").click(function(){
		var keyword = $("#keyword").val();
		location.href="/searchPromotion.do?currentPage=''"+"&keyword="+keyword;
	});
	</script>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />