<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<style>
.recom li{float: left;width: 20%;}
</style>
<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 재료 관리 > 재료 수정</div>
		
		<form action="/ingreManage/ingreUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="ingreIdx" value="${iv.ingreIdx}">
				<table class="comm-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>	
					<tr>
						<th>카테고리</th>
						<td>
							<select name="ingreType" id="ingreType" class="short" data-type="${iv.ingreType }" required>
								<option value="">== 카테고리 ==</option>
								<option value="메인재료">메인재료</option>
								<option value="빵">빵</option>
								<option value="추가토핑">추가토핑</option>
								<option value="치즈">치즈</option>
								<option value="채소">채소</option>
								<option value="소스">소스</option>
								<option value="사이드메뉴">사이드메뉴</option>
								<option value="세트메뉴">세트메뉴</option>
								<option value="샐러드">샐러드</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>재료명</th>
						<td>
							<input type="text" name="ingreLabel" id="ingreLabel" value="${iv.ingreLabel}" required>
						</td>
					</tr>
					<tr id="sauceTr">
						<th>추천 소스</th>
						<td>
							<label><input type="checkbox" name="ckRecomSauce" id="chk-del-all" value="">전체 선택 해제</label>
							<ul class="recom">
							<c:forEach items="${sauceList}" var="list" varStatus="i">
								<li><label><input type="checkbox" class="ckRecomSauce" name="ckRecomSauce" value="${list.ingreLabel}" data-cnt="${i.count}"> ${list.ingreLabel}</label></li>
							</c:forEach>
							</ul>
							<input type="hidden" name="ingreRecomSauce" id="ingreRecomSauce" value="${iv.ingreRecomSauce }">
						</td>
					</tr>
					<tr>
						<th>판매가격</th>
						<td>
							<c:if test="${iv.ingreDiscntRate > 0 }">
								<c:set var="costt15" value="${iv.ingreCost15 * ((1-(iv.ingreDiscntRate/100))/100)}"/>
								<c:set var="costt30" value="${iv.ingreCost30 * ((1-(iv.ingreDiscntRate/100))/100)}"/>
								<fmt:parseNumber var="cost15" value="${costt15}" integerOnly="true"/>
								<fmt:parseNumber var="cost30" value="${costt30}" integerOnly="true"/>
									15cm : <input type="text" name="ingreCost15" id="ingreCost15" class="short" value="${cost15*100}" style="text-align:right;" required> 원 &nbsp;&nbsp;
									30cm : <input type="text" name="ingreCost30" id="ingreCost30" class="short" value="${cost30*100}" style="text-align:right;" required> 원
							</c:if>
							<c:if test="${iv.ingreDiscntRate == 0 }">
								15cm : <input type="text" name="ingreCost15" id="ingreCost15" class="short" value="${iv.ingreCost15 }" style="text-align:right;" required> 원 &nbsp;&nbsp;
								30cm : <input type="text" name="ingreCost30" id="ingreCost30" class="short" value="${iv.ingreCost30 }" style="text-align:right;" required> 원
							</c:if>
						</td>
					</tr>
					<tr>
						<th>활성화/비활성화</th>
						<td>
							<select name="ingreActive" id="ingreActive" data-active="${iv.ingreActive}" class="short">
								<option value="1">활성화</option>
								<option value="0">비활성화</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td>
							<textarea rows="5" cols="100" name="ingreDescription">${iv.ingreDescription }</textarea>
						</td>
					</tr>
					<tr>
						<th>칼로리</th>
						<td>
							<input type="text" name="ingreKcal" class="short" value="${iv.ingreKcal}" style="text-align:right;"> Kcal
						</td>
					</tr>
					<tr>
						<th>상품 이미지</th>
						<td>
							<input type="hidden" name="oldFilepath" value="${iv.ingreFilepath }">
							<c:if test="${not empty iv.ingreFilepath }">
								<span id="nowFile"><%-- ${qna.boardFilename } --%> <img src="/resources/upload/ingredients/${iv.ingreFilepath}" style="width:100px;"><button type="button" id="fileDelBtn" class="file-del-btn delFile">삭제</button>
								<input type="hidden" name="deleteFile" ></span>
								<span id="upload"><input type="file" name="filepath" id="filepath1"><p class="comment">(※ 파일 크기는 최대 10MB까지만 가능합니다.)</p></span>
							</c:if>
							<c:if test="${empty iv.ingreFilepath }">
								<input type="file" name="filepath" id="filepath2"><p class="comment">(※ 파일 크기는 최대 10MB까지만 가능합니다.)</p>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>단위(unit)</th>
						<td>
							<select name="ingreUnit" class="short" data-unit="${iv.ingreUnit}" required>
								<option value="box">box</option>
								<option value="kg">kg</option>
								<option value="통">통</option>
							</select>
						</td>
					</tr>
				</table>
				<div class="common-tbl-btn-group">
					<button type="submit" class="btn-style1" id="submit-btn">재료 수정</button>
					<button type="button" class="btn-style2" onclick="history.back();">취소</button>
				</div>
			</form>

	</div>
</section>
<script>
$(document).ready(function(){
	
	/* 카테고리 선택 셋팅 */
	var ingreType = $('select[name=ingreType]').data('type');
	$('select[name=ingreType]').children('option').each(function(){
		if(ingreType == $(this).val()){
			$(this).prop("selected",true);
		}
	});
	
	/* 단위 선택 셋팅 */
	var ingreUnit = $('select[name=ingreUnit]').data('unit');
	$('select[name=ingreUnit]').children('option').each(function(){ 
		if(ingreUnit == $(this).val()){
			$(this).prop("selected",true);
		}
	});
	
	/* 활성화/비활성화 선택 셋팅 */
	var ingreActive = $('select[name=ingreActive]').data('active');
	$('select[name=ingreActive]').children('option').each(function(){
		if(ingreActive == $(this).val()){
			$(this).prop("selected",true);
		}
	});
	
	
	$("#sauceTr").hide();
	
	//받아온 추천 소스
	var list = '${iv.ingreRecomSauce}';
	var sauce = list.split(',');	//배열로만들기
	console.log(sauce);
	
	/* 메인 재료일 경우 tr 보여주 고 추천소스 checked로 */
	if($("#ingreType").val()=='메인재료'){
		$("#sauceTr").show();
		$("input:checkbox[name='ckRecomSauce']" ).each(function(){
			for(var i=0;i<sauce.length;i++){
					console.log($(this).val());
					//console.log(sauce[i]);
				if($(this).val() == sauce[i]){
					$(this).prop("checked",true); // checked 처리
				}
			}
		});
	}
	
	//재료 카테고리 변경시
	$("#ingreType").change(function(){
		//메인재료 선택시 추천소스 tr 보여주기
		if($("#ingreType").val()=='메인재료'){
			$("#sauceTr").show();
		}else{
			$("#sauceTr").hide();
		}
	});
		
	//추천소스 선택시
	$("input[name=ckRecomSauce]").change(function(){
		if($("#chk-del-all").is(":checked")){
			$("input[name='ckRecomSauce']").prop("checked",false);
		}
		var values = "";
		for(var i=0;i<$('input[name="ckRecomSauce"]:checked').length;i++){
			if(i!= $('input[name="ckRecomSauce"]:checked').length-1){
				values += $('input[name="ckRecomSauce"]:checked').eq(i).val() + ",";
			}else{
				values += $('input[name="ckRecomSauce"]:checked').eq(i).val();
			}
		}
		$("#ingreRecomSauce").val(values);
		console.log(values);
	});
	
	/* 첨부파일 삭제 */
	$('#upload').hide();
	$('#fileDelBtn').click(function(){
		if(confirm("첨부파일을 삭제하시겠습니까?")){
			$('input[name=deleteFile]').val('1');
			$('#nowFile').hide();
			$('#upload').show();
		}
	});
	
	/* 파일 여부 체크 */
	$("#submit-btn").click(function(){
		if($('input[name=oldFilepath]').val()!=''){
			if($('input[name=deleteFile]').val()=='1'){
				var filepath1 = $("#filepath1").val();
				if(filepath1==""){
					$("#filepath1").focus();
					return false;
				}
			}
		}else{
			var filepath2 = $("#filepath2").val();
			if(filepath2==""){
				$("#filepath2").focus();
				return false;
			}
		}
	});
});
</script>


<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />