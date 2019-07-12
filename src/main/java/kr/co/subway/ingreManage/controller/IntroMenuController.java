package kr.co.subway.ingreManage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.ingreManage.service.IntroMenuService;
import kr.co.subway.ingreManage.vo.IngreVo;

@Controller
@RequestMapping("/intro")
public class IntroMenuController {
	
	@Autowired
	private IntroMenuService service;

	@RequestMapping("/menu.do")
	public String introMebu(Model model, String no) {
		System.out.println(no);
		String type = "메인재료";
		IngreVo ingre = new IngreVo();
		ingre.setIngreType(type);
		ArrayList<IngreVo> list = service.introMenu(ingre);
		model.addAttribute("list", list);
		return "menu/introMenu";
	}
	

}
