<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
<!-- <script src="https://code.highcharts.com/highcharts.src.js"></script>	하이차트 사용하기 -->
<script src="https://code.highcharts.com/highcharts.src.js"></script>	<!-- 하이차트 사용하기 -->
<!-- <script type="text/javascript" src="/resources/js/highcharts/highcharts.js"></script> -->

<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 매출통계</div>
		
		<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div> <Br>
    	<div id="container2" style="width: 550px; height: 400px; margin: 0 auto"></div> <br>
    	<div id="container3" style="width: 550px; height: 400px; margin: 0 auto"></div> 
	
	<form action="/salesStatics/getSales.do">
		<button type="button" id="btn1">테스트1</button>
	</form>
	<div id="test1" style="width: 550px; height: 400px; margin: 0 auto"></div><br>
	
	
<script>
	function getFunc(){
		alert("되느냐?");
	}
	
	$(function () { 
		$("#btn1").click(function(){
			$.ajax({
				url:"/salesStatics/getSales.do",
				dataType:'json',
				success : function(cost){
					var arr = new Array();
					for(var i=1;i<13;i++){
	        			if(cost[i].cusoBranch=='total'){
	        				if(Number(cost[i].orderMonth)==i){
	        					console.log(cost[i].totalCost);
	        					arr.push(cost[i].totalCost);
	        				}
	        			}
					}
					console.log(arr);
					for(var i=0;i<cost.length;i++){
						console.log("지점명 : "+cost[i].cusoBranch+" 판매금액 : "+cost[i].totalCost+" 판매 일자 : "+cost[i].orderMonth+"<br>");
					}
					Highcharts.chart('test1', {
				        chart: {
				            type: 'column'
				        },
				        title: {
				            text: '매출 통계'
				        },
				        subtitle: {
				            text: '월별 전체 매출액'
				        },
				        xAxis: {
				            categories: ['Jan','Feb', 'Mar', 'Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
				            crosshair: true
				        },
				        yAxis: {
				            min: 0,
				            title: {
				                text: '가격 (원)'
				            }
				        },
				        tooltip: {
				            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
				            footerFormat: '</table>',
				            shared: true,
				            useHTML: true
				        },
				        plotOptions: {
				            column: {
				                pointPadding: 0.2,	/* 막대그래프 사이 간격 */
				                borderWidth: 0
				            },
				            /* 클릭이벤트 */
				            series: {
				            	cursor: 'pointer',
				            	point:{
				            		events:{
				            			click:function(){
				            				getFunc()
				            			}
				            		}
				            	}
				            }
				        },
				        series: [{
				        	name:"매출",
				        	data: arr
				        }]
				    });
				}
			});
		});
		
		
		
		
		Highcharts.setOptions({
	         chart: {
	             backgroundColor: {
	                 linearGradient: [0, 0, 500, 500],
	                 stops: [
	                     [0, 'rgb(255, 255, 255)'],
	                     [1, 'rgb(200, 200, 2000)']
	                     ]
	             },
	             borderWidth: 2,
	             plotBackgroundColor: 'rgba(255, 255, 255, .9)',
	             plotShadow: true,
	             plotBorderWidth: 1
	         }
	     });


	    var myChart = Highcharts.chart('container', {
	        /* 차트종류 */
	        //chart: { type: 'column' },	/* line:꺾은선 그래프, column : 막대그래프 */
			
	        /* 제목 / 부제목 */
	        title: { text: 'Fruit Consumption' },
	        subtitle: { text: 'Fruit Consumption Decenber'},
	
	        /* X축 / Y 축 */
	        xAxis: { categories: ['Apples', 'Bananas', 'Oranges'] },
	        yAxis: { title: { text: 'Fruit eaten' } },
	
	        /* 범례 */
	        legend: { layout: 'vertical', align: 'right', verticalAlign: 'middle', borderWidth:0 },
	
	        /* 툴팁 */
	        tooltip: {valueSuffix: '개'},
	
	        /* 표 데이터 */
	        series: [
	            { type: 'column', name: 'Jane', data: [1, 1, 4] },
	            { type: 'line',name: 'John', data: [5, 7, 3] },
	            { type: 'line',name: 'data', data: [6, 10, 3] },
	        ]
	    });
	    
	    var chart2 = new Highcharts.Chart({
	         chart: {
	             renderTo: 'container2',
	             type: 'bar'
	         },
	         xAxis: {
	             type: 'datetime'
	         },
	         series: [{
	             data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 
	                    135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
	             pointStart: Date.UTC(2010, 0, 1),
	             pointInterval: 3600 * 1000  // one hour
	         }]
	     });
	    
	    
	    Highcharts.chart('container3', {
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: '매출 통계'
	        },
	        subtitle: {
	            text: '월별 전체 매출액'
	        },
	        xAxis: {
	            categories: ['Jan','Feb', 'Mar', 'Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
	            crosshair: true
	        },
	        yAxis: {
	            min: 0,
	            title: {
	                text: '가격 (원)'
	            }
	        },
	        tooltip: {
	            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
	            footerFormat: '</table>',
	            shared: true,
	            useHTML: true
	        },
	        plotOptions: {
	            column: {
	                pointPadding: 0.2,	/* 막대그래프 사이 간격 */
	                borderWidth: 0
	            }
	        },
	        series: [{
	            name: 'Tokyo',
	            data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]

	        }, {
	            name: 'New York',
	            data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]

	        }, {
	            name: 'London',
	            data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]

	        }, {
	            name: 'Berlin',
	            data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]

	        }]
	    });
	});
</script>

		
		
		
		
		
		
		
	</div>
</section>
	
	
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />