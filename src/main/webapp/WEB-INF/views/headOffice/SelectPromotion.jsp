<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	.comm-tbl th,.comm-tbl td{
		text-align: center;
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
		<div class="sub-menu">※ 메뉴관리 > 이벤트 / 할인</div>
		<h1 class="comm-content-tit">프로모션</h1>
		<div class="board-search-box">
			<select name="statusGroup">
				<option>상품명</option>
			</select>
			<input type="text" maxlength="30" placeholder="상품 검색" value="${keyword }"style="height:34px; padding-left:5px;">
			<button type="button" class="bbs-search-btn" name="searchBtn">검색</button><br>
			<span id="link">
				<a href="/admin.do" id="mainLink">메인으로</a>
				<span id="slash">/</span>
				<a href="/promotionSelect.do?currentPage=''" id="allList">상품 전체보기</a>
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
			</colgroup>	
			<tr>
				<th>No.</th>
				<th>상품명</th>
				<th>15cm</th>
				<th>30cm</th>
				<th>행사</th>
				<th>할인 후 가격</th>
			</tr>
			<c:forEach items="${pd.list }" var="ingre" varStatus="i">
				<input type="hidden" value="${ingre.ingreType }">
				<input type="hidden" value="${ingre.ingreIdx }">
				<c:if test="${ingre.ingreType == '메인재료'}">
					<tr>
						<td><span>${ingre.rnum }</span></td>
						<td><span>${ingre.ingreLabel }</span></td>
						<td><span>${ingre.ingreCost15 }</span>원</td>
						<td><span>${ingre.ingreCost30 }</span>원</td>
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
			<c:if test="${pd.totalCount <= 0 }">
				<tr>
					<td colspan="9">상품 정보가 없습니다.</td>
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
		$(this).parent().next().children().html('15cm : '+ingreCost15Discnt+"원 /"+' 30cm : '+ingreCost30Discnt+"원");
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
	//상품명 검색 리스트 가져오기
	$("[name=searchBtn]").click(function(){
		var keyword = $(this).prev().val();
		location.href="/searchPromotion.do?currentPage=''"+"&keyword="+keyword;
	});
	</script>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />