<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
   <input type="hidden" id="stateVal" value="${stateVal}">
   <input type="hidden" id="customerId" value="${selectCustomerVo.customerId}">
   <script>
      var stateVal = $("#stateVal").val();
      if(stateVal == 0){ //휴면계정
         if(confirm("계정이 휴면상태입니다. 휴면상태를 해제하시겠습니까?????????????")){
            
            $.ajax({
               
                 url:"/oldUserToNewAjax.do",
                 data:{
                       'oldUserToNew' : 'Y'
                       ,'customerId' : $("#customerId").val()
                    },
                 type:"get",
                 dataType:"JSON", 
                 success:function(data){
                    if(data > 0){
                       alert("해제됐습니다. 재 로그인 해주세요.");
                       location.href="/index.do";
                       
                    }else{
                       alert("잠시 후 다시 시도해주세요");
                       location.href="/index.do";
                    }
                 },
                 error:function(){
                    console.log("실패");
                    location.href="/index.do";
                 }
              });
                 
         }else{
            alert("취소");
            location.href="/index.do";
         }
//       }else if(stateVal == 2){// 탈퇴계정
         
      }else if(stateVal == 3){
         alert("로그인 실패했습니다ㅠㅠㅠㅠㅠㅠ");
         location.href="/index.do";
      }
      
   </script>
</body>
</html>