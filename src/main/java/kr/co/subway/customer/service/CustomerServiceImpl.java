package kr.co.subway.customer.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.subway.customer.dao.CustomerDao;
import kr.co.subway.customer.vo.CustPageNaviData;
import kr.co.subway.customer.vo.Customer;
import kr.co.subway.notice.vo.PageBound;
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
   public CustPageNaviData allCustomerList(int reqPage, String customerState, String cusIdName, String keyword) {
	    customerState = (customerState == null || "".equals(customerState))? "-1" : customerState;
	    keyword = (keyword == null)? "" : keyword;
	    
        int numPerPage = 10;
        
		int totalCount = customerdao.custTotalCount(customerState, cusIdName, keyword);
		System.out.println("totalCount: "+totalCount);
		
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		
		PageBound pb = new PageBound(start, end);
		ArrayList<Customer> custList = (ArrayList<Customer>)customerdao.allCustomerList(pb,customerState, cusIdName,keyword);
		
		
		System.out.println("custList() service : "+ custList.size());
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/allCustomerList.do?reqPage="+(pageNo-1)+"&customerState="+Integer.parseInt(customerState)+"&cusIdName="+cusIdName+"&keyword="+keyword+"'"+pageNo+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/allCustomerList.do?reqPage="+pageNo+"&customerState="+customerState+"&cusIdName="+cusIdName+"&keyword="+keyword+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo < totalPage) {
			pageNavi +="<a class='paging-arrow next-arrow' href='/allCustomerList.do?reqPage="+pageNo+"&customerState="+customerState+"&cusIdName="+cusIdName+"&keyword="+keyword+"'"+pageNo+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		return new CustPageNaviData(custList, pageNavi);
	   
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
   //비번찾기(비번변경)
   @Override
   public int pwUpdate(Customer customerVo) {
      return customerdao.pwUpdate(customerVo);
   }
   //회원정보수정
   public int cusUpdateEnroll(Customer vo) {
      vo.setPhone(vo.getPhone() + "-" + vo.getPhone1() + "-" +vo.getPhone2());
      System.out.println(vo.getPhone());
      return customerdao.cusUpdateEnroll(vo);
   }
   //회원탈퇴
   public int cusDelete(Customer vo) {
      return customerdao.cusDelete(vo);
   }

}