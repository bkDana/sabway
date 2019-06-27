package kr.co.subway.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	@RequestMapping("/orderList.do")
	public String orderList() {
		return "admin/orderList";
	}

}
