package kr.co.subway.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.common.CommonFunc;
import kr.co.subway.common.SearchVO;
import kr.co.subway.notice.dao.BoardDao;
import kr.co.subway.notice.vo.Notice;
import kr.co.subway.notice.vo.PageNaviData;
import kr.co.subway.notice.vo.Qna;
import kr.co.subway.notice.vo.Review;

@Service
public class BoardService {
	
	@Autowired
	private BoardDao dao;
	
	public PageNaviData boardList(SearchVO search){
		int reqPage = search.getReqPage();
		int total = dao.totalCount(search);
		int pageNum = 15;
		search.setStart((reqPage*pageNum-pageNum)+1);
		search.setEnd(reqPage*pageNum);
		
		String pageNavi = new CommonFunc().getPageNavi(total, reqPage, pageNum, 10);
		
		if(search.getType().equals("notice")) {
			return new PageNaviData((ArrayList<Notice>)dao.boardList(search),null,null,pageNavi);
		}else if(search.getType().equals("qna")) {
			return new PageNaviData(null,(ArrayList<Qna>)dao.boardList(search),null,pageNavi);
		}else if(search.getType().equals("review")) {
			return new PageNaviData(null,null,(ArrayList<Review>)dao.boardList(search),pageNavi);
		}else {
			return null;
		}
		
		
	}

	public int addComment(Qna qna) {
		return dao.addComment(qna);
	}
	
	
}
