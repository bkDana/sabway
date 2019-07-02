<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>

<section id="content-wrapper" class="clearfix">
	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 재고관리 > 발주서 작성</div>

		<form action="/managerOrder/addOrder.do" method="post" onsubmit="return submit_chk();">
			<input type="hidden" name="mOrderManagerId" value="dangsan">
			<table class="comm-tbl">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<td>날짜</td><td><input type="text" name="mOrderDelDate" class="datepicker" readonly></td>
				</tr>
				<!-- 
				<tr>
					<td>지점명</td><td><input type="text" name="" value="당산점"></td>
				</tr>
				 -->
				<tr>
					<td>물품 선택</td>
					<td>
						<select class="middle"><option>-- 1차분류 --</option></select>&nbsp;
						<select class="middle" id="item"><option value="">-- 물품 --</option><option value="23">로티세리</option><option value="10">에그마요</option></select>
						<button type="button" class="add-btn" onclick="add();">추가</button>
					</td>
				</tr>
			</table>
			<br><br><br><br><br><br>
			<h1>물품 내역</h1>
			<table class="comm-tbl type2" id="item_tbl">
				<colgroup>
					<col width="50%">
					<col width="20%">
					<col width="40%">
				</colgroup>
				<thead>
					<tr>
						<th>물품명</th><th>단위별 수량</th><th>기능</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
				
			</table>
			<div class="common-tbl-btn-group">
				<button class="btn-style2" type="submit">발주서 등록</button>
			</div>
		</form>
	</div>
</section>

<script>
/* 물품 추가하기 */
function add(){
//$('.add-btn').click(function(){
	var item_idx = $('#item option:selected').val();
	if(item_idx == ''){
		alert('추가할 물품을 선택하세요');
		$('#item').focus();
		return;
	}
	var chk_num = 0;
	$('table#item_tbl tbody tr').each(function () {
	       var $tr = $(this).children('td');
	       var check = $tr.children('input[name^=idx]').val();
	       if(item_idx == check){
	    	   alert('이미 추가된 물품입니다.');
	    	   chk_num++;
	       }
	});
	
	if(chk_num==0){
		var item_name = $('#item option:selected').text();
		var cnt = $('#item_tbl tbody').children('tr').length+1;
		var add = '';
		add += '<tr><td><input type="hidden" name="idx_'+cnt+'" value="'+item_idx+'"><input type="text" name="name_'+cnt+'" class="short" value="'+item_name+'"readonly></td>';
		add += '<td><input type="text" name="amount_'+cnt+'" class="short"></td>';
		add += '<td><button type="button" class="del-btn" onclick="remove(this);">삭제</button></td></tr>';
		$('#item_tbl tbody').append(add);
	}
//});
}

/* 추가한 item 삭제하기 */
function remove(e) {
    $(e).closest('tr').remove();
    var num = 1;
    $('table#item_tbl tbody tr').each(function () {
       var $tr = $(this).children('td');
       $tr.children('input[name^=idx]').attr("name","idx_"+num);
       $tr.children('input[name^=name]').attr("name","name_"+num);
       $tr.children('input[name^=amount]').attr("name","amount_"+num);
       
       num++;
    });
 }

/* 수량 입력했는지 확인 */
function submit_chk(){
	var cnt = $('#item_tbl tbody').children('tr').length;
	if(cnt==0){
		alert('물품을 추가하세요');
		return false;
	}
	var chk_num = 0;
	$('table#item_tbl tbody tr').each(function () {
	       var $tr = $(this).children('td');
	       var amount = $tr.children('input[name^=amount]').val();
	       if(amount == '' || amount == 0){
	    	   chk_num++;
	    	   return;
	       }
	});
	if(chk_num>0){
		alert('수량을 입력하세요');
		return false;
	}
	
	
	return true;
}

</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />