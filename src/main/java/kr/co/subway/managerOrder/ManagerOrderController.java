
package kr.co.subway.managerOrder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ManagerOrderController {
	
	@RequestMapping("/managerOrder/orderList.do")
	public String orderList() {
		return "admin/managerOrder/orderList";
	}

}
