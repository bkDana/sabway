package kr.co.subway.manager.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.subway.manager.service.AddrCode;
import kr.co.subway.manager.service.AddrType;
import kr.co.subway.manager.service.MgrService;
import kr.co.subway.manager.service.RandomTel;
import kr.co.subway.manager.vo.Mgr;

@Controller
public class MgrController {
	@Resource(name="mgrservice")
	MgrService mgrservice;
	@Resource(name="addrtype")
	AddrType addrtype;
	@Resource(name="randomtel")
	RandomTel randomtel;
	@Resource(name="addrcode")
	AddrCode addrcode;
	//랜덤 전화번호, 지역별 번호, 지역별 코드 설정
	@RequestMapping(value="/enrollMgr.do")
	public String enrollMgr(@RequestParam String applyArea,@RequestParam String applyName,@RequestParam int applyNo,Model model) {
		int i = 1;
		//가맹점 승인하면 applyName과 applyArea를 매개변수로 받음
		//applyArea : 지역 정보를 알아보기 위함
		//applyName : 가맹점 등록에 사용할 목적
		String ranTel = randomtel.randomTel();
		String addrType = addrtype.addrType(applyArea);
		String mgrTel = addrcode.addrCode(ranTel,addrType);
		//가맹점 정보를 가져와서 이름 체크
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.mgrList();
		for(int y=0;y<list.size();y++) {
			if(list.get(y).getMgrAddr().contains(applyArea)) {		
				i++;
			}
		}
		//이름 중복시 1호점씩 증가
		model.addAttribute("i",i);
		model.addAttribute("applyName",applyName);
		model.addAttribute("mgrAddrType",addrType);
		model.addAttribute("applyNo",applyNo);
		model.addAttribute("mgrAddr",applyArea);
		model.addAttribute("mgrTel",mgrTel);
		return "manager/mgrEnroll";
	}
	//가맹점 등록
	@RequestMapping(value="/mgrEnroll.do")
	public String mgrEnroll(Mgr mg,@RequestParam String applyName,@RequestParam int applyNo) {
		mg.setMgrId(mg.getMgrId()+mg.getMgrAddrCode());
		//신청인(가맹점주) 이름 등록용
		mg.setMgrBossName(applyName);
		//그 외 가맹점 계정을 등록하면 applyNo를 받아와서 DB등록이 완료되면 status를 변경하기 위해 
		int result = mgrservice.enrollMgr(mg,applyNo);
		String view = "";
		if(result>0) {
			view = "manager/successMsg";
		}else {
			view = "manager/failMsg";
		}
		return view;
	}
	
	//관리자 로그인 페이지 이동용
	@RequestMapping("/loginAdmin.do")
	public String loginAdmin(){
		return "admin/login";
	}
	//관리자 로그인
	@RequestMapping("/adminLogin.do")
	public String adminLogin(HttpServletRequest request, @RequestParam String mgrId){
		HttpSession session = request.getSession();
		Mgr mgr = new Mgr();
		mgr = mgrservice.login(mgrId);
		String view = "";
		if(mgr != null) {
			session.setAttribute("mgr", mgr);
			view = "admin/index";
		}else {
			view = "main";
		}
		return view;
	}
	//관리자 로그아웃
	@RequestMapping("/adminLogout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		session.invalidate();
		return "main";
	}
	//가맹점 목록
	@RequestMapping(value="/managerList.do")
	public ModelAndView managerList() {
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.mgrList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list", list);
			mav.setViewName("manager/managerList");
		}else {
			mav.setViewName("manager/listMsg");
		}
		return mav;
	}
	//가맹점 상태변경(update)
	@RequestMapping(value="/mgrUpdate.do")
	public String mgrUpdate(Mgr mgr) {
		int result = mgrservice.mgrUpdate(mgr);
		return "redirect:/listMgr.do";
	}
	//변경된 목록
	@RequestMapping(value="/listMgr.do")
	public ModelAndView listMgr() {
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.mgrList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list", list);
			mav.setViewName("manager/managerList");
		}else {
			mav.setViewName("manager/listFail");
		}
		return mav;
	}
	//검색어 검색
	@RequestMapping(value="/searchKeyword.do")
	public ModelAndView searchKeyword(@RequestParam String keyword, @RequestParam String text) {
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.searchList(keyword,text);
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list", list);
			mav.setViewName("manager/mgrList");
		}else {
			mav.setViewName("manager/listFail");
		}
		return mav;
	}
	//상태별 분류
	@RequestMapping(value="/selectStatus.do")
	public ModelAndView selectStatus(@RequestParam String keyword) {
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.selectStatus(keyword);
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list", list);
			mav.setViewName("manager/statusList");
		}else {
			mav.setViewName("manager/listFail");
		}
		return mav;
	}
	//상태별 검색
	@RequestMapping(value="/searchStatus.do")
	public ModelAndView searchStatus(@RequestParam String keyword, @RequestParam String text, @RequestParam int status) {
		Mgr mgr = new Mgr();
		mgr.setMgrAddr(text);
		mgr.setMgrBossName(text);
		mgr.setMgrStatus(status);
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.searchStatus(keyword,mgr);
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list", list);
			mav.setViewName("manager/mgrList");
		}else {
			mav.setViewName("manager/listFail");
		}
		return mav;
	}
	
	//신규가맹점 목록
	@RequestMapping(value="/findStore.do")
	public ModelAndView newStoreList() {
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.newStoreList();
		ArrayList<Integer> listDate = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++){
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
			Date today = new Date();
			if(list.get(i).getMgrOpenDate()!=null) {
				int dateNumber = Integer.parseInt(transFormat.format(list.get(i).getMgrOpenDate()));
				int todateNumber = Integer.parseInt(transFormat.format(today));
				if((todateNumber-dateNumber)<30) {
					listDate.add((i));
				}
			}	
		}
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list", list);
			mav.addObject("listDate", listDate);
			mav.setViewName("findStore/findStore");
		}else {
			mav.setViewName("manager/listMsg");
		}
		return mav;
	}
	
	// 가맹점키워드검색
	@RequestMapping(value="/searchStore.do")
	public ModelAndView searchStore(@RequestParam String keyword) {
		ArrayList<Mgr> searchList = (ArrayList<Mgr>) mgrservice.searchStore(keyword);
		ModelAndView mav = new ModelAndView();
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.newStoreList();
		ArrayList<Integer> listDate = new ArrayList<Integer>();
		for(int i=0; i<list.size(); i++){
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
			Date today = new Date();
			if(list.get(i).getMgrOpenDate()!=null) {
				int dateNumber = Integer.parseInt(transFormat.format(list.get(i).getMgrOpenDate()));
				int todateNumber = Integer.parseInt(transFormat.format(today));
				if((todateNumber-dateNumber)<30) {
					listDate.add((i));
				}
			}	
		}
			
		if(!searchList.isEmpty()) {
			mav.addObject("searchList",searchList);
			mav.addObject("list", list);
			mav.addObject("listDate", listDate);
			mav.setViewName("findStore/findStore");

		}else {
			mav.addObject("list", list);
			mav.addObject("listDate", listDate);
			mav.setViewName("findStore/findStore");
			System.out.println("안돼");
		}
		return mav;
	}
}
