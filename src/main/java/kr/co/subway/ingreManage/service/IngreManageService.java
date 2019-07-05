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
	
	//�옱猷� �벑濡앺븯湲�
	public int ingreReg(IngreVo iv) {
		int result = ingreDao.ingreReg(iv);
		return result;
	}
	
	//�옱猷� 由ъ뒪�듃 媛��졇�삤湲�
	public IngrePageNaviData ingreList(int reqPage, String searchType, String searchVal) {
		System.out.println(searchType);
		System.out.println(searchVal);
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
			pageNavi += "<a class='paging-arrow prev-arrow' href='/ingreList.do?reqPage="+(pageNo-1)+"&searchType="+searchType+"&searchVal="+searchVal+"'"+pageNo+"'>�씠�쟾</a>";
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
		if(pageNo < totalPage) {
			pageNavi +="<a class='paging-arrow next-arrow' href='/ingreList.do?reqPage="+pageNo+"&searchType="+searchType+"&searchVal="+searchVal+"'"+pageNo+"'>�떎�쓬</a>";
		}
		
		return new IngrePageNaviData(ingreList, pageNavi);
	}
	
	//�솢�꽦�솕�뿬遺� 蹂�寃쎌떆 �뾽�뜲�씠�듃�븯湲�
	public int updateIngreActive(String ingreActive, String ingreIdx) {
		int result = ingreDao.updateIngreActive(ingreActive,ingreIdx);
		return result;
	}
	
	//�옱猷� 由ъ뒪�듃 �럹�씠吏��뿉�꽌 寃��깋諛뺤뒪�뿉�꽌 �옱猷� 移댄뀒濡쒓린 �꽑�깮�떆 �븯�쐞 媛� 媛��졇�삤湲�
	public List ingreType() {
		List list = ingreDao.ingreType();
		return list;
	}

	//�옱猷뚯젙蹂� 媛��졇�삤湲�
	public IngreVo goUpdateIngre(String ingreIdx) {
		IngreVo iv = ingreDao.goUpdateIngre(ingreIdx);
		return iv;
	}
	
	//�옱猷� �닔�젙�븯湲�
	public int ingreUpdate(IngreVo iv) {
		return ingreDao.ingreUpdate(iv);
	}
	
	//�옱猷� �궘�젣�븯湲�
	public int ingreDelete(String ingreIdx) {
		return ingreDao.ingreDelete(ingreIdx);
	}

	//엑셀 다운로드할  리스트 가져오기
		public List ingreList(String searchType, String searchVal) {
			return ingreDao.ingreSelectAll(searchType, searchVal);
		}

}
