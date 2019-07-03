package kr.co.subway.managerOrder.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.common.SearchVO;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.managerOrder.dao.ManagerOrderDao;
import kr.co.subway.managerOrder.vo.ManagerItemVO;
import kr.co.subway.managerOrder.vo.ManagerOrderListVO;
import kr.co.subway.managerOrder.vo.ManagerOrderVO;

@Service("ManagerOrderService")
public class ManagerOrderService {
	
	@Autowired
	private ManagerOrderDao dao;

	public ManagerOrderListVO selectList(SearchVO search) {
		int reqPage = search.getReqPage();
		int total = 0;
		total = dao.totalCount(search);
		
		int pageNum = 10;
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
		search.setStart((reqPage*pageNum-pageNum)+1);
		search.setEnd(reqPage*pageNum);
		
		/* 리스트 */
		ArrayList<ManagerOrderVO> orderList = (ArrayList<ManagerOrderVO>)(dao.selectList(search));
		
		/* 페이지 네비 */
		int totalNavi = 5;
		String pageNavi = "";
		int pageNo = ((reqPage-1)/totalNavi)*totalNavi+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='javascript:list("+(pageNo-1)+");'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a> ";	
		}
		int i = 1;
		while(!(i++>totalNavi || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<a class='cur'>"+pageNo+"</a> ";
			}else {
				pageNavi += "<a href='javascript:list("+pageNo+");'>"+pageNo+"</a> ";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='javascript:list("+pageNo+");'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}

		ManagerOrderListVO list = new ManagerOrderListVO(orderList, pageNavi);
		return list;
	}

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
/*
	public ArrayList<String> selectType() {
		return (ArrayList<String>)dao.selectType();
	}
*/
	public ArrayList<IngreVo> selectIngre(String type) {
		return (ArrayList<IngreVo>)dao.selectIngre(type);
	}

	public int updateState(ManagerOrderVO mo) {
		return dao.updateState(mo);
	}
}
