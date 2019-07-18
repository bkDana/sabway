package kr.co.subway.customerOrder.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.customerOrder.dao.CusOrderDao;
import kr.co.subway.customerOrder.vo.Bucket;
import kr.co.subway.customerOrder.vo.CusOrder;
import kr.co.subway.customerOrder.vo.CusOrderPageBound;
import kr.co.subway.customerOrder.vo.CusOrderPageData;
import kr.co.subway.customerOrder.vo.UpdateQuantity;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.manager.vo.Mgr;

@Service("cusOrderService")
public class CusOrderService {
	
	@Autowired
	private CusOrderDao cusOrderDao;
	
	public ArrayList<IngreVo> ingreSelectAll(){
		return (ArrayList<IngreVo>)cusOrderDao.ingreSelectAll();
	}
	 
	@Transactional(value="transactionManager")
	public int insertCusOrder(CusOrder cuso) {
		int result = cusOrderDao.insertCusOrder(cuso);
		return result;
		
	}

	public ArrayList<Bucket> loadBucketList(String customerIdx) {
		List<Bucket> list = cusOrderDao.loadBucketList(customerIdx);
		return (ArrayList<Bucket>)list;
	}

	public IngreVo selectCostMain(IngreVo ingre) {
		IngreVo mainIngre = cusOrderDao.selectCostMain(ingre);
		return mainIngre;
	}
	
	@Transactional
	public int tempOrderInsert(Bucket b) {
		return cusOrderDao.tempOrderInsert(b); 
	}
	
	public int tempOrderSelect() {
		return cusOrderDao.tempOrderSelect(); 
	}
	
	@Transactional
	public int tempOrderDelete(int idx) {
		return cusOrderDao.tempOrderDelete(idx); 
	}
	
	public Mgr mgrSelectOne(int mgrNo) {
		return cusOrderDao.mgrSelectOne(mgrNo); 
	}
	
	@Transactional
	public int updateQuantity(UpdateQuantity uq) {
		return cusOrderDao.updateQuantity(uq);
	}

	@Transactional
	public int updateOrder(Bucket b) {
		return cusOrderDao.updateOrder(b);
		
	}
	//주문 목록 가져오기
	public CusOrderPageData cusOrderList(int currentPage1){
		String pageNavi = "";
		int numPerPage = 10;
		int pageNaviSize = 5;
		int totalCount = cusOrderDao.totalCount();
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage1-1)*numPerPage+1;
		int end = currentPage1*numPerPage;
		CusOrderPageBound pb = new CusOrderPageBound(start,end);
		ArrayList<CusOrder> list = (ArrayList<CusOrder>) cusOrderDao.cusOrderList(pb);
		int pageNo = ((currentPage1-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage1 != 1) {
			pageNavi += "<a href='/cusOrderList.do?currentPage="+(currentPage1-1)+"'>이전</a>&nbsp;";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(currentPage1 == pageNo) {
				pageNavi += "&nbsp;<span style='color:black;font-size:20px;'>"+pageNo+"</span>&nbsp;";
			}else {
				pageNavi += "&nbsp;<a href='/cusOrderList.do?currentPage="+pageNo+"'>"+pageNo+"<a/>&nbsp;";
			}
			pageNo++;
		}
		if(currentPage1 < totalPage) {
			pageNavi += "&nbsp;<a href='/cusOrderList.do?currentPage="+(currentPage1+1)+"'>다음</a>";
		}
		return new CusOrderPageData(list,pageNavi,totalCount);
	}
	//주문 상태 변경
	@Transactional
	public int orderStateUpdate(CusOrder cuso) {
		int result = cusOrderDao.orderStateUpdate(cuso);
		return result;
	}
}
