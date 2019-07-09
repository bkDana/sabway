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
	
	//가맹점 등록
	public int enrollMgr(Mgr mg) {
		return session.insert("mgr.enrollMgr",mg);
	}
	//가맹점 목록
	public List<Mgr> mgrList() {
		return session.selectList("mgr.mgrList");
	}
	//로그인
	public Mgr login(String mgrId) {
		return session.selectOne("mgr.login", mgrId);
	}
	//가맹점 상태변경
	public int mgrUpdate(Mgr mgr) {
		return session.update("mgr.mgrUpdate",mgr);
	}
	//검색어 검색(name)
	public List<Mgr> searchBossName(String text){
		return session.selectList("mgr.searchBossName",text);
	}
	//검색어 검색(addr)
	public List<Mgr> searchAddr(String text){
		return session.selectList("mgr.searchAddr",text);
	}
}
