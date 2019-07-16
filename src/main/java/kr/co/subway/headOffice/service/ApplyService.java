package kr.co.subway.headOffice.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.headOffice.dao.ApplyDAO;
import kr.co.subway.headOffice.vo.Apply;

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
		applyVo.setApplyArea(applyVo.getApplyArea()+applyVo.getApplyArea2());
		
		//이메일
		applyVo.setApplyEmail(applyVo.getApplyEmail()+'@'+applyVo.getApplyEmail2());
		
		
		System.out.println(applyVo.getApplyEmail2());
		return applyDao.insertApply(applyVo);
	}
}
