package kr.co.subway.customer.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.customer.vo.Customer;
@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao{
	@Autowired
	SqlSessionTemplate sqlsession;
	
	
//	@Override
//	public Customer selectMaxNum(Customer vo) {
//		// TODO Auto-generated method stub
//		return sqlsession.selectOne("customer.selectMaxNum",vo);
//	}
	@Override
	public Customer selectOneCustomerEnroll(Customer vo) {
		return sqlsession.selectOne("customer.selectOneCustomer",vo);
	}
	@Override
	public Customer selectOneId(String customerId) {
		return sqlsession.selectOne("customer.selectOneId",customerId);
	}
	@Override
	public Customer selectOneNick(String customerNick) {
		return sqlsession.selectOne("customer.selectOneNick",customerNick);
	}
	@Override
	public Customer selectOneEmail(String email) {
		return sqlsession.selectOne("customer.selectOneEmail",email);
	}
	@Override
	public int insertCustomerEnroll(Customer vo) {
		// TODO Auto-generated method stub
		return sqlsession.insert("customer.insertCustomer",vo);
	}
	@Override
	public int updateLastLog(Customer c) {
		return sqlsession.update("customer.updateCustomer",c);
	}
	@Override
	public int updateState(Customer c) {
		return sqlsession.update("customer.updateState",c);
	}
	
}
