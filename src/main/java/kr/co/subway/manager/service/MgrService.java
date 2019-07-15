package kr.co.subway.manager.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.headOffice.dao.ApplyDAO;
import kr.co.subway.manager.dao.MgrDAO;
import kr.co.subway.manager.vo.Mgr;
import kr.co.subway.manager.vo.MgrPageData;
import kr.co.subway.manager.vo.PageNo;
import kr.co.subway.manager.vo.StorePageNaviData;
import kr.co.subway.notice.vo.Notice;
import kr.co.subway.notice.vo.PageBound;
import kr.co.subway.notice.vo.PageNaviData;

@Service("mgrservice")
public class MgrService {
	@Resource(name="mgrdao")
	MgrDAO mgrdao;
	@Resource(name="applyDao")
	ApplyDAO applydao;

	//승인한 가맹점 등록
	@Transactional
	public int enrollMgr(Mgr mg,int applyNo) {
		int result = mgrdao.enrollMgr(mg);
		applydao.applyManagerUpdate(applyNo);
		return result;
	}
	//가맹점 목록
	public List<Mgr> mgrList() {
		List<Mgr> list= mgrdao.mgrList();
		return list;
	}
	//가맹점 목록(더보기)
	public List<Mgr> mpdList(MgrPageData mpd) {
		List<Mgr> list= mgrdao.mpdList(mpd);
		return list;
	}
	
	
	// 가맹점 페이징
	@SuppressWarnings("unchecked")
	public StorePageNaviData StoreSelectPaging(int currentPage){
		String pageNavi = "";
		int numPerPage = 10; // 출력될 개시판 개수
		int pageNaviSize = 5; // 하단 페이징 노출 수
		
		int totalCount = mgrdao.storeTotalCount();
		
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		
		PageBound pb = new PageBound(start, end);
		
		ArrayList<Mgr> storeList = (ArrayList<Mgr>)mgrdao.storeSelectPaging(pb);
		storeList.get(0).setTotalCount(totalCount);
		
		int pageNo = ((currentPage-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage != 1) {
			pageNavi += "<a href='/findStore.do?currentPage="+(currentPage-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(currentPage == pageNo) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/findStore.do?currentPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(currentPage < totalPage) {
			pageNavi +="<a href='/findStore.do?currentPage="+(currentPage+1)+"'>다음</a>";
		}
		
		return new StorePageNaviData(storeList,pageNavi);
	}
	
	
	
	//신규가맹점 목록
	public List<Mgr> newStoreList() {
		List<Mgr> list= mgrdao.newStoreList();
		return list;
	}
	//관리자 로그인
	public Mgr login(String mgrId) {
		Mgr mgr = mgrdao.login(mgrId);
		return mgr;
	}
	//가맹점 상태 변경(update)
	@Transactional
	public int mgrUpdate(Mgr mgr) {
		int result = mgrdao.mgrUpdate(mgr);
		return result;
	}	
	//검색어 검색
	public List<Mgr> searchList(MgrPageData mpd){
		List<Mgr> list = null;
		if(mpd.getKeyword().equals("이름")) {
			list = mgrdao.searchBossName(mpd);
		}else if(mpd.getKeyword().equals("주소")){
			list = mgrdao.searchAddr(mpd);
		}
		return list;
	}
	//상태별 분류
	public List<Mgr> selectStatus(MgrPageData mpd){
		List<Mgr> list = null;
		if(mpd.getKeyword().equals("준비")) {
			mpd.setStatus(1);
			list = mgrdao.selectStatus(mpd);
		}else if(mpd.getKeyword().equals("영업")) {
			mpd.setStatus(2);
			list = mgrdao.selectStatus(mpd);
		}else if(mpd.getKeyword().equals("폐업")) {
			mpd.setStatus(3);
			list = mgrdao.selectStatus(mpd);
		}
		return list;
	}
	//검색 결과 상태별 분류
	public List<Mgr> selectSearchStatus(MgrPageData mpd){
		List<Mgr> list = null;
		if(mpd.getKeyword().equals("주소")) {
			list = mgrdao.selectSearchStatusAddr(mpd);
		}else if(mpd.getKeyword().equals("이름")) {
			list = mgrdao.selectSearchStatusName(mpd);
		}
		return list;
	}
	public List<Mgr> searchStore(String keyword){
		List<Mgr> list = mgrdao.searchStore(keyword);
		return list;
		
	}
	//상태별 검색
	public List<Mgr> searchStatus(MgrPageData mpd){
		List<Mgr> list = null;
		if(mpd.getKeyword().equals("이름")) {
			list = mgrdao.searchStatusName(mpd);
		}else if(mpd.getKeyword().equals("주소")){
			list = mgrdao.searchStatusAddr(mpd);
		}
		return list;
	}
	//더보기
	public List<Mgr> pageMore(MgrPageData mpd){
		List<Mgr> list = mgrdao.pageMore(mpd);
		return list;
	}
	//mgr 개수
	public int totalCount(){
		int result = mgrdao.totalCount();
		return result;
	}
	//검색어를 조건으로 mgr 개수
	public int searchTotalCount(MgrPageData mpd){
		int result = 0;
		if(mpd.getKeyword().equals("주소")) {
			result = mgrdao.addrTotalCount(mpd);
		}else if(mpd.getKeyword().equals("이름")) {
			result = mgrdao.nameTotalCount(mpd);
		}
		return result;
	}
	//상태를 조건으로 mgr 개수
	public int statusTotalCount(MgrPageData mpd){
		int result = 0;
		if(mpd.getKeyword().equals("준비")) {
			mpd.setStatus(1);
			result = mgrdao.statusTotalCount(mpd);
		}else if(mpd.getKeyword().equals("영업")) {
			mpd.setStatus(2);
			result = mgrdao.statusTotalCount(mpd);
		}else if(mpd.getKeyword().equals("폐업")) {
			mpd.setStatus(3);
			result = mgrdao.statusTotalCount(mpd);
		}
		return result;
	}
	//검색 결과 내 상태를 조건으로 mgr 개수
	public int searchStatusTotalCount(MgrPageData mpd){
		int result = 0;
		if(mpd.getKeyword().equals("준비")) {
			mpd.setStatus(1);
			result = mgrdao.searchStatusTotalCount(mpd);
		}else if(mpd.getKeyword().equals("영업")) {
			mpd.setStatus(2);
			result = mgrdao.searchStatusTotalCount(mpd);
		}else if(mpd.getKeyword().equals("폐업")) {
			mpd.setStatus(3);
			result = mgrdao.searchStatusTotalCount(mpd);
		}
		return result;
	}
	//더보기(keyword)
	public List<Mgr> keywordMore(MgrPageData mpd){
		List<Mgr> list = mgrdao.keywordMore(mpd);
		return list;
	}
	//더보기(status)
	public List<Mgr> statusMore(MgrPageData mpd){
		List<Mgr> list = null;
		if(mpd.getKeyword().equals("준비")) {
			mpd.setStatus(1);
			list = mgrdao.statusMore(mpd);
		}else if(mpd.getKeyword().equals("영업")) {
			mpd.setStatus(2);
			list = mgrdao.statusMore(mpd);
		}else if(mpd.getKeyword().equals("폐업")) {
			mpd.setStatus(3);
			list = mgrdao.statusMore(mpd);
		}
		return list;
	}
}
