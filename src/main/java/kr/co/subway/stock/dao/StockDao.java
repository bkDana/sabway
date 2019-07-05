package kr.co.subway.stock.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.common.SearchVO;

@Repository
public class StockDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int totalCount(SearchVO search) {
		return sqlSession.selectOne("stock.totalCount",search);
	}

	public List selectList(SearchVO search) {
		return sqlSession.selectList("stock.selectList",search);
	}

}
