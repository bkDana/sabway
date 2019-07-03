package kr.co.subway.headOffice.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.subway.headOffice.service.ApplyService;
import kr.co.subway.headOffice.vo.Apply;
import net.sf.json.JSONObject;

@Controller
public class PromotionController {
	@Resource(name="applyService")
	ApplyService applyService;
	
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
	public ModelAndView applyList(HttpServletRequest request) {
		ArrayList<Apply> list = (ArrayList<Apply>) applyService.applyList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("headOffice/managerApply");
		}
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/apply.do",produces="text/html;charset=utf-8")
	public String applyManager(@RequestParam String applyName, @RequestParam int applyStatus) {
		JSONObject obj = new JSONObject();
		if(applyName!=null) {
			if(applyStatus == 1) {
				//승인(status 1일 때)
				applyService.applyManagerUpdate(applyName,applyStatus);
				obj.put("result", 0);
			}else if(applyStatus==2) {
				//거절(status 2일 때)
				applyService.applyManagerUpdate(applyName,applyStatus);
				obj.put("result", 0);
			}
		}else {
			obj.put("result", 1);
		}
		return new Gson().toJson(obj);
	}	
	@RequestMapping(value="/applyView.do")
	public String applyView(@RequestParam int applyNo,Model model) {
		Apply ap = applyService.applyView(applyNo);
		if(ap != null) {
			model.addAttribute("ap",ap);
		}
		return "headOffice/applyView";
	}
	
}
