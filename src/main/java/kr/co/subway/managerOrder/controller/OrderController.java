
package kr.co.subway.managerOrder.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	@RequestMapping("/managerOrder/orderList.do")
	public String orderList() {
		return "admin/managerOrder/orderList";
	}

}
