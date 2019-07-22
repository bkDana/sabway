<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
*:focus{outline:none;}
#content-wrapper1{padding:100px 0; background-color:#fff;}
.area1{ max-width:1900px; margin:0px auto; }
/* 문의 ::: 가맹신청문의, 1:1문의 */
.inquiry_wrapper{background-color:#fff; width:1028px; margin:0 auto; border:1px solid #e8e8e8; padding:0 70px 49px;}
.inquiry_wrapper h2.subTitle{padding:72px 0 76px !important;}
#content h2.subTitle{text-align: center;font-size: 40px;color: #292929;font-weight: 600; letter-spacing: -0.07em;}
#content h3.h_title{font-size: 28px;color: #292929;font-weight: bold;letter-spacing: -0.05em;padding-bottom: 38px;}
.inquiry_wrapper .board_write_wrapper .agree_info{overflow:hidden; border-bottom:1px solid #e8e8e8; padding:25px 0 13px 0;}
.inquiry_wrapper .board_write_wrapper .agree_info >p{float:left; color:#666666; font-size:16px; font-weight:300; letter-spacing:-0.03em; text-indent:10px;}
.inquiry_wrapper .board_write_wrapper .agree_info >p:after{content:''; background:url(/resources/img/main/icon_ess.png) 0 0 no-repeat; width:7px; height:6px; display:inline-block; vertical-align:middle; position:relative; margin-left:4px; top:-2px;}
.inquiry_wrapper .board_write_wrapper .agree_info >.form_checkbox{float:right; top:-5px;}
.inquiry_wrapper .inquiry_notice{background:#f6f6f6 url(/resources/img/main/icon_exc.png) 25px 50% no-repeat; margin:30px 0 100px; color:#999999; font-size:13px; padding:15px 0 19px 81px;}
.inquiry_wrapper .inquiry_notice li{line-height:23px; letter-spacing:-0.015em;}
.inquiry_wrapper .btns_wrapper{border-top:1px solid #e8e8e8; position:relative; left:-70px; margin-right:-140px; padding-top:40px;}
.inquiry_wrapper .pd_agree_wrapper{overflow:hidden; margin-bottom:96px;}
.inquiry_wrapper .pd_agree_wrapper .pd_agree{float:left; width:490px;}
.inquiry_wrapper .pd_agree_wrapper .pd_agree:first-child{margin-right:48px;}
.inquiry_wrapper .pd_agree_wrapper .pd_agree h3{color:#666666; font-size:18px; font-weight:300; letter-spacing:-0.05em; padding-bottom:19px;}
.inquiry_wrapper .pd_agree_wrapper .pd_agree .scroll_wrapper{border:2px solid #e5e5e5; height:150px; padding:13px 0 13px 17px; overflow:auto; color:#bbbbbb; font-size:13px; line-height:21px; margin-bottom:14px;}
.inquiry_wrapper .pd_agree_wrapper .pd_agree .scroll_wrapper .mCSB_inside > .mCSB_container{margin-right:17px;}
.inquiry_wrapper .pd_agree_wrapper .pd_agree .scroll_wrapper .mCSB_inside > .mCSB_container:focus{outline:none !important;}
.inquiry_wrapper .pd_agree_wrapper .pd_agree .scroll_wrapper .mCSB_scrollTools .mCSB_draggerRail{opacity:0 !important;}
.inquiry_wrapper .pd_agree_wrapper .pd_agree .scroll_wrapper .mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{width:5px !important; background-color:#dddddd !important;}
.inquiry_wrapper .form_select{margin-right:7px;}
.inquiry_wrapper .em{display:inline-block; vertical-align:middle; width:63px; text-align:center; color:#292929; font-size:15px;}

/* form ::: checkbox */
.form_checkbox{display:inline-block; cursor:pointer; overflow:hidden; position:relative; vertical-align:middle; color:#292929; font-size:16px; line-height:26px; letter-spacing:-0.05em;}
.form_checkbox input[type="checkbox"]{height:0; opacity:0; width:0; position:absolute; left:-10px;}
.form_checkbox .icon{width:26px; height:26px; border:2px solid #dddddd; border-radius:50px; display:inline-block; position:relative; vertical-align:middle; margin-right:10px;}
.form_checkbox .icon:before{content:''; width:0; height:20px; background:url(/resources/img/main/icon_checkbox.png) 0 0 no-repeat; position:absolute; left:4px; top:0; transition-duration:0.2s;}
.form_checkbox input[type="checkbox"]:checked+.icon:before{width:24px;}
.form_checkbox em{color:#009223;}

/* form ::: file */
.form_file{border:2px solid #dddddd; position:relative; display:inline-block; cursor:pointer; padding-right:98px; box-sizing:border-box;}
.form_file:before{content:''; position:absolute; right:96px; top:13px; width:2px; height:16px; background-color:#e8e8e8;}
.form_file:after{content:'파일선택'; position:absolute; right:20px; top:0; z-index:1; cursor:pointer; line-height:41px; color:#009223; font-size:16px; font-weight:300; letter-spacing:-0.05em;}
.form_file input[type="file"]{position:absolute; right:0; top:0; height:41px; width:98px; text-indent:-9999px;  opacity:0; z-index:3; cursor:pointer;}
.form_file input[type="text"]{background-color:white;width:100%; height:41px; border:0; display:block; text-indent:13px;}

/* form ::: textarea */
.form_textarea{background-color:#f8f8f8; display:inline-block;}
.form_textarea textarea{background-color:transparent; width:100%; border:0}

/* form ::: text */
.form_text{background-color:#f8f8f8; display:inline-block;}
.form_text input{width:100%; border:0; background:transparent; height:45px; color:#292929; font-size:16px; text-indent:15px;}
.form_text input::placeholder{color:#bbbbbb;}
.form_text input:-ms-input-placeholder{color:#bbbbbb;}

/* form ::: selectbox */
.form_select{display:inline-block; vertical-align:middle; overflow:hidden; position:relative; border:2px solid #dddddd;}
.form_select:before{content:''; position:absolute; right:13px; top:18px; width:12px; height:7px; background:url(/resources/img/main/icon_select_arr.png) 0 0 no-repeat; z-index:3;}
.form_select select{width:100%; border:0; height:41px; line-height:41px; font-size:16px; color:#999999; position:relative; z-index:1; text-indent:9px;-webkit-appearance:none;}


/* form ::: search */
.form_search{border:2px solid #dddddd; height:41px; display:block; vertical-align:middle; position:relative; padding-right:42px;}
.form_search input{border:0; height:41px; width:100%; text-indent:14px; color:#292929; font-size:16px;}
.form_search input::placeholder{color:#bbbbbb; font-size:16px;font-family:font_ns, sans-serif;}
.form_search .btn_search{background:url(/resources/img/main/icon_search.png) 50% 50% no-repeat; width:41px; height:41px; position:absolute; right:0; top:0;}
.form_search .btn_search:after{content:''; position:absolute; left:-2px; top:13px; width:2px; height:16px; background-color:#e5e5e5;}

/* board write */
.board_write_wrapper{position:relative;}
.board_write_wrapper .rt_note{color:#999999; font-size:16px; letter-spacing:-0.05em; position:absolute; right:0; top:-29px; background:url(/resources/img/main/icon_ess.png) 0 7px no-repeat; padding-left:10px;}
.board_write_wrapper th{font-weight:300; color:#666666; font-size:16px; height:21px; padding-top:24px; border-bottom:1px solid #e8e8e8; text-align:left; vertical-align:top;}
.board_write_wrapper td{height:45px; padding:12px 0; border-bottom:1px solid #e8e8e8;}
.board_write_wrapper th .ess{background:url(/resources/img/main/icon_ess.png) 0 0 no-repeat; width:7px; height:6px; display:inline-block; vertical-align:middle; position:relative; margin-left:4px; top:-2px;}
.board_write_wrapper td .file_note{font-size:13px; color:#999999; margin-left:25px;}
/* button */
.btns_wrapper{text-align:center;}
.btns_wrapper .btn{margin:0 4px;}
.btn{font-size:18px; font-weight:bold; text-align:center; display:inline-block; vertical-align:middle; border-radius:30px; transition-duration:0.2s;}
.btn span{display:inline-block; vertical-align:middle; height:46px; line-height:46px;}
.btn.bgc_white{background-color:#fff; border:2px solid #dddddd; color:#bbbbbb;}
.btn.bgc_white:hover{border-color:#bbbbbb;}
.btn.bgc_point{background-color:#009223; color:#fff;}
.btn.bgc_point span{height:50px; line-height:50px; letter-spacing:-0.03em;}
.btn.bgc_point:hover{background-color:#00811f;}
.btn.i_reg:after{content:''; display:inline-block; vertical-align:middle; width:21px; height:16px; background:url(/resources/img/main/icon_reg.png) 0 0 no-repeat; margin-left:7px;}

</style>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" />

<section id="content-wrapper1">
	<div class="area1">
		<div id="content">
			<div class="inquiry_wrapper">
				<h2 class="subTitle">가맹신청ㆍ문의</h2>
				<div class="content">
					<form id="applyForm" action="/insertApply.do" method="post" enctype="multipart/form-data" id="frm">
						<div class="pd_agree_wrapper">
							<div class="pd_agree">
								<h3>개인정보 수집 및 이용동의</h3>
								<div class="scroll_wrapper mCustomScrollbar _mCS_1"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container" style="position:relative; top:0; left:0; outline:none;" dir="ltr">
									'서브웨이인터내셔날 비브이' 의 광고를 담당하는 써브웨이 프랜차이즈 광고 기금 트러스트는 (이하 '회사') 는 문의 및 가맹신청 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br><br>
									ο 수집항목<br>
									필수항목 : 이름, 이메일, 연락처<br>
									선택항목 : 기타문의사항<br><br>
									ο 개인정보 수집방법 : 홈페이지(문의 및 가맹신청)<br><br>
									■ 개인정보의 수집 및 이용목적<br>
									회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br><br>
									ο 신청자 관리<br>
									서비스 이용에 따른 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달<br>
									(민원처리를 위해 해당 매장 및 매장 담당 지사에 성함 및 연락처가 전달될 수 있음을 알려드립니다.)<br><br>
									ο 마케팅 및 광고에 활용<br>
									 이벤트 등 광고성 정보 전달, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br><br>
									■ 개인정보의 보유 및 이용기간<br>
									원칙적으로, 개인정보 수집 및 이용목적이 달성된 후(회원 탈퇴 등)에는 귀하의 개인정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br><br>
									계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)<br>
									소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)
								</div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: block; height: 50px; max-height: 140px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
								<label class="form_checkbox">
									<input name="agree1" type="checkbox">
									<span class="icon"></span>개인정보수집 및 이용에 동의합니다. <em>(필수)</em>
								</label>
							</div>
							<div class="pd_agree">
								<h3>개인정보 위탁동의</h3>
								<div class="scroll_wrapper mCustomScrollbar _mCS_2"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0" style="max-height: none;"><div id="mCSB_2_container" class="mCSB_container" style="position:relative; top:0; left:0;" dir="ltr">
									개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br><br>
									회사는 개인정보 취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br><br>
									 ο 본 방침은 : 2018 년 1 월 31 일 부터 시행됩니다.<br><br>
									써브웨이인터내셔날 비브이는 (이하 '회사'는) 고객님의 개인정보 를 중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.
								</div><div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: block;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; display: block; height: 150px; max-height: 140px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
								<!-- checkbox -->
								<label class="form_checkbox">
									<input name="agree2" type="checkbox">
									<span class="icon"></span>개인정보 위탁에 동의합니다. <em>(필수)</em>
								</label>
								<!--// checkbox -->
							</div> <!-- 개인정보 위탕동의 div 끝 -->
						</div>
						<h3 class="h_title">문의 작성하기</h3>
						<div class="board_write_wrapper">
							<p class="rt_note">필수입력사항<span class="ess"></span></p>
							<table style="width:1028px">
								<caption>문의 작성하기 테이블</caption>
								<colgroup>
									<col width="130px">
									<col width="/">
								</colgroup>
								<tbody>
									<tr>
										<th scope="col"><label for="applyName">이름</label><span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%;">
												<input class="inputBox short" type="text" id="applyName" name="applyName" placeholder="이름을 입력해주세요">
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col"><label for="applyPhone">연락처</label><span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%;">
												<input class="inputBox" type="text" id="applyPhone" name="applyPhone" placeholder="연락 가능한 전화번호를 입력해주세요">
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col"><label for="email">E-Mail</label><span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:200px;">
												<input class="inputBox" type="text" id="applyEmail" name="applyEmail" placeholder="이메일"><!--   style="width:50%" -->
											</span>
											<span class="em">@</span>
											<span class="form_text" style="width:200px;">
												<input type="text" id="applyEmail2" name="applyEmail2">
											</span>
											<div class="form_select" style="width:196px; margin-left:7px;">
												<select name="emailEx" id="emailEx">
													<option value="">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="nate.com">nate.com</option>
													<option value="empas.com">empas.com</option>
													<option value="dreamwiz.com">dreamwiz.com</option>
													<option value="lycos.co.kr">lycos.co.kr</option>
													<option value="korea.com">korea.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="hanmir.com">hanmir.com</option>
												</select>
												<!-- <button type="button" id="emailChk">중복확인안돼</button> -->
											</div>
										</td>
									</tr>
									<tr>
										<th scope="col"><label for="applyArea">지역</label><span class="ess"></span></th>
										<td>
											<div class="form_select" style="width:196px;">
												<select class="inputBox" name="applyArea" id="applyArea">
													<option value="">시/도</option>
													<option value="서울특별시">서울특별시</option>
													<option value="경기도">경기도</option>
													<option value="인천광역시">인천광역시</option>
													<option value="대전광역시">대전광역시</option>
													<option value="세종특별자치시">세종특별자치시</option>
													<option value="충청남도">충청남도</option>
													<option value="경상남도">경상남도</option>
													<option value="울산광역시">울산광역시</option>
													<option value="부산광역시">부산광역시</option>
													<option value="대구광역시">대구광역시</option>
													<option value="제주특별자치도">제주특별자치도</option>
													<option value="전라북도">전라북도</option>
													<option value="충청북도">충청북도</option>
													<option value="광주광역시">광주광역시</option>
													<option value="전라남도">전라남도</option>
													<option value="경상북도">경상북도</option>
													<option value="강원도">강원도</option>
												</select>
											</div>
											<div class="form_select" id="select2" style="width:196px;">
												<select name="applyArea2" id="applyArea2">
													<option value="">시/군/구</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="col"><label for="applyTitle">제목</label><span class="ess"></span></th>
										<td>
											<span class="form_text" style="width:100%">

												<input class="inputBox" type="text" id="applyTitle" name="applyTitle"  placeholder="제목을 입력해주세요">

											</span>
										</td>
									</tr>
									<tr>
										<th scope="col"><label for="applyContent">내용</label><span class="ess"></span></th>
										<td>
											<span class="form_textarea" style="width:100%">
												<textarea class="inputBox" name="applyContent" id="applyContent" cols="5"  rows="10" style="height:230px;"></textarea>
											</span>
										</td>
									</tr>
									<tr>
										<th scope="col"><label for="applyFilename">첨부파일</label></th>
										<td>
											<label class="form_file" style="width:466px;">
												<input data-maxsize="2" data-maxupload="1" id="applyFilename" name="applyfilename" type="file" onchange="formFile(this); return false;">
												<input readonly="readonly" type="text">
											</label>

											<span class="file_note">※ 등록 가능 확장자 : pdf,docx,pptx,xlsx,jpg,gif,png / 최대 2MB</span>
										</td>
									</tr>
								</tbody>
							</table>

							<div class="inquiry_notice">
								<ul>
									<li>· 문의가 집중되거나 주말의 경우 답변이 지연될 수 있습니다. 최대한 빠르게 답변 드리도록 하겠습니다.</li>
									<li>· 욕설, 비속어, 비방성 등의 부적절한 단어 포함되어 있는 경우, 답변 진행이 어려울 수 있습니다.</li>
								</ul>
							</div>
						</div>
						<div class="btns_wrapper">
							<button type="reset" class="btn bgc_white" style="width:126px;"><span>취소</span></button>
							<button type="submit" onclick="return check();" class="btn bgc_point i_reg" style="width:170px;"><span>등록하기</span></button>
						</div>
					</form>
				</div>
				
			</div>	<!-- class="inquiry_wrapper -->
		</div>	<!-- id="content -->
		
		
	</div>
</section>
	
<script>
//이메일 작성
	$("#emailEx").change(function(){
	    if(isEmpty($("#emailEx").val())){
	         $("#applyEmail2").attr("readonly",false);
	         $("#applyEmail2").val("");
	         $("#applyEmail2").focus();
	    }else{
	         $("#applyEmail2").attr("readonly",true);
	       $("#applyEmail2").val($("#emailEx").val());
	    }
	 });

// 빈값 체크
	function isEmpty(text){
	   if(text != null && text != ""){
	      return false;
	   }else{
	      return true;
	   }
	}
	
/* 약관동의,빈값 체크 */
function check(){
	if(!$("input:checkbox[name=agree1]").is(":checked")) {
		alert("개인정보수집 및 이용에 동의가 필요합니다.");
		$("input:checkbox[name=agree1]").focus();
		return false;
	}
	if(!$("input:checkbox[name=agree2]").is(":checked")) {
		alert("개인정보 위탁에 동의가 필요합니다.");
		$("input:checkbox[name=agree2]").focus();
		return false;
	}
	if(isEmpty($("#applyName").val())){
	      alert("이름을 작성해주세요.")
	      return false;
	   }
	   if(isEmpty($("#applyPhone").val())){
	      alert("휴대폰번호를 작성해주세요.")
	      return false;
	   }
	   if(isEmpty($("#applyEmail").val())){
	      alert("이메일을 작성해주세요.")
	      return false;
	   }
	   if(isEmpty($("#applyEmail2").val())){
	      alert("이메일을 작성해주세요.")
	      return false;
	   }
	   if(isEmpty($("#applyArea").val())){
	      alert("지역을 선택해주세요.")
	      return false;
	   }
	   if(isEmpty($("#applyArea2").val())){
	      alert("지역을 선택해주세요.")
	      return false;
	   }
	   if(isEmpty($("#applyTitle").val())){
	      alert("제목을 작성해주세요.")
	      return false;
	   }
	   if(isEmpty($("#applyContent").val())){
	      alert("내용을 작성해주세요.")
	      return false;
	   }
}
//첨부파일 표시
function formFile(obj){// 첨부파일
	var value = obj.value;
	var file = value.split('\\');
	console.log(file[2]);
	$(obj).next('input').val(file[2]);
}



//지역 selectBox
	$(document).ready(function(){
		$("#applyArea").change(function(){
		console.log($(this).val())
			
		 	if($(this).val() == "서울특별시"){
		 		$("#applyArea2").find("option").remove();
		 		$("#applyArea2").append("<option value=''>시/군/구</option>");
				$("#applyArea2").append("<option value='강남구'>강남구</option>");
				$("#applyArea2").append("<option value='강동구'>강동구</option>");
				$("#applyArea2").append("<option value='강북구'>강북구</option>");
				$("#applyArea2").append("<option value='강서구'>강서구</option>");
				$("#applyArea2").append("<option value='구로구'>구로구</option>");
				$("#applyArea2").append("<option value='금천구'>금천구</option>");
				$("#applyArea2").append("<option value='노원구'>노원구</option>");
				$("#applyArea2").append("<option value='도봉구'>도봉구</option>");
				$("#applyArea2").append("<option value='동대문구'>동대문구</option>");
				$("#applyArea2").append("<option value='동작구'>동작구</option>");
				$("#applyArea2").append("<option value='마포구'>마포구</option>");
				$("#applyArea2").append("<option value='서초구'>서초구</option>");
				$("#applyArea2").append("<option value='성동구'>성동구</option>");
				$("#applyArea2").append("<option value='성북구'>성북구</option>");
				$("#applyArea2").append("<option value='송파구'>송파구</option>");
				$("#applyArea2").append("<option value='양천구'>양천구</option>");
				$("#applyArea2").append("<option value='영등포구'>영등포구</option>");
				$("#applyArea2").append("<option value='용산구'>용산구</option>");
				$("#applyArea2").append("<option value='은평구'>은평구</option>");
				$("#applyArea2").append("<option value='종로구'>종로구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
				$("#applyArea2").append("<option value='중랑구'>중랑구</option>");
				
				
			}
		 	
		 	else if($(this).val() == "경기도"){
		 		
				$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
				$("#applyArea2").append("<option value='가평군'>가평군</option>");
				$("#applyArea2").append("<option value='덕양구'>고양시 덕양구</option>");
				$("#applyArea2").append("<option value='일산동구'>고양시 일산동구</option>");
				$("#applyArea2").append("<option value='일산서구'>고양시 일산서구</option>");
				$("#applyArea2").append("<option value='과천시'>과천시</option>");
				$("#applyArea2").append("<option value='광명시'>광명시</option>");
				$("#applyArea2").append("<option value='광주시'>광주시</option>");
				$("#applyArea2").append("<option value='구리시'>구리시</option>");
				$("#applyArea2").append("<option value='군포시'>군포시</option>");
				$("#applyArea2").append("<option value='김포시'>김포시</option>");
				$("#applyArea2").append("<option value='남양주시'>남양주시</option>");
				$("#applyArea2").append("<option value='동두천시'>동두천시</option>");
				$("#applyArea2").append("<option value='부천시'>부천시</option>");
				$("#applyArea2").append("<option value='분당구'>성남시 분당구</option>");
				$("#applyArea2").append("<option value='수정구'>성남시 수정구</option>");
				$("#applyArea2").append("<option value='중원구'>성남시 중원구</option>");
				$("#applyArea2").append("<option value='권선구'>수원시 권선구</option>");
				$("#applyArea2").append("<option value='영통구'>수원시 영통구</option>");
				$("#applyArea2").append("<option value='장안구'>수원시 장안구</option>");
				$("#applyArea2").append("<option value='팔달구'>수원시 팔달구</option>");
				$("#applyArea2").append("<option value='시흥시'>시흥시</option>");
				$("#applyArea2").append("<option value='단원구'>안산시 단원구</option>");
				$("#applyArea2").append("<option value='상록구'>안산시 상록구</option>");
				$("#applyArea2").append("<option value='안성시'>안성시</option>");
				$("#applyArea2").append("<option value='만안구'>안양시 만안구</option>");
				$("#applyArea2").append("<option value='동안구'>안양시 동안구</option>");
				$("#applyArea2").append("<option value='양주시'>양주시</option>");
				$("#applyArea2").append("<option value='양평군'>양평군</option>");
				$("#applyArea2").append("<option value='여주시'>여주시</option>");
				$("#applyArea2").append("<option value='연천군'>연천군</option>");
				$("#applyArea2").append("<option value='오산시'>오산시</option>");
				$("#applyArea2").append("<option value='팔달구'>수원시 팔달구</option>");
				$("#applyArea2").append("<option value='기흥구'>용인시 기흥구</option>");
				$("#applyArea2").append("<option value='수지구'>용인시 수지구</option>");
				$("#applyArea2").append("<option value='처인구'>용인시 처인구</option>");
				$("#applyArea2").append("<option value='의왕시'>의왕시</option>");
				$("#applyArea2").append("<option value='의정부시'>의정부시</option>");
				$("#applyArea2").append("<option value='이천시'>이천시</option>");
				$("#applyArea2").append("<option value='파주시'>파주시</option>");
				$("#applyArea2").append("<option value='평택시'>평택시</option>");
				$("#applyArea2").append("<option value='포천시'>포천시</option>");
				$("#applyArea2").append("<option value='하남시'>하남시</option>");
				$("#applyArea2").append("<option value='화성시'>화성시</option>");

			}
			
		 	else if($(this).val() == "인천광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강화군'>강화군</option>");
				$("#applyArea2").append("<option value='계양구'>계양구</option>");
				$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='남동구'>남동구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='부평구'>부평구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='연수구'>연수구</option>");
				$("#applyArea2").append("<option value='옹진군'>옹진군</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
		 	}

		 	else if($(this).val() == "대전광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='대덕구'>대덕구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='유성구'>유성구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
				
		 	}

		 	else if($(this).val() == "충청남도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='계룡시'>계룡시</option>");
				$("#applyArea2").append("<option value='공주시'>공주시</option>");
				$("#applyArea2").append("<option value='금산군'>금산군</option>");
				$("#applyArea2").append("<option value='논산시'>논산시</option>");
				$("#applyArea2").append("<option value='당진시'>당진시</option>");
				$("#applyArea2").append("<option value='보령시'>보령시</option>");
				$("#applyArea2").append("<option value='부여군'>부여군</option>");
				$("#applyArea2").append("<option value='서산시'>서산시</option>");
				$("#applyArea2").append("<option value='서천군'>서천군</option>");
				$("#applyArea2").append("<option value='아산시'>아산시</option>");
				$("#applyArea2").append("<option value='예산군'>예산군</option>");
				$("#applyArea2").append("<option value='천안시 동남구'>천안시 동남구</option>");
				$("#applyArea2").append("<option value='천안시 서북구'>천안시 서북구</option>");
				$("#applyArea2").append("<option value='청양군'>청양군</option>");
				$("#applyArea2").append("<option value='태안군'>태안군</option>");
				$("#applyArea2").append("<option value='홍성군'>홍성군</option>");
				
		 	}

		 	else if($(this).val() == "경상남도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='거제시'>거제시</option>");
				$("#applyArea2").append("<option value='거창군'>거창군</option>");
				$("#applyArea2").append("<option value='고성군'>고성군</option>");
				$("#applyArea2").append("<option value='김해시'>김해시</option>");
				$("#applyArea2").append("<option value='남해군'>남해군</option>");
				$("#applyArea2").append("<option value='밀양시'>밀양시</option>");
				$("#applyArea2").append("<option value='사천시'>사천시</option>");
				$("#applyArea2").append("<option value='산청군'>산청군</option>");
				$("#applyArea2").append("<option value='양산시'>양산시</option>");
				$("#applyArea2").append("<option value='의령군'>의령군</option>");
				$("#applyArea2").append("<option value='진주시'>진주시</option>");
				$("#applyArea2").append("<option value='창녕군'>창녕군</option>");
				$("#applyArea2").append("<option value='창원시 마산합포구'>창원시 마산합포구</option>");
				$("#applyArea2").append("<option value='창원시 마산회원구'>창원시 마산회원구</option>");
				$("#applyArea2").append("<option value='창원시 성산구'>창원시 성산구</option>");
				$("#applyArea2").append("<option value='창원시 의창구'>창원시 의창구</option>");
				$("#applyArea2").append("<option value='창원시 진해구'>창원시 진해구</option>");
				$("#applyArea2").append("<option value='통영시'>통영시</option>");
				$("#applyArea2").append("<option value='하동군'>하동군</option>");
				$("#applyArea2").append("<option value='함안군'>함안군</option>");
				$("#applyArea2").append("<option value='함양군'>함양군</option>");
				$("#applyArea2").append("<option value='합천군'>합천군</option>");
				
				
		 	}
		
			else if($(this).val() == "울산광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='울주군'>울주군</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
			
		 	}

			else if($(this).val() == "부산광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강서구'>강서구</option>");
				$("#applyArea2").append("<option value='금정구'>금정구</option>");
				$("#applyArea2").append("<option value='기장군'>기장군</option>");
				$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='동래구'>동래구</option>");
				$("#applyArea2").append("<option value='부산진구'>부산진구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='사상구'>사상구</option>");
				$("#applyArea2").append("<option value='사하구'>사하구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='수영구'>수영구</option>");
				$("#applyArea2").append("<option value='연제구'>연제구</option>");
				$("#applyArea2").append("<option value='영도구'>영도구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
				$("#applyArea2").append("<option value='해운대구'>해운대구</option>");
			
		 	}

			else if($(this).val() == "대구광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='달서구'>달서구</option>");
				$("#applyArea2").append("<option value='달성군'>달성군</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
				$("#applyArea2").append("<option value='수성구'>수성구</option>");
				$("#applyArea2").append("<option value='중구'>중구</option>");
			
		 	}
		
			else if($(this).val() == "제주특별자치도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='서귀포시'>서귀포시</option>");
				$("#applyArea2").append("<option value='제주시'>제주시</option>");		
		 	}

			else if($(this).val() == "전라북도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='고창군'>고창군</option>");
				$("#applyArea2").append("<option value='군산시'>군산시</option>");
				$("#applyArea2").append("<option value='김제시'>김제시</option>");
				$("#applyArea2").append("<option value='남원시'>남원시</option>");
				$("#applyArea2").append("<option value='무주군'>무주군</option>");
				$("#applyArea2").append("<option value='부안군'>부안군</option>");
				$("#applyArea2").append("<option value='순창군'>순창군</option>");
				$("#applyArea2").append("<option value='완주군'>완주군</option>");
				$("#applyArea2").append("<option value='익산시'>익산시</option>");
				$("#applyArea2").append("<option value='임실군'>임실군</option>");
				$("#applyArea2").append("<option value='장수군'>장수군</option>");
				$("#applyArea2").append("<option value='전주시 덕진구'>전주시 덕진구</option>");
				$("#applyArea2").append("<option value='전주시 완산구'>전주시 완산구</option>");
				$("#applyArea2").append("<option value='정읍시'>정읍시</option>");
				$("#applyArea2").append("<option value='진안군'>진안군</option>");
			
		 	}

			else if($(this).val() == "충청북도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='괴산군'>괴산군</option>");
				$("#applyArea2").append("<option value='단양군'>단양군</option>");
				$("#applyArea2").append("<option value='보은군'>보은군</option>");
				$("#applyArea2").append("<option value='영동군'>영동군</option>");
				$("#applyArea2").append("<option value='옥천군'>옥천군</option>");
				$("#applyArea2").append("<option value='음성군'>음성군</option>");
				$("#applyArea2").append("<option value='제천시'>제천시</option>");
				$("#applyArea2").append("<option value='증평군'>증평군</option>");
				$("#applyArea2").append("<option value='진천군'>진천군</option>");
				$("#applyArea2").append("<option value='청주시 상당구'>청주시 상당구</option>");
				$("#applyArea2").append("<option value='청주시 서원구'>청주시 서원구</option>");
				$("#applyArea2").append("<option value='청주시 청원구'>청주시 청원구</option>");
				$("#applyArea2").append("<option value='청주시 흥덕구'>청주시 흥덕구</option>");
				$("#applyArea2").append("<option value='충주시'>충주시</option>");
			
		 	}
		
			else if($(this).val() == "광주광역시" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='광산구'>광산구</option>");
				$("#applyArea2").append("<option value='남구'>남구</option>");
				$("#applyArea2").append("<option value='동구'>동구</option>");
				$("#applyArea2").append("<option value='북구'>북구</option>");
				$("#applyArea2").append("<option value='서구'>서구</option>");
			
		 	}

			else if($(this).val() == "전라남도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강진군'>강진군</option>");
				$("#applyArea2").append("<option value='고흥군'>고흥군</option>");
				$("#applyArea2").append("<option value='곡성군'>곡성군</option>");
				$("#applyArea2").append("<option value='광양시'>광양시</option>");
				$("#applyArea2").append("<option value='구례군'>구례군</option>");
				$("#applyArea2").append("<option value='나주시'>나주시</option>");
				$("#applyArea2").append("<option value='담양군'>담양군</option>");
				$("#applyArea2").append("<option value='목포시'>목포시</option>");
				$("#applyArea2").append("<option value='무안군'>무안군</option>");
				$("#applyArea2").append("<option value='보성군'>보성군</option>");
				$("#applyArea2").append("<option value='순천시'>순천시</option>");
				$("#applyArea2").append("<option value='신안군'>신안군</option>");
				$("#applyArea2").append("<option value='여수시'>여수시</option>");
				$("#applyArea2").append("<option value='영광군'>영광군</option>");
				$("#applyArea2").append("<option value='영암군'>영암군</option>");
				$("#applyArea2").append("<option value='완도군'>완도군</option>");
				$("#applyArea2").append("<option value='장성군'>장성군</option>");
				$("#applyArea2").append("<option value='장흥군'>장흥군</option>");
				$("#applyArea2").append("<option value='진도군'>진도군</option>");
				$("#applyArea2").append("<option value='함평군'>함평군</option>");
				$("#applyArea2").append("<option value='해남군'>해남군</option>");
				$("#applyArea2").append("<option value='화순군'>화순군</option>");
			
		 	}

			else if($(this).val() == "경상북도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='경산시'>경산시</option>");
				$("#applyArea2").append("<option value='경주시'>경주시</option>");
				$("#applyArea2").append("<option value='고령군'>고령군</option>");
				$("#applyArea2").append("<option value='구미시'>구미시</option>");
				$("#applyArea2").append("<option value='군위군'>군위군</option>");
				$("#applyArea2").append("<option value='김천시'>김천시</option>");
				$("#applyArea2").append("<option value='문경시'>문경시</option>");
				$("#applyArea2").append("<option value='봉화군'>봉화군</option>");
				$("#applyArea2").append("<option value='상주시'>상주시</option>");
				$("#applyArea2").append("<option value='성주군'>성주군</option>");
				$("#applyArea2").append("<option value='안동시'>안동시</option>");
				$("#applyArea2").append("<option value='영덕군'>영덕군</option>");
				$("#applyArea2").append("<option value='영양군'>영양군</option>");
				$("#applyArea2").append("<option value='영주시'>영주시</option>");
				$("#applyArea2").append("<option value='영천시'>영천시</option>");
				$("#applyArea2").append("<option value='예천군'>예천군</option>");
				$("#applyArea2").append("<option value='울릉군'>울릉군</option>");
				$("#applyArea2").append("<option value='울진군'>울진군</option>");
				$("#applyArea2").append("<option value='의성군'>의성군</option>");
				$("#applyArea2").append("<option value='청도군'>청도군</option>");
				$("#applyArea2").append("<option value='청송군'>청송군</option>");
				$("#applyArea2").append("<option value='칠곡군'>칠곡군</option>");
				$("#applyArea2").append("<option value='포항시 남구'>포항시 남구</option>");
				$("#applyArea2").append("<option value='포항시 북구'>포항시 북구</option>");
			
		 	}

			else if($(this).val() == "강원도" ){
		 		
		 		$("#applyArea2").find("option").remove();
				$("#applyArea2").append("<option value=''>시/군/구</option>");
		 		$("#applyArea2").append("<option value='강릉시'>강릉시</option>");
				$("#applyArea2").append("<option value='고성군'>고성군</option>");
				$("#applyArea2").append("<option value='동해시'>동해시</option>");
				$("#applyArea2").append("<option value='삼척시'>삼척시</option>");
				$("#applyArea2").append("<option value='속초시'>속초시</option>");
				$("#applyArea2").append("<option value='양구군'>양구군</option>");
				$("#applyArea2").append("<option value='양양군'>양양군</option>");
				$("#applyArea2").append("<option value='영월군'>영월군</option>");
				$("#applyArea2").append("<option value='원주시'>원주시</option>");
				$("#applyArea2").append("<option value='인제군'>인제군</option>");
				$("#applyArea2").append("<option value='정선군'>정선군</option>");
				$("#applyArea2").append("<option value='철원군'>철원군</option>");
				$("#applyArea2").append("<option value='춘천시'>춘천시</option>");
				$("#applyArea2").append("<option value='태백시'>태백시</option>");
				$("#applyArea2").append("<option value='평창군'>평창군</option>");
				$("#applyArea2").append("<option value='홍천군'>홍천군</option>");
				$("#applyArea2").append("<option value='화천군'>화천군</option>");
				$("#applyArea2").append("<option value='횡성군'>횡성군</option>");
			
		 	}
		
		});
	});
</script>			
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />



