package kr.co.subway.manager.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.headOffice.dao.ApplyDAO;
import kr.co.subway.manager.dao.MgrDAO;
import kr.co.subway.manager.vo.Mgr;
import kr.co.subway.manager.vo.MgrPageData;
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
	//가맹점 목록(더보기)
	public List<Mgr> mpdList(MgrPageData mpd) {
		List<Mgr> list= mgrdao.mpdList(mpd);
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
	public List<Mgr> searchList(MgrPageData mpd){
		List<Mgr> list = null;
		if(mpd.getKeyword().equals("이름")) {
			list = mgrdao.searchBossName(mpd);
		}else if(mpd.getKeyword().equals("주소")){
			list = mgrdao.searchAddr(mpd);
		}
		return list;
	}
	//상태별 분류
	public List<Mgr> selectStatus(MgrPageData mpd){
		List<Mgr> list = null;
		if(mpd.getKeyword().equals("준비")) {
			mpd.setStatus(1);
			list = mgrdao.selectStatus(mpd);
		}else if(mpd.getKeyword().equals("영업")) {
			mpd.setStatus(2);
			list = mgrdao.selectStatus(mpd);
		}else if(mpd.getKeyword().equals("폐업")) {
			mpd.setStatus(3);
			list = mgrdao.selectStatus(mpd);
		}
		return list;
	}
	//검색 결과 상태별 분류
	public List<Mgr> selectSearchStatus(MgrPageData mpd){
		List<Mgr> list = null;
		if(mpd.getKeyword().equals("주소")) {
			list = mgrdao.selectSearchStatusAddr(mpd);
		}else if(mpd.getKeyword().equals("이름")) {
			list = mgrdao.selectSearchStatusName(mpd);
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
	//더보기
	public List<Mgr> pageMore(PageNo pn){
		List<Mgr> list = mgrdao.pageMore(pn);
		return list;
	}
	public ArrayList<Mgr> newStoreList() {
		// TODO Auto-generated method stub
		return null;
	}
	//mgr 개수
	public int totalCount(){
		int result = mgrdao.totalCount();
		return result;
	}
	//더보기(keyword)
	public List<Mgr> keywordMore(MgrPageData mpd){
		List<Mgr> list = mgrdao.keywordMore(mpd);
		return list;
	}
	//더보기(status)
	public List<Mgr> statusMore(MgrPageData mpd){
		List<Mgr> list = null;
		if(mpd.getKeyword().equals("준비")) {
			mpd.setStatus(1);
			list = mgrdao.statusMore(mpd);
		}else if(mpd.getKeyword().equals("영업")) {
			mpd.setStatus(2);
			list = mgrdao.statusMore(mpd);
		}else if(mpd.getKeyword().equals("폐업")) {
			mpd.setStatus(3);
			list = mgrdao.statusMore(mpd);
		}
		return list;
	}
	
}
