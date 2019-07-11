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
		<div class="sub-menu">※ 매출통계 > 지점별 매출 통계</div>
		
		<form action="지점명 가져와" method="post">
			<div class="board-search-box branch">
				지점명 : <input type="text" name="searchBranch"> <button type="submit" class="bbs-search-btn" title="검색">검색</button>
				<select name="cusoBranch">
					<option value=""></option>
				</select>
			</div>
		</form>
		
		<div id="graph1" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div>
		<div id="graph2" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div><br><br><br>
		
		<div id="graph3" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div>
		<div id="graph4" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div>
		<div id="container2" style="width: 700px; height: 400px; margin: 20px auto; display:inline-block;float:left;"></div>
	
	
	
<script>
	$(document).ready(function(){		
		//그래프 디자인 설정
		Highcharts.setOptions({
			colors:['#ffce32','#009223'],	/* 막대 색상 */
//	         chart: {
// 	             backgroundColor: {
// 	                 linearGradient: [0, 0, 500, 500],
// 	                 stops: [
// 	                	 /* 그래프 밖 배경 흰색으로만 */
// 	                     [0, 'rgb(255, 255, 255)']/* ,
// 	                     [1, '#009223']*/
// 	                     ] 
// 	             },
// 	             borderWidth: 0,
// 	             plotBackgroundColor: 'rgba(255, 255, 255, .9)',	/* 그래프  배경 */
// 	             plotShadow: true,
// 	             plotBorderWidth: 1,
//	             
//	         },
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
	
		//전체 매출 가져오기(막대그래프)
		$.ajax({
			url:"/salesStatics/totalSales.do",
			dataType:'json',
			success : function(cost){ 
				var arr = new Array();
				for(var i=1;i<13;i++){
        			if(cost[i].cusoBranch=='total'){
        				//console.log(cost[i]);
        				if(Number(cost[i].orderMonth)==i){
        					//console.log(cost[i].totalCost);
        					arr.push(cost[i].totalCost);
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
			            text: '매출 통계',
			        },
			        subtitle: {
			            text: '월별 전체 매출액'
			        },
			        xAxis: {
			            categories: ['01월','02월', '03월', '04월','05월','06월','07월','08월','09월','10월','11월','12월'],
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
			            				getBranchSales(event.point.category)	//해당 월 보내주기
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
		
		
		//전체 매뉴 매출순위(파이차트)
		$.ajax({
			url:"/salesStatics/totalSales.do",
			dataType:'json',
			success : function(cost){ 
				var arr = new Array();
				for(var i=1;i<13;i++){
        			if(cost[i].cusoBranch=='total'){
        				if(Number(cost[i].orderMonth)==i){
        					//console.log(cost[i].totalCo3st);
        					arr.push(cost[i].totalCost);
        				}
        			}
				}
				//console.log(arr);
				for(var i=0;i<cost.length;i++){
					//console.log("지점명 : "+cost[i].cusoBranch+" 판매금액 : "+cost[i].totalCost+" 판매 일자 : "+cost[i].orderMonth+"<br>");
				}
				Highcharts.chart('graph2', {
			        chart: {
			            type: 'pie'
			        },
			        title: {
			            text: '매출 통계',
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
			            /* 클릭이벤트 */
			            /* series: {
			            	cursor: 'pointer',
			            	point:{
			            		events:{
			            			click:function(){
			            				getFunc()
			            			}
			            		}
			            	}
			            } */
			        },
			        series: [{
			        	name:"매출",
			        	colorByPoint:true,
			        	data: [{name:'당산점',y:290000},{name:'당산점',y:500000},{name:'당산점',y:2190000}]
			        }]
			    });
			}
		});

	
	});	//$(document) 종료
	
	
	//선택한 월의 매출 가져오기
	function  getBranchSales(month){
		
		$.ajax({
			url:"/salesStatics/monthTotalSales.do",
			data : {month:month},
			dataType:'json',
			success : function(branch){ 
				var name = new Array();	//지점명
				var cost = new Array();	//매출
				for(var i=0;i<10;i++){
					//console.log(branch);
					name.push(branch[i].cusoBranch);
					cost.push(branch[i].totalCost);
				}
				//console.log(name);
				//console.log(cost);
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
			            text: month,
			        },
			        subtitle: {
			            text: '서브 타이틀'
			        },
			        xAxis: {
			            categories: name,
			            crosshair: true
			        },
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
			            /* 클릭이벤트 */
			            series: {
			            	cursor: 'pointer',
			            	point:{
			            		events:{
			            			click:function(){
			            				//console.log(event.point.category)	//event.point : 클릭한 값에 대한 정보
			            				getFunc()
			            				getBranchSales(event.point.category)	//해당 월 보내주기
			            			}
			            		}
			            	}
			            }
			        },
			        series: [{
			        	name:"매출",
			        	data: cost
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