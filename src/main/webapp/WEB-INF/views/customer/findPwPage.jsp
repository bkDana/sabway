<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
	.area1 {
	    max-width: 1900px;
	    margin: 0px auto;
	    min-height:485px;
	}
	.inquiry_wrapper {
	    background-color: #fff;
	    width: 600px;
	    margin: 0 auto;
	    border: 1px solid #e8e8e8;
	    padding: 0 70px 49px;
	}
	.inquiry_wrapper th {
	    font-weight: 300;
	    color: #666666;
	    font-size: 16px;
	    height: 21px;
	    padding-top: 24px;
	    padding-left: 7px;
	    border-bottom: 1px solid #e8e8e8;
	    text-align: left;
	    vertical-align: top;
	}
	label {
    	cursor: pointer;
	}
	.inquiry_wrapper th .ess {
	    background: url(/resources/img/main/icon_ess.png) 0 0 no-repeat;
	    width: 7px;
	    height: 6px;
	    display: inline-block;
	    vertical-align: middle;
	    position: relative;
	    margin-left: 4px;
	    top: -2px;
	}
	.inquiry_wrapper td {
	    height: 45px;
	    padding: 12px 0;
	    border-bottom: 1px solid #e8e8e8;
	}
	.form_text {
	    background-color: #f8f8f8;
	    display: inline-block;
	}
	.form_text input {
	    width: 100%;
	    border: 0;
	    background: transparent;
	    height: 45px;
	    color: #292929;
	    font-size: 16px;
	    text-indent: 15px;
	}
	.findPw_wrapper {
    	position: relative;
	}
	.form_select {
	    display: inline-block;
	    vertical-align: middle;
	    overflow: hidden;
	    position: relative;
	    border: 2px solid #dddddd;
	}
	.form_select1 {
	    display: inline-block;
	    vertical-align: middle;
	    overflow: hidden;
	    position: relative;
	    border: 2px solid #dddddd;
	}
	.form_select select {
	    width: 100%;
	    border: 0;
	    height: 41px;
	    line-height: 41px;
	    font-size: 16px;
	    color: #999999;
	    position: relative;
	    z-index: 1;
	    text-indent: 9px;
	    -webkit-appearance: none;
	}
	.form_select:before {
	    content: '';
	    position: absolute;
	    right: 13px;
	    top: 18px;
	    width: 12px;
	    height: 7px;
	    background: url(/resources/img/main/icon_select_arr.png) 0 0 no-repeat;
	    z-index: 3;
	}
.comm-content-tit1{position:relative; font-size:26px; color:#2b2b2b; text-align:center;  font-weight:bold; padding:20px 0; margin-bottom:50px;}
.comm-content-tit1:after{display:block; content:""; width:50px; height:4px; position:absolute; bottom:0; left:50%; margin-left:-30px;}
</style>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/common/sub.jsp" />

<section id="content-wrapper">
	<div class="area1">
		<div class="inquiry_wrapper">
			<h1 class="comm-content-tit1" style="margin-top: 50px;">비밀번호 찾기</h1>
			<form action="/findPw.do" method="post">
				<div class="findPw_wrapper">
					<table style="width:100%">
					    <colgroup>
					    	<col width= "100px">
					    	<col width="/">
					    </colgroup>
						<tr>
							<th scope="col">아이디</th>
							<td><span class="form_text" style="width: 94%"><input type="text" name="customerId"></span></td>
						</tr>
						<tr>
							<th scope="col">이메일</th>
							<td><span class="form_text" style="width: 94%"><input type="text" name="email" placeholder='등록된 이메일을 입력해주세요.'></span></td>
						</tr>
					</table>
				</div>
				<div class="common-tbl-btn-group" style="padding-top:35px;text-align:center">
					<button type="submit" class="btn-style1">찾기</button>
				</div>
			</form>
		</div>
	</div>
</section>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />