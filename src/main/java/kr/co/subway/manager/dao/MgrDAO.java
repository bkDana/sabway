package kr.co.subway.manager.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.manager.vo.Mgr;
import kr.co.subway.manager.vo.PageNo;

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
	//신규매장 목록
		public List<Mgr> newStoreList() {
			return session.selectList("mgr.newStoreList");
		}
	//로그인
	public Mgr login(String mgrId) {
		return session.selectOne("mgr.login", mgrId);
	}
	//가맹점 상태변경
	public int mgrUpdate(Mgr mgr) {
		//영업으로 변경시킬때
		if(mgr.getMgrStatus()==2) {
			return session.update("mgr.mgrOpenUpdate",mgr);
		}
		//폐업
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
	//상태별 분류
	public List<Mgr> selectStatus(int status){
		return session.selectList("mgr.selectStatus",status);
	}
	//statusName 검색
	public List<Mgr> searchStatusName(Mgr mgr){
		return session.selectList("mgr.searchStatusName",mgr);
	}	
	//statusAddr 검색
	public List<Mgr> searchStatusAddr(Mgr mgr){
		return session.selectList("mgr.searchStatusAddr",mgr);
	}
	//searchStore 검색
	public List<Mgr> searchStore(String keyword){
		return session.selectList("mgr.searchStore",keyword);
	}
	//초기화면 10개 출력
	public List<Mgr> morePage(PageNo pn){
		return session.selectList("mgr.pageMore",pn);
	}
	//더보기
	public List<Mgr> pageMore(PageNo pn){
		return session.selectList("mgr.pageMore",pn);
	}
	//mgr 개수
	public int totalCount(){
		return session.selectOne("mgr.totalCount");
	}
}
