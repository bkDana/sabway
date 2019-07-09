package kr.co.subway.customerOrder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.subway.customerOrder.service.CusOrderService;

@Controller
public class CusOrderController {
	@Autowired
	private CusOrderService cusOrderServcice;
	
	@RequestMapping("/cusOrder.do")
	public String loadCusOrder() {
		return "/customerOrder/horizentalOrder";
	}
	@RequestMapping(value="submitCusOrder.do")
	public String submitCusOrder(@RequestParam String isSalad, @RequestParam String main, @RequestParam String is15, @RequestParam String bread, @RequestParam String cheese,
			@RequestParam String topping, @RequestParam String isOvened, @RequestParam String vegi, @RequestParam String source, @RequestParam String side, @RequestParam String set) {
		System.out.println("isSalad : " + isSalad);
		System.out.println("main : " + main);
		if(!bread.equals(null)) {
			System.out.println("is15 :" + is15);
			System.out.println("bread : " + bread); 
		}
		System.out.println("cheese : " + cheese);
		System.out.println("topping : " + topping);
		System.out.println("isOvened : " + isOvened);
		System.out.println("vegi : " + vegi);
		System.out.println("source : " + source);
		System.out.println("side : " + side);
		System.out.println("whichSet : " + set);

		
		return "redirect:/index.jsp";
	}
	
}
