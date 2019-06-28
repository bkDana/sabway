package kr.co.subway.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping("/admin.do")
	public String movePage() {
		return "admin/index";
	}
	@RequestMapping("/main.do")
	public String moveMain() {
		return "main";
	}
}
