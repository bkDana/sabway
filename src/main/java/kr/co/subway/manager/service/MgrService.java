package kr.co.subway.manager.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.customer.vo.Customer;
import kr.co.subway.headOffice.dao.ApplyDAO;
import kr.co.subway.manager.dao.MgrDAO;
import kr.co.subway.manager.vo.Mgr;
import kr.co.subway.manager.vo.MgrPageBound;
import kr.co.subway.manager.vo.MgrPageData;
import kr.co.subway.manager.vo.SearchKeyword;
import kr.co.subway.manager.vo.StorePageNaviData;
import kr.co.subway.notice.vo.PageBound;

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
		int pageNaviSize = 10; // 하단 페이징 노출 수
		
		int totalCount = mgrdao.storeTotalCount();
		
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		
		PageBound pb = new PageBound(start, end ,null);
		
		ArrayList<Mgr> storeList = (ArrayList<Mgr>)mgrdao.storeSelectPaging(pb);
		storeList.get(0).setTotalCount(totalCount);
		
		int pageNo = ((currentPage-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage != 1) {
			pageNavi += "<a href='/findStore.do?status=22"+"&currentPage="+(currentPage-1)+"'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}else{//2019-07-21 디자인 통일하려고 변경 (지영)
			pageNavi += "<a><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(currentPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";//2019-07-21 디자인 통일하려고 변경 (지영)
			}else {
				pageNavi += "<a href='/findStore.do?status=22"+"&currentPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(currentPage < totalPage) {
			pageNavi +="<a href='/findStore.do?status=22"+"&currentPage="+(currentPage+1)+"'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}else{//2019-07-21 디자인 통일하려고 변경 (지영)
			pageNavi +="<a><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
		}
		
		return new StorePageNaviData(storeList,pageNavi, totalCount);
	}
	// 전체매장 select 필터 검색 페이징
	@SuppressWarnings("unchecked")
	public StorePageNaviData allStoreSelectPaging(int currentPage,String keyword,String area, String type){
			System.out.println(keyword);
			String pageNavi = "";
			int numPerPage = 10; // 출력될 개시판 개수
			int pageNaviSize = 10; // 하단 페이징 노출 수
			
			int totalCount = mgrdao.allStoreTotalCount(keyword);
			System.out.println("갯수:"+totalCount);
			int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			
			PageBound pb = new PageBound(start, end ,keyword);
			
			ArrayList<Mgr> storeList = (ArrayList<Mgr>)mgrdao.storeSelectPaging(pb);
			
			int pageNo = ((currentPage-1)/pageNaviSize)*pageNaviSize+1;
			if(currentPage != 1) {
				pageNavi += "<a href='javascript:applyArea(\""+area+"\",\""+(currentPage-1)+"\","+type+");'><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
			}else{//2019-07-21 디자인 통일하려고 변경 (지영)
				pageNavi += "<a><img src='/resources/img/left_arrow.png' style='width:30px;height:30px;'></a>";
			}
			
			int i = 1;
			while(!(i++>pageNaviSize || pageNo>totalPage)) {
				if(currentPage == pageNo) {
					pageNavi += "<span class='cur'>"+pageNo+"</span>";//2019-07-21 디자인 통일하려고 변경 (지영)
				}else {
					pageNavi += "<a href='javascript:applyArea(\""+area+"\",\""+pageNo+"\","+type+");'>"+pageNo+"</a>";
				}
				pageNo++;
			}
			if(currentPage < totalPage) {
				pageNavi +="<a href='javascript:applyArea(\""+area+"\",\""+(currentPage+1)+"\","+type+");'><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
			}else{//2019-07-21 디자인 통일하려고 변경 (지영)
				pageNavi +="<a><img src='/resources/img/right_arrow.png' style='width:30px;height:30px;'></a>";
			}
			
			return new StorePageNaviData(storeList,pageNavi, totalCount);
		}
	//신규가맹점 목록
	public List<Mgr> newStoreList() {
		List<Mgr> list= mgrdao.newStoreList();
		return list;
	}
	//관리자 로그인
	public Mgr login(Mgr mgr) {
		mgr = mgrdao.login(mgr);
		return mgr;
	}
	//가맹점 상태 변경(update)
	@Transactional
	public int mgrUpdate(Mgr mgr) {
		int result = mgrdao.mgrUpdate(mgr);
		return result;
	}	
	//매장찾기 키워드 검색
		public List<Mgr> searchStore(String keyword){
			PageBound pb = new PageBound(0,0,"%"+keyword+"%");
			
			List<Mgr> list = mgrdao.searchStore(pb);
			return list;
		}
	//해당 list 개수
	public int totalCount(){
		int result = mgrdao.totalCount();
		return result;
	}
	public MgrPageData mgrPaging(int currentPage1) {
		String pageNavi = "";
		int numPerPage = 10;
		int pageNaviSize = 5;
		int totalCount = mgrdao.totalCount();
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage1-1)*numPerPage+1;
		int end = currentPage1*numPerPage;
		MgrPageBound pb = new MgrPageBound(start,end,null,null,0);
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrdao.mgrPaging(pb);
		int pageNo = ((currentPage1-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage1 != 1) {
			pageNavi += "<a href='/managerList.do?currentPage="+(currentPage1-1)+"'>이전</a>&nbsp;";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(currentPage1 == pageNo) {
				pageNavi += "&nbsp;<span style='color:black;font-size:20px;'>"+pageNo+"</span>&nbsp;";
			}else {
				pageNavi += "&nbsp;<a href='/managerList.do?currentPage="+pageNo+"'>"+pageNo+"<a/>&nbsp;";
			}
			pageNo++;
		}
		if(currentPage1 < totalPage) {
			pageNavi += "&nbsp;<a href='/managerList.do?currentPage="+(currentPage1+1)+"'>다음</a>";
		}
		return new MgrPageData(list,pageNavi,totalCount);
	}
	public MgrPageData searchKeyword(int currentPage1,String keyword,String text,int status) {
		String pageNavi = "";
		int numPerPage = 10;
		int pageNaviSize = 5;
		SearchKeyword sk = new SearchKeyword(keyword,text,status);
		int totalCount = mgrdao.searchTotalCount(sk);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage1-1)*numPerPage+1;
		int end = currentPage1*numPerPage;
		MgrPageBound pb = new MgrPageBound(start,end,keyword,text,status);
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrdao.searchKeyword(pb);
		int pageNo = ((currentPage1-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage1 != 1) {
			pageNavi += "<a href='/searchKeyword.do?currentPage="+(currentPage1-1)+"&keyword="+keyword+"&text="+text+"&status1="+status+"'>이전</a>&nbsp;";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(currentPage1 == pageNo) {
				pageNavi += "&nbsp;<span style='color:black;font-size:20px;'>"+pageNo+"</span>&nbsp;";
			}else {
				pageNavi += "&nbsp;<a href='/searchKeyword.do?currentPage="+pageNo+"&keyword="+keyword+"&text="+text+"&status1="+status+"'>"+pageNo+"<a/>&nbsp;";
			}
			pageNo++;
		}
		if(currentPage1 < totalPage) {
			pageNavi += "&nbsp;<a href='/searchKeyword.do?currentPage="+(currentPage1+1)+"&keyword="+keyword+"&text="+text+"&status1="+status+"'>다음</a>";
		}
		return new MgrPageData(list,pageNavi,totalCount);
	}
	// id 체크
	public Mgr idChk(String mgrId) {
		Mgr mgr = mgrdao.idChk(mgrId);
		return mgr;
	}
	public Mgr selectOneManager(Mgr vo) {
	      return mgrdao.selectOneManager(vo);
	}
	//회원정보수정
	   public int mgrProfileUpdate(Mgr vo) {
	      return mgrdao.mgrProfileUpdate(vo);
	   }
}
