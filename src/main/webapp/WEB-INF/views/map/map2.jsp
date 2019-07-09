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
.store_search_wrapper .store_map .store_map_layer .info dt{color:#292929; font-size:13px; float:left; height:21px; padding-left:2px; position:relative; margin-bottom:4px; letter-spacing:-0.04em}
.store_search_wrapper .store_map .store_map_layer .info dt:before{content:''; width:2px; height:2px; display:inline-block; vertical-align:middle; background-color:#696969; margin-right:5px; position:relative; top:-1px}
.store_search_wrapper .store_map .store_map_layer .info dd{color:#999999; font-size:13px; line-height:21px; margin:0 0 4px 76px; position:relative; top:-3px; letter-spacing:-0.03em; min-height:21px;}
.store_search_wrapper .store_map .store_map_layer .foot{text-align: center; padding-top:17px;}
.store_search_wrapper .store_map .store_map_layer .foot a{display:inline-block; color:#292929; font-size:16px; font-weight:300; letter-spacing:-0.045em;}
.store_search_wrapper .store_map .store_map_layer .foot a:after{content:''; width:25px; height:25px; background:url(../images/common/icon_more.png) 0 0 no-repeat; display:inline-block; vertical-align:middle; margin-left:10px; position:relative; top:-2px;}


/* 써브웨이 ::: 매장찾기 - 신규매장안내 */
.new_store_content{background-color:#f6f6f6; padding:96px 0 100px; margin-bottom:95px;}
.new_store_content .new_store_slider_wrapper{position:relative;}
.new_store_content .new_store_slider_wrapper .store_list{overflow:hidden; margin:-30px 0 0 -30px;}
.new_store_content .new_store_slider_wrapper .store_list li{width:270px; height:172px; background-color:#fff; float:left; position:relative; margin:30px 0 0 30px;}
.new_store_content .new_store_slider_wrapper .store_list li .region{text-align:center; color:#292929; font-size:18px; padding-top:32px;}
.new_store_content .new_store_slider_wrapper .store_list li .region strong{font-weight:bold; color:#292929; font-size:22px; text-align:center; display:block; margin-top:12px;}
.new_store_content .new_store_slider_wrapper .store_list li .state{height:50px; position:absolute; left:0; width:100%; bottom:0; text-align:center; line-height:50px; font-weight:bold; font-size:18px;  font-family:font_sw;}
.new_store_content .new_store_slider_wrapper .store_list li .state:after{content:''; width:12px; height:7px; background:url(../images/subway/icon_store_arr.png) 0 0 no-repeat; position:absolute; left:50%; top:0; margin-left:-6px;}
.new_store_content .new_store_slider_wrapper .store_list li .state.coming{background-color:#ffce32; color:#009223;}
.new_store_content .new_store_slider_wrapper .store_list li .state.open{background-color:#009223; color:#ffce32;}
.new_store_content .new_store_slider_wrapper .store_list li .state.open strong{color:#fff;}

.new_store_content .new_store_slider_wrapper .bx-wrapper .bx-controls-direction a{width:50px; height:50px; background:url(../images/news/icon_event_slider_arr.png) no-repeat; position:absolute; top:50%; margin-top:-25px; overflow:hidden; font-size:0; line-height:0px; text-indent:-9999px;}
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

 </style>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=4fytek2c6k"></script>
</head>
<body>
   <div id="uiShopMap" style="width:100%;height:100%;"></div>
<script>
var naverMap = {
      map: null,
      markers: [],
      infoWindows: [],
      HOME_PATH : window.HOME_PATH || '.',
      MARKER_SPRITE_X_OFFSET : 29,
      MARKER_SPRITE_Y_OFFSET : 50,
      MARKER_SPRITE_POSITION : {},
      init: function(initLoc) {

         naverMap.map = new naver.maps.Map(document.getElementById('uiShopMap'), {
            zoom: 10,
            minZoom: 5,
            //zoomControl: true,
            //scaleControl: true,
            //mapTypeControl: true,
            zoomControlOptions: { //줌 컨트롤의 옵션
                  position: naver.maps.Position.BOTTOM_RIGHT
              }
         });

         //naverMap.infowindow = new naver.maps.InfoWindow();

         if (initLoc == null && navigator.geolocation) {
              navigator.geolocation.getCurrentPosition(naverMap.onSuccessGeolocation, naverMap.onErrorGeolocation);
          }
         else {
            naverMap.map.setCenter(initLoc);
         }
      },
      push: function(shop, callback) {

         //기존 마커 삭제
         naverMap.removeMarkers();

         //지도에 표시하기
         var bounds = naverMap.map.getBounds(),
             southWest = bounds.getSW(),
             northEast = bounds.getNE();

         var markers = [],
             infoWindows = [];

         var center, index=0;
         for (var key in naverMap.MARKER_SPRITE_POSITION) {

            var position = new naver.maps.LatLng(
                  naverMap.MARKER_SPRITE_POSITION[key][1],
                  naverMap.MARKER_SPRITE_POSITION[key][0]);

            if(center == null || center == undefined ) {
               center = position;
            }

             var marker = new naver.maps.Marker({
               map: naverMap.map,
               position: position,
               title: key,
               // icon: {
               //    // url: naverMap.HOME_PATH +'/img/example/sp_pins_spot_v3.png',
               //    url: '/images/subway/icon_pin.png',
               //    size: new naver.maps.Size(40, 58),
               //    origin: new naver.maps.Point(0, 0),
               //    anchor: new naver.maps.Point(25, 26)
               // },
               zIndex: index
            });

            //마커 정보창
            var infoWindow = new naver.maps.InfoWindow({
               content: [
                  '<div style="width:300px;text-align:left;padding:5px;font-size:12px">',
                  '   <h3><strong style="font-size:15px">'+shop[index].storNm+'</strong></h3>',
                  '   <div class="info">',
                  '      <p>'+shop[index].storAddr1+'</p>',
                  '      <p>연락처:'+shop[index].storTel.phoneFomatter('-')+'</p>',
                  '      <p>영업시간:'+shop[index].openTm.timeFormat() + ' ~ ' + shop[index].closeTm.timeFormat() +' </p>',
                  '   </div>',
                  '</div>'
               ].join('')
            });

            markers.push(marker);
            infoWindows.push(infoWindow);

            index++;
         };

         //naver.maps.Event.addListener(naverMap.map, 'idle', function() {
         //   naverMap.updateMarkers(naverMap.map, markers);
         //});

         if(center != null && center != undefined )
            naverMap.map.setCenter(center);

         naverMap.infoWindows = infoWindows;
         naverMap.markers = markers;

         for(var i=0;i<markers.length;i++) {
            naver.maps.Event.addListener(markers[i], 'click', naverMap.getClickHandler(i, callback));
         }
         //naverMap.infoWindows[0].open(naverMap.map, markers[0]);
      },
      getClickHandler: function(seq, callback) {
         return function(e) {
            var marker = naverMap.markers[seq],
               infoWindow = naverMap.infoWindows[seq];

            //마커 클릭시 정보창 출력
            /*
            if (infoWindow.getMap()) {
               infoWindow.close();
            } else {
               infoWindow.open(naverMap.map, marker);
            }
            */

            callback(marker, seq);
         }
      },
      updateMarkers: function(map, markers) {
         var mapBounds = map.getBounds();
         var marker, position;

         for (var i = 0; i < markers.length; i++) {

            marker = markers[i]
            position = marker.getPosition();

            if (mapBounds.hasLatLng(position)) {
               if (marker.setMap()) return;
               marker.setMap(map);
            } else {
               if (!marker.setMap()) return;
               marker.setMap(null);
            }
         }
      },
      removeMarkers: function() {
         for (var i = 0; i < naverMap.markers.length; i++) {
            naverMap.markers[i].setMap(null);
         }
         naverMap.markers = [];
         naverMap.infoWindows = [];
      },
      onSuccessGeolocation: function(position) {
         var location = new naver.maps.LatLng(position.coords.latitude,
                                     position.coords.longitude);

         naverMap.map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
         //naverMap.map.setZoom(10); // 지도의 줌 레벨을 변경합니다.
      },
      onErrorGeolocation: function() {
          //var center = naverMap.map.getCenter();
          //naverMap.infowindow.open(naverMap.map, center);
      }
      // 매장목록 클릭 시 네이버지도 선택 매장으로 중앙 이동 처리 _by ahn.180212
      , moveCenter: function(param, index) {
         naverMap.map.setCenter(param);
         naverMap.map.setZoom(15);
         // naverMap.infoWindows[index].open(naverMap.map, naverMap.markers[index]);
      }
}

naverMap.init();
</script>
</body>



