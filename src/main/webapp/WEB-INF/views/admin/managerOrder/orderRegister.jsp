<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>

<section id="content-wrapper" class="clearfix">
	<%-- LEFT MENU --%>
	<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
	<div class="area">
		<div class="sub-menu">※ 재고관리 > 발주서 작성</div>

		<form action="/managerOrder/addOrder.do" method="post" onsubmit="return submit_chk();">
			<c:if test="${not empty sessionScope.customer }">
			<input type="text" name="mOrderManagerId" value="${sessionScope.customer.customerId }">
			</c:if>
			<c:if test="${empty sessionScope.customer }">
			(가맹점 아이디 입력하면 됨)테스트용 추후 삭제 요망->
			<input type="text" name="mOrderManagerId" value="jy">
			</c:if>
			<table class="comm-tbl">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<th>날짜</th><td><input type="text" name="mOrderDelDate" class="regMorder" readonly></td>
				</tr>
				<tr>
					<th>재료 선택</th>
					<td>
						<select class="middle" id="itemType"><option>-- 1차분류 --</option></select>&nbsp;
						<select class="middle" id="item"><option value="">-- 재료 --</option></select>
						<button type="button" class="add-btn" onclick="add();">추가</button>
					</td>
				</tr>
			</table>
			<br><br><br><br><br><br>
			<table class="comm-tbl" id="item_tbl">
				<colgroup>
					<col width="60%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th>재료명</th><th>단위별 수량</th><th>기능</th>
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

/* 1차분류 세팅*/
$.ajax({
	url : '/ingreType.do',
	success : function(data){
		//console.log(data);
		for(var i=0;i<data.length;i++){
			$('#itemType').append('<option value='+data[i]+'>'+data[i]+'</option>');
		}
	},
	error : function(){
		console.log('실패');
	}
});


/* 재료 리스트 */
$('#itemType').change(function(){
	var type = $('#itemType option:selected').val();
	
	$.ajax({
		url : '/getIngre.do',
		data : {type:type},
		success : function(data){
			//console.log(data);
			$('#item').empty();
			$('#item').append('<option value="">-- 재료 --</option>');
			for(var i=0;i<data.length;i++){
				var unit = data[i].ingreUnit;
				if(unit==null || unit==''){
					unit = '등록안됨';
				}
				$('#item').append('<option value="'+data[i].ingreIdx+'">'+data[i].ingreLabel+'('+unit+')</option>');
			}
		},
		error : function(){
			console.log('실패');
		}
	});
	
});

/* 재료 추가하기 */
function add(){
//$('.add-btn').click(function(){
	var item_idx = $('#item option:selected').val();
	if(item_idx == ''){
		alert('추가할 재료를 선택하세요');
		$('#item').focus();
		return;
	}
	var chk_num = 0;
	$('table#item_tbl tbody tr').each(function () {
	       var $tr = $(this).children('td');
	       var check = $tr.children('input[name^=idx]').val();
	       if(item_idx == check){
	    	   alert('이미 추가된 재료입니다.');
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
		alert('재료를 추가하세요');
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