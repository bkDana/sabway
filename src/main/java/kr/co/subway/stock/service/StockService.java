package kr.co.subway.stock.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.common.CommonFunc;
import kr.co.subway.common.SearchVO;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.managerOrder.vo.StockVO;
import kr.co.subway.stock.vo.stockViewVO;
import kr.co.subway.stock.dao.StockDao;
import kr.co.subway.stock.vo.HistoryListVO;
import kr.co.subway.stock.vo.HistoryVO;
import kr.co.subway.stock.vo.StockListVO;

@Service
public class StockService {
	
	@Autowired
	private StockDao dao;
	
	/* 페이지 네비 만들기 ~.~ */
	public String getPageNavi(int total, int reqPage, int pageNum, int totalNavi) {
		String pageNavi = "";
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
		int pageNo = ((reqPage-1)/totalNavi)*totalNavi+1;
		if(reqPage != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='javascript:list("+(reqPage-1)+");'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";	
		}
		
		int i = 1;
		while(!(i++>totalNavi || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<a class='cur'>"+pageNo+"</a>";
			}else {
				pageNavi += "<a href='javascript:list("+pageNo+");'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(reqPage!=totalPage && totalPage!=0) {
			pageNavi += "<a class='paging-arrow next-arrow' href='javascript:list("+(reqPage+1)+");'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		return pageNavi;
	}
	
	public String getModalPageNavi(int total, int reqPage, int pageNum, int totalNavi) {
		String pageNavi = "";
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
		int pageNo = ((reqPage-1)/totalNavi)*totalNavi+1;
		if(reqPage != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='javascript:list2("+(reqPage-1)+");'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";	
		}
		
		int i = 1;
		while(!(i++>totalNavi || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<a class='cur'>"+pageNo+"</a>";
			}else {
				pageNavi += "<a href='javascript:list2("+pageNo+");'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(reqPage!=totalPage && totalPage!=0) {
			pageNavi += "<a class='paging-arrow next-arrow' href='javascript:list2("+(reqPage+1)+");'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		return pageNavi;
	}

	/* 재고 리스트 */
	@SuppressWarnings("unchecked")
	public StockListVO selectList(SearchVO search) {
		int reqPage = search.getReqPage();
		int total = dao.totalCount(search);
		int pageNum = 24;
		
		search.setStart((reqPage*pageNum-pageNum)+1);
		search.setEnd(reqPage*pageNum);
		/* 리스트 */
		ArrayList<stockViewVO> stockList = (ArrayList<stockViewVO>)(dao.selectList(search));

		StockListVO list = new StockListVO(stockList, new CommonFunc().getPageNavi(total,reqPage,pageNum,10));//전체 row, 현재페이지, 한페이지 출력 개수, 출력할 페이지 개수
		return list;
	}

	/* 재고 수정!!!! */
	@Transactional
	public int modifyStock(StockVO stock) {
		 int result = dao.modifyStock(stock);
		 if(result==1) {
			 String hContent = String.valueOf(stock.getmItemAmount() - stock.getmItemIdx());
			 HistoryVO history = new HistoryVO(0, 0, stock.getmStockIdx(), hContent, null);
			 result = dao.addHistory(history);
		 }
		 return result;
	}

	/* 입출고 내역 리스트 */
	public HistoryListVO stockHistory(SearchVO search) {
		int reqPage = search.getReqPage();
		int total = dao.totalStock(search);
		int pageNum = 10;
		
		search.setStart((reqPage*pageNum-pageNum)+1);
		search.setEnd(reqPage*pageNum);
		/* 리스트 */
		ArrayList<HistoryVO> stockList = (ArrayList<HistoryVO>)(dao.stockHistory(search));
		
		IngreVo ingre = dao.ingreInfo(search);
		HistoryListVO list = new HistoryListVO(stockList,ingre, getModalPageNavi(total,reqPage,pageNum,10));//전체 row, 현재페이지, 한페이지 출력 개수, 출력할 페이지 개수
		return list;
	}

}
