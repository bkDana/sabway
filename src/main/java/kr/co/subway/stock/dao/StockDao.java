package kr.co.subway.stock.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.common.SearchVO;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.managerOrder.vo.StockVO;
import kr.co.subway.stock.vo.HistoryVO;

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

	public int modifyStock(StockVO stock) {
		return sqlSession.update("stock.modifyStock",stock);
	}

	public int addHistory(HistoryVO history) {
		return sqlSession.insert("stock.addHistory",history);
	}

	public List stockHistory(SearchVO search) {
		return sqlSession.selectList("stock.stockHistory",search);
	}

	public int totalStock(SearchVO search) {
		return sqlSession.selectOne("stock.totalStock",search);
	}

	public IngreVo ingreInfo(SearchVO search) {
		return sqlSession.selectOne("stock.ingreInfo",search);
	}

}
