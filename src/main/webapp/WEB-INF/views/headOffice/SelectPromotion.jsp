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
							<td><span>${ingre.ingreLabel }</span></td>
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
			console.log(ingreType+","+ingreLabel+","+discntRate);
			location.href="/selectPromotion.do?ingreLabel="+ingreLabel+'&ingreType='+ingreType+"&discntRate="+discntRate;
		});
	});
	//메인페이지 이동 버튼
	$("#mainLink").click(function(){
		location.href="/admin.do";
	});
	
/* 		//메뉴 변경시 적용되게
		var selectMenu;
		var discntPrice;
		$('[name=menuNo]').on("change",function(){//상품을 선택해서 값이 변하면
			$(this).parent().siblings().eq(0).children().hide();//선택한 객체의 부모객체의 바로 다음 형제의 자식객체들을 다 숨김
			$(this).parent().siblings().eq(0).children().eq($(this).val()).show();//선택한 객체의 부모객체의 바로 다음 형제의 자식객체 중에서 선택한 인덱스의 객체만 보이게
			var selectMenuName = $('[name=spMenuName]').eq($(this).val()).html();//이름 저장
			$('[name=menuName]').val(selectMenuName);

			selectMenu = $(this).parent().siblings().eq(0).find('span').eq($(this).val()).html();//선택한 selectBox의 index(메뉴)에 들어있는 가격을 변수에 저장
			$('[name=menuBasePrice]').val(selectMenu);//controller에 보낼 파라미터(가격을 저장한 변수를 전달)
			
			//선택 되어있는 함수 적용
				var price = selectMenu;//가격 변수
				var rate = $('[name=menuDiscntRate2]').val();//할인 계산용 변수
				$('rate').attr("selected","selected");
				var discntPrice = Math.round(price*rate);//할인율 변수
				//view page 출력용 menuDiscntPrice값  
				$(".menuDiscntPrice").html(discntPrice);
				//controller 전달용 menuDiscntPrice 파라미터 
				$("[name=menuDiscntPrice]").val(discntPrice);
			
			//할인율 변경했을 때 적용
			$('[name=menuDiscntRate2]').on("change",function(){
				var price = selectMenu;//가격 변수
				var rate = $('[name=menuDiscntRate2]').val();//할인 계산용 변수
				$('rate').attr("selected","selected");
				discntPrice = Math.round(price*rate);//할인율 변수
				//view page 출력용 menuDiscntPrice값  
				$(".menuDiscntPrice").html(discntPrice);
				//controller 전달용 menuDiscntPrice 파라미터 
				$("[name=menuDiscntPrice]").val(discntPrice);
			});
		}); */
	</script>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />