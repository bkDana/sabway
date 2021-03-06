<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<style>
	 /* 써브웨이 ::: 매장찾기 레이어 */
	.store_search_wrapper{padding-top:60px;}
	.store_search_wrapper .store_map{height:700px; position:relative;}
	.store_search_wrapper .store_search_layer{position:absolute; left:20px; top:330px; z-index:3; width:340px; height:658px; padding:0 29px; background-color:#fff; border:1px solid #dddddd;}
	.store_search_wrapper .store_search_layer h2{color:#292929; font-size:28px; font-weight:bold; text-align:center; padding:34px 0 17px 0}
	.store_search_wrapper .store_search_layer .store_search{border:2px solid #dddddd; display:block; height:41px; position:relative}
	.store_search_wrapper .store_search_layer .store_search input{border:0; height:41px; width:223px; text-indent:14px; color:#bbbbbb; font-size:16px;}
	.store_search_wrapper .store_search_layer .store_search input::placeholder{color:#bbbbbb; font-size:16px;font-family:font_ns, sans-serif;}
	.store_search_wrapper .store_search_layer .store_search .btn_search{background:url(../images/common/icon_search.png) 50% 50% no-repeat; width:41px; height:41px; position:absolute; right:0; top:0}
	.store_search_wrapper .store_search_layer .store_search .btn_search:after{content:''; position:absolute; left:-2px; top:13px; width:2px; height:16px; background-color:#e5e5e5;}
	.store_search_wrapper .store_search_layer .search_result_cont .search_total{color:#999999; font-size:16px; margin-top:13px; letter-spacing:-0.01em}
	.store_search_wrapper .store_search_layer .search_result_cont .search_total strong{color:#009132; font-weight:bold;}
	.store_search_wrapper .store_search_layer .search_result_cont .store_list_scroll{margin-top:18px; height:421px; border-top:1px solid #dddddd; overflow:hidden;}
	.store_search_wrapper .store_search_layer .search_result_cont .store_list_scroll .mCSB_inside>.mCSB_container{margin-right:0}
	.store_search_wrapper .store_search_layer .search_result_cont .store_list_scroll .mCSB_scrollTools{width:4px !important; top:10px !important; bottom:10px !important; opacity:1 !important;}
	.store_search_wrapper .store_search_layer .search_result_cont .store_list_scroll .mCSB_scrollTools .mCSB_draggerRail{opacity:0 !important}
	.store_search_wrapper .store_search_layer .search_result_cont .store_list_scroll .mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{opacity:1 !important; background-color:#dddddd; width:4px;}
	.store_search_wrapper .store_search_layer .search_result_cont ul li{position:relative; padding:26px 0 17px 40px; border-bottom:1px solid #dddddd; cursor:pointer}
	.store_search_wrapper .store_search_layer .search_result_cont ul li a{display:block;}
	.store_search_wrapper .store_search_layer .search_result_cont ul li .num{display:block; width:30px; height:30px; text-align:center; line-height:26px; background-color:#009223; border-radius:100px; font-family:font_sw; font-weight:bold; color:#fff; position:absolute; left:0; top:23px;}
	.store_search_wrapper .store_search_layer .search_result_cont ul li strong{color:#292929; font-size:18px; font-weight:bold; padding-bottom:14px;display:block;}
	.store_search_wrapper .store_search_layer .search_result_cont ul li .info{color:#999999; font-size:13px; line-height:23px; margin-bottom:15px;}
	.store_search_wrapper .store_search_layer .search_result_cont ul li .info span{display:block; letter-spacing:-0.045em}
	.store_search_wrapper .store_search_layer .search_result_cont ul li .service{margin-left:-2px;}
	.store_search_wrapper .store_search_layer .search_result_cont ul li .service span{display:inline-block; font-size:13px; color:#666; border:1px solid #666; border-radius:30px; height:23px; line-height:23px; padding:0 8px; margin:0 0 8px 2px;}
	.store_search_wrapper .store_search_layer .search_result_cont .pagination .arr.prev{margin-right:27px;}
	.store_search_wrapper .store_search_layer .search_result_cont .pagination .arr.next{margin-left:27px;}
	.store_search_wrapper .store_search_layer .search_result_cont .pagination{position:absolute; left:0; width:100%; bottom:25px}
	
	.store_search_wrapper .store_map .store_map_layer{width:298px; height:243px; border:1px solid #000000; background-color:#fff; position:absolute; left:50%; top:50%; margin:-234px 0 0 -150px; z-index:0}
	.store_search_wrapper .store_map .store_map_layer:after{content:''; position:absolute; left:50%; bottom:-8px; width:12px; height:8px; margin-left:-6px; background:url(../images/subway/icon_arr_d.png) 0 0 no-repeat;}
	.store_search_wrapper .store_map .store_map_layer .head{background-color:#ffce32; position:relative; height:54px;}
	.store_search_wrapper .store_map .store_map_layer .head strong{color:#292929; font-size:18px; font-weight:300; display:block; padding:17px 0 0 23px; letter-spacing:-0.03em}
	.store_search_wrapper .store_map .store_map_layer .head .btn_close{background:url(../images/common/icon_close01.png) 50% 50% no-repeat; width:54px; height:54px; position:absolute; right:0; top:0; overflow:hidden; text-indent:-9999px; font-size:0; line-height:0}
	.store_search_wrapper .store_map .store_map_layer .info{margin:0 24px; border-bottom:1px solid #dddddd; height:133px}
	.store_search_wrapper .store_map .store_map_layer .info dl{overflow:hidden; padding-top:23px;}
	.store_search_wrapper .store_map .store_map_layer .info dt:before{content:''; width:2px; height:2px; display:inline-block; vertical-align:middle; background-color:#696969; margin-right:5px; position:relative; top:-1px}
	.store_search_wrapper .store_map .store_map_layer .foot{text-align: center; padding-top:17px;}
	.store_search_wrapper .store_map .store_map_layer .foot a{display:inline-block; color:#292929; font-size:16px; font-weight:300; letter-spacing:-0.045em;}
	.store_search_wrapper .store_map .store_map_layer .foot a:after{content:''; width:25px; height:25px; background:url(../images/common/icon_more.png) 0 0 no-repeat; display:inline-block; vertical-align:middle; margin-left:10px; position:relative; top:-2px;}
	.store_map_layer .foot {text-align: center;padding-top: 17px;}
	.store_map_layer .info dt { color: #292929; font-size: 16px;float: left;height: 21px;padding-left: 2px;position: relative;margin-bottom: 4px;letter-spacing: -0.04em;}
	.store_map_layer .info dd {color: #999999; font-size: 14px;line-height: 21px;margin: 0 0 4px 76px;position: relative;top: -3px;letter-spacing: -0.03em;min-height: 21px;}
	.store_map_layer .foot a {display: inline-block;color: #292929;font-size: 16px;font-weight: 300;letter-spacing: -0.045em;}
	
	
	/* 써브웨이 ::: 매장찾기 - 신규매장안내 */
	.new_store_content{background-color:#f6f6f6; padding:96px 0 100px; margin-bottom:95px;}
	.new_store_content .new_store_slider_wrapper{position:relative;}
	.new_store_content .new_store_slider_wrapper .store_list{overflow:hidden; margin:-30px 0 0 -30px;}
	.new_store_content .new_store_slider_wrapper .store_list li{width:270px; height:172px; background-color:#fff; float:left; position:relative; margin:30px 0 0 30px;}
	.new_store_content .new_store_slider_wrapper .store_list li .region{text-align:center; color:#292929; font-size:18px; padding-top:32px;}
	.new_store_content .new_store_slider_wrapper .store_list li .region strong{font-weight:bold; color:#292929; font-size:22px; text-align:center; display:block; margin-top:12px;}
	.new_store_content .new_store_slider_wrapper .store_list li .state{height:50px; position:absolute; left:0; width:100%; bottom:0; text-align:center; line-height:50px; font-weight:bold; font-size:18px;  font-family:font_sw;}
	.new_store_content .new_store_slider_wrapper .store_list li .state:after{content:''; width:12px; height:7px; position:absolute; left:50%; top:0; margin-left:-6px;}
	.new_store_content .new_store_slider_wrapper .store_list li .state.coming{background-color:#ffce32; color:#009223;}
	.new_store_content .new_store_slider_wrapper .store_list li .state.open{background-color:#009223; color:#ffce32;}
	.new_store_content .new_store_slider_wrapper .store_list li .state.open strong{color:#fff;}
	
	.new_store_content .new_store_slider_wrapper .bx-wrapper .bx-controls-direction a{width:50px; height:50px; position:absolute; top:50%; margin-top:-25px; overflow:hidden; font-size:0; line-height:0px; text-indent:-9999px;}
	.new_store_content .new_store_slider_wrapper .bx-wrapper .bx-controls-direction .bx-prev{background-position:0 0; left:-105px;}
	.new_store_content .new_store_slider_wrapper .bx-wrapper .bx-controls-direction .bx-prev:hover{background-position:0 100%}
	.new_store_content .new_store_slider_wrapper .bx-wrapper .bx-controls-direction .bx-next{background-position:100% 0; right:-105px}
	.new_store_content .new_store_slider_wrapper .bx-wrapper .bx-controls-direction .bx-next:hover{background-position:100% 100%}
	
	.new_store_content .new_store_slider_wrapper .bx-pager{position:absolute; right:-5px; top:-45px;}
	.new_store_content .new_store_slider_wrapper .bx-pager .bx-pager-item{display:inline-block; margin:0 5px;}
	.new_store_content .new_store_slider_wrapper .bx-pager a{display:block; width:10px; height:10px; background-color:#dddddd; font-size:0; line-height:0; text-indent:-9999px; overflow:hidden; border-radius:30px; transition-duration:0.3s}
	.new_store_content .new_store_slider_wrapper .bx-pager a.active{background-color:#ffc300; width:30px;}
	
	/* 써브웨이 ::: 매장안내 */
	.store_detail_wrapper{padding-top:60px;}
	.store_detail_wrapper .store_detail_layer{position:absolute; left:20px; top:80px; background-color:#fff; width:400px; border:1px solid #dddddd; padding:0 29px 20px; box-sizing:border-box; z-index:9}
	.store_detail_wrapper .store_detail_layer h2{text-align:center; font-size:28px; color:#292929; font-weight:bold; letter-spacing:-0.035em; padding:34px 0 0 0}
	.store_detail_wrapper .store_detail_layer .store_slider{height:229px; position:relative; margin:27px 0 25px 0;}
	.store_detail_wrapper .store_detail_layer .store_slider li{text-align:center; overflow:hidden; background-color:#fff;}
	.store_detail_wrapper .store_detail_layer .store_slider img{width:auto; height:200px}
	.store_detail_wrapper .store_detail_layer .store_slider .bx-controls-direction{display:none;}
	.store_detail_wrapper .store_detail_layer .store_slider .bx-pager{position:absolute; left:0; width:100%; bottom:0px; text-align:center }
	.store_detail_wrapper .store_detail_layer .store_slider .bx-pager .bx-pager-item{display:inline-block; margin:0 5px;}
	.store_detail_wrapper .store_detail_layer .store_slider .bx-pager a{display:block; width:10px; height:10px; background-color:#dddddd; font-size:0; line-height:0; text-indent:-9999px; overflow:hidden; border-radius:30px; transition-duration:0.3s}
	.store_detail_wrapper .store_detail_layer .store_slider .bx-pager a.active{background-color:#ffc300; width:30px;}
	.store_detail_wrapper .store_detail_layer dl{overflow:hidden;}
	.store_detail_wrapper .store_detail_layer dt{color:#292929; font-size:16px; float:left; letter-spacing:-0.035em; margin-bottom:16px; height:18px; margin-left:-4px;}
	.store_detail_wrapper .store_detail_layer dt:before{content:'ㆍ'; display:inline-block;}
	.store_detail_wrapper .store_detail_layer dd{margin-left:104px; color:#999999; font-size:16px; letter-spacing:-0.04em; margin-bottom:16px;}
	.store_detail_wrapper .store_detail_layer dd .service{margin-left:-2px; position:relative; top:2px;}
	.store_detail_wrapper .store_detail_layer dd .service span{display:inline-block; font-size:13px; color:#666; border:1px solid #666; border-radius:30px; height:23px; line-height:23px; padding:0 8px; margin:0 0 8px 2px; letter-spacing:0}
	.store_detail_wrapper .store_map{height:780px;}
	
	/* form ::: search */
	.form_search{border:2px solid #dddddd; height:41px; display:block; vertical-align:middle; position:relative; padding-right:42px}
	.form_search input{border:0; height:41px; width:100%; text-indent:14px; color:#292929; font-size:16px;}
	.form_search input::placeholder{color:#bbbbbb; font-size:16px;font-family:font_ns, sans-serif;}
	.form_search .btn_search{background:url(http://subway.co.kr/images/common/icon_search.png) 50% 50% no-repeat; width:41px; height:41px; position:absolute; right:0; top:0}
	.form_search .btn_search:after{content:''; position:absolute; left:-2px; top:13px; width:2px; height:16px; background-color:#e5e5e5;}
	
	.store_search_wrapper .store_map .store_map_layer{width:298px;height:243px;border:1px solid #000000;background-color:#fff;position:absolute;left:50%;top:50%;margin:-234px 0 0 -150px;z-index:0;}
	.store_search_wrapper .store_map .store_map_layer:after{content:''; position:absolute; left:50%; bottom:-8px; width:12px; height:8px; margin-left:-6px; background:url(../images/subway/icon_arr_d.png) 0 0 no-repeat;}
	.store_search_wrapper .store_map .store_map_layer .head{background-color:#ffce32; position:relative; height:54px;}
	.store_search_wrapper .store_map .store_map_layer .head strong{color:#292929; font-size:18px; font-weight:300; display:block; padding:17px 0 0 23px; letter-spacing:-0.03em}
	.store_search_wrapper .store_map .store_map_layer .head .btn_close{background:url(../images/common/icon_close01.png) 50% 50% no-repeat; width:54px; height:54px; position:absolute; right:0; top:0; overflow:hidden; text-indent:-9999px; font-size:0; line-height:0}
	.store_search_wrapper .store_map .store_map_layer .info{margin:0 24px; border-bottom:1px solid #dddddd; height:133px}
	.store_search_wrapper .store_map .store_map_layer .info dl{overflow:hidden; padding-top:23px;}
	.store_search_wrapper .store_map .store_map_layer .info dt{color:#292929; font-size:13px; float:left; height:21px; padding-left:2px; position:relative; margin-bottom:4px; letter-spacing:-0.04em}
	.store_search_wrapper .store_map .store_map_layer .info dt:before{content:''; width:2px; height:2px; display:inline-block; vertical-align:middle; background-color:#696969; margin-right:5px; position:relative; top:-1px}
	.store_search_wrapper .store_map .store_map_layer .info dd{color:#999999; font-size:13px; line-height:21px; margin:0 0 4px 76px; position:relative; top:-3px; letter-spacing:-0.03em; min-height:21px;}
	.store_search_wrapper .store_map .store_map_layer .foot{text-align: center; padding-top:17px;}
	.store_search_wrapper .store_map .store_map_layer .foot a{display:inline-block; color:#292929; font-size:16px; font-weight:300; letter-spacing:-0.045em;}
	 .store_map_layer .foot a:after { width: 25px;   height: 25px;  margin-left: 10px; top: -2px;}
	</style>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=4fytek2c6k&submodules=geocoder"></script>
</head>
<body>
   <div id="uiShopMap" style="width:100%;height:100%;"></div>
<script>



var x = 0;
var y = 0;
var map = null;
var marker = null;



var contentString = null;




function mapXyInfo (data) {
	
	var address = data.mgrAddr;
	
	naver.maps.Service.geocode({
	              query: address
	          }, function(status, response) {
	              if (status === naver.maps.Service.Status.ERROR) {
	                  return alert('Something Wrong!');
	              }
	
	              if (response.v2.meta.totalCount === 0) {
	                  return alert('totalCount' + response.v2.meta.totalCount);
	              }
	
	              var htmlAddresses = [],
	                  item = response.v2.addresses[0],
	                  point = new naver.maps.Point(item.x, item.y);
	
	              if (item.roadAddress) {
	                  htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
	              }
	
	              if (item.jibunAddress) {
	                  htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
	              }
	
	              if (item.englishAddress) {
	                  htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
	              }
	              
					x = item.x;
					y = item.y;
					contentString = [
						"<div class='store_map_layer'>",
						"	<div class='head'>",
						"		<strong>"+data.mgrName+"</strong>",
						"	</div>",
						"	<div class='info'>",
						"		<dl>",
						"			<dt>주소</dt>",
						"			<dd id='ui_storeInfoLayer_addr'>",
						data.mgrAddr,
						"			</dd>",
						"			<dt>연락처</dt>",
						"			<dd>"+data.mgrTel+"</dd>",
						"		</dl>",
						"	</div>",
						"	<div class='foot'>",
						"		<a href='#' style='font-weight:bold' onclick='detailMarket2("+data.mgrNo+")'>주문하기<img src='../resources/img/icon_more.png' style='margin-left:10px;margin-bottom:3px'>",
						"	</a></div>",
						"</div>"
						].join('');
					
					
					mapDoing();
		});
}


function mapDoing(){
	var cityhall = new naver.maps.LatLng(y, x);
	
	map = new naver.maps.Map(document.getElementById('uiShopMap'), {
		center: cityhall,
		zoom: 13,
		minZoom: 3,
		maxZoom: 16,
	});
	
	marker = new naver.maps.Marker({
		map: map,
		position: cityhall
	});

	var infowindow = new naver.maps.InfoWindow({
		content: contentString
	});

	infowindow.open(map, marker);
	
}


	$(document).ready(function(){
		var data = {
				mgrName : 'Sabway 시청점',
				mgrAddr : '서울 중구 세종대로 68 태평로2가 69-13 천일빌딩',
				mgrAddrCode : '04526',
				mgrNo : '1',
				mgrTel : '02-777-9200'
				
			} 
		
		mapXyInfo(data);
	})

</script>
</body>


