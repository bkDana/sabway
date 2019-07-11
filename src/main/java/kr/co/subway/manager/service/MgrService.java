package kr.co.subway.manager.service;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.headOffice.dao.ApplyDAO;
import kr.co.subway.manager.dao.MgrDAO;
import kr.co.subway.manager.vo.Mgr;
import kr.co.subway.manager.vo.PageNo;

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
		applydao.applyManagerUpdate(applyNo);
		return result;
	}
	//가맹점 목록
	public List<Mgr> mgrList() {
		List<Mgr> list= mgrdao.mgrList();
		return list;
	}
	//관리자 로그인
	public Mgr login(String mgrId) {
		Mgr mgr = mgrdao.login(mgrId);
		return mgr;
	}
	//가맹점 상태 변경(update)
	@Transactional
	public int mgrUpdate(Mgr mgr) {
		int result = mgrdao.mgrUpdate(mgr);
		return result;
	}
	//검색어 검색
	public List<Mgr> searchList(String keyword, String text){
		List<Mgr> list = null;
		if(keyword.equals("이름")) {
			list = mgrdao.searchBossName(text);
		}else if(keyword.equals("주소")){
			list = mgrdao.searchAddr(text);
		}
		return list;
	}
	//상태별 분류
	public List<Mgr> selectStatus(String keyword){
		List<Mgr> list = null;
		if(keyword.equals("준비")) {
			int status = 1;
			list = mgrdao.selectStatus(status);
		}else if(keyword.equals("영업")) {
			int status = 2;
			list = mgrdao.selectStatus(status);
		}else if(keyword.equals("폐업")) {
			int status = 3;
			list = mgrdao.selectStatus(status);
		}
		return list;
	}
	//상태별 검색
	public List<Mgr> searchStatus(String keyword,Mgr mgr){
		List<Mgr> list = null;
		if(keyword.equals("이름")) {
			list = mgrdao.searchStatusName(mgr);
		}else if(keyword.equals("주소")){
			list = mgrdao.searchStatusAddr(mgr);
		}
		return list;
	}
	public List<Mgr> morePage(PageNo pn){
		List<Mgr> list = mgrdao.morePage(pn);
		return list;
	}
	public List<Mgr> pageMore(PageNo pn){
		List<Mgr> list = mgrdao.pageMore(pn);
		return list;
	}
	
	
	
	
}
