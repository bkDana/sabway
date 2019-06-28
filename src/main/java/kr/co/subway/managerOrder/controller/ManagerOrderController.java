package kr.co.subway.managerOrder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.managerOrder.service.ManagerOrderService;
import kr.co.subway.managerOrder.vo.ManagerOrderListVO;

@Controller
public class ManagerOrderController {
	
	@Autowired
	private ManagerOrderService service;
	
	@RequestMapping("/managerOrder/orderList.do")
	public String orderList(Model model) {
		ManagerOrderListVO list = service.selectList();
		model.addAttribute("list", list);
		return "admin/managerOrder/orderList";
	}
	
	@RequestMapping("/managerOrder/orderRegister.do")
	public String orderRegister() {
		return "admin/managerOrder/orderRegister";
	}
	
	@RequestMapping("/managerOrder/stockList.do")
	public String stockList() {
		return "admin/managerOrder/stockList";
	}

}
