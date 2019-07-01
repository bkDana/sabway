package kr.co.subway.menuManage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.menuManage.service.MenuManageService;

@Controller
public class MenuManageController {
	@Autowired
	private MenuManageService menuService;
	
	@RequestMapping("/goMenuReg.do")
	public String goMenuReg() {
		return "admin/menuManage/menuRegisterForm";
	}
	
	
}
