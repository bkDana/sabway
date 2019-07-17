package kr.co.subway.headOffice.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.headOffice.dao.ApplyDAO;
import kr.co.subway.headOffice.vo.Apply;
import kr.co.subway.headOffice.vo.ApplyPageBound;
import kr.co.subway.headOffice.vo.ApplyPageData;
import kr.co.subway.headOffice.vo.CompletionPageData;

@Service("applyService")
public class ApplyService {
	@Resource(name="applyDao")
	ApplyDAO applyDao;
	//신청 리스트
	public List<Apply> applyList() {
		List<Apply> list = applyDao.applyList();
		return (ArrayList<Apply>)list;
	}
	//거절 누르면 상태변경
	@Transactional
	public int rejectManagerUpdate(int applyStatus,int applyNo){
		int result = 0;
		if(applyStatus==2) {
			result = applyDao.rejectManagerUpdate(applyNo);
		}
		return result;
	}
	//신청 글 상세보기
	public Apply applyView(int applyNo) {
		Apply ap = applyDao.applyView(applyNo);
		return ap;
	}
	@Transactional
	// 가맹신청/문의 등록
	public int insertApply(Apply applyVo) {
		
		//승인여부 0:기본
		applyVo.setApplyStatus(0);
		
		//지역
		applyVo.setApplyArea(applyVo.getApplyArea()+" "+applyVo.getApplyArea2());
		
		//이메일
		applyVo.setApplyEmail(applyVo.getApplyEmail()+'@'+applyVo.getApplyEmail2());
		
		
		System.out.println(applyVo.getApplyEmail2());
		return applyDao.insertApply(applyVo);
	}
	//신청 목록 가져오기
	public ApplyPageData applyPaging(int currentPage1){
		String pageNavi = "";
		int numPerPage = 10;//출력할 최대 개수
		int pageNaviSize = 5;//하단 page 개수
		int totalCount = applyDao.applyTotalCount();//리스트 전체 개수 조회
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage1-1)*numPerPage+1;
		int end = currentPage1*numPerPage;
		ApplyPageBound pb = new ApplyPageBound(start,end);
		ArrayList<Apply> applyList = (ArrayList<Apply>)applyDao.applyPaging(pb);
		int pageNo = ((currentPage1-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage1 != 1) {
			pageNavi += "<a href='/managerApply.do?currentPage="+(currentPage1-1)+"'>이전</a>&nbsp;";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(currentPage1 == pageNo) {
				pageNavi += "&nbsp;<span style='color:black;font-size:20px;'>"+pageNo+"</span>&nbsp;";
			}else {
				pageNavi += "&nbsp;<a href='/managerApply.do?currentPage="+pageNo+"'>"+pageNo+"<a/>&nbsp;";
			}
			pageNo++;
		}
		if(currentPage1 < totalPage) {
			pageNavi += "&nbsp;<a href='/managerApply.do?currentPage="+(currentPage1+1)+"'>다음</a>";
		}
		return new ApplyPageData(applyList,pageNavi,totalCount);
	}
	//처리한 목록 가져오기
	public CompletionPageData completionPaging(int currentPage1){
		String pageNavi = "";
		int numPerPage = 10;//출력할 최대 개수
		int pageNaviSize = 5;//하단 page 개수
		int totalCount = applyDao.completionTotalCount();//리스트 전체 개수 조회
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage1-1)*numPerPage+1;
		int end = currentPage1*numPerPage;
		ApplyPageBound pb = new ApplyPageBound(start,end);
		ArrayList<Apply> applyList = (ArrayList<Apply>)applyDao.completionPaging(pb);
		int pageNo = ((currentPage1-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage1 != 1) {
			pageNavi += "<a href='/applyCompletion.do?currentPage="+(currentPage1-1)+"'>이전</a>&nbsp;";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(currentPage1 == pageNo) {
				pageNavi += "&nbsp;<span style='color:black;font-size:20px;'>"+pageNo+"</span>&nbsp;";
			}else {
				pageNavi += "&nbsp;<a href='/applyCompletion.do?currentPage="+pageNo+"'>"+pageNo+"<a/>&nbsp;";
			}
			pageNo++;
		}
		if(currentPage1 < totalPage) {
			pageNavi += "&nbsp;<a href='/applyCompletion.do?currentPage="+(currentPage1+1)+"'>다음</a>";
		}
		return new CompletionPageData(applyList,pageNavi,totalCount);
	}
}
