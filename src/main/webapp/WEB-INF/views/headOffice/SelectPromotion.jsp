<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 메뉴관리 > 이벤트 / 할인</div>
		<div class="common-tbl-box">
			<h1 class="comm-content-tit">프로모션</h1>
			<form action="/selectPromotion.do" method="post">
				<table class="comm-tbl" >
					<tr>
						<th>상품명</th>
						<th>판매가</th>
						<th>행사</th>
						<th>적용 후 금액(확인용)</th>
					</tr>
 						<tr>
							<!-- Menu의 db 정보 사용 -->
							<!-- 예시 -->
							<td>
								<select name="menuNo">
									<option selected="selected" disabled="disabled">상품선택</option>
									<optgroup label="샌드위치">
										<c:forEach items="${list }" var="m" varStatus="i">
											<option value="${i.index }" >${m.menuName }</option>
										</c:forEach>
									</optgroup>
								</select>
								<input type="hidden" name="menuName" value="" >
								<c:forEach items="${list }" var="m">
									<span name="spMenuName" style="display:none;">${m.menuName }</span>
								</c:forEach>
							</td>
							<td>
								<c:forEach items="${list }" var="m">
									<span style="display:none;">${m.menuBasePrice }</span>
								</c:forEach>
								<input type="hidden" name="menuBasePrice" value="">
							</td>
							<td>
								<!-- 선택한 promotion으로 DB update -->
								<select name="menuDiscntRate2"><!-- 상품 할인 유/무 & 할인율 선택 -->
									<option selected value=1.0>적용안함</option>
									<option value=0.9>10% 할인</option>
									<option value=0.8>20% 할인</option>
									<option value=0.7>30% 할인</option>
								</select>
							</td>
							<td>
								<input type="hidden" name="menuDiscntPrice" value="">
								<span class="menuDiscntPrice"></span>
							</td>
						</tr>
				</table>
				<div class="common-tbl-btn-group">
					<button class="btn-style2" type="submit">적용</button>
					<button class="btn-style2" type="button"><a href="/admin.do">메인으로</a></button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		//메뉴 변경시 적용되게
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
		});
	</script>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />