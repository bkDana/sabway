package kr.co.subway.sales.statics.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.co.subway.sales.statics.service.SalesStaticsService;
import kr.co.subway.sales.statics.vo.SalesStaticsGrpVo;

@Controller
@RequestMapping("/salesStatics")
public class SalesStaticsController {
	@Autowired
	private SalesStaticsService service;
	
	@RequestMapping("/goTotalSales.do")
	public String goTotalSales() {
		return "admin/salesStatics/totalSales";
	}
	//막대차트 부분
	//전체 매출 가져오기
	@ResponseBody
	@RequestMapping("/totalSales.do")
	public void totalSales(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<SalesStaticsGrpVo> list = service.totalSales();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//전체 매출페이지에서 선택한 월의 지점별 매출
	@ResponseBody
	@RequestMapping("/monthTotalSales.do")
	public void monthTotalSales(String month,HttpServletResponse response) throws JsonIOException, IOException {
		String orderMonth = month.substring(0,month.length()-1);
		System.out.println(orderMonth);
		ArrayList<SalesStaticsGrpVo> list = service.monthTotalSales(orderMonth);
		System.out.println(list.get(2).getCusoBranch());
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//지점별 매출통계 페이지로 가기
	@RequestMapping("/goBranchSales.do")
	public String goBranchSales() {
		return "admin/salesStatics/branchSales";
	}
	
	//지점명 가져오기
	@ResponseBody
	@RequestMapping("/getBranch.do")
	public void getBranch(String cusoBranch,HttpServletResponse response) throws JsonIOException, IOException {
		System.out.println(cusoBranch);
		List list = service.getBranch(cusoBranch);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//지점 매출 가져오기
	@ResponseBody
	@RequestMapping("/getBranchSales.do")
	public void getBranchSales(String branchName,HttpServletResponse response) throws JsonIOException, IOException {
		//System.out.println(branchName);
		ArrayList<SalesStaticsGrpVo> list = service.getBranchSales(branchName);
		//System.out.println("월 : "+list.get(2).getOrderMonth()+"매출 : "+list.get(2).getTotalCost());
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	///////////////////////////////////////// bucket table에서 정보 가져옴 //////////////////
	//파이차트 부분
	//해당년도 전체 메뉴 판매 현황
	@ResponseBody
	@RequestMapping("/totalMenu.do")
	public void getTotalMenu(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<SalesStaticsGrpVo> list = service.getTotalMenu();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//해당 월 메뉴 판매 현황
	@ResponseBody
	@RequestMapping("/monthTotalMenu.do")
	public void getMonthTotalMenu(String month,HttpServletResponse response) throws JsonIOException, IOException {
		String orderMonth = month.substring(0,month.length()-1);
		System.out.println("선택된 월: "+orderMonth);
		SalesStaticsGrpVo ssg = new SalesStaticsGrpVo();
		ssg.setOrderMonth(orderMonth);
		ArrayList<SalesStaticsGrpVo> list = (ArrayList<SalesStaticsGrpVo>)service.getMonthTotalMenu(ssg);
		//System.out.println("controller list size(): "+list.size());
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//지점 당월 메뉴 매출순위
	@ResponseBody
	@RequestMapping("/branchMenuSales.do")
	public void getBranchMenuSales(String branchName,HttpServletResponse response) throws JsonIOException, IOException {
		System.out.println("지점명 : "+branchName);
		SalesStaticsGrpVo ssg = new SalesStaticsGrpVo();
		ssg.setCusoBranch(branchName);
		ArrayList<SalesStaticsGrpVo> list = service.getBranchMenuSales(ssg);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//지점 선택한 월 메뉴 매출 순위
	@ResponseBody
	@RequestMapping("/monthBranchMenuSales.do")
	public void getMonthBranchMenuSales(String month, String branchName,HttpServletResponse response) throws JsonIOException, IOException {
		String orderMonth = month.substring(0,month.length()-1);
		System.out.println(orderMonth);
		System.out.println("지점명 : "+branchName);
		SalesStaticsGrpVo ssg = new SalesStaticsGrpVo();
		ssg.setCusoBranch(branchName);
		ssg.setOrderMonth(orderMonth);
		ArrayList<SalesStaticsGrpVo> list = service.getBranchMenuSales(ssg);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	////////////////////////////////////////////////////////////////////
	//
	
	
	
	
	
	
	
	
	
	//매출 가져오기
	/*@RequestMapping("/totalSales.do")
	public ModelAndView totalSales(ModelAndView mav, HttpServletRequest request) {
		ArrayList<SalesStaticsGrpVo> list = service.getSales();
		if(!list.isEmpty()) {
			mav.addObject("salesList",list);
			mav.setViewName("admin/salesStatics/totalSales");
		}else {
			mav.setViewName("common/error");
		}
		return mav;
	}*/
}
