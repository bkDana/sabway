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
      
      Customer vo = new Customer();
      vo.setCustomerId(customerId);
      vo.setCustomerPw(customerPw);
      
      try {
         
         Customer c = customerService.selectOneCustomerEnroll(vo);
         HttpSession session = request.getSession();
         if(c!=null) {
            session.setAttribute("customer", c);
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         Calendar cal = Calendar.getInstance();
         Calendar cal2 = Calendar.getInstance();
            System.out.println("오늘날짜 : " +sdf.format(cal.getTime()));
            System.out.println("마지막로그인날짜 : "+ c.getLastLogDate());
            cal2.setTime(c.getLastLogDate());
            cal2.add(Calendar.MONTH, 1);
            System.out.println("마지막로그인+30일 : "+sdf.format(cal2.getTime()));
            int result = cal.compareTo(cal2);
            System.out.println(result);
            if(result == 1) {  // 마지막 로그인날짜 + 30일 < 현재날짜
               // 휴면계정
                // 1:정상, 0:휴면, 2:탈퇴 , 3:로그인실패
               customerService.updateState(c);
               System.out.println("변경된 상태 : "+ c.getCustomerState());
               request.setAttribute("stateVal", "0");
               customerService.updateLastLog(c);
               return "customer/loginFailed";
            }else{
               customerService.updateLastLog(c);// 마지막로깅용 메소드 호출
            }
            customerService.updateLastLog(c);
            return "customer/loginSuccess";
         }else {
            request.setAttribute("stateVal", "3");
            return "customer/loginFailed";
         }
         
      }catch(Exception e) {
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