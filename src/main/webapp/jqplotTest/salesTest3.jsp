<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 선언 -->
<script type="text/javascript" src="/resources/js/jqplot/jquery.jqplot.js"></script>
<script type="text/javascript" src="/resources/js/jqplot/plugins/jqplot.barRenderer.js"></script>	<!-- 막대그래프를 위한 플러그인 없으면 기본적으로 꺾은선 그래프 -->
<script type="text/javascript" src="/resources/js/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/jqplot/jquery.jqplot.css"/>

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<div class="area">
		<div class="sub-menu">한 범주에 두개 이상의 막대</div>
	
	<script type="text/javascript">
		jQuery(document).ready(function () {
		    var line = [6,10,5,6,4];
		    var line2 = [11,5,2,7,6];
		    jQuery("#chart").jqplot([line,line2], {
		          title:"막대 그래프",
		          //seriesColors:['#FFCCE5', '#00749F'],		/* 그래프 색상 지정 */
		          stackSeries : false,	/* false : 따로따로, true: 한막대에 두개범주 같이 */
		          seriesDefaults:{
		            renderer:jQuery.jqplot.BarRenderer,
		            rendererOptions:{
		            	varyBarColor:true
		            }
		          },
		           axes:{
		              xaxis:{
		                renderer:jQuery.jqplot.CategoryAxisRenderer,		/* 축을 카테고리 (범주)로 취급 그리드를 카테고리 구분선으로 표시 할 때 필요 */
		                ticks:['트와이스', '러블리즈', '베리굿', '라붐', '여자친구']	/* X축 차트의 각 부분의 범주 */
		            }
		        }
		    });
		});
	</script>
	<div id="chart" style="width:750px;height:324px;"></div>

	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />