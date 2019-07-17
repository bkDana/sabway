<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="http://code.jquery.com/jquery-3.4.0.min.js"></script>
 <script src="https://code.highcharts.com/highcharts.src.js"></script>	<!-- 하이차트 사용하기 -->

<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 매출통계 > 전체 매출 통계</div>
		
		<div id="graph1" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div>
		<div id="graph2" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div><br><br><br>
		
		<div id="graph3" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div>
		<div id="graph4" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div>
		<div id="container2" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div>
	
	
	
<script>
	//올해 년도 구하기
	var year1 = new Date();
	var year = year1.getFullYear(); 
	
	$(document).ready(function(){
		
		totalSales();
		totalMenuPie();
		
		//그래프 디자인 설정
		Highcharts.setOptions({
			colors:['#ffce32','#009223'],	/* 막대 색상 */
	         title:{
	        	 style: {
	        		 fontSize:'18px',
	        		 color:'#444',
	        		 fontFamily:'Noto Sans KR, 나눔고딕, NanumGothic, Nanum Gothic,돋움, Dotum, Arial, sans-serif'
	        	 }
	         },
	         subtitle:{
	        	 style: {
	        		 fontSize:'13px',
	        		 color:'#444',
	        		 fontFamily:'Noto Sans KR, 나눔고딕, NanumGothic, Nanum Gothic,돋움, Dotum, Arial, sans-serif'
	        	 }
	         },
	         yAxis: {
	             labels: {
	                 style: {
	                     color: '#444'
	                 }
	             },
	             lineColor: '#707073',
	             minorGridLineColor: '#505053',
	             tickColor: '#707073',
	             //tickWidth: 1,
	             title: {
	                 style: {
	                     color: '#444'
	                 }
	             }
	         },
	     });
		
	});	//$(document) 종료
	
	
	//전체 매출 가져오기(막대그래프)
	function totalSales(){
		$.ajax({
			url:"/salesStatics/totalSales.do",
			dataType:'json',
			success : function(cost){ 
				var arr = new Array();
				var month = new Array();
				console.log(cost);
				for(var i=1;i<13;i++){
        			if(cost[i].cusoBranch=='total'){
        				//console.log(cost[i]);
        				console.log(cost[i].orderMonth);
        				if(Number(cost[i].orderMonth)==i){
        					//console.log(cost[i].totalCost);
        					arr.push(cost[i].totalCost);
        					month.push(cost[i].orderMonth+"월");
        				}
        			}
				}
				//console.log(arr);
				for(var i=0;i<cost.length;i++){
					//console.log("지점명 : "+cost[i].cusoBranch+" 판매금액 : "+cost[i].totalCost+" 판매 일자 : "+cost[i].orderMonth+"<br>");
				}
				Highcharts.chart('graph1', {
			        chart: {
			            type: 'column',
		            	backgroundColor: {
			                 linearGradient: [0, 0, 500, 500],
			                 stops: [
			                	 /* 그래프 밖 배경 흰색으로만 */
			                     [0, 'rgb(255, 255, 255)']/* ,
			                     [1, '#009223']*/
			                     ] 
			             },
			             borderWidth: 0,
			             plotBackgroundColor: 'rgba(255, 255, 255, .9)',	/* 그래프  배경 */
			             plotShadow: true,
			             plotBorderWidth: 1,
			        },
			        title: {
			            text: year+'년도 전 매장 매출 현황',
			        },
			        /* subtitle: {
			            text: '월별 전체 매출액'
			        }, */
			        xAxis: {
			            categories: month,
			            crosshair: true
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: '가격 (원)'
			            }
			        },
			        tooltip: {
			            headerFormat: '<span style="font-size:10px;">{point.key}</span><table class="comm-tbl" style="width:100px;">',
			            pointFormat: '<tr><td style="color:{series.color};padding:0;">{series.name} </td>' +
			                '<td style="padding:0;"><b>{point.y} </b>원</td></tr>',
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
			            				console.log("막대그래프 클릭~!")	//event.point : 클릭한 값에 대한 정보
			            				console.log()
			            				getMonthTotalSales(event.point.category)	//해당 월 보내주기
			            				MonthtotalMenuPie(event.point.category)
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
	}
		
	//전체 매뉴 매출순위(파이차트)
	function totalMenuPie(){
		$.ajax({
			url:"/salesStatics/totalMenu.do",
			dataType:'json',
			success : function(cost){ 
				console.log(cost);
				var money=0;
				var arr = new Array();
				for(var i=1;i<6;i++){
					money += cost[i].totalCost;
					console.log(i+"위 메뉴 매출 금액 : "+money);
					arr.push({name:i+'위 '+cost[i].ingredients, y:cost[i].totalCost})
				}
				var etc = cost[0].totalCost - money;
				console.log("기타 메뉴 매출액 : "+etc);
				arr.push({name:'기타', y:etc});
				Highcharts.chart('graph2', {
			        chart: {
			            type: 'pie'
			        },
			        title: {
			            text: year+'년도 메뉴 매출 현황',
			        },
			        tooltip: {
			            headerFormat: '<span style="font-size:10px">{point.key}</span><table class="comm-tbl" style="width:150px;">',
			            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                '<td style="padding:0"><b>{point.y} 원</b></td></tr>',
			            footerFormat: '</table>',
			            shared: true,
			            useHTML: true
			        },
			        plotOptions: {
			            pie: {
			            	allowPointSelect: true,
			                cursor: 'pointer',
			                dataLabels: {
			                    enabled: true,
			                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
			                    style: {
			                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
			                    }
			                }
			            },
			        },
			        series: [{
			        	name:"매출",
			        	colorByPoint:true,
			        	data: arr
			        }]
			    });
			}
		});
	}	
		
	
	//선택한 월의 매출 가져오기
	function  getMonthTotalSales(month){
		$.ajax({
			url:"/salesStatics/monthTotalSales.do",
			data : {month:month},
			dataType:'json',
			success : function(branch){ 
				var name = new Array();	//지점명
				var cost = new Array();	//매출
				for(var i=0;i<branch.length;i++){
					console.log(branch[i].cusoBranch);
					name.push(branch[i].cusoBranch);
					cost.push(branch[i].totalCost);
					if(i==9){
						break;
					}
				}
				Highcharts.chart('graph3', {
			        chart: {
			            type: 'column',
		            	backgroundColor: {
			                 linearGradient: [0, 0, 500, 500],
			                 stops: [
			                	 /* 그래프 밖 배경 흰색으로만 */
			                     [0, 'rgb(255, 255, 255)']/* ,
			                     [1, '#009223']*/
			                     ] 
			             },
			             borderWidth: 0,
			             plotBackgroundColor: 'rgba(255, 255, 255, .9)',	/* 그래프  배경 */
			             plotShadow: true,
			             plotBorderWidth: 1,
			        },
			        title: {
			            text: month+' Top10 매장 매출 현황(?)',
			        },
			        subtitle: {
			            text: '서브 타이틀'
			        },
			        xAxis: {
			            categories: name,
			            crosshair: true
			        }, .
			        
			        yAxis: {
			            min: 0,
			            title: {
			                text: '가격 (원)'
			            }
			        },
			        tooltip: {
			            headerFormat: '<span style="font-size:10px">{point.key}</span><table class="comm-tbl" style="width:100px;">',
			            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                '<td style="padding:0"><b>{point.y} 원</b></td></tr>',
			            footerFormat: '</table>',
			            shared: true,
			            useHTML: true
			        },
			        plotOptions: {
			            column: {
			                pointPadding: 0.2,	/* 막대그래프 사이 간격 */
			                borderWidth: 0
			            },
			        },
			        series: [{
			        	name:"매출",
			        	data: cost
			        }]
			    });
			}
		});
	}
	
	//선택한 월 매뉴 매출순위(파이차트)
	function MonthtotalMenuPie(month){
		$.ajax({
			url:"/salesStatics/monthTotalMenu.do",
			data:{month:month},
			dataType:'json',
			success : function(cost){ 
				console.log(cost);
				var money=0;
				var arr = new Array();
				for(var i=1;i<6;i++){
					money += cost[i].totalCost;
					console.log(i+"위 메뉴 매출 금액 : "+money);
					arr.push({name:i+'위 '+cost[i].ingredients, y:cost[i].totalCost})
				}
				var etc = cost[0].totalCost - money;
				console.log("기타 메뉴 매출액 : "+etc);
				arr.push({name:'기타', y:etc});
				Highcharts.chart('graph4', {
			        chart: {
			            type: 'pie'
			        },
			        title: {
			            text: year+'년도'+month+' 메뉴 매출 현황',
			        },
			        tooltip: {
			            headerFormat: '<span style="font-size:10px">{point.key}</span><table class="comm-tbl" style="width:150px;">',
			            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			                '<td style="padding:0"><b>{point.y} 원</b></td></tr>',
			            footerFormat: '</table>',
			            shared: true,
			            useHTML: true
			        },
			        plotOptions: {
			            pie: {
			            	allowPointSelect: true,
			                cursor: 'pointer',
			                dataLabels: {
			                    enabled: true,
			                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
			                    style: {
			                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
			                    }
			                }
			            },
			        },
			        series: [{
			        	name:"매출",
			        	colorByPoint:true,
			        	data: arr
			        }]
			    });
			}
		});
	}	
	
	
		

</script>

		
		
		
		
		
		
		
	</div>
</section>
	
	
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />