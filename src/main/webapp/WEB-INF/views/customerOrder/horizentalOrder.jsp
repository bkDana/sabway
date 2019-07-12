<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- Header --%>
<link rel="stylesheet" type="text/css" href="/resources/css/formwizard.css?after" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="/resources/js/formwizard.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>

<!-- 모든 한글로 쓰인 attribute : 실재 EL로 바꿔야함 -->
<script type="text/javascript">
var myform=new formtowizard({
	formid: 'feedbackform',
	persistsection: true,
	revealfx: ['slide', 300]
});
</script>
<%-- content--%>
<section id="content-wrapper">
	<div class="area">
		<c:if test="${not empty sessionScope.customer}">
			<a class="header-btn" href="/myBucket.do">내 주문정보 보기</a>
		</c:if>
		<br><br>
		<h1>온라인 주문 예약</h1><br>
		<form id="feedbackform" action="/submitCusOrder.do" method="post">
			<fieldset class="sectionwrap">
				<legend>샌드위치/샐러드</legend>
				<div class="type img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/sandwich/sandwich_fl04.jpg">
					<p class="label">샌드위치</p>
				</div>
				<div class="type img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/salad/salad_fl04.jpg">
					<p class="label">샐러드</p>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>빵</legend>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '빵'}">
						<div class="bread img-box select-one">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
							<div class="button-box">
								<button type="button" class="bread-amount">15cm</button>
								<button type="button" class="bread-amount">30cm</button>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>주 재료</legend>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '메인재료' }">
<%-- 						<label for="${ingre.ingreLabel }"><img src="/resources/upload/ingredients/${ingre.ingreFilepath }"></label>  --%>
<%-- 						<input type="radio" class="hide" id="${ingre.ingreLabel }" name="isMain${status.conunt }" value="1"> --%>
						<div class="main img-box select-one">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
						</div>
					</c:if>
				</c:forEach>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>치즈</legend>
				<div class="cheeze img-box select-none fix-img" style="background-color:white; clear:both;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">선택안함</p>
				</div>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '치즈' }">
						<div class="cheeze img-box select-one">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
						</div>
					</c:if>
				</c:forEach>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>추가토핑</legend>
				<div class="topping img-box select-none fix-img" style="background-color:white; clear:both;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">선택안함</p>
				</div>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '추가토핑' }">
						<div class="topping img-box select-many">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
						</div>
					</c:if>
				</c:forEach>
				<div class="common-tbl-btn-group">
					<button type="button" class="btn-style2 topping-check" style="clear:both;">토핑 선택완료</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>오븐</legend>
				<div class="oven img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/checkedyellow.png">
					<p class="label">오븐 사용</p>
				</div>
				<div class="oven img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">오븐 미사용</p>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>채소</legend>
				<p>아무것도 선택하지 않으시면 모두 보통으로 들어갑니다.</p>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '채소' }">
						<div class="vegi img-box">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
							<div class="button-box">
								<button type="button" class="vegi-amount">없음</button>
								<button type="button" class="vegi-amount">적게</button>
								<button type="button" class="vegi-amount select-vegi">보통</button>
								<button type="button" class="vegi-amount">많이</button>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<div class="common-tbl-btn-group">
					<button type="button" class="btn-style2 vegi-check" style="clear:both;">채소 선택완료</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>소스</legend>
				<div class="source img-box select-none fix-img" style="background-color:white; clear:both;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">선택안함</p>
				</div>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '소스' }">
						<div class="source img-box select-many">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
						</div>
					</c:if>
				</c:forEach>
				<div class="common-tbl-btn-group">
					<button type="button" class="btn-style2 source-check" style="clear:both;">소스 선택완료</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>사이드메뉴</legend>
				<div class="sidemenu img-box select-none fix-img" style="background-color:white; clear:both;" >
					<img src="/resources/img/cancelyellow.png">
					<p class="label">선택안함</p>
				</div>
				<c:forEach items="${ingreList }" var="ingre" varStatus="status">
					<c:if test="${ingre.ingreType eq '사이드메뉴' }">
						<div class="sidemenu img-box select-many">
							<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
							<p class="label">${ingre.ingreLabel }</p>
						</div>
					</c:if>
				</c:forEach>
				<div class="common-tbl-btn-group">
					<button type="button" class="btn-style2 sidemenu-check" style="clear:both;">사이드 선택완료</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>세트</legend>
				<div class="set img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/checkedgreen.png">
					<p class="label">단품</p>
				</div>
				<div class="set img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/checkedgreen.png">
					<p class="label">감자칩세트</p>
				</div>
				<div class="set img-box select-one fix-img" style="background-color:white;" >
					<img src="/resources/img/checkedgreen.png">
					<p class="label">쿠키세트</p>
				</div>
			</fieldset>
				<input type="hidden" name="bucBread" class="orderInput">
				<input type="hidden" name="bucMain" class="orderInput">
				<input type="hidden" name="bucVegi" class="orderInput">
				<input type="hidden" name="bucCheese" class="orderInput">
				<input type="hidden" name="bucSource" class="orderInput">
				<input type="hidden" name="bucTopping" class="orderInput">
				<input type="hidden" name="bucSide" class="orderInput">
				<input type="hidden" name="bucIsSalad" class="orderInput">
				<input type="hidden" name="bucIsOvened" class="orderInput">
				<input type="hidden" name="bucSet" class="orderInput">
				<input type="hidden" name="bucCost" class="orderInput">
				<input type="hidden" name="bucKcal" class="orderInput"> 
				<input type="hidden" name="bucQua" class="orderInput">
				<input type="hidden" name="bucQuantity" class="orderInput">
				
			<div id="test" style="width:100%; height:150px; background-color:white;">
				<h3>장바구니 영역</h3>
				<div id="orderAjax">
					<span id="ajaxMain"></span>&nbsp;<span id="ajaxBread"></span>&nbsp;<span id="ajaxIs15"></span>
					&nbsp;<span id="ajaxCheese"></span>&nbsp;<span id="ajaxTopping"></span>&nbsp;<span id="ajaxIsOvened"></span>
					&nbsp;<span id="ajaxVegi"></span>&nbsp;<span id="ajaxSource"></span>&nbsp;<span id="ajaxSide"></span>&nbsp;<span id="ajaxSet"></span>
					<br>
					<select class="hide">
						<option>수량</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
					</select>
				</div>
				<div id="costWrapper"><span id="totalCost"></span><br></div>
				<div id="btn-wrapper" style="width:400px; margin-left:400px; background-color:orange;">
					<button type="submit">주문</button>
					<button type="button">추가주문</button>
				</div>
			</div>
		</form>
	</div>
</section>
<!-- 이 스크립트는 아래에 있어야 작동함 -->
<script src="/resources/js/hor.js" type="text/javascript"></script> 
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />