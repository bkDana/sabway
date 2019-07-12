package kr.co.subway.customerOrder.service;

import java.util.ArrayList;

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
}
