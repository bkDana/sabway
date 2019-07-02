package kr.co.subway.customer.dao;

import java.util.List;

import kr.co.subway.customer.vo.Customer;

public interface CustomerDao {
	public Customer selectOneCustomerEnroll (Customer vo);	//로그인
	public Customer selectOneId(String customerId);			//아이디 중복체크
	public Customer selectOneNick (String customerNick);	//닉네임 중복체크
	public Customer selectOneEmail (String email);			//이메일 중복체크
	public int insertCustomerEnroll(Customer vo);			//회원가입
	public int updateLastLog(Customer c);					//마지막로깅
}
