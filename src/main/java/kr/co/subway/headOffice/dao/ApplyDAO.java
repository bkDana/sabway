package kr.co.subway.headOffice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("applyDao")
public class ApplyDAO {
	@Autowired
	SqlSession sqlsession;
	public List applyList() {
		return sqlsession.selectList("apply.applyList");
	}
}
