package kr.co.subway.ingreManage.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.subway.ingreManage.service.IngreManageService;
import kr.co.subway.ingreManage.vo.IngrePageNaviData;
import kr.co.subway.ingreManage.vo.IngreVo;
import net.sf.json.JSONObject;

@Controller
public class IngreManageController {
	@Autowired
	private IngreManageService ingreService;
	
	//재료 등록페이지로 보내기
	@RequestMapping("/goIngreReg.do")
	public String goIngreReg() {
		return "admin/ingreManage/ingreRegisterForm";
	}
	
	//재료 등록하기
	@RequestMapping("/ingreRegister.do")
	public String ingreReg(IngreVo iv) {
		int result = ingreService.ingreReg(iv);
		if(result>0) {
			return "redirect:/";	//메뉴관리 리스트로 보내주기
		}else {
			return "redirect:/";
		}
	}
	
	//재료 리스트 가져오기
	@RequestMapping("/ingreList.do")
	public ModelAndView ingreList(@RequestParam String reqPage, ModelAndView mav, String searchType, String searchVal) {
		IngrePageNaviData ip = ingreService.ingreList(Integer.parseInt(reqPage),searchType,searchVal);
		ArrayList<IngreVo> list = ip.getIngreList();
		String pageNavi = ip.getPageNavi();
		if(!list.isEmpty()) {
			mav.addObject("ingreList",list);
			mav.addObject("pageNavi",pageNavi);
			mav.addObject("searchType",searchType);
			mav.addObject("searchVal",searchVal);
			mav.setViewName("admin/ingreManage/ingreList");
		}else {
			mav.setViewName("common/error");
		}
		return mav;
	}
	
	//재료 리스트 페이지에서 검색박스에서 재료 카테고리 선택시 하위 값 가져오기
	@ResponseBody
	@RequestMapping("/ingreType.do")
	public String ingreType() {
		List list = ingreService.ingreType();
		JSONObject obj = new JSONObject();
		if(!list.isEmpty()) {
			obj.put("list", list);
		}else {
			System.out.println("ajax로 ingreType가져오기 실패(Controller)");
		}
		return new Gson().toJson(obj);
	}
	
	
	
}
