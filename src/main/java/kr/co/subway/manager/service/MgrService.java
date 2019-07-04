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

	@Transactional
	public int enrollMgr(Mgr mg,String applyName) {
		int result = mgrdao.enrollMgr(mg);
		applydao.applyManagerUpdate(applyName);
		return result;
	}
//	public List selectMgr() {
//		List list= mgrdao.selectMgr();
//		return (ArrayList<Mgr>)list;
//	}
	
	public Mgr login(String mgrId) {
	Mgr mgr = mgrdao.login(mgrId);
	return mgr;
}
}
