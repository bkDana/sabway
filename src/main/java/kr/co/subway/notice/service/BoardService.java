package kr.co.subway.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.common.CommonFunc;
import kr.co.subway.common.SearchVO;
import kr.co.subway.notice.dao.BoardDao;
import kr.co.subway.notice.vo.Notice;
import kr.co.subway.notice.vo.PageNaviData;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao dao;
	
	public PageNaviData boardList(SearchVO search){
		int reqPage = search.getReqPage();
		int total = dao.totalCount(search);
		int pageNum = 10;
		search.setStart((reqPage*pageNum-pageNum)+1);
		search.setEnd(reqPage*pageNum);
		
		ArrayList<Notice> noticeList = (ArrayList<Notice>)dao.boardList(search);
		return new PageNaviData(noticeList,null,null, new CommonFunc().getPageNavi(total, reqPage, pageNum, 10));
	}
	
	
}
