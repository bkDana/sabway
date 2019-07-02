package kr.co.subway.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		
//		vo.setCustomerNo(customerdao.selectMaxNum(vo).getCustomerNo());
//		
		// 휴대폰 번호
		vo.setPhone(vo.getPhone() + vo.getPhone1() + vo.getPhone2());
		vo.setEmail(vo.getEmail() + "@" +vo.getEmail2());
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

}
