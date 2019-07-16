package kr.co.subway.customer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.subway.customer.dao.CustomerDao;
import kr.co.subway.customer.vo.Customer;
@Service("customerService")
public class CustomerServiceImpl implements CustomerService{
   @Autowired
   @Qualifier(value="customerDao")
   private CustomerDao customerdao;

   @Override
   public Customer selectOneCustomerEnroll(Customer vo) {
      return customerdao.selectOneCustomerEnroll(vo);
   }
   
   //아이디 중복 체크
   @Override
   public Customer selectOneId(String customerId) {
      Customer c = customerdao.selectOneId(customerId);
      return c;
   }
   
   //닉네임 중복 체크
   @Override
   public Customer selectOneNick(String customerNick) {
      Customer c = customerdao.selectOneNick(customerNick);
      return c;
   }
   
   //이메일 중복 체크
      @Override
      public Customer selectOneEmail(String email) {
         Customer c = customerdao.selectOneEmail(email);
         return c;
      }
   @Override
   public int insertCustomerEnroll(Customer vo) {
      
//      vo.setCustomerNo(customerdao.selectMaxNum(vo).getCustomerNo());
//      
      // 휴대폰 번호
      vo.setPhone(vo.getPhone() + "-" + vo.getPhone1() + "-" +vo.getPhone2());
      vo.setCustomerState(1);
      
      //customerdao.insertCustomer(vo);
      return customerdao.insertCustomerEnroll(vo);
   }

   @Override
   public int updateLastLog(Customer c) {
      return customerdao.updateLastLog(c);
   }

   @Override
   public int updateState(Customer c) {
      return customerdao.updateState(c);
   }

   //회원리스트
   @Override
	public ArrayList<Customer> allCustomerList() {
		return (ArrayList<Customer>) customerdao.allCustomerList();
	}
   //회원탈퇴시키기
	@Override
	public int adminCustomerDelete(int customerNo) {
		return customerdao.adminCustomerDelete(customerNo);
	}
	//회원탈퇴해제시키기
	@Override
	public int adminCustomerDeleteCancle(int customerNo) {
		return customerdao.adminCustomerDeleteCancle(customerNo);
	}
	//아이디찾기
	@Override
   public String findId(Customer customerVo) {
		customerVo.setPhone(customerVo.getPhone() + "-" + customerVo.getPhone1() + "-" +customerVo.getPhone2());
		System.out.println(customerVo.getPhone());
		String id = customerdao.findId(customerVo);
		return id;
   }
	//비번찾기
	@Override
   public Customer idAndEmailCheck(Customer customerVo) {
		return customerdao.idAndEmailCheck(customerVo);
		 
   }

	@Override
	public int pwUpdate(Customer customerVo) {
		return customerdao.pwUpdate(customerVo);
	}
	
}