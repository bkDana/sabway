package kr.co.subway.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.common.SearchVO;
import kr.co.subway.notice.vo.Qna;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSessionTemplate sql;

	public int totalCount(SearchVO search) {
		if(search.getType().equals("notice")) {
			return sql.selectOne("board.noticeTotal",search);
		}else if(search.getType().equals("qna")) {
			return sql.selectOne("board.qnaTotal",search);
		}else if(search.getType().equals("review")) {
			return sql.selectOne("board.reviewTotal",search);
		}else {
			return 0;
		}
	}
	
	public List boardList(SearchVO search){
		if(search.getType().equals("notice")) {
			return sql.selectList("board.noticeList", search);
		}else if(search.getType().equals("qna")) {
			return sql.selectList("board.qnaList", search);
		}else if(search.getType().equals("review")) {
			return sql.selectList("board.reviewList", search);
		}else {
			return null;
		}
	}

	public int addComment(Qna qna) {
		return sql.update("board.addComment",qna);
	}

}
