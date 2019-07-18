package kr.co.subway.customer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.subway.customer.common.SHA256Util;
import kr.co.subway.customer.service.CustomerService;
import kr.co.subway.customer.vo.CustPageNaviData;
import kr.co.subway.customer.vo.Customer;
import kr.co.subway.manager.vo.Mgr;

@Controller
public class CustomerController {
   @Autowired
   @Qualifier(value = "customerService")
   private CustomerService customerService;


   // private MailSendService mailsender;


   @RequestMapping(value = "/login.do")
   public String customerLogin(HttpServletRequest request, HttpServletResponse response) {
      HttpSession session = request.getSession();

      String customerId = request.getParameter("customerId");
      String customerPw = request.getParameter("customerPw");
      System.out.println(customerId);
      System.out.println(customerPw);

      String oldUserToNew = request.getParameter("oldUserToNew");

      Customer vo = new Customer();
      vo.setCustomerId(customerId);
      vo.setCustomerPw(customerPw);

      try {

         if (oldUserToNew != null && "Y".equals(oldUserToNew)) {
            vo.setCustomerState(1); // 해당 회원 State 값 1 변경
            int resultCnt = customerService.updateState(vo); // 회원정보 수정 서비스
            String result = String.valueOf(resultCnt);
            return result;
         }

         Customer selectCustomerVo = customerService.selectOneCustomerEnroll(vo);

         // 탈퇴계정
         int state2 = selectCustomerVo.getCustomerState();

         if (state2 == 2) {
            request.setAttribute("stateVal", "2");
            session.removeAttribute("customer");
            return "customer/loginFailed";
         }

         if (selectCustomerVo != null) {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            Calendar cal = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();

            System.out.println("오늘날짜 : " + sdf.format(cal.getTime()));
            System.out.println("마지막로그인날짜 : " + selectCustomerVo.getLastLogDate());

            cal2.setTime(selectCustomerVo.getLastLogDate());
            cal2.add(Calendar.MONTH, 1);

            System.out.println("마지막로그인+30일 : " + sdf.format(cal2.getTime()));

            int result = cal.compareTo(cal2);

            System.out.println(result);

            // 마지막로그인이 한달이 지났을경우 1 else -1
            if ((oldUserToNew == null || !"Y".equals(oldUserToNew)) && result == 1) {
               // 휴면계정 CustomerState [1:정상, 0:휴면, 2:탈퇴 ]

               selectCustomerVo.setCustomerState(0); // 해당 회원 State 값 0 변경
               customerService.updateState(selectCustomerVo); // 회원정보 수정 서비스

               System.out.println("변경된 상태 : " + selectCustomerVo.getCustomerState());

               request.setAttribute("stateVal", "0");
               request.setAttribute("selectCustomerVo", selectCustomerVo);

               return "customer/loginFailed";
            }

            customerService.updateLastLog(selectCustomerVo); // 마지막로깅용 메소드 호출
            session.setAttribute("customer", selectCustomerVo);
            return "customer/loginSuccess";

         } else {

            // 회원 정보 없음
            request.setAttribute("stateVal", "3");
            session.removeAttribute("customer");
            return "customer/loginFailed";
         }

      } catch (Exception e) {
         request.setAttribute("stateVal", "3");
         session.removeAttribute("customer");
         return "customer/loginFailed";
      }
   }

   // 로그아웃
   @RequestMapping(value = "/logout.do")
   public String customerLogout(HttpServletRequest request) {
      HttpSession session = request.getSession(false);
      session.removeAttribute("customer");
      session.invalidate();
      return "redirect:/index.jsp";
   }

   // 아이디 체크
   @ResponseBody // 값을 view resolver를 거치지 않고 view에 전달하는 어노테이션이다.
   @RequestMapping(value = "/idCheck.do", produces = "text/html;charset=utf-8")
   public String idCheck(@RequestParam String customerId) {
      Customer c = customerService.selectOneId(customerId);
      System.out.println(c);
      if (c != null) {
         return "1";
      } else {
         return "0";
      }
   }

   // 닉네임 체크
   @ResponseBody
   @RequestMapping(value = "/nickCheck.do", produces = "text/html;charset=utf-8")
   public String nickCheck(@RequestParam String customerNick) {
      Customer c = customerService.selectOneNick(customerNick);
      System.out.println(c);
      if (c != null) {
         return "1";
      } else {
         return "0";
      }
   }

   // 이메일 체크
   @ResponseBody
   @RequestMapping(value = "/emailCheck.do", produces = "text/html;charset=utf-8")
   public String emailCheck(@RequestParam String email) {
      Customer c = customerService.selectOneEmail(email);
      System.out.println(c);
      if (c != null) {
         return "1";
      } else {
         return "0";
      }
   }

   // 휴면계정 해제
   @ResponseBody
   @RequestMapping(value = "/oldUserToNewAjax.do", produces = "application/json")
   public int oldUserToNewAjax(HttpServletRequest request) {

      String customerId = request.getParameter("customerId");
      String oldUserToNew = request.getParameter("oldUserToNew");

      Customer vo = new Customer();
      vo.setCustomerId(customerId);

      if (oldUserToNew != null && "Y".equals(oldUserToNew)) {
         vo.setCustomerState(1); // 해당 회원 State 값 1 변경
         int resultCnt = customerService.updateState(vo); // 회원정보 수정 서비스
         customerService.updateLastLog(vo); // 마지막로깅용 메소드 호출

         return resultCnt;
      } else {
         return 0;
      }
   }

   // 회원가입
   @RequestMapping(value = "/enroll.do")
   public String customerEnroll(Customer vo, HttpServletRequest request) {
      int result = customerService.insertCustomerEnroll(vo);

      if (result > 0) {
         return "customer/insertSuccess";
      } else {
         return "customer/insertFailed";
      }
   }

   // 로그인 페이지
   @RequestMapping(value = "/index.do")
   public String index() {
      return "customer/index";
   }

   // 회원가입 페이지 이동
   @RequestMapping(value = "/enrollPage.do")
   public String enrollPage() {
      return "customer/enrollPage";
   }

   // 회원리스트
   @RequestMapping(value="/allCustomerList.do")
   public ModelAndView allCustomerList() {
      ArrayList<Customer> list = customerService.allCustomerList();
      ModelAndView mav = new ModelAndView();
      
      if(!list.isEmpty()) {
         mav.addObject("list",list);
         mav.setViewName("customer/allCustomerList");
      }else {
         mav.setViewName("customer/error");
      }
   return mav;   
   }
   
   // 회원 리스트검색
	@RequestMapping(value="/customerKeyword.do")
	public ModelAndView customerKeyword(String reqPage, @RequestParam String keyword, @RequestParam String cusIdName, @RequestParam String cusStatusMember) {
    	  
		int reqPage1;
		try {
			reqPage1 = Integer.parseInt(reqPage);
		} catch (Exception e) {
			reqPage1 = 1;
		}
		CustPageNaviData cp = customerService.customerList(keyword, cusIdName, cusStatusMember);
		//ArrayList<Customer> list = (ArrayList<Customer>) customerService.customerKeyword(keyword,cusIdName,cusStatusMember);
		ArrayList<Customer> list = cp.getCustList();
		
		ModelAndView mav = new ModelAndView();
		   if(!list.isEmpty()) {
		      mav.addObject("list",list);
		      mav.setViewName("customer/allCustomerList");
		   }else {
		      mav.setViewName("customer/error");
		   }
		return mav; 
	}

   // 회원탈퇴시키기
   @RequestMapping(value = "/adminCustomerDelete.do", produces = "application/json")
   public void adminCustomerDelete(HttpServletRequest request, HttpServletResponse response,
         @RequestParam int customerNo) {
      System.out.println(customerNo);
      int result = customerService.adminCustomerDelete(customerNo);

      try {
         PrintWriter out = response.getWriter();
         if (result > 0) {
            out.print(1);
         } else {
            out.print(0);
         }

      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

   }

   // 회원탈퇴해제시키기
   @RequestMapping(value = "/adminCustomerDeleteCancle.do", produces = "application/json")
   public void adminCustomerDeleteCancle(HttpServletRequest request, HttpServletResponse response,
         @RequestParam int customerNo) {
      int result = customerService.adminCustomerDeleteCancle(customerNo);

      try {
         PrintWriter out = response.getWriter();
         if (result > 0) {
            out.print(1);
         } else {
            out.print(0);
         }

      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

   }

   // 이메일 인증
   @RequestMapping(value = "/emailAuth.do")
   public void emailcertification(HttpServletRequest request, HttpServletResponse response) {
      String id = request.getParameter("email");
      System.out.println("메일 인증");
      String host = "smtp.googlemail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정

      final String user = "ssuyong2@gmail.com";
      final String password = "tjqmdnpdl2";

      Properties props = new Properties();
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", 587);
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");

      Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
         protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
         }
      });

      try {
         MimeMessage message = new MimeMessage(session);
         message.setFrom(new InternetAddress(user));
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(id));
         // 메일 제목
         message.setSubject("Sabway");

         Random random = new Random();
         String num = new String();
         for (int i = 0; i < 7; i++) {
            num += String.valueOf(random.nextInt(9) + 1);

         }
         // 메일 내용
         message.setContent("<!DOCTYPE html>\r\n" + "<html>\r\n" + "<head>\r\n" + "<meta charset=\"UTF-8\">\r\n"
               + "<title>Insert title here</title>\r\n" + "</head>\r\n" + "    <style>\r\n" + "        div{\r\n"
               + "           \r\n" + "        }\r\n" + "    </style>\r\n" + "<body>\r\n"
               + "    <div style=\"padding-left: 50px;padding-top:20px; margin: 100px; width:1155px; border: 2px solid darkgray;\" >\r\n"
               + "        <br>\r\n" + "        <div style=\"padding-top:30px;font-weight:bold;\">\r\n"
               + "    <p style=\"text-align:left;\">\r\n" + "        저희 Sabway를 이용해 주셔서 감사합니다.<br><br>\r\n"
               + "        \r\n" + "        회원님의 본인인증 키는 <span style=\"font-size:20px;\"> " + num
               + " </span>입니다.<br><br>\r\n" + "        보안을 위해 이 링크는 전송된 후 2분이 지나면 만료됩니다.<br><br>\r\n"
               + "        감사합니다. <br>\r\n" + "       Sabway \r\n" + "    </p>\r\n" + "       </div>\r\n"
               + "    </div>\r\n" + "</body>\r\n" + "</html>", "text/html;charset=euc-kr");
         // send the message
         Transport.send(message);
         System.out.println("Success Message Send");
         RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/customer/emailAuth.jsp");
         request.setAttribute("num", num);
         try {
            rd.forward(request, response);
         } catch (ServletException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      } catch (MessagingException e) {
         e.printStackTrace();
      }
   }

   // 아이디찾기 페이지 이동
   @RequestMapping(value = "/findIdPage.do")
   public String findIdPage() {
      return "customer/findIdPage";
   }

   // 비번찾기 페이지 이동
   @RequestMapping(value = "/findPwPage.do")
   public String findPwPage() {
      return "customer/findPwPage";
   }

   // 아이디 찾기
   @RequestMapping(value = "/findId.do")
   public String findId(HttpServletRequest request) {
      Customer customerVo = new Customer();
      customerVo.setCustomerName(request.getParameter("customerName"));
      customerVo.setPhone(request.getParameter("phone"));
      customerVo.setPhone1(request.getParameter("phone1"));
      customerVo.setPhone2(request.getParameter("phone2"));
      customerVo.setBirthday(request.getParameter("birthday"));
      System.out.println(customerVo.getPhone());

      customerVo.setCustomerId(customerService.findId(customerVo));
      System.out.println(customerVo.getCustomerId());
      String view = "";
      if (customerVo.getCustomerId() == null) {
         view = "common/msg";
         request.setAttribute("msg", "이름과 핸드폰 번호를 정확히 입력해주세요");
         request.setAttribute("loc", "/index.do");
      } else {

         System.out.println(customerVo.getCustomerId());
         view = "common/msg";
         request.setAttribute("msg", "아이디는 " + customerVo.getCustomerId() + " 입니다");
         request.setAttribute("loc", "/index.do");
      }
      return view;
   }

   // 비번 찾기
   @RequestMapping(value = "/findPw.do")
   public String findPw(HttpServletRequest request) {
      Customer customerVo = new Customer();
      customerVo.setCustomerId(request.getParameter("customerId"));
      customerVo.setEmail(request.getParameter("email"));
      System.out.println(customerVo.getEmail());
      System.out.println(customerVo.getCustomerId());
      Customer customer = customerService.idAndEmailCheck(customerVo);
      System.out.println("dd");
      String view = "common/msg";
      if (customer == null) {
         request.setAttribute("msg", "아이디와 이름을 확인해주세요");
         request.setAttribute("loc", "/findPwPage.do");
         return view;
      } else {
         String host = "smtp.googlemail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정

         final String user = "ssuyong2@gmail.com";
         final String password = "tjqmdnpdl2";

         Properties props = new Properties();
         props.put("mail.smtp.host", host);
         props.put("mail.smtp.port", 587);
         props.put("mail.smtp.auth", "true");
         props.put("mail.smtp.starttls.enable", "true");

         Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(user, password);
            }
         });
         String msg = null;
         try {
            String pw = "";
            for (int i = 0; i < 12; i++) {
               pw += (char) ((Math.random() * 26) + 97);
            }
            customerVo.setCustomerPw(pw);

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(customerVo.getEmail()));
            // 메일 제목
            message.setSubject("sabway");
            message.setContent("<div align='center' style='border:1px solid black; font-family:verdana'>"
                  + "<h3 style='color: blue;'>" + customerVo.getCustomerId()
                  + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>" + "<p>임시 비밀번호 : " + customerVo.getCustomerPw()
                  + "</p></div>", "text/html;charset=euc-kr");
            Transport.send(message);
         } catch (Exception e) {
         }
         System.out.println("암호화 이전" + customerVo.getCustomerPw());
         try {
            customerVo.setCustomerPw(new SHA256Util().encData(customerVo.getCustomerPw()));
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         System.out.println("암호화 다음" + customerVo.getCustomerPw());
         int result = customerService.pwUpdate(customerVo);
         if (result > 0) {
            request.setAttribute("msg", "비밀번호 변경 메일을 확인해주세요");
            request.setAttribute("loc", "/index.do");
         } else {
            request.setAttribute("msg", "비밀번호 변경 실패");
            request.setAttribute("loc", "/findPwPage.do");
         }
      }
      return view;
   }

   // 회원정보
   @RequestMapping(value = "/mypage.do")
   public String mypage(HttpSession session) {
      Customer vo = (Customer) session.getAttribute("customer");
      System.out.println(vo.getPhone());
      Customer c = customerService.selectOneCustomerEnroll(vo);
      System.out.println(vo.getPhone());

      vo.setPhone1(vo.getPhone().substring(0, 3));
      vo.setPhone2(vo.getPhone().substring(4, 8));
      vo.setPhone3(vo.getPhone().substring(9, 13));
      System.out.println(vo.getPhone1());
      // System.out.println(c.getPhone1());
      // System.out.println(c.getPhone2());
      // System.out.println(c.getPhone3());

      Model model = new ExtendedModelMap();
      model.addAttribute("customer", vo);
      return "customer/mypage";
   }

   // 회원수정
   @RequestMapping(value = "/cusUpdate.do")
   public String cusUpdate(Customer vo, HttpSession session) {
      int result = customerService.cusUpdateEnroll(vo);
      if (result > 0) {
         session.setAttribute("customer", vo);
         return "customer/updateSuccess";
      } else {
         return "customer/updateFailed";
      }
   }

   @RequestMapping(value = "/cusDelete.do")
   public String cusDelete(Customer vo, HttpServletRequest request) {
      int result = customerService.cusDelete(vo);
      HttpSession session = request.getSession(false);
      session.invalidate();
      if (result > 0) {
         return "customer/deleteSuccess";
      } else {
         return "customer/deleteFailed";
      }
   }

   
   @RequestMapping(value = "/mypageIntro.do")
   public String mypageIntro(HttpSession session) {
      return "customer/myPage";
   }

   // 회원정보 페이지 이동
   @RequestMapping(value = "/customerProfile.do")
   public String customerProfile(HttpSession session) {
      Customer vo = (Customer) session.getAttribute("customer");
      Customer c = customerService.selectOneCustomerEnroll(vo);
      Model model = new ExtendedModelMap();
      model.addAttribute("customer", c);
      return "customer/customerProfile";

   }

}