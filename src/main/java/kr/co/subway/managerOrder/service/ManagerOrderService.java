package kr.co.subway.managerOrder.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.managerOrder.dao.ManagerOrderDao;
import kr.co.subway.managerOrder.vo.ManagerOrderListVO;
import kr.co.subway.managerOrder.vo.ManagerOrderVO;

@Service("ManagerOrderService")
public class ManagerOrderService {
	
	@Autowired
	private ManagerOrderDao dao;

	public ManagerOrderListVO selectList() {
		ArrayList<ManagerOrderVO> orderList = (ArrayList<ManagerOrderVO>)(dao.selectList());
		String pageNavi = "";
		ManagerOrderListVO list = new ManagerOrderListVO(orderList, pageNavi);
		return list;
	}
}
