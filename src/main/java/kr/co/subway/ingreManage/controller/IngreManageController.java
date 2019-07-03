package kr.co.subway.ingreManage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.co.subway.ingreManage.service.IngreManageService;
import kr.co.subway.ingreManage.vo.IngrePageNaviData;
import kr.co.subway.ingreManage.vo.IngreVo;

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
		System.out.println(searchType);
		System.out.println(searchVal);
		int reqPage1;
		try {
			reqPage1 = Integer.parseInt(reqPage);
		}catch (Exception e) {
			reqPage1=1;
		}
		IngrePageNaviData ip = ingreService.ingreList(reqPage1,searchType,searchVal);
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
	
	//활성화여부 변경시 업데이트하기
	@ResponseBody
	@RequestMapping("/updateIngreActive.do")
	public void updateIngreActive(HttpServletResponse response,String ingreActive,String ingreIdx) throws IOException {
		System.out.println("활성화:"+ingreActive);
		System.out.println("인덱스:"+ingreIdx);
		int result = ingreService.updateIngreActive(ingreActive,ingreIdx);
		System.out.println(result);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("업데이트 성공");
		}else{
			out.println("업데이트 실패");
		}
	}
	
	//재료 리스트 페이지에서 검색박스에서 재료 카테고리 선택시 하위 값 가져오기
	@ResponseBody
	@RequestMapping("/ingreType.do")
	public void ingreType(HttpServletResponse response) throws JsonIOException, IOException {
		List list = ingreService.ingreType();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	
	
}
