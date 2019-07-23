package kr.co.subway.managerOrder.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.common.CommonFunc;
import kr.co.subway.common.SearchVO;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.managerOrder.dao.ManagerOrderDao;
import kr.co.subway.managerOrder.vo.ManagerItemVO;
import kr.co.subway.managerOrder.vo.ManagerOrderListVO;
import kr.co.subway.managerOrder.vo.ManagerOrderVO;
import kr.co.subway.managerOrder.vo.StockVO;


@Service("ManagerOrderService")
public class ManagerOrderService {
	
	@Autowired
	private ManagerOrderDao dao;

	public ManagerOrderListVO selectList(SearchVO search) {
		int reqPage = search.getReqPage();
		int total = dao.totalCount(search);
		int pageNum = 15;
		
		search.setStart((reqPage*pageNum-pageNum)+1);
		search.setEnd(reqPage*pageNum);
		/* 리스트 */
		ArrayList<ManagerOrderVO> orderList = (ArrayList<ManagerOrderVO>)(dao.selectList(search));
		
		ManagerOrderListVO list = new ManagerOrderListVO(orderList, new CommonFunc().getPageNavi(total, reqPage, pageNum, 10));
		return list;
	}

	@Transactional
	public int addOrder(ManagerOrderVO managerOrderVO) {
		
		int result = dao.addOrder(managerOrderVO);
		int result2 = dao.addItem(managerOrderVO.getItemList());
		//System.out.println("등록된 물품 개수 :"+result2);
		return result;
	}

	public ManagerOrderVO selectOrder(String no) {
		ManagerOrderVO order = dao.selectOrder(no);
		order.setItemList((ArrayList<ManagerItemVO>)(dao.selectItem(no)));
		return order;
	}

	public ArrayList<IngreVo> selectIngre(String type) {
		return (ArrayList<IngreVo>)dao.selectIngre(type);
	}

	@Transactional
	public int updateState(ManagerOrderVO mo) {
		return dao.updateState(mo);
	}

	@Transactional
	public int deliveryEnd(SearchVO search) {
		return dao.deliveryEnd(search);
	}

	@Transactional
	public int addStock(SearchVO search) {
		int result = 0;
		int chkAmount = 0;
		/*추가해야할 재고 목록*/
		ArrayList<StockVO> stockList = (ArrayList<StockVO>)dao.delStock(search);
		for (StockVO stock : stockList) {

			/* insert, update 여부 판단 */
			StockVO chkStock = dao.findStock(stock);
			if(chkStock == null) {
				result += dao.insertStock(stock);
			}else {
				stock.setmStockIdx(chkStock.getmStockIdx());
				result += dao.updateStock(stock);
				
			}
			
			chkAmount++;
		}
		/*
		if(result==chkAmount) {
			System.out.println("재고 모두 추가 완료");
		}else {
			System.out.println("안맞는데");
		}
		*/
		return result;
	}
	
	/**/
	@Transactional
	public int updateBucket(String bucketCookie, String customerId) {
		int result = dao.updateBucket(bucketCookie, customerId);
		return result;
	}
	
	
	
}
