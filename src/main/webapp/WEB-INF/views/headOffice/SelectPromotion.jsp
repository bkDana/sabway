<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 메뉴관리 > 이벤트 / 할인</div>
		<div class="common-tbl-box">
			<h1 class="comm-content-tit">프로모션</h1>
			<table class="comm-tbl" >
				<tr>
					<td>No.</td>
					<td>상품명</td>
					<td>15cm</td>
					<td>30cm</td>
					<th>행사</th>
					<td>할인 후 가격</td>
				</tr>
				<c:forEach items="${list }" var="ingre" varStatus="i">
					<input type="hidden" value="${ingre.ingreType }">
					<c:if test="${ingre.ingreType == '메인재료'}">
 						<tr>
 							<td><span>${i.count }</span></td>
							<td><span>${fn:escapeXml(ingre.ingreLabel) }</span></td>
 							<td><span>${ingre.ingreCost15 }</span></td>
 							<td><span>${ingre.ingreCost30 }</span></td>
 							<td>
								<!-- 선택한 promotion으로 DB update -->
								<select name="ingreDiscntRate"><!-- 상품 할인 유/무 & 할인율 선택 -->
									<option selected="selected" disabled="disabled">할인선택</option>
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
			<div class="common-tbl-btn-group">
				<button class="btn-style2" type="button" id="submitLink">할인적용</button>
				<button class="btn-style2" type="button" id="mainLink">메인으로</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	//선택한 할인율에 따른 가격 변경
	$('[name=ingreDiscntRate]').on('change',function(){
		var ingreType = $(this).parent().parent().prev().val();
		var ingreLabel = $(this).parent().prev().prev().prev().children().html();
		var ingreCost15 = $(this).parent().prev().prev().children().html();
		var ingreCost30 = $(this).parent().prev().children().html();
		var discntRate = $(this).val();
		//화면 출력용
		var ingreCost15Discnt = Math.round(discntRate*ingreCost15);
		var ingreCost30Discnt = Math.round(discntRate*ingreCost30);
		$(this).parent().next().children().html('15cm : '+ingreCost15Discnt+'<br>30cm : '+ingreCost30Discnt);
		//할인 적용한 메뉴 submit
		$("#submitLink").click(function(){
			$.ajax({
				url:"/selectPromotion.do",
				dataType:"json",
				data:{ingreLabel:ingreLabel,ingreType:ingreType,discntRate:discntRate},
				success:function(data){
					console.log(ingreLabel+" = " + '15cm : '+ingreCost15Discnt+' / 30cm : '+ingreCost30Discnt);
				}
			});
		});
	});
	//메인페이지 이동 버튼
	$("#mainLink").click(function(){
		location.href="/admin.do";
	});
	</script>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />