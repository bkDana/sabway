package kr.co.subway.customerOrder.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.customerOrder.service.CusOrderService;

@Controller
public class CusOrderController {
	@Autowired
	private CusOrderService cusOrderServcice;
	
	@RequestMapping("/submitCusOrder.do")
	public String submitOrder() {
		return "";
	}
}
