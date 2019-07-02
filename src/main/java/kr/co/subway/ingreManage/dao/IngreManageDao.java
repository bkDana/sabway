package kr.co.subway.ingreManage.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.ingreManage.vo.IngreVo;

@Repository("menuManageDao")
public class IngreManageDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	//재료 등록하기
	public int ingreReg(IngreVo iv) {
		return sqlSession.insert("ingre.ingreReg",iv);
	}
	
}
