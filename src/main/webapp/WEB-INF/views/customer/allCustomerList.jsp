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
      <div>
         <select id="cusStatusMember">
            <option value="3">전체</option>
            <option value="1">회원</option>
            <option value="0">휴면</option>
            <option value="2">탈퇴</option>
         </select>
         <select id="cusIdName">
            <option value="1">아이디</option>
            <option value="2">이름</option>
         </select>
      </div>
      <div class="form_searchM">
         <input id="keyword" name="keyword" maxlength="30" placeholder="회원검색" type="text" value="" onkeypress="if(event.keyCode == 13){ searchBtn(); return; }">
         <button type="submit" class="btn_searchM"></button>
      </div>
   <!-- </form> -->
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
      </table>
   </div>
</section>
<script>
   $(document).ready(function(){
      $("#cusStatus").change(function(){
         var status = $(this).val();
         console.log(status);
         
      });
   });
   function searchBtn(){
         var keyword = $("#keyword").val();
         console.log(keyword)
         $.ajax({
            url : "/customerKeyword.do",
            data : {
               keyword : keyword
            },
            dataType : "json",
            success : function(data){
               $(".cusTr").remove();
               for(var i=0; i<data.length; i++){
                  $("#searchViewTbl").append("<tr style='height:60px' class='searchTr'><td style='color:#ffc300;font-weight: bold;>"+data.length[i].rnum+"</td></tr>")
               }
            }
         });
      }
   
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
                  alert("실패")
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
                  alert("실패")
               }
            }
         });
      }else{
         alert("취소")
         location.href="/allCustomerList.do"
      }
   
   });
      $('.btn_searchM').click(function(){
         var cusStatusMember = $('#cusStatusMember').val();
         var cusIdName = $('#cusIdName').val();
         var keyword = $('#keyword').val();
         alert($('#cusStatusMember').val());
         alert($('#cusStatus').val());
         alert($('#keyword').val());
         location.href="/customerKeyword.do?cusStatusMember="+cusStatusMember+"&cusIdName="+cusIdName+"&keyword="+keyword;
      });
</script>
<%-- Footer --%>
<jsp:include page="/WEB-INF/views/admin/common/footer.jsp" />