package kr.co.subway.customer.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.subway.customer.vo.Customer;

@Service
@Aspect
public class CustomerPassword {
	@Autowired
	@Qualifier("SHA256Util")
	SHA256Util sha256Util;
	@Pointcut("execution(* kr.co.subway.customer.service..*ServiceImpl.*Enroll(..))")
	 public void insertPointcut() {}
    @Before("insertPointcut()")
 public void passLog(JoinPoint jp) {
    Object[] args = jp.getArgs();
    Customer c = (Customer)args[0];
    System.out.println(c.getCustomerPw());
       try {
          c.setCustomerPw(sha256Util.encData(c.getCustomerPw()));
       } catch (Exception e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }
       System.out.println(c.getCustomerPw());

 }
}
