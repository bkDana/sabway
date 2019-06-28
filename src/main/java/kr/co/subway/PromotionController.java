package kr.co.subway;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PromotionController {
	@RequestMapping(value="promotionSelect.do")
	public String promotion() {
		return "admin/SelectPromotion";
	}
	@RequestMapping(value="selectPromotion.do")
	public String selectPromotion(@RequestParam String prdName, @RequestParam int price, @RequestParam double promotion) {
		System.out.println(prdName+" : "+price);
		System.out.println("할인율 : "+(int)Math.floor(100-(promotion*100))+"%");
		System.out.println(prdName+" : "+(int)Math.floor(price*promotion)+"원");
		return "redirect:/index.jsp";
	}
}
