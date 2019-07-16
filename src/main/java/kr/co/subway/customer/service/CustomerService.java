package kr.co.subway.customer.service;

import java.util.ArrayList;

import kr.co.subway.customer.vo.Customer;

public interface CustomerService {
	public Customer selectOneCustomerEnroll (Customer vo);	//로그인
	public Customer selectOneId(String customerId);			//아이디 중복체크
	public Customer selectOneNick (String customerNick);	//닉네임 중복체크
	public Customer selectOneEmail (String email);			//이메일 중복체크
	public int insertCustomerEnroll(Customer vo);			//회원가입
	public int updateLastLog(Customer c);					//마지막로깅
	public int updateState(Customer c);						//상태변경
	public ArrayList<Customer> allCustomerList();			//회원리스트
	public int adminCustomerDelete(int customerNo);			//회원탈퇴시키기
	public int adminCustomerDeleteCancle(int customerNo);	//회원탈퇴해제시키기
	public String findId (Customer vo);					//아이디찾기
}
