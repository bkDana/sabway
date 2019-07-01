package kr.co.subway.managerOrder.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.common.SearchVO;
import kr.co.subway.managerOrder.service.ManagerOrderService;
import kr.co.subway.managerOrder.vo.ManagerOrderListVO;

@Controller
public class ManagerOrderController {
	
	@Autowired
	private ManagerOrderService service;
	
	@RequestMapping("/managerOrder/orderList.do")
	public String orderList(Model model, HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch (Exception e) {
			reqPage = 1;
		}
		SearchVO search = new SearchVO(reqPage, 0,0,0);
		ManagerOrderListVO list = service.selectList(search);
		model.addAttribute("list", list);
		return "admin/managerOrder/orderList";
	}
	
	@RequestMapping("/managerOrder/orderRegister.do")
	public String orderRegister() {
		return "admin/managerOrder/orderRegister";
	}
	
	@RequestMapping("/managerOrder/addOrder.do")
	public String addOrder(HttpServletRequest request) {
		String mOrderDelDate = request.getParameter("mOrderDelDate");
		String mOrderManagerId = request.getParameter("mOrderManagerId");
		System.out.println(mOrderDelDate);
		System.out.println(mOrderManagerId);
		for(int i=1;;i++) {
			String idx = request.getParameter("idx_"+i);
			if(idx==null || idx.equals("")) break;			
			
			String name = request.getParameter("name_"+i);
			String amount = request.getParameter("amount_"+i);
			System.out.println(idx);
			System.out.println(name);
			System.out.println(amount);
			
		}
		return "redirect:/managerOrder/orderList.do";
	}
	
	@RequestMapping("/managerOrder/stockList.do")
	public String stockList() {
		return "admin/managerOrder/stockList";
	}

}
