package kr.co.subway.manager.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.manager.vo.Mgr;
import kr.co.subway.manager.vo.MgrPageBound;
import kr.co.subway.manager.vo.MgrPageData;
import kr.co.subway.manager.vo.SearchKeyword;
import kr.co.subway.notice.vo.PageBound;

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
	// 가맹점 토탈카운트
	public int storeTotalCount() {
		return session.selectOne("mgr.storeTotalCount");
	}
	
	// 가맹점 페이징
	public List storeSelectPaging(PageBound pb){
		return session.selectList("mgr.storeSelectPaging", pb);
	}
	//신규매장 목록
		public List<Mgr> newStoreList() {
			return session.selectList("mgr.newStoreList");
		}
	//로그인
	public Mgr login(Mgr mgr) {
		return session.selectOne("mgr.login", mgr);
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
	//검색어 검색
	public List<Mgr> searchAddr(MgrPageData mpd){
		return session.selectList("mgr.searchAddr",mpd);
	}	
	//상태별 분류
	public List<Mgr> selectStatus(MgrPageData mpd){
		return session.selectList("mgr.selectStatus",mpd);
	}
	//searchStore 검색
	public List<Mgr> searchStore(PageBound pb){
		return session.selectList("mgr.storeSelectPaging",pb);
	}
	//mgr 개수
	public int totalCount(){
		return session.selectOne("mgr.totalCount");
	}
	public int allStoreTotalCount(String keyword) {
		return session.selectOne("mgr.allStoreTotalCount",keyword);
	}
	//가맹점 list 페이징
	public List<Mgr> mgrPaging(MgrPageBound pb){
		return session.selectList("mgr.mgrPaging",pb);
	}
	//가맹점 검색 total
	public int searchTotalCount(SearchKeyword sk){
		return session.selectOne("mgr.searchTotalCount",sk);
	}
	//조건에 일치하는 가맹점 정보 가져오기
	public List<Mgr> searchKeyword(MgrPageBound pb){
		return session.selectList("mgr.searchKeyword",pb);
	}
	//id체크
	public Mgr idChk(String mgrId) {
		return session.selectOne("mgr.idChk", mgrId);
	}
}
