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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.subway.manager.service.AddrCode;
import kr.co.subway.manager.service.AddrType;
import kr.co.subway.manager.service.MgrService;
import kr.co.subway.manager.service.RandomTel;
import kr.co.subway.manager.service.SubStr;
import kr.co.subway.manager.vo.Mgr;
import kr.co.subway.manager.vo.MgrPageData;
import kr.co.subway.manager.vo.StorePageNaviData;

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
	@Resource(name="substr")
	SubStr substr;
	@RequestMapping(value="/enrollMgr.do")
	//랜덤 전화번호, 지역별 번호, 지역별 코드 설정
	public String enrollMgr(@RequestParam String applyArea,@RequestParam String applyName,@RequestParam int applyNo,Model model) {
		int i = 1;
		//가맹점 승인하면 applyName과 applyArea를 매개변수로 받음
		//applyArea : 지역 정보를 알아보기 위함
		//applyName : 가맹점 등록에 사용할 목적
		System.out.println(applyArea);
		System.out.println(applyName);
		System.out.println(applyNo);
		String ranTel = randomtel.randomTel();
		String addrType = addrtype.addrType(applyArea);
		String mgrTel = addrcode.addrCode(ranTel,addrType);
		String addrSubStr = substr.subStr(applyArea);
		System.out.println(addrSubStr);
		//가맹점 정보를 가져와서 이름 체크
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.mgrList();
		for(int y=0;y<list.size();y++) {
			if(list.get(y).getMgrAddr().contains(addrSubStr)) {
				i++;
				System.out.println(i);
			}
		}
		//이름 중복시 1호점/id +1
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
	public String adminLogin(HttpServletRequest request, @RequestParam String mgrId, @RequestParam String mgrPw){
		HttpSession session = request.getSession();
		String view = "";
		Mgr mgr2 = mgrservice.idChk(mgrId); //id 유무 체크
		if(mgr2!=null) { // 아이디 있으면
			Mgr mgr = new Mgr();
			mgr.setMgrId(mgr2.getMgrId());
			mgr.setMgrPw(mgrPw);
			mgr = mgrservice.login(mgr);
			if(mgr != null) { // 정상 로그인 
				if(mgr.getMgrStatus()==3) { //폐업 계정일 때
					view ="manager/shutDown";
					return view;
				}
				session.setAttribute("mgr", mgr);
				view = "admin/index";
			}else { //비밀번호가 다를 때
				view = "manager/passwordFail";
			}
		}else {	// id없으면
			view = "manager/loginFailMsg";
		}
		return view;
	}
	//관리자 로그아웃
	@RequestMapping("/adminLogout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		session.invalidate();
		return "redirect:/admin.do";
	}
	//가맹점 목록
	@RequestMapping(value="/managerList.do")
	public ModelAndView managerList(@RequestParam String currentPage) {
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch(Exception e) {
			currentPage1 = 1;
		}
		MgrPageData pd = mgrservice.mgrPaging(currentPage1);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("pd",pd);
			mav.setViewName("manager/managerList");
		}catch(Exception e) {
			mav.setViewName("manager/listMsg");
		}
		return mav;
	}
	//가맹점 상태변경(update)
	@RequestMapping(value="/mgrUpdate.do")
	public ModelAndView mgrUpdate(Mgr mgr,@RequestParam String currentPage) {
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch(Exception e) {
			currentPage1 = 1;
		}
		int result = mgrservice.mgrUpdate(mgr);
		ModelAndView mav = new ModelAndView();
		if(result > 0) {
			MgrPageData pd = mgrservice.mgrPaging(currentPage1);
			try {
				mav.addObject("pd",pd);
				mav.setViewName("manager/managerList");
			}catch(Exception e) {
				mav.setViewName("manager/listMsg");
			}
		}else {
			mav.setViewName("manager/listMsg");
		}
		return mav;
	}
	//검색
	@RequestMapping(value="/searchKeyword.do")
	public ModelAndView searchKeyword(@RequestParam String currentPage,@RequestParam String keyword,@RequestParam String text,@RequestParam int status1) {
		int status = 0;
		if(status1 == -1) {
			status = -1;
		}else if(status1 != -1){
			status = status1;
		}
		System.out.println("검색 : "+status);
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch(Exception e) {
			currentPage1 = 1;
		}
		MgrPageData pd = mgrservice.searchKeyword(currentPage1,keyword,text,status);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("text",text);
			mav.addObject("keyword",keyword);
			mav.addObject("status",status);
			mav.addObject("pd",pd);
			mav.setViewName("manager/managerList");
		}catch(Exception e) {
			mav.setViewName("manager/listMsg");
		}
		return mav;
	}
	//신규가맹점 목록
	@RequestMapping(value="/findStore.do")
	public ModelAndView newStoreList(String currentPage, @RequestParam int status) {
		System.out.println(status);
		//신규매점 리스트
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.newStoreList();
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch (Exception e) {
			currentPage1=1;
		}
		StorePageNaviData pd = mgrservice.StoreSelectPaging(currentPage1);
		
		
		// 페이징		
		String pageNavi = pd.getPageNavi();
		System.out.println(pageNavi);
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
			if(status!=11) {
				mav.addObject("list", list);
				mav.addObject("listDate", listDate);
				mav.addObject("listS", pd.getStoreList());
				mav.addObject("totalCnt", pd.getStoreList().get(0).getTotalCount());
				mav.addObject("pageNavi",pageNavi);
				mav.setViewName("findStore/findStore");
			}else {
				mav.addObject("list", list);
				mav.addObject("listDate", listDate);
				mav.addObject("listS", pd.getStoreList());
				mav.addObject("totalCnt", pd.getStoreList().get(0).getTotalCount());
				mav.addObject("pageNavi",pageNavi);
				mav.setViewName("findStore/findStoreOrder");
			}
			
		}else {
			mav.setViewName("manager/listMsg");
		}
		return mav;
	}
	//전체매장 select 필터 검색
	@ResponseBody
	@RequestMapping(value="/allSearchKeyword.do",produces="application/json; charset=utf-8")
	public String allSearchKeyword(String area, String currentPage, String type) {
		String type2 = "";
		System.out.println("갔다오냐"+area);
		System.out.println(currentPage);
//		String keyword = area.substring(0,2);
		String keyword = area;
		System.out.println(keyword);
		System.out.println("type : " + type);
//		if(type.equals("1")) {
//			keyword = keyword+"%";
//		}else if(type.equals("2")) {
//			keyword ="% "+keyword+" %";
//		}
		//ArrayList<Mgr> allSearchKeyword = (ArrayList<Mgr>) mgrservice.searchStore(keyword);
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch (Exception e) {
			currentPage1=1;
		}
		StorePageNaviData pd = mgrservice.allStoreSelectPaging(currentPage1,keyword,area,type);
		/*for(int i=0; i<allSearchKeyword.size(); i++){

		}*/
		return new Gson().toJson(pd);
	}
	//매장 키워드검색
	@ResponseBody
	@RequestMapping(value="/searchKeyword.do",produces="application/json; charset=utf-8")
	public String storeList(@RequestParam String keyword) {
		ArrayList<Mgr> searchKeyword = (ArrayList<Mgr>) mgrservice.searchStore(keyword);
		for(int i=0; i<searchKeyword.size(); i++){

			System.out.println(searchKeyword.get(i).getMgrAddr());
		}
		return new Gson().toJson(searchKeyword);
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
