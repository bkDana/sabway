package kr.co.subway.headOffice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import net.sf.json.JSONObject;

@Controller
public class PromotionController {
	@RequestMapping(value="/promotionSelect.do")
	public String promotion() {
		return "headOffice/SelectPromotion";
	}
	@RequestMapping(value="/selectPromotion.do")
	public String selectPromotion(@RequestParam String prdName, @RequestParam int price, @RequestParam double promotion) {
		String name="이름";
		System.out.println(prdName+" : "+price);
		System.out.println("할인율 : "+(int)Math.floor(100-(promotion*100))+"%");
		System.out.println(prdName+" : "+(int)Math.floor(price*promotion)+"원");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/managerApply.do")
	public String managerApply() {
		return "headOffice/managerApply";
	}
	@ResponseBody
	@RequestMapping(value="/apply.do",produces="text/html;charset=utf-8")
	public String apply(@RequestParam String name) {
		// DB 변경 로직 추가 해야됨
		JSONObject obj = new JSONObject();
		if(name!=null) {
			obj.put("result", 0);
		}else {
			obj.put("result", 1);
		}
		return new Gson().toJson(obj);
	}
	@ResponseBody
	@RequestMapping(value="/reject.do",produces="text/html;charset=utf-8")
	public String reject(@RequestParam int status) {
		JSONObject obj = new JSONObject();
		if(status==2) {
			obj.put("result", 2);
		}
		return new Gson().toJson(obj);
	}
}
