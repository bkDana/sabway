<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- Header --%>
<link rel="stylesheet" type="text/css" href="/resources/css/formwizard.css?after" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- 아임포트 api 추가 -->
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<script src="/resources/js/formwizard.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>

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
	<strong style="font-size:40px; font-weight:bolder;">온라인 주문 예약</strong>
		<c:if test="${not empty sessionScope.customer}">
			<a class="header-btn" style="margin-right:30px; float:right; cursor:pointer;"><img src="/resources/img/shopping-cart.png" width="30px"></a><!-- 장바구니 개수 넣어주세요 -->
		</c:if>
		<br><br><strong style="font-size:30px; font-weight:bolder;">${mgr.mgrName } 주문하기</strong>
		<form id="feedbackform" name="feedbackform" method="post">
			<fieldset class="sectionwrap">
				<legend>샌드위치/샐러드</legend>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
				</div>
				<div class="content-outlin-box">
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 hidden-space-btn">숨기기</button><br>
					</div>
					<div class="type img-box select-one fix-img" style="background-color:white;" >
						<img src="/resources/img/sandwich/sandwich_fl04.jpg">
						<p class="label">샌드위치</p>
					</div>
					<div class="type img-box select-one fix-img" style="background-color:white;" >
						<img src="/resources/img/salad/salad_fl04.jpg">
						<p class="label">샐러드</p>
					</div>
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 next-btn">다음</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>빵</legend>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
					<button type="button" class="btn-style2 prev-btn">이전</button>
				</div>
				<div class="content-outlin-box">
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 hidden-space-btn">숨기기</button><br>
					</div>
					<c:forEach items="${ingreList }" var="ingre" varStatus="status">
						<c:if test="${ingre.ingreType eq '빵' and ingre.ingreActive eq '1'}">
							<div class="bread img-box select-one">
								<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
								<p class="label">${ingre.ingreLabel }</p>
								<div class="button-box">
									<button type="button" class="bread-amount">15cm</button>
									<button type="button" class="bread-amount">30cm</button>
								</div>
								<input type="hidden" value="${ingre.ingreKcal }">
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 next-btn">다음</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>메인재료</legend>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
					<button type="button" class="btn-style2 prev-btn">이전</button>
				</div>
				<div class="content-outlin-box">
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 hidden-space-btn">숨기기</button><br>
					</div>				
					<c:forEach items="${ingreList }" var="ingre" varStatus="status">
						<c:if test="${ingre.ingreType eq '메인재료' and ingre.ingreActive eq '1' }">
	<%-- 						<label for="${ingre.ingreLabel }"><img src="/resources/upload/ingredients/${ingre.ingreFilepath }"></label>  --%>
	<%-- 						<input type="radio" class="hide" id="${ingre.ingreLabel }" name="isMain${status.conunt }" value="1"> --%>
							<div class="main img-box select-one">
								<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
								<p class="label">${ingre.ingreLabel }</p>
								<input type="hidden" value="${ingre.ingreKcal }">
								<c:set var="discnt" value="${ingre.ingreDiscntRate}"/>
								<c:if test="${discnt ne 0 }">
									
									<c:set var="cost15str" value="${ingre.ingreCost15*(100-discnt)/10000}"/>
									<c:set var="parseCost15" value="${fn:substringBefore(cost15str,'.') }"/>
									<c:set var="cost15" value="${parseCost15 }"/>
									
									<c:set var="cost30str" value="${ingre.ingreCost30*(100-discnt)/10000}"/>
									<c:set var="parseCost30" value="${fn:substringBefore(cost30str,'.') }"/>
									<c:set var="cost30" value="${parseCost30 }"/>
									<pre class="label half">15cm : <fmt:formatNumber value="${cost15*100 }" type="number"/>원</pre>
									<pre class="label full">30cm : <fmt:formatNumber value="${cost30*100 }" type="number"/>원</pre>
									<input type="hidden" value="${cost15*100 }">
									<input type="hidden" value="${cost30*100 }">
								</c:if>
								<c:if test="${ingre.ingreDiscntRate eq 0 }">
									<pre class="label half">15cm : <fmt:formatNumber value="${ingre.ingreCost15 }" type="number"/>원</pre>
									<pre class="label full">30cm : <fmt:formatNumber value="${ingre.ingreCost30 }" type="number"/>원</pre>
									<input type="hidden" value="${ingre.ingreCost15 }">
									<input type="hidden" value="${ingre.ingreCost30 }">
								</c:if>
								<input type="hidden" value="${ingre.ingreRecomSauce }">
							</div>
						</c:if>
					</c:forEach>
					<c:forEach items="${ingreList }" var="ingre" varStatus="status">
						<c:if test="${ingre.ingreType eq '샐러드' and ingre.ingreActive eq '1' }">
	<%-- 						<label for="${ingre.ingreLabel }"><img src="/resources/upload/ingredients/${ingre.ingreFilepath }"></label>  --%>
	<%-- 						<input type="radio" class="hide" id="${ingre.ingreLabel }" name="isMain${status.conunt }" value="1"> --%>
							<div class="salad img-box select-one">
								<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
								<p class="label">${ingre.ingreLabel }</p>
								<input type="hidden" value="${ingre.ingreKcal }">
								<c:set var="discnt" value="${ingre.ingreDiscntRate}"/>
								<c:if test="${discnt ne 0 }">
									
									<c:set var="cost15str" value="${ingre.ingreCost15*(100-discnt)/10000}"/>
									<c:set var="parseCost15" value="${fn:substringBefore(cost15str,'.') }"/>
									<c:set var="cost15" value="${parseCost15 }"/>
									
									<pre class="label half"><fmt:formatNumber value="${cost15*100 }" type="number"/>원</pre>
									<pre class="label full"><fmt:formatNumber value="${cost15*100 }" type="number"/>원</pre>
									<input type="hidden" value="${cost15*100 }">
									<input type="hidden" value="${cost15*100 }">
								</c:if>
								<c:if test="${ingre.ingreDiscntRate eq 0 }">
									<pre class="label half"><fmt:formatNumber value="${ingre.ingreCost15 }" type="number"/>원</pre>
									<pre class="label full"><fmt:formatNumber value="${ingre.ingreCost30 }" type="number"/>원</pre>
									<input type="hidden" value="${ingre.ingreCost15 }">
									<input type="hidden" value="${ingre.ingreCost15 }">
								</c:if>
								
								<input type="hidden" value="${ingre.ingreRecomSauce }">
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 next-btn">다음</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>치즈</legend>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
					<button type="button" class="btn-style2 prev-btn">이전</button>
				</div>
				<div class="content-outlin-box">
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 hidden-space-btn">숨기기</button><br>
					</div>				
					<div class="cheese img-box select-none fix-img" style="background-color:white; clear:both;" >
						<img src="/resources/img/cancelyellow.png">
						<p class="label">선택안함</p>
						<input type="hidden" value="0">
					</div>
					<c:forEach items="${ingreList }" var="ingre" varStatus="status">
						<c:if test="${ingre.ingreType eq '치즈' and ingre.ingreActive eq '1' }">
							<div class="cheese img-box select-one">
								<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
								<p class="label">${ingre.ingreLabel }</p>
								<input type="hidden" value="${ingre.ingreKcal }">
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 next-btn">다음</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>추가토핑</legend>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
					<button type="button" class="btn-style2 prev-btn">이전</button>
				</div>
				<div class="content-outlin-box">
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 hidden-space-btn">숨기기</button><br>
					</div>				
					<div class="topping img-box select-none fix-img" style="background-color:white; clear:both;" >
						<img src="/resources/img/cancelyellow.png">
						<p class="label">선택안함</p>
						<input type="hidden" value="0">
						<input type="hidden" value="0">
						<input type="hidden" value="0">
					</div>
					<c:forEach items="${ingreList }" var="ingre" varStatus="status">
						<c:if test="${ingre.ingreType eq '추가토핑' and ingre.ingreActive eq '1' }">
							<div class="topping img-box select-many">
								<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
								<p class="label">${ingre.ingreLabel }</p>
								<input type="hidden" value="${ingre.ingreKcal }">
								<input type="hidden" value="${ingre.ingreCost15 }">
								<input type="hidden" value="${ingre.ingreCost30 }">
								<pre class="label half">15cm : ${ingre.ingreCost15 }원</pre>
								<pre class="label full">30cm : ${ingre.ingreCost30 }원</pre>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 next-btn topping-check">다음</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>오븐</legend>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
					<button type="button" class="btn-style2 prev-btn">이전</button>
				</div>
				<div class="content-outlin-box">
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 hidden-space-btn">숨기기</button><br>
					</div>				
					<div class="oven img-box select-one fix-img" style="background-color:white;" >
						<img src="/resources/img/checkedyellow.png">
						<p class="label">오븐 사용</p>
					</div>
					<div class="oven img-box select-one fix-img" style="background-color:white;" >
						<img src="/resources/img/cancelyellow.png">
						<p class="label">오븐 미사용</p>
					</div>
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 next-btn">다음</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>채소</legend>
				<p>아무것도 선택하지 않으시면 모두 보통으로 들어갑니다.</p>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
					<button type="button" class="btn-style2 prev-btn">이전</button>
				</div>
				<div class="content-outlin-box">
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 hidden-space-btn">숨기기</button><br>
					</div>				
					<c:forEach items="${ingreList }" var="ingre" varStatus="status">
						<c:if test="${ingre.ingreType eq '채소' and ingre.ingreActive eq '1' }">
							<div class="vegi img-box">
								<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
								<p class="label">${ingre.ingreLabel }</p>
								<div class="button-box">
									<button type="button" class="vegi-amount">없음</button>
									<button type="button" class="vegi-amount">적게</button>
									<button type="button" class="vegi-amount select-vegi">보통</button>
									<button type="button" class="vegi-amount">많이</button>
								</div>
								<input type="hidden" value="${ingre.ingreKcal }">
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 vegi-check next-btn">다음</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>소스</legend>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
					<button type="button" class="btn-style2 prev-btn">이전</button>
				</div>
				<div class="content-outlin-box">		
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 source-recom">추천소스 적용</button><br>
					</div>
					<br>
					<div class="source img-box select-none fix-img" style="background-color:white; clear:both;" >
						<img src="/resources/img/cancelyellow.png">
						<p class="label">선택안함</p>
						<input type="hidden" value="0">
					</div>
					<c:forEach items="${ingreList }" var="ingre" varStatus="status">
						<c:if test="${ingre.ingreType eq '소스' and ingre.ingreActive eq '1' }">
							<div class="source img-box select-many">
								<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
								<p class="label">${ingre.ingreLabel }</p>
								<input type="hidden" value="${ingre.ingreKcal }">
							</div>
						</c:if>
					</c:forEach>
					
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 source-check next-btn">다음</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>세트메뉴</legend>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
					<button type="button" class="btn-style2 prev-btn">이전</button>
				</div>
				<div class="content-outlin-box">
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 hidden-space-btn">숨기기</button><br>
					</div>				
					<div class="set img-box select-one fix-img" style="background-color:white;" >
						<img src="/resources/img/checkedgreen.png">
						<p class="label">단품</p>
						<input type="hidden" value="0">
						<input type="hidden" value="0">
					</div>
					<c:forEach items="${ingreList }" var="ingre" varStatus="status">
						<c:if test="${ingre.ingreType eq '세트메뉴' and ingre.ingreActive eq '1' }">
							<div class="set img-box select-one" style="background-color:white;">
								<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
								<p class="label">${ingre.ingreLabel }</p>
								<input type="hidden" value="${ingre.ingreKcal }">
								<input type="hidden" value="${ingre.ingreCost15 }">
								<pre class="label half">${ingre.ingreCost15 }원</pre>
								<pre class="label full">${ingre.ingreCost15 }원</pre>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 next-btn">다음</button>
				</div>
			</fieldset>
			<fieldset class="sectionwrap">
				<legend>사이드메뉴</legend>
				<div class="common-tbl-btn-group prev-btn-box outline-box">
					<button type="button" class="btn-style2 prev-btn">이전</button>
				</div>
				<div class="content-outlin-box">
					<div class="common-tbl-btn-group">
						<button type="button" class="btn-style2 hidden-space-btn">숨기기</button><br>
					</div>				
					<div class="sidemenu img-box select-none fix-img" style="background-color:white; clear:both;" >
						<img src="/resources/img/cancelyellow.png">
						<p class="label">선택안함</p>
					</div>
					<c:forEach items="${ingreList }" var="ingre" varStatus="status">
						<c:if test="${ingre.ingreType eq '사이드메뉴' and ingre.ingreActive eq '1' }">
							<div class="sidemenu img-box select-many">
								<img width="100%" height="100%" src="/resources/upload/ingredients/${ingre.ingreFilepath }">
								<p class="label">${ingre.ingreLabel }</p>
								<input type="hidden" value="${ingre.ingreKcal }">
								<input type="hidden" value="${ingre.ingreCost15 }">
								<pre class="label half">${ingre.ingreCost15 }원</pre>
								<pre class="label full">${ingre.ingreCost15 }원</pre>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="common-tbl-btn-group next-btn-box outline-box">
					<button type="button" class="btn-style2 order-check">주문 확인</button>
				</div>
			</fieldset>
		
				<div class="common-tbl-box">
					<table class="comm-tbl type2">
						<colgroup>
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="9%">
							<col width="10%">
						</colgroup>
						<tr>
							<th>빵</th>
							<th>메인재료</th>
							<th>치즈</th>
							<th>추가토핑</th>
							<th>채소</th>
							<th>소스</th>
							<th>세트</th>
							<th>사이드</th>
							<th>수량</th>
							<th>가격</th>
							<th>취소</th>
						</tr>
					</table>
					<div class="common-tbl-btn-group">
						<button type="button" id="sbmOrder" class="btn-style2 add-order">추가 주문</button>
						<button type="button" id="sbmOrder" class="btn-style2">주문 완료</button>
					</div>
				</div>
			<input type="hidden" name="bucBread" class="orderInput">
			<input type="hidden" name="bucMain" class="orderInput">
			<input type="hidden" name="bucCheese" class="orderInput">
			<input type="hidden" name="bucTopping" class="orderInput">
			<input type="hidden" name="bucVegi" class="orderInput">
			<input type="hidden" name="bucSource" class="orderInput">
			<input type="hidden" name="bucSet" class="orderInput" value="단품">
			<input type="hidden" name="bucSide" class="orderInput">
			<input type="hidden" name="bucQuantity" class="orderInput">
			<input type="hidden" name="bucCost" class="orderInput">
			<input type="hidden" name="bucKcal" class="orderInput"> 
			<input type="hidden" name="bucIsSalad" class="orderInput">
			<input type="hidden" name="bucIsOvened" class="orderInput">
			<input type="hidden" name="bucBranch" class="orderInput" value="${mgr.mgrName }">
			<c:if test="${sessionScope.customer ne null }">
				<input type="hidden" name="bucCustomerIdx" class="orderInput" value="${sessionScope.customer.customerNo}">
			</c:if>
			<c:if test="${sessionScope.customer eq null }">
				<input type="hidden" name="bucCustomerIdx" class="orderInput" id="cookie">
			</c:if>
		</form>
		<input type="hidden" id="recom-sauce">
		<input type="hidden" id="recom-main">
	</div>
</section>

<!-- 이 스크립트는 아래에 있어야 작동함 -->
<script src="/resources/js/hor.js" type="text/javascript"></script> 
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />