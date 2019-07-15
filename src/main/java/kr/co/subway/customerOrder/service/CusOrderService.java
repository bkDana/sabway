package kr.co.subway.customerOrder.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.customerOrder.dao.CusOrderDao;
import kr.co.subway.customerOrder.vo.Bucket;
import kr.co.subway.ingreManage.vo.IngreVo;

@Service("cusOrderService")
public class CusOrderService {
	
	@Autowired
	private CusOrderDao cusOrderDao;
	
	public ArrayList<IngreVo> ingreSelectAll(){
		return (ArrayList<IngreVo>)cusOrderDao.ingreSelectAll();
	}
	 
	@Transactional(value="transactionManager")
	public int insertCusOrder(Bucket buc) {
		int result = cusOrderDao.insertMember(buc);
		return result;
		
	}

	public ArrayList<Bucket> allOrderList(int customerIdx) {
		List<Bucket> list = cusOrderDao.allOrderList(customerIdx);
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
	
	@Transactional(value="transactionManager")
	public int insertBucket(Bucket b) {
		int result = cusOrderDao.insertBucket(b);
		return result;
	}
	
	public int tempOrderSelect() {
		return cusOrderDao.tempOrderSelect(); 
	}
	
	@Transactional
	public int tempOrderDelete(int idx) {
		return cusOrderDao.tempOrderDelete(idx); 
	}
}
