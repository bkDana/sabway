package kr.co.subway.sales.statics.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("salesStaticsDao")
public class SalesStaticsDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	//그래프 테스트
	public List getSales() {
		return sqlSession.selectList("sales.getOrder");
	}

}
