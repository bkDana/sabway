<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* footer */
#footer{background-color:#292929; color:#666666; padding:22px 0; position:relative; z-index:9}
#footer:after{content:''; position:absolute; left:0; top:59px; width:100%; height:1px; background-color:#3b3b3b}
#footer .content .util_menu{margin-bottom:25px;}
#footer .content .util_menu ul{overflow:hidden;padding-left:370px;}
#footer .content .util_menu ul li{float:left; margin-right:29px;}
#footer .content .util_menu ul li a{color:#666666; display:block; font-size:14px; letter-spacing:-0.05em}
#footer .content .util_menu ul li a strong{color:#bbbbbb}
#footer .content .util_menu ul li a.eng{letter-spacing:0.05em}
#footer .content span{position:relative; display:inline-block; margin-top:19px; font-size:13px; padding-left:9px; margin-left:3px; letter-spacing:-0.01em}
#footer .content span:after{content:''; position:absolute; left:0; top:5px; width:2px; height:10px; background-color:#666666}
#footer .content span.addr{padding-left:0; margin-left:0}
#footer .content span.addr:after{display:none;}
#footer .content .copyright{font-family:font_sw; font-size:13px; line-height:25px; padding-top:2px; letter-spacing:0.005em}
#footer .content .sns_area {/*position:absolute; right:300px; bottom:20px;*/display:inline-block; overflow:hidden; text-indent:-9999px; font-size:0; line-height:0; width:50px; height:50px;}
#footer .content .sns_area:after{content:''; width:50px; height:50px; display:block; opacity:0; transition-duration:0.3s;}
#footer .content .sns_area:hover:after{opacity:1}
#footer .content .sns_area.fackbook {background:url(/resources/img/main/icon_sns_facebook.png) 0 0 no-repeat;}
#footer .content .sns_area.fackbook:after {background:url(/resources/img/main/icon_sns_facebook.png) 100% 0 no-repeat;}
#footer .content .sns_area.fackbook:hover:after{opacity:1}
#footer .content .sns_area.instagram{/*right:105px;*/margin-right:5px; background:url(/resources/img/main/icon_sns_instar.png) 0 0 no-repeat;}
#footer .content .sns_area.instagram:after{background:url(/resources/img/main/icon_sns_instar.png) 100% 0 no-repeat;}
#footer .area{text-align:left;}
</style>
<footer id="footer">
	<!-- <div class="footer-inner area">
		<img src="/resources/img/logo_w.png">
		<p>COPYRIGHT &copy; SABWAY. ALL RIGHT RESERVED. </p>
	</div> -->
	<div class="content">
	        <!-- util menu -->
	        <div class="util_menu">
	            <ul>
	                <li><a href="/agreement">이용약관</a></li>
	                <li><a href="/privacy"><strong>개인정보취급방침</strong></a></li>
	                <li><a href="https://store.subway.co.kr/" target="_blank">점주관리자</a></li><!-- 20180202 추가 -->
	                <li><a class="eng" href="http://www.global.subway.com" target="_blank">Subway Listens</a></li>
	            </ul>
	        </div>
	        <!--// util menu -->
			<div class="area clearfix">
		        <div style="float:left;">
			        <span class="addr">서울시 서초구 강남대로 535 프린스빌딩 15층</span>
			        <span class="rep">대표 : 콜린클락</span>
			        <span class="tel">전화 : 02-797-5036</span>
					<span class="rep">사업자등록번호 : 101-84-04143</span>
			        <p class="copyright">SUBWAY® is a Registered Trademark of Subway IP Inc.© 2018 Subway IP Inc.All Rights Reserved.</p>
				</div>
				<div style="float:right; padding-top:10px;">
					<a class="sns_area instagram" href="https://www.instagram.com/subwaykorea" target="_blank">instagram</a>
			        <a class="sns_area fackbook" href="https://www.facebook.com/Subwaykr" target="_blank">facebook</a>
		        </div>
	        </div>
	    </div>
</footer>
</body>
</html>