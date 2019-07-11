package kr.co.subway.sales.statics.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.co.subway.sales.statics.service.SalesStaticsService;
import kr.co.subway.sales.statics.vo.SalesStaticsGrpVo;

@Controller
@RequestMapping("/salesStatics")
public class SalesStaticsController {
	@Autowired
	private SalesStaticsService service;
	
	@RequestMapping("/goChart.do")
	public String goChart() {
		return "admin/salesStatics/branchSales";
	}

	//그래프 테스트
	@ResponseBody
	@RequestMapping("/getSales.do")
	public void getSales(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<SalesStaticsGrpVo> list = service.getSales();
		/*Map<String,String> map = H
		for(int i=0;i<list.size();i++) {
			if()
			list.get(i).getOrderMonth()
		}*/
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//매출 가져오기
	@RequestMapping("/totalSales.do")
	public ModelAndView totalSales(ModelAndView mav, HttpServletRequest request) {
		ArrayList<SalesStaticsGrpVo> list = service.getSales();
		if(!list.isEmpty()) {
			mav.addObject("salesList",list);
			mav.setViewName("admin/salesStatics/totalSales");
		}else {
			mav.setViewName("common/error");
		}
		return mav;
	}
}
