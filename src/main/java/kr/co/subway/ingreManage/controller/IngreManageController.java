package kr.co.subway.ingreManage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.ingreManage.service.IngreManageService;

@Controller
public class IngreManageController {
	@Autowired
	private IngreManageService ingreService;
	
	@RequestMapping("/goIngreReg.do")
	public String goMenuReg() {
		return "admin/ingreManage/ingreRegisterForm";
	}
	
	
}
