package kr.co.subway.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.manager.vo.Mgr;

@Repository("mgrdao")
public class MgrDAO {
	@Autowired
	SqlSession session;
	
	public int enrollMgr(Mgr mg) {
		return session.insert("mgr.enrollMgr",mg);
	}
//	public List selectMgr() {
//		return session.selectList("mgr.selectMgr");
//	}
}
