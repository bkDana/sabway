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
	
	public List<Apply> applyList() {
		List<Apply> list = applyDao.applyList();
		return (ArrayList<Apply>)list;
	}
	@Transactional
	public int rejectManagerUpdate(String applyName,int applyStatus){
		int result = 0;
		if(applyStatus==2) {
			result = applyDao.rejectManagerUpdate(applyName);
		}
//		else {
//			result = applyDao.applyManagerUpdate(applyName);
//		}
		return result;
	}
	public Apply applyView(int applyNo) {
		Apply ap = applyDao.applyView(applyNo);
		return ap;
	}
	// 가맹신청/문의 등록
	public int insertApply(Apply applyVo) {
		
		//승인여부 0:기본
		applyVo.setApplyStatus(0);
		
		//지역
		applyVo.setApplyArea(applyVo.getApplyArea()+applyVo.getApplyArea2());
		
		//이메일
		applyVo.setApplyEmail(applyVo.getApplyEmail()+'@'+applyVo.getApplyEmail2());
		
		
		return applyDao.insertApply(applyVo);
	}
}
