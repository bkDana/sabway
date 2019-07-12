package kr.co.subway.customerOrder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.subway.customer.vo.Customer;
import kr.co.subway.customerOrder.service.CusOrderService;
import kr.co.subway.customerOrder.vo.Bucket;
import kr.co.subway.ingreManage.vo.IngreVo;

@Controller
public class CusOrderController {
	@Autowired
	private CusOrderService cusOrderService;
	
	@RequestMapping("/cusOrder.do")
	public ModelAndView loadCusOrder() {
		ArrayList<IngreVo> ingreList = cusOrderService.ingreSelectAll();
		ModelAndView mav = new ModelAndView();
		if (!ingreList.isEmpty()) {
			mav.addObject("ingreList", ingreList); // view에서 사용할 객체 추가
			mav.setViewName("customerOrder/horizentalOrder");
		} else {
			System.out.println("비어dltdma");
			mav.setViewName("common/error");
		}

		return mav;
	}
	@RequestMapping(value="submitCusOrder.do")
	public String submitCusOrder(HttpServletRequest request, @RequestParam String isSalad, @RequestParam String main, @RequestParam String is15, @RequestParam String bread, @RequestParam String cheese,
			@RequestParam String topping, @RequestParam String isOvened, @RequestParam String vegi, @RequestParam String source, @RequestParam String side, @RequestParam String set) {
//		System.out.println("isSalad : " + isSalad);
//		System.out.println("main : " + main);
//		if(!bread.equals(null)) {
//			System.out.println("is15 :" + is15);
//			System.out.println("bread : " + bread); 
//		}
//		System.out.println("cheese : " + cheese);
//		System.out.println("topping : " + topping);
//		System.out.println("isOvened : " + isOvened);
//		System.out.println("vegi : " + vegi);
//		System.out.println("source : " + source);
//		System.out.println("side : " + side);
//		System.out.println("whichSet : " + set);
		HttpSession session = request.getSession(false);
		int cusoIdx = -1;
		Customer c = (Customer)session.getAttribute("customer");
		if(c == null) { // 비회원이 주문할 때
			session.invalidate(); 
		} else {
			cusoIdx = c.getCustomerNo();
		}
		//tset code
		Bucket buc = new Bucket(0/*bucIdx*/, cusoIdx, bread, main, vegi, cheese, source, topping, side, isSalad, isOvened, set, 
				8000/*cost*/, 0.0/*discntRate*/, 500/*Kcal*/, 1/*quantity*/, null/*Date*/);
		int result = cusOrderService.insertCusOrder(buc);
		if(result>0) {
			return "/customerOrder/bucketSuccess";
		} else {
			return "/common/error";
		}
	}
	
	@RequestMapping("/myBucket.do")
	public String loadMyBucket() {
		return "/customerOrder/myBucket";
	}
	

}
