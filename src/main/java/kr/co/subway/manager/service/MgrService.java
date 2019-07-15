package kr.co.subway.manager.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.headOffice.dao.ApplyDAO;
import kr.co.subway.manager.dao.MgrDAO;
import kr.co.subway.manager.vo.Mgr;
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
	public List<Mgr> searchList(String keyword, String text){
		List<Mgr> list = null;
		if(keyword.equals("이름")) {
			list = mgrdao.searchBossName(text);
		}else if(keyword.equals("주소")){
			list = mgrdao.searchAddr(text);
		}
		return list;
	}
	public List<Mgr> searchStore(String keyword){
		List<Mgr> list = mgrdao.searchStore(keyword);
		return list;
		
	}
	//상태별 분류
	public List<Mgr> selectStatus(String keyword){
		List<Mgr> list = null;
		if(keyword.equals("준비")) {
			int status = 1;
			list = mgrdao.selectStatus(status);
		}else if(keyword.equals("영업")) {
			int status = 2;
			list = mgrdao.selectStatus(status);
		}else if(keyword.equals("폐업")) {
			int status = 3;
			list = mgrdao.selectStatus(status);
		}
		return list;
	}
	//상태별 검색
	public List<Mgr> searchStatus(String keyword,Mgr mgr){
		List<Mgr> list = null;
		if(keyword.equals("이름")) {
			list = mgrdao.searchStatusName(mgr);
		}else if(keyword.equals("주소")){
			list = mgrdao.searchStatusAddr(mgr);
		}
		return list;
	}
	public List<Mgr> morePage(PageNo pn){
		List<Mgr> list = mgrdao.morePage(pn);
		return list;
	}
	public List<Mgr> pageMore(PageNo pn){
		List<Mgr> list = mgrdao.pageMore(pn);
		return list;
	}
	
}
