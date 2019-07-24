<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<style>
.recom li{float: left;width: 20%;}
</style>

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 재료 관리 > 재료 등록</div>
		
			<form action="/ingreManage/ingreRegister.do" method="post" enctype="multipart/form-data">
				<table class="comm-tbl">
					<colgroup>
						<col width="20%">
						<col width="/">
					</colgroup>	
					<tr>
						<th>카테고리</th>
						<td>
							<select name="ingreType" id="ingreType" class="short" required>
								<option value="">== 카테고리 ==</option>
								<option value="메인재료">메인재료</option>
								<option value="샐러드">샐러드</option>
								<option value="빵">빵</option>
								<option value="추가토핑">추가토핑</option>
								<option value="치즈">치즈</option>
								<option value="채소">채소</option>
								<option value="소스">소스</option>
								<option value="사이드메뉴">사이드메뉴</option>
								<option value="세트메뉴">세트메뉴</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>재료명</th>
						<td>
							<input type="text" name="ingreLabel" id="ingreLabel" required>
						</td>
					</tr>
					<tr id="sauceTr">
						<th>추천 소스</th>
						<td>
							<label><input type="checkbox" name="ckRecomSauce" id="chk-del-all" value="">전체 선택 해제</label>
							<ul class="recom">
								<c:forEach items="${sauce}" var="sauce">
									<li><label><input type="checkbox" class="ckRecomSauce" name="ckRecomSauce" value="${sauce.ingreLabel}"> ${sauce.ingreLabel}</label></li>
								</c:forEach>
							</ul>
							<input type="hidden" name="ingreRecomSauce" id="ingreRecomSauce">
						</td>
					</tr>
					<tr>
						<th>판매 가격</th>
						<td>
							15cm : <input type="text" name="ingreCost15" id="ingreCost15" class="short" value="0" required style="text-align:right;"> 원 &nbsp;&nbsp;
							30cm : <input type="text" name="ingreCost30" id="ingreCost30" class="short" value="0" required style="text-align:right;"> 원
						</td>
					</tr>
					<tr>
						<th>활성화/비활성화</th>
						<td>
							<select name="ingreActive" id="ingreActive" class="short">
								<option value="1" selected>활성화</option>
								<option value="0">비활성화</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>상세설명</th>
						<td>
							<textarea rows="5" cols="100" name="ingreDescription"></textarea>
						</td>
					</tr>
					<tr>
						<th>칼로리</th>
						<td>
							<input type="text" name="ingreKcal" class="short" required style="text-align:right;"> Kcal
						</td>
					</tr>
					<tr>
						<th>이미지 등록</th>
						<td>
							<input type="file" name="filepath" required>
						</td>
					</tr>
					<tr>
						<th>단위(unit)</th>
						<td>
							<select name="ingreUnit" class="short" required>
								<option value="box">box</option>
								<option value="kg">kg</option>
								<option value="통">통</option>
							</select>
						</td>
					</tr>
				</table>
				<div class="common-tbl-btn-group">
					<button type="submit" class="btn-style1">메뉴등록</button>
					<button type="reset" class="btn-style2">취소</button>
				</div>
			</form>
		</div>
	
</section>

<script>
	$(document).ready(function(){
		$("#sauceTr").hide();
	});
	
	//재료 카테고리 변경시
	$("#ingreType").change(function(){
		//메인재료 선택시
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
	});
</script>




<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />