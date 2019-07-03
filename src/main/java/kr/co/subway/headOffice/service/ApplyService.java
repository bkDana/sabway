package kr.co.subway.headOffice.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
}
