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
		<div class="sub-menu">※ 매출통계 > ${sessionScope.mgr.mgrName} 매출 통계</div>
		
		
		<div id="graph1" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;">${sessionScope.mgrName }</div>
		<div id="graph2" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div><br><br><br>
		
		<!-- <div id="graph3" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div>
		<div id="graph4" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div> -->
	
	
	
<script>
	var year1 = new Date();
	var year = year1.getFullYear();
	var month1 = year1.getMonth()+1;	
	
	
	//지점 셀렉했을 시 지점 매출현황 가져오기
	/* $("#selBranch").change(function(){
		getBranchSales();
		getBranchMenuSales();
	}); */
	
	//지점 매출현황 가져오기
	function getBranchSales2(){
		var branchName = '${sessionScope.mgr.mgrName}';
		console.log("지점명 : "+branchName);
		$.ajax({
			url : "/salesStatics/getBranchSales.do",
			dataType: "json",
			data: {branchName:branchName},
			success : function(cost){
				//console.log(cost);
				var arr = new Array();
				var month = new Array();
				for(var i=0;i<cost.length;i++){
					console.log(cost[i].orderMonth);
					console.log(cost[i].totalCost);
					if(cost[i].orderMonth!='total'){
							console.log("콘솔 찍히냐");
	       					//console.log(cost[i].totalCost);
	       					month.push(cost[i].orderMonth+"월");
	       					arr.push(cost[i].totalCost);
	       					if(i==11){
	       						break;
	       					}
					}
				}
				//console.log("배열얼얼:"+arr);
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
			            text: year+"년도 "+branchName+" 매출 현황",
			        },
			        subtitle: {
			            text: '서브 타이틀'
			        },
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
			            				getMonthBranchMenuSales2(event.point.category)	//해당 월 보내주기
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
			},
			error: function(){
				console.log("지점 매출 못가져왔어..");
			}
		});
	}

	//해당 지점 당월 메뉴 매출순위(파이차트)
	function getBranchMenuSales2(){
		var branchName = '${sessionScope.mgr.mgrName}';
		console.log("지점명 : "+branchName);
		$.ajax({
			url:"/salesStatics/branchMenuSales.do",
			data: {branchName:branchName},
			dataType:'json',
			success : function(cost){ 
				console.log(cost);
				var money=0;
				var arr = new Array();
				console.log("cost배열 길이:"+cost.length);
				if(cost.length>5){
					for(var i=1;i<6;i++){
						money += cost[i].totalCost;
						console.log(i+"위 메뉴 매출 금액 : "+money);
						arr.push({name:i+'위 '+cost[i].ingredients, y:cost[i].totalCost})
					}
					var etc = cost[0].totalCost - money;
				}
				if(cost.length<6){
					for(var i=1;i<cost.length;i++){
						money += cost[i].totalCost;
						console.log(i+"위 메뉴 매출 금액 : "+money);
						arr.push({name:i+'위 '+cost[i].ingredients, y:cost[i].totalCost})
					}
					var etc = cost[0].totalCost - money;
				}
				console.log("기타 메뉴 매출액 : "+etc);
				arr.push({name:'기타', y:etc});
				//console.log(arr);
				Highcharts.chart('graph2', {
			        chart: {
			            type: 'pie'
			        },
			        title: {
			            text: branchName+' '+month1+'월 메뉴 매출 현황',
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
	
	//해당 월 메뉴 매출순위(파이차트)
	function getMonthBranchMenuSales2(month){
		var branchName = '${sessionScope.mgr.mgrName}';
		console.log("지점명 : "+branchName);
		$.ajax({
			url:"/salesStatics/monthBranchMenuSales.do",
			data: {month:month,branchName:branchName},
			dataType:'json',
			success : function(cost){ 
				console.log(cost);
				var money=0;
				var arr = new Array();
				if(cost.length>5){
					for(var i=1;i<6;i++){
						money += cost[i].totalCost;
						console.log(i+"위 메뉴 매출 금액 : "+money);
						arr.push({name:i+'위 '+cost[i].ingredients, y:cost[i].totalCost})
					}
					var etc = cost[0].totalCost - money;
				}
				if(cost.length<6){
					for(var i=1;i<cost.length;i++){
						money += cost[i].totalCost;
						console.log(i+"위 메뉴 매출 금액 : "+money);
						arr.push({name:i+'위 '+cost[i].ingredients, y:cost[i].totalCost})
					}
					var etc = cost[0].totalCost - money;
				}
				console.log("기타 메뉴 매출액 : "+etc);
				arr.push({name:'기타', y:etc});
				//console.log(arr);
				Highcharts.chart('graph2', {
			        chart: {
			            type: 'pie'
			        },
			        title: {
			            text: branchName+' '+month+' 메뉴 매출 현황',
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
	
	
	$(document).ready(function(){
		getBranchSales2();
		getBranchMenuSales2();
		
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
</script>


	</div>
</section>
	
	
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />