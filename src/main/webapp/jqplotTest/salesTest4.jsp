<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 선언 -->
<script type="text/javascript" src="/resources/js/jqplot/jquery.jqplot.js"></script>
<script type="text/javascript" src="/resources/js/jqplot/plugins/jqplot.barRenderer.js"></script>	<!-- 막대그래프를 위한 플러그인 없으면 기본적으로 꺾은선 그래프 -->
<script type="text/javascript" src="/resources/js/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
<script type="text/javascript" src="/resources/js/jqplot/plugins/jqplot.pointLabels.js"></script>	<!-- 막대 그래프 위에 레이블 생성 -->
<link rel="stylesheet" type="text/css" href="/resources/css/jqplot/jquery.jqplot.css"/>

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<div class="area">
		<div class="sub-menu">막대 그래프에 레이블</div>
	
	<script type="text/javascript">
		jQuery(document).ready(function () {
			var line = [['트와이스', 9], ['러블리즈', 8], ['걸스데이', 4], ['에이핑크', 6], ['AOA', 8], ['라붐', 6], ['여자친구', 6], ['블랙핑크', 4], ['레드벨벳', 5]];
			//var line = [[9,'트와이스'], [8,'러블리즈'], [4,'걸스데이'], [6,'에이핑크'], [ 8,'AOA'], [6,'라붐'], [6,'여자친구'], [4,'블랙핑크'], [5,'레드벨벳']];
		    jQuery("#chart").jqplot([line], {
		          title:"막대 그래프",
		          seriesDefaults:{ renderer:jQuery.jqplot.BarRenderer },
		          series:[
		            {
		                pointLabels:{
		                    show:true,
		                    labels:['JYP', '울림', '드림티', '플랜에이', 'FNC', 'NH EMG', '쏘스뮤직', 'YG', 'SM']
		                }
		            }
		        ],
		          axes:{
		              xaxis:{ renderer:jQuery.jqplot.CategoryAxisRenderer },
		              yaxis:{ padMax:1.3 }
		        }
		    });
		});
	</script>
	<div id="chart" style="width:750px;height:324px;"></div>

	</div>
</section>

<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />