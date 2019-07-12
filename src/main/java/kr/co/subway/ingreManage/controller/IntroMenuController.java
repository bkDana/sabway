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
		IngreVo ingre = new IngreVo();
		if(no.equals("1")) {
			ingre.setIngreType("메인재료");
		}else if(no.equals("2")) {
			ingre.setIngreType("메인재료");
		}else if(no.equals("3")) {
			ingre.setIngreType("추가토핑");
		}else if(no.equals("4")) {
			ingre.setIngreType("사이드메뉴");
		}else if(no.equals("5")) {
			ingre.setIngreType("빵");
		}else if(no.equals("6")) {
			ingre.setIngreType("채소");
		}else if(no.equals("7")) {
			ingre.setIngreType("치즈");
		}else if(no.equals("8")) {
			ingre.setIngreType("소스");
		}
		
		ArrayList<IngreVo> list = service.introMenu(ingre);
		model.addAttribute("list", list);
		return "menu/introMenu";
	}
	

}
