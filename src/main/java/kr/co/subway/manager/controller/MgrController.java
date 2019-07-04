package kr.co.subway.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/enrollMgr.do")
	public String enrollMgr(@RequestParam String applyArea,@RequestParam String applyName,Model model) {
		//가맹점 승인하면 applyName과 applyArea를 매개변수로 받음
		//applyArea : 지역 정보를 알아보기 위함
		//applyName : 가맹점 등록에 사용할 목적
		String ranTel = randomtel.randomTel();
		String addrType = addrtype.addrType(applyArea);
		String mgrTel = addrcode.addrCode(ranTel,addrType);
		model.addAttribute("applyName",applyName);
		model.addAttribute("mgrAddrType",addrType);
		model.addAttribute("mgrAddr",applyArea);
		model.addAttribute("mgrTel",mgrTel);
		return "manager/mgrEnroll";
	}
	@RequestMapping(value="/mgrEnroll.do")
	public String mgrEnroll(Mgr mg,@RequestParam String applyName) {
		//가맹점 계정을 등록하면 applyName를 받아와서 DB등록이 완료되면 status를 변경하기 위해 
		int result = mgrservice.enrollMgr(mg,applyName);
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

	@RequestMapping("/adminLogout.do")
	public String logout(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		session.invalidate();
		return "main";
	}
	
}
