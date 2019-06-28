package kr.co.subway.menuManage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.subway.menuManage.service.MenuManageService;

@Controller
public class MenuManageController {
	@Autowired
	private MenuManageService menuService;

}
