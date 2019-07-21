<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" />

<%-- Content --%>
<img src="/resources/img/img_visual_sandwich.jpg" class="sub-img">
<div class="sub-menu-title">
	<c:if test='${param.no eq 1 }'>
		<p>Sandwich</p>
		<p>전세계 넘버원 브랜드 Subway!</p>
		<p>50년 전통의 세계 최고의 샌드위치를 맛보세요!</p>
	</c:if>
	<c:if test='${param.no eq 2 }'>
		<p>Chopped Salad</p>
		<p>양은 더 많이! 칼로리는 더 적게!</p>
		<p>신선한 야채와 다양한 소스로 가볍게 찹샐러드를 즐겨보세요!</p>
	</c:if>
	<c:if test='${param.no eq 3 }'>
		<p>Topping</p>
		<p>다양한 추가토핑을 추가해</p>
		<p>나만의 써브웨이 레시피를 만들어보세요.</p>
	</c:if>
	<c:if test='${param.no eq 4 }'>
		<p>Sides & Drink</p>
		<p>바삭하고 쫀득한 달콤한 쿠키와 간편하고 든든한 수프,</p>
		<p>커피와 음료까지 함께 즐길 수 있습니다.</p>
	</c:if>
	<c:if test='${param.no >= 5 }'>
		<p>Fresh Ingredients</p>
		<p>매장에서 직접 굽는 빵, 엄격하게 세척하는 야채의 신선함,</p>
		<p>써브웨이만의 다양한 소스를 맛보세요.</p>
	</c:if>
</div>

<section id="content-wrapper" style="background-color:#f6f6f6;">
	<div class="area" >
		<!-- '신선한 재료' 메뉴에서만 하위 메뉴 나옴 -->
		<c:if test='${param.no >= 5 }'>
			<div class="second-menu">
				<ul class="clearfix">
					<li>
						<a href="/intro/menu.do?no=5" class="<c:if test='${param.no eq 5 }'>on</c:if>">빵</a>
					</li>
					<li>
						<a href="/intro/menu.do?no=6" class="<c:if test='${param.no eq 6 }'>on</c:if>">채소</a>
					</li>
					<li>
						<a href="/intro/menu.do?no=7" class="<c:if test='${param.no eq 7 }'>on</c:if>">치즈</a>
					</li>
					<li>
						<a href="/intro/menu.do?no=8" class="<c:if test='${param.no eq 8 }'>on</c:if>">소스</a>
					</li>
				</ul>
			</div>
		</c:if>
		
		<ul class="menu-list clearfix">
			<c:forEach items="${list }" var="ingre">
				<li>
					<span class="etc">NEW</span>
					<span>
						<c:if test="${empty ingre.ingreFilepath }">
							<img src="/resources/img/sandwich.png" width="150px" height="150px"><br>
						</c:if>
						<c:if test="${not empty ingre.ingreFilepath }">
							<img src="/resources/upload/ingredients/${ingre.ingreFilepath }" ><br>
						</c:if>
					</span>
					<span class="label">${ingre.ingreLabel }</span>
					<span class="kcal">${ingre.ingreKcal }kcal</span>
					<div class="cover">
						<div class="cover-con">
							<div class="cover-inner">
								<span class="tit">${ingre.ingreLabel }</span>
								<span class="desc">${ingre.ingreDescription }</span>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</section>


<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />