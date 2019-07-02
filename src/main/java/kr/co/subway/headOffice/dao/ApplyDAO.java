package kr.co.subway.headOffice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.headOffice.vo.Apply;

@Repository("applyDao")
public class ApplyDAO {
	@Autowired
	SqlSession sqlsession;
	
	public List applyList() {
		return sqlsession.selectList("apply.applyList");
	}
	public int applyManagerUpdate(String applyName) {
		return sqlsession.update("apply.applyManagerUpdate",applyName);
	}
	public int rejectManagerUpdate(String applyName) {
		return sqlsession.update("apply.rejectManagerUpdate",applyName);
	}
	public Apply applyView(int applyNo) {
		return sqlsession.selectOne("apply.applyView",applyNo);
	}
}
