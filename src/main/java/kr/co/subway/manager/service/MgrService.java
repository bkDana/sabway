package kr.co.subway.manager.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.subway.headOffice.dao.ApplyDAO;
import kr.co.subway.manager.dao.MgrDAO;
import kr.co.subway.manager.vo.Mgr;

@Service("mgrservice")
public class MgrService {
	@Resource(name="mgrdao")
	MgrDAO mgrdao;
	@Resource(name="applyDao")
	ApplyDAO applydao;
	
	public int enrollMgr(Mgr mg,String applyName) {
		int result = mgrdao.enrollMgr(mg);
		applydao.applyManagerUpdate(applyName);
		return result;
	}
//	public List enrollMgr() {
//		List list= mgrdao.enrollMgr();
//		return (ArrayList<Mgr>)list;
//	}
}
