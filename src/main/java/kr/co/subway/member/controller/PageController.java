package kr.co.subway.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.manager.vo.Mgr;

@Controller
public class PageController {
	
	@RequestMapping("/admin.do")
	public String movePage(HttpSession session) {
		if(session.getAttribute("mgr")==null) {
			System.out.println("로그인 해라@@@!!!!");
			return "redirect:/loginAdmin.do";
		}else {
			return "admin/index";
		}
	}
	
	@RequestMapping("/main.do")
	public String moveMain() {
		return "main";
	}
	
	@RequestMapping("/menu1.do")
	public String movemenu1() {
		return "menu/menu1";
	}
	
	@RequestMapping("/menu2.do")
	public String movemenu2() {
		return "menu/menu2";
	}
	
	@RequestMapping("/menu3.do")
	public String movemenu3() {
		return "menu/menu3";
	}
	
}
