package kr.co.subway.stock.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.co.subway.common.SearchVO;
import kr.co.subway.manager.vo.Mgr;
import kr.co.subway.managerOrder.vo.StockVO;
import kr.co.subway.stock.service.StockService;
import kr.co.subway.stock.vo.HistoryListVO;
import kr.co.subway.stock.vo.StockListVO;

@Controller
@RequestMapping("/managerOrder")
public class StockController {
	
	@Autowired
	private StockService service;
	
	@RequestMapping("/stockList.do")
	public String stockList(Model model, HttpSession session, HttpServletRequest request, SearchVO search) {

		if(session.getAttribute("mgr")!=null) {
			search.setMgrId(((Mgr)session.getAttribute("mgr")).getMgrId());
		}else {
			search.setMgrId("jy");//임시 아이디로 설정
		}
		
		if(search.getReqPage()==0) {
			search.setReqPage(1);
		}

		StockListVO list = service.selectList(search);
		model.addAttribute("search", search);
		model.addAttribute("list", list);
		
		return "admin/managerOrder/stockList";
	}
	
	@RequestMapping("/stockHistory.do")
	public String stockHistory(Model model, SearchVO search) {
		if(search.getReqPage()==0) {
			search.setReqPage(1);
		}
		HistoryListVO history = service.stockHistory(search);
		
		model.addAttribute("search", search);
		model.addAttribute("history", history);
		return "admin/managerOrder/history";
	}
	
	@ResponseBody
	@RequestMapping(value="/moveHistory.do", produces="application/json;charset=utf-8;")
	public String moveHistory(SearchVO search) {
		if(search.getReqPage()==0) {
			search.setReqPage(1);
		}
		HistoryListVO history = service.stockHistory(search);
		
		//model.addAttribute("history", history);
		return new Gson().toJson(history);
	}
	
	@ResponseBody
	@RequestMapping("/modifyStock.do")
	public void modifyStock(HttpServletResponse response, StockVO stock) throws JsonIOException, IOException{
		int result = service.modifyStock(stock);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(result,response.getWriter());
	}
	

}
