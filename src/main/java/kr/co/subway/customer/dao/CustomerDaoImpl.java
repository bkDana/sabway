package kr.co.subway.customer.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.customer.vo.Customer;
import kr.co.subway.notice.vo.PageBound;
@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao{
   @Autowired
   SqlSessionTemplate sqlsession;
   
   
//   @Override
//   public Customer selectMaxNum(Customer vo) {
//      // TODO Auto-generated method stub
//      return sqlsession.selectOne("customer.selectMaxNum",vo);
//   }
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
   @Override
   public int custTotalCount(String customerState, String cusIdName, String keyword) {
	   Map<String, String> map = new HashMap<String, String>();
	   map.put("customerState", customerState);
	   map.put("cusIdName", cusIdName);
	   map.put("keyword", keyword);
	   return sqlsession.selectOne("customer.custTotalCount",map);
   }
   @Override
   public List allCustomerList(PageBound pb, String customerState, String cusIdName, String keyword) {
	    Map<String, String> map = new HashMap<String, String>();
		map.put("start", Integer.toString(pb.getStart()));
		map.put("end", Integer.toString(pb.getEnd()));
		map.put("customerState", customerState);
		map.put("cusIdName", cusIdName);
		map.put("keyword", keyword);
	   return sqlsession.selectList("customer.allCustomerList",map);
   }
   @Override
   public int adminCustomerDelete(int customerNo) {
      return sqlsession.update("customer.adminCustomerDelete",customerNo);
   }
   @Override
   public int adminCustomerDeleteCancle(int customerNo) {
      return sqlsession.update("customer.adminCustomerDeleteCancle",customerNo);
   }
   @Override
   public String findId(Customer customerVo) {
       String id = sqlsession.selectOne("customer.findId",customerVo);
       return id;
      }
   //비번찾기(아디검색)
   @Override
   public Customer idAndEmailCheck(Customer customerVo) {
      return sqlsession.selectOne("customer.idAndEmailCheck",customerVo);
      
   }
   
   //비번찾기(비번업뎃)
   @Override
   public int pwUpdate(Customer customerVo) {
      return sqlsession.update("customer.pwUpdate",customerVo);
   }
   
   //회원정보수정
   @Override
   public int cusUpdateEnroll(Customer vo) {
      return sqlsession.update("customer.cusUpdate",vo);
   }
   @Override
   public int cusDelete(Customer vo) {
      return sqlsession.update("customer.cusDelete",vo);
   }
   @Override
   public List<Customer> customerKeyword(String keyword,String cusIdName,String cusStatusMember) {
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("keyword", keyword);
      map.put("cusIdName", cusIdName);
      map.put("cusStatusMember", cusStatusMember);
      return sqlsession.selectList("customer.customerKeyword",map);
   }

   
}