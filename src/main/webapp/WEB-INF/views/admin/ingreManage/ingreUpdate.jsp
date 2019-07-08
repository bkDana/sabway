<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />


<%-- Content --%>
<section id="content-wrapper" class="clearfix">
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 메뉴관리 > 메뉴수정</div>
		
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
								<option value="메인메뉴">메인메뉴</option>
								<option value="메인재료">메인재료</option>
								<option value="빵">빵</option>
								<option value="추가토핑">추가토핑</option>
								<option value="치즈">치즈</option>
								<option value="채소">채소</option>
								<option value="소스">소스</option>
								<option value="사이드메뉴">사이드메뉴</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>재료명</th>
						<td>
							<input type="text" name="ingreLabel" id="ingreLabel" value="${iv.ingreLabel}" required>
						</td>
					</tr>
					<tr>
						<th>판매가격</th>
						<td>
							15cm : <input type="text" name="ingreCost15" id="ingreCost15" class="short" value="${iv.ingreCost15 }" style="text-align:right;" value="0" required> 원 &nbsp;&nbsp;
							30cm : <input type="text" name="ingreCost30" id="ingreCost30" class="short" value="${iv.ingreCost30 }" style="text-align:right;" value="0" required> 원
						</td>
					</tr>
					<tr>
						<th>활성화/비활성화</th>
						<td>
							<select name="ingreActive" id="ingreActive" class="short">
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
								<span id="upload"><input type="file" name="filepath"><p class="comment">(※ 파일 크기는 최대 10MB까지만 가능합니다.)</p></span>
							</c:if>
							<c:if test="${empty iv.ingreFilepath }">
								<input type="file" name="filepath"><p class="comment" >(※ 파일 크기는 최대 10MB까지만 가능합니다.)</p>
							</c:if>
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
					<button type="submit" class="btn-style1">재료 수정</button>
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
	
	/* 첨부파일 삭제 */
	$('#upload').hide();
	$('#fileDelBtn').click(function(){
		if(confirm("첨부파일을 삭제하시겠습니까?")){
			$('input[name=deleteFile]').val('1');
			$('#nowFile').hide();
			$('#upload').show();
		}
	});
});
</script>


<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />