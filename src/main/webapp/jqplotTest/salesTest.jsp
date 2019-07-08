<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script><!-- jQuery 선언 -->
<script type="text/javascript" src="/resources/js/jqplot/jquery.jqplot.js"></script>
<script type="text/javascript" src="/resources/js/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
<%-- Header --%>



<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	
	<div class="area">
		<div class="sub-menu">※ 매출관리 > 매출 통계</div>
	
		<script type="text/javascript">
			jQuery(document).ready(function () {
			    var line = [['트와이스', 6], ['러블리즈', 5], ['베리굿', 2], ['라붐', 4], ['여자친구', 6]];
			    jQuery("#chart").jqplot([line], {
			          title:"기본 차트"
			        , seriesDefaults:{
			            renderer:jQuery.jqplot.BarRenderer
			        }
			        , axes:{
			            xaxis:{
			                renderer:jQuery.jqplot.CategoryAxisRenderer
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