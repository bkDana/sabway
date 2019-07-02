package kr.co.subway.manager.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.subway.manager.dao.MgrDAO;
import kr.co.subway.manager.vo.Mgr;

@Service("mgrservice")
public class MgrService {
	@Resource(name="mgrdao")
	MgrDAO mgrdao;
	public int enrollMgr(Mgr mg) {
		int result = mgrdao.enrollMgr(mg);
		return result;
	}
	public List mgrList() {
		List list= mgrdao.mgrList();
		return (ArrayList<Mgr>)list;
	}
}
