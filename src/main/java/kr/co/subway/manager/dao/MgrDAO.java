package kr.co.subway.manager.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.manager.vo.Mgr;
import kr.co.subway.manager.vo.MgrPageData;
import kr.co.subway.manager.vo.PageNo;
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
	//가맹점 목록(더보기)
	public List<Mgr> mpdList(MgrPageData mpd) {
		return session.selectList("mgr.mpdList",mpd);
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
	public List<Mgr> searchBossName(MgrPageData mpd){
		return session.selectList("mgr.searchBossName",mpd);
	}
	//검색어 검색(addr)
	public List<Mgr> searchAddr(MgrPageData mpd){
		return session.selectList("mgr.searchAddr",mpd);
	}	
	//상태별 분류
	public List<Mgr> selectStatus(MgrPageData mpd){
		return session.selectList("mgr.selectStatus",mpd);
	}
	//statusName 검색
	public List<Mgr> searchStatusName(MgrPageData mpd){
		return session.selectList("mgr.searchStatusName",mpd);
	}	
	//statusAddr 검색
	public List<Mgr> searchStatusAddr(MgrPageData mpd){
		return session.selectList("mgr.searchStatusAddr",mpd);
	}
	//selectSearchStatusName 검색
	public List<Mgr> selectSearchStatusName(MgrPageData mpd){
		return session.selectList("mgr.selectSearchStatusName",mpd);
	}	
	//selectSearchStatusAddr 검색
	public List<Mgr> selectSearchStatusAddr(MgrPageData mpd){
		return session.selectList("mgr.selectSearchStatusAddr",mpd);
	}
	//searchStore 검색
	public List<Mgr> searchStore(String keyword){
		return session.selectList("mgr.searchStore",keyword);
	}
//	//초기화면 10개 출력
//	public List<Mgr> morePage(PageNo pn){
//		return session.selectList("mgr.pageMore",pn);
//	}
	//더보기
	public List<Mgr> pageMore(MgrPageData mpd){
		return session.selectList("mgr.pageMore",mpd);
	}
	//mgr 개수
	public int totalCount(){
		return session.selectOne("mgr.totalCount");
	}
	//주소를 조건으로 mgr 개수
	public int addrTotalCount(MgrPageData mpd){
		return session.selectOne("mgr.addrTotalCount",mpd);
	}
	//이름을 조건으로 mgr 개수
	public int nameTotalCount(MgrPageData mpd){
		return session.selectOne("mgr.nameTotalCount",mpd);
	}
	//상태를 조건으로 mgr 개수
	public int statusTotalCount(MgrPageData mpd){
		return session.selectOne("mgr.statusTotalCount",mpd);
	}
	//검색 결과 내 상태를 조건으로 mgr 개수
	public int searchStatusTotalCount(MgrPageData mpd){
		if(mpd.getKeyword().equals("주소")) {
			return session.selectOne("mgr.addrStatusTotalCount",mpd);
		}
		return session.selectOne("mgr.nameStatusTotalCount",mpd);
	}
	//더보기(keyword)
	public List<Mgr> keywordMore(MgrPageData mpd){
		if(mpd.getKeyword().equals("주소")) {
			return session.selectList("mgr.addrMore",mpd);
		}
		return session.selectList("mgr.nameMore",mpd);
	}
	//더보기(status)
	public List<Mgr> statusMore(MgrPageData mpd){
		return session.selectList("mgr.statusMore",mpd);
	}
}
