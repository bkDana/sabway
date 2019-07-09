package kr.co.subway.manager.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.headOffice.dao.ApplyDAO;
import kr.co.subway.manager.dao.MgrDAO;
import kr.co.subway.manager.vo.Mgr;

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
		System.out.println("서비스 승인no확인:"+applyNo);
		applydao.applyManagerUpdate(applyNo);
		return result;
	}
	public List<Mgr> selectMgr() {
		List<Mgr> list= mgrdao.selectMgr();
		return list;
	}
	//관리자 로그인
	public Mgr login(String mgrId) {
		Mgr mgr = mgrdao.login(mgrId);
		return mgr;
	}
}
