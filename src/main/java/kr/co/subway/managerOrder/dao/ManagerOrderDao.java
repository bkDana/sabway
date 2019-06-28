package kr.co.subway.managerOrder.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ManagerOrderDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List selectList(){
		return sqlSession.selectList("managerOrder.selectList");
	}

}
