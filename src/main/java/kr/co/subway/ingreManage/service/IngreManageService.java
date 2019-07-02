package kr.co.subway.ingreManage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.ingreManage.dao.IngreManageDao;
import kr.co.subway.ingreManage.vo.IngreVo;

@Service("menuManageService")
public class IngreManageService {
	@Autowired
	private IngreManageDao ingreDao;
	
	//재료 등록하기
	public int ingreReg(IngreVo iv) {
		int result = ingreDao.ingreReg(iv);
		return result;
	}
}
