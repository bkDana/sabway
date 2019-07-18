package kr.co.subway.customerOrder.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.customerOrder.dao.CusOrderDao;
import kr.co.subway.customerOrder.vo.Bucket;
import kr.co.subway.customerOrder.vo.CusOrder;
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
	public List<CusOrder> cusOrderList(){
		List<CusOrder> list = cusOrderDao.cusOrderList();
		return list;
	}
	//주문 상태 변경
	@Transactional
	public int orderStateUpdate(CusOrder cuso) {
		int result = cusOrderDao.orderStateUpdate(cuso);
		return result;
	}

	public ArrayList<CusOrder> loadOrderList(String customerIdx) {
		return (ArrayList<CusOrder>)cusOrderDao.loadOrderList(customerIdx);
	}
}
