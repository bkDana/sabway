package kr.co.subway.ingreManage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.ingreManage.dao.IngreManageDao;
import kr.co.subway.ingreManage.vo.IngrePageNaviData;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.notice.vo.PageBound;

@Service("menuManageService")
public class IngreManageService {
	@Autowired
	private IngreManageDao ingreDao;
	
	//재료 등록하기
	public int ingreReg(IngreVo iv) {
		int result = ingreDao.ingreReg(iv);
		return result;
	}
	
	//재료 리스트 가져오기
	public IngrePageNaviData ingreList(int reqPage, String searchType, String searchVal) {
		int numPerPage = 10;
		int totalCount = ingreDao.ingreTotalCount(searchType, searchVal);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		PageBound pb = new PageBound(start, end);
		ArrayList<IngreVo> ingreList = (ArrayList<IngreVo>)ingreDao.ingreSelectAll(pb,searchType, searchVal);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(reqPage != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/ingreList.do?reqPage="+(pageNo-1)+"&searchType="+searchType+"&searchVal="+searchVal+"'>"+pageNo+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/ingreList.do?reqPage="+pageNo+"&searchType="+searchType+"&searchVal="+searchVal+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(reqPage < totalPage) {
			pageNavi +="<a class='paging-arrow next-arrow' href='/ingreList.do?reqPage="+pageNo+"&searchType="+searchType+"&searchVal="+searchVal+"'>"+pageNo+"'>다음</a>";
		}
		
		return new IngrePageNaviData(ingreList, pageNavi);
	}
	
	//재료 리스트 페이지에서 검색박스에서 재료 카테로기 선택시 하위 값 가져오기
	public List ingreType() {
		List list = ingreDao.ingreType();
		return list;
	}
}
