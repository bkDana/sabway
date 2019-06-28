package kr.co.subway.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class noticeController {
	
	@RequestMapping("/notice.do")
	public String noticeSelectAll() {
		return "notice/notice";
	}
}
