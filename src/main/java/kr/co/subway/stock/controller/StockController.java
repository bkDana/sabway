package kr.co.subway.stock.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.common.SearchVO;
import kr.co.subway.customer.vo.Customer;
import kr.co.subway.stock.service.StockService;
import kr.co.subway.stock.vo.StockListVO;

@Controller
public class StockController {
	
	@Autowired
	private StockService service;
	
	@RequestMapping("/managerOrder/stockList.do")
	public String stockList(Model model, HttpServletRequest request, SearchVO search) {
		
		String id = "";
		HttpSession session = request.getSession(false);
		if(session.getAttribute("customer")!=null) {
			id = ((Customer)session.getAttribute("customer")).getCustomerId();//TODO 여기는 나중에 관리자 id로 바꿔서 받아와야함
		}else {
			//id = "admin";
			search.setMgrId("jy");
		}
		if(search.getReqPage()==0) {
			search.setReqPage(1);
		}


		StockListVO list = service.selectList(search);
		model.addAttribute("search", search);
		model.addAttribute("list", list);
		
		return "admin/managerOrder/stockList";
	}

}
