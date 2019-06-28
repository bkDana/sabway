
package kr.co.subway.managerOrder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerOrderController {
	
	@RequestMapping("/managerOrder/orderList.do")
	public String orderList() {
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
