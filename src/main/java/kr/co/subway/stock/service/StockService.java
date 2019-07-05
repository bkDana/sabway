package kr.co.subway.stock.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.common.SearchVO;
import kr.co.subway.stock.vo.stockViewVO;
import kr.co.subway.stock.dao.StockDao;
import kr.co.subway.stock.vo.StockListVO;

@Service
public class StockService {
	
	@Autowired
	private StockDao dao;

	@SuppressWarnings("unchecked")
	public StockListVO selectList(SearchVO search) {
		int reqPage = search.getReqPage();
		int total = 0;
		total = dao.totalCount(search);
		
		int pageNum = 24;
		int totalPage = (total%pageNum==0)?(total/pageNum):(total/pageNum)+1;
		search.setStart((reqPage*pageNum-pageNum)+1);
		search.setEnd(reqPage*pageNum);
		/* 리스트 */
		ArrayList<stockViewVO> stockList = (ArrayList<stockViewVO>)(dao.selectList(search));
		
		/* 페이지 네비 */
		int totalNavi = 5;
		String pageNavi = "";
		int pageNo = ((reqPage-1)/totalNavi)*totalNavi+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='javascript:list("+(pageNo-1)+");'><img src='/img/left_arrow.png' style='width:30px;height:30px;'></a>";	
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
		if(pageNo <= totalPage) {
			pageNavi += "<a class='paging-arrow next-arrrow' href='javascript:list("+pageNo+");'><img src='/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}

		StockListVO list = new StockListVO(stockList, pageNavi);
		return list;
	}

}
