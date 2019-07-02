package kr.co.subway.ingreManage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.ingreManage.service.IngreManageService;
import kr.co.subway.ingreManage.vo.IngreVo;

@Controller
public class IngreManageController {
	@Autowired
	private IngreManageService ingreService;
	
	//메뉴등록페이지로 보내기
	@RequestMapping("/goIngreReg.do")
	public String goIngreReg() {
		return "admin/ingreManage/ingreRegisterForm";
	}
	
	//메뉴 등록하기
	@RequestMapping("/ingreRegister.do")
	public String ingreReg(IngreVo iv) {
		int result = ingreService.ingreReg(iv);
		if(result>0) {
			return "redirect:/";	//메뉴관리 리스트로 보내주기
		}else {
			return "redirect:/";
		}
	}
	
	
	
	
}
