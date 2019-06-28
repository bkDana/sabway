package kr.co.subway.menuManage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("menuManageDao")
public class MenuManageDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
}
