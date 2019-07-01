package kr.co.subway.managerOrder.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.common.SearchVO;


@Repository
public class ManagerOrderDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int totalCount(SearchVO search) {
		return sqlSession.selectOne("managerOrder.totalCount");
	}
	
	public List selectList(SearchVO search){
		return sqlSession.selectList("managerOrder.selectList",search);
	}

	

}
