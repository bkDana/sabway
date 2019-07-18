<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- Header --%>
<jsp:include page="/WEB-INF/views/admin/common/header.jsp" />

<%-- Content --%>
<section id="content-wrapper" class="clearfix">
<%-- LEFT MENU --%>
<jsp:include page="/WEB-INF/views/admin/common/admin-left-nav.jsp" />
<style>
   .del-btn2{
      height: 30px;
       padding: 0 10px;
       border-radius: 5px;
       background-color: #747474;
       color: #fff;
       margin-left: 5px;
   }
      /* form ::: search */
   .form_searchM{border:2px solid #dddddd; height:41px;width:15%; display:block; vertical-align:middle; position:relative; padding-right:42px }
   .form_searchM input{border:0; height:41px; width:100%; text-indent:14px; color:#292929; font-size:16px;}
   .form_searchM input::placeholder{color:#bbbbbb; font-size:16px;font-family:font_ns, sans-serif;}
   .form_searchM .btn_searchM{background:url(http://subway.co.kr/images/common/icon_search.png) 50% 50% no-repeat; width:41px; height:41px; position:absolute; right:0; top:0}
   .form_searchM .btn_searchM:after{content:''; position:absolute; left:-2px; top:13px; width:2px; height:16px; background-color:#e5e5e5;}
</style>
   <div class="area">
   <div class="sub-menu">※ 회원관리 &gt; 회원리스트</div>
   <!-- <form action="/customerKeyword.do" method="post"> -->
      <div class="board-search-box">
      	<form action="/allCustomerList.do" method="post">
      		<input type="hidden" name="reqPage" value="1">
	        <select name = "customerState" id="cusStatusMember" data-state="${customerState}">
	           <option value="-1">전체</option>
	           <option value="1">회원</option>
	           <option value="0">휴면</option>
	           <option value="2">탈퇴</option>
	        </select>
            <select name="cusIdName" id="cusIdName" data-sel="${cusIdName}">
               <option value="id">아이디</option>
               <option value="name">이름</option>
            </select>
	        <!-- <div class="form_searchM"> -->
	           <input type="text" name="keyword" maxlength="30" placeholder="회원검색" value="${keyword}" style="height:34px; padding-left:5px;">
	           <button type="submit" class="bbs-search-btn">검색</button>
	       <!--  </div> -->
        </form>
      </div>
   <!-- </form> -->
   <br>
      <table border="1" class="comm-tbl type2" id="searchViewTbl">
         <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>닉네임</th>
            <th>생년월일</th>
            <th>성별</th>
            <th>핸드폰 번호</th>
            <th>이메일</th>
            <th>회원 상태</th>
            <th>가입일</th>
            <th>마지막 로그인 날짜</th>
            <th></th>
         </tr>
            <c:if test="${empty list }">
            	<tr>
					<td colspan="12">
						검색하신 결과가 없습니다.
					</td>
				</tr>
            </c:if>
            <c:if test="${not empty list }">
         <c:forEach items="${list }" var="c">
            <input type="hidden" value="${c.customerNo }">
	            <tr class="cusTr">
	               <td>${c.rnum}</td>
	               <td>${c.customerId}</td>
	               <td>${c.customerName}</td>
	               <td>${c.customerNick}</td>
	               <td>${c.birthday}</td>
	               <c:if test="${c.gender == 'M'}">
	                  <td>남자</td>
	               </c:if>
	               <c:if test="${c.gender == 'F'}">
	                  <td>여자</td>
	               </c:if>
	               <td>${c.phone}</td>
	               <td>${c.email}</td>
	               <c:if test="${c.customerState == 0}">
	                  <td style="color:#ffce32">휴면</td>
	               </c:if>
	               <c:if test="${c.customerState == 1}">
	                  <td style="color:#009223">회원</td>
	               </c:if>
	               <c:if test="${c.customerState == 2}">
	                  <td style="color:#d90f0f">탈퇴</td>
	               </c:if>
	               <td>${c.regDate}</td>
	               <td>${c.lastLogDate}</td>
	               <td>
	                  <c:choose>
	                     <c:when test="${c.customerState == 2}">
	                        <button type="button" class="del-btn2">탈퇴해제</button>
	                     </c:when>
	                     <c:otherwise>
	                        <button type="button" class="del-btn">탈퇴</button>
	                     </c:otherwise>
	                  </c:choose>
	               </td>   
	            </tr>
         </c:forEach>
	          </c:if>
      </table>
      <div class="paging">${pageNavi }</div>
      
   </div>
</section>
<script>
   $(document).ready(function(){
	   /* 검색 후 회원상태 고정 */
     	var customerState = $('select[name=customerState]').data('state');
	    console.log(customerState);
     	$('select[name=customerState]').children('option').each(function(){
     		if(customerState == $(this).val()){
     			$(this).prop("selected",true);
     		}
     	});
     	
     	/* 검색 후 아이디/이름 고정 */
     	var cusIdName = $('select[name=cusIdName]').data('sel');
     	console.log(cusIdName);
     	$('select[name=cusIdName]').children('option').each(function(){
     		if(cusIdName == $(this).val()){
     			$(this).prop("selected",true);
     		}
     	});
   });
   
   //회원 탈퇴시키기
   $('.del-btn').click(function(){
      if(confirm("해당 회원을 탈퇴 시키겠습니까?!?!?")){
         var customerNo =
            $(this).parent().parent().prev().val();
         
         $.ajax({
            type:"GET",
            url:"/adminCustomerDelete.do?customerNo="+customerNo,
            success : function(data){
               var result = data;
               if(result == 1){
                  alert("회원 탈퇴 완료");
                  location.reload();
               }else{
                  alert("탈퇴 실패")
               }
            }
         });
      }else{
         alert("취소")
         location.href="/allCustomerList.do"
      }
   });
      //회원 탈퇴 해제 시키기
   $('.del-btn2').click(function(){
      if(confirm("해당 회원을 해제 시키겠습니까?!?!?")){
         var customerNo =
            $(this).parent().parent().prev().val();
         
         $.ajax({
            type:"GET",
            url:"/adminCustomerDeleteCancle.do?customerNo="+customerNo,
            success : function(data){
               var result = data;
               if(result == 1){
                  alert("회원 해제 완료");
                  location.reload();
               }else{
                  alert("탈퇴 해제 실패")
               }
            }
         });
      }else{
         alert("취소")
         location.href="/allCustomerList.do"
      }
   
   });
      /* $('.btn_searchM').click(function(){
         var cusStatusMember = $('#cusStatusMember').val();
         var cusIdName = $('#cusIdName').val();
         var keyword = $('#keyword').val();
         alert($('#cusStatusMember').val());
         alert($('#cusStatus').val());
         alert($('#keyword').val());
         location.href="/customerKeyword.do?cusStatusMember="+cusStatusMember+"&cusIdName="+cusIdName+"&keyword="+keyword;
      }); */
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />