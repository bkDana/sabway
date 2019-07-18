$(function(){
	
	/* 검색값 고정 */
	var searchType = $('select[name=searchType]').data('val');
	$('select[name=searchType]').children('option').each(function(){
		if(searchType == $(this).val()){
			$(this).prop("selected",true);
		}
	});

	var order = $('select#order').data('val');
	$('select#order').children('option').each(function(){
		if(order == $(this).val()){
			$(this).prop("selected",true);
		}
	});

	/* 리스트 정렬 submit */
	$('select#order').change(function(){
		$('input[name=orderBy]').val($(this).val());
		search.submit();
	});

	/* 체크박스 전체 선택or해제 */
	$('.allcbox').click(function(){
		if($(this).is(':checked')){
			$('.cbox').prop('checked',true);
		}else{
			$('.cbox').prop('checked',false);
		}
	});
	
	/* 선택 삭제 */
	$('#del-button').click(function(){
		var idx = "";
		var boardType = $('input[name=type]').val();
		console.log(boardType);
		$('.cbox:checked').each(function(){
			idx += $(this).data('idx')+",";
		});
		if(idx==""){
			alert('선택된게 없어..');
		}else{

			$.ajax({
				url : '/board/allDelete.do',
				data : {idx:idx,boardType:boardType},
				type : 'post',
				dataType : 'json',
				success : function(res){
					if(res=="성공"){
						alert('삭제 완료');
						window.location.reload();
					}else{
						alert('실패한거같은데');
					}
				},
				error : function(){
					console.log('실퍄');
				}
			});
			
		}
	});
});

/* 페이지 이동 */
function list(p){
	$('input[name=reqPage]').val(p);
	search.submit();
}

