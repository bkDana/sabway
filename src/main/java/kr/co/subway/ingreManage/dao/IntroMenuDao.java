package kr.co.subway.ingreManage.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.ingreManage.vo.IngreVo;

@Repository
public class IntroMenuDao {
	
	@Autowired
	SqlSessionTemplate sql;

	public List introMenu(IngreVo ingre) {
		return sql.selectList("selectIngreList", ingre);
	}

}
