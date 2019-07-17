package kr.co.subway.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.common.SearchVO;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSessionTemplate sql;

	public int totalCount(SearchVO search) {
		return sql.selectOne("board.totalCount",search);
	}
	
	public List boardList(SearchVO search){
		return sql.selectList("board.boardList", search);
	}

}
