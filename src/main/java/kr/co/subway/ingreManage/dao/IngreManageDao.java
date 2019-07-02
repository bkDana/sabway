package kr.co.subway.ingreManage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("menuManageDao")
public class IngreManageDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
}
