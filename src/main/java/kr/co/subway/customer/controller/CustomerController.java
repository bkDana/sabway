package kr.co.subway.customer.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.subway.customer.service.CustomerService;
import kr.co.subway.customer.vo.Customer;

@Controller
public class CustomerController {
   @Autowired
   @Qualifier(value="customerService")
   private CustomerService customerService;
   @RequestMapping(value="/login.do")
   public String customerLogin(HttpServletRequest request, HttpServletResponse response) {
      
      String customerId = request.getParameter("customerId");
      String customerPw = request.getParameter("customerPw");
      String oldUserToNew = request.getParameter("oldUserToNew");
      
      Customer vo = new Customer();
      vo.setCustomerId(customerId);
      vo.setCustomerPw(customerPw);
      
      try {
         
         if(oldUserToNew != null && "Y".equals(oldUserToNew)) {
            vo.setCustomerState(1); // 해당 회원 State 값 1 변경
            int resultCnt = customerService.updateState(vo); // 회원정보 수정 서비스
            String result = String.valueOf(resultCnt);
             return result;
          }
         
         Customer selectCustomerVo = customerService.selectOneCustomerEnroll(vo);
         
         HttpSession session = request.getSession();
         if(selectCustomerVo != null) {
            session.setAttribute("customer", selectCustomerVo);
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         
         Calendar cal = Calendar.getInstance();
         Calendar cal2 = Calendar.getInstance();
         
         
            System.out.println("오늘날짜 : " +sdf.format(cal.getTime()));
            System.out.println("마지막로그인날짜 : "+ selectCustomerVo.getLastLogDate());
            
            
            cal2.setTime(selectCustomerVo.getLastLogDate());
            cal2.add(Calendar.MONTH, 1);
            
            
            System.out.println("마지막로그인+30일 : "+sdf.format(cal2.getTime()));
            
            
            int result = cal.compareTo(cal2);
            
            
            System.out.println(result);
            
            
            // 마지막로그인이 한달이 지났을경우 1 else -1 
            if((oldUserToNew == null || !"Y".equals(oldUserToNew)) && result == 1) {
              // 휴면계정  CustomerState [1:정상, 0:휴면, 2:탈퇴 ]
   
               
            selectCustomerVo.setCustomerState(0); // 해당 회원 State 값 0 변경
            customerService.updateState(selectCustomerVo); // 회원정보 수정 서비스
            
            System.out.println("변경된 상태 : "+ selectCustomerVo.getCustomerState());
               
            request.setAttribute("stateVal", "0");
            request.setAttribute("selectCustomerVo", selectCustomerVo);
               
            return "customer/loginFailed";
            }
               
           customerService.updateLastLog(selectCustomerVo); // 마지막로깅용 메소드 호출
           return "customer/loginSuccess";
            
         }else {
            
           // 회원 정보 없음
            request.setAttribute("stateVal", "3");
            return "customer/loginFailed";
         }
         
      } catch(Exception e) {
        request.setAttribute("stateVal", "3");
         return "customer/loginFailed";
      }
   }
   
   //로그아웃
   @RequestMapping(value="/logout.do")
   public String customerLogout(HttpServletRequest request) {
      HttpSession session = request.getSession(false);
      session.invalidate();
      return "redirect:/index.jsp";
   }
   
   //아이디 체크
   @ResponseBody//값을  view resolver를 거치지 않고 view에 전달하는 어노테이션이다.
   @RequestMapping(value="/idCheck.do" ,produces="text/html;charset=utf-8")
   public String idCheck(@RequestParam String customerId) {
      Customer c = customerService.selectOneId(customerId);
      System.out.println(c);
      if(c!=null) {
         return "1";
      }else {
         return "0";
      }
   }
   
   //닉네임 체크
   @ResponseBody
   @RequestMapping(value="/nickCheck.do" ,produces="text/html;charset=utf-8")
   public String nickCheck(@RequestParam String customerNick) {
      Customer c = customerService.selectOneNick(customerNick);
      System.out.println(c);
      if(c!=null) {
         return "1";
      }else {
         return "0";
      }
   }
   
   //휴면계정 해제
   @ResponseBody
   @RequestMapping(value="/oldUserToNewAjax.do" ,produces="text/html;charset=utf-8")
   public int oldUserToNewAjax(HttpServletRequest request) {
      
     String customerId = request.getParameter("customerId");
      String oldUserToNew = request.getParameter("oldUserToNew");
         
      Customer vo = new Customer();
      vo.setCustomerId(customerId);
     
     if(oldUserToNew != null && "Y".equals(oldUserToNew)) {
      vo.setCustomerState(1); // 해당 회원 State 값 1 변경
      int resultCnt = customerService.updateState(vo); // 회원정보 수정 서비스
      
      return resultCnt;
     }else{
        return 0;
     }
   }
   
   //닉네임 체크
   @ResponseBody
   @RequestMapping(value="/emailCheck.do" ,produces="text/html;charset=utf-8")
   public String emailCheck(@RequestParam String email) {
      Customer c = customerService.selectOneEmail(email);
      System.out.println(c);
      if(c!=null) {
         return "1";
      }else {
         return "0";
      }
   }
   
   //회원가입
   @RequestMapping(value="/enroll.do")
   public String customerEnroll(Customer vo) {
      int result = customerService.insertCustomerEnroll(vo);
      if(result>0) {
         return "customer/insertSuccess";
      }else {
         return "customer/insertFailed";
      }
   }
   
   //로그인 페이지
   @RequestMapping(value="/index.do")
   public String index() {
     return "customer/index";
   }
   
   //회원가입 페이지 이동
   @RequestMapping(value="/enrollPage.do")
   public String enrollPage() {
      return "customer/enrollPage";
   }
}