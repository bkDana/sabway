package kr.co.subway.ingreManage.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.ingreManage.dao.IngreManageDao;
import kr.co.subway.ingreManage.vo.IngrePageNaviData;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.notice.vo.PageBound;

@Service("ingreManageService")
public class IngreManageService {
	@Autowired
	private IngreManageDao ingreDao;
	
	//재료 등록
	public int ingreReg(IngreVo iv) {
		int result = ingreDao.ingreReg(iv);
		return result;
	}
	
	//재료 리스트
	public IngrePageNaviData ingreList(int reqPage, String searchType, String searchVal) {
		int numPerPage = 10;
		int totalCount = ingreDao.ingreTotalCount(searchType, searchVal);
		System.out.println("totalCount: "+totalCount);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		PageBound pb = new PageBound(start, end);
		ArrayList<IngreVo> ingreList = (ArrayList<IngreVo>)ingreDao.ingreSelectAll(pb,searchType, searchVal);
		System.out.println("ingreList() service : "+ingreList.size());
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='paging-arrow prev-arrow' href='/ingreManage/ingreList.do?reqPage="+(pageNo-1)+"&searchType="+searchType+"&searchVal="+searchVal+"'"+pageNo+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='cur'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/ingreManage/ingreList.do?reqPage="+pageNo+"&searchType="+searchType+"&searchVal="+searchVal+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo < totalPage) {
			pageNavi +="<a class='paging-arrow next-arrow' href='/ingreManage/ingreList.do?reqPage="+pageNo+"&searchType="+searchType+"&searchVal="+searchVal+"'"+pageNo+"'>다음</a>";
		}
		
		return new IngrePageNaviData(ingreList, pageNavi);
	}
	
	//재료 활성화 업데이트
	public int updateIngreActive(String ingreActive, String ingreIdx) {
		int result = ingreDao.updateIngreActive(ingreActive,ingreIdx);
		return result;
	}
	
	//재료 카테고리 선택시 하위 컬럼 가져오기
	public List ingreType() {
		List list = ingreDao.ingreType();
		return list;
	}

	//재료 업데이트 페이지로
	public IngreVo goUpdateIngre(String ingreIdx) {
		IngreVo iv = ingreDao.goUpdateIngre(ingreIdx);
		return iv;
	}
	
	//재료 업데이트
	public int ingreUpdate(IngreVo iv) {
		return ingreDao.ingreUpdate(iv);
	}
	
	//재료 삭제
	public int ingreDelete(String ingreIdx) {
		return ingreDao.ingreDelete(ingreIdx);
	}

	//엑셀 다운로드할  리스트 가져오기
	public List ingreList(String searchType, String searchVal) {
		return ingreDao.ingreSelectAll(searchType, searchVal);
	}

	//재료 하나 select
	public IngreVo selectOneIngre(IngreVo ingreVo) {
		return ingreDao.ingreSelectOne(ingreVo);
	}
	//재료 타입 골라 리스트
	public ArrayList<IngreVo> selectIngreList(IngreVo ingreVo) {
		return (ArrayList<IngreVo>)ingreDao.selectIngreList(ingreVo);
	}

}
