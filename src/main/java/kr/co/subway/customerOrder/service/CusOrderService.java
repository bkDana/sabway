package kr.co.subway.customerOrder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.customerOrder.dao.CusOrderDao;
import kr.co.subway.customerOrder.vo.Bucket;

@Service("cusOrderService")
public class CusOrderService {
	
	@Autowired
	private CusOrderDao cusOrderDao;
	
	@Transactional(value="transactionManager")
	public int insertCusOrder(Bucket buc) {
		int result = cusOrderDao.insertMember(buc);
		return result;
		
	}

}
