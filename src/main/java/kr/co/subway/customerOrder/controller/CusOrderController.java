package kr.co.subway.customerOrder.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.subway.customer.vo.Customer;
import kr.co.subway.customerOrder.service.CusOrderService;
import kr.co.subway.customerOrder.vo.Bucket;
import kr.co.subway.customerOrder.vo.UpdateQuantity;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.manager.vo.Mgr;

@Controller
public class CusOrderController {
	@Autowired
	private CusOrderService cusOrderService;
	///매개변수로 지점명
	@RequestMapping("/cusOrder.do")
	public ModelAndView loadCusOrder(@RequestParam int mgrNo) {
		ArrayList<IngreVo> ingreList = cusOrderService.ingreSelectAll();
		Mgr mgr = cusOrderService.mgrSelectOne(mgrNo);
		ModelAndView mav = new ModelAndView();
		if (!ingreList.isEmpty()) {
			mav.addObject("ingreList", ingreList); // view에서 사용할 객체 추가
			mav.addObject("mgr", mgr);
			mav.setViewName("customerOrder/horizentalOrder");
		} else {
			System.out.println("비어dltdma");
			mav.setViewName("common/error");
		}
		return mav;
	}

	//활성화 여부 ajax로 변경
	@ResponseBody
	@RequestMapping("/tempOrder.do")
	public void tempOrderInsert(HttpServletResponse response, Bucket b){
		b.setBucCusoIdx("0");
		int result = cusOrderService.tempOrderInsert(b);
		int bucIdx = cusOrderService.tempOrderSelect();
	//			System.out.println("controller updateIngreActive() result : "+result);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.setContentType("application/json");
			new Gson().toJson(bucIdx,response.getWriter());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			System.out.println("임시저장 성공");
		}else{
			System.out.println("임시저장 실패");
		}
	}
	@ResponseBody
	@RequestMapping("/tempOrderDelete.do")
	public void tempOrderDelete(HttpServletResponse response, @RequestParam String delIdx){
		int idx = Integer.parseInt(delIdx);
		int result = cusOrderService.tempOrderDelete(idx);
		
		if(result>0) {
			System.out.println("임시저장 성공");
		}else{
			System.out.println("임시저장 실패");
		}
	}
	@ResponseBody
	@RequestMapping("/updateQuantity.do")
	public void updateQuantity(HttpServletResponse response, @RequestParam int value, @RequestParam int idx){
		UpdateQuantity uq = new UpdateQuantity(value, idx);
		int result = cusOrderService.updateQuantity(uq);
		
		if(result>0) {
			System.out.println("수량 수정 성공");
		}else{
			System.out.println("수량 수정 실패");
		}
	}			
	@RequestMapping("/loadBucket.do")
	public ModelAndView loadBucket(HttpServletRequest request) {
		String customerIdx = "-1";
		HttpSession session = request.getSession(false);
		Customer c = (Customer)session.getAttribute("customer");
		if(c != null) {
			customerIdx = String.valueOf(c.getCustomerNo());
		} else {
			Cookie[]getCookie = request.getCookies();
			customerIdx = getCookie[2].getValue();
			
		}

		ArrayList<Bucket> list = cusOrderService.allOrderList(customerIdx);
		
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("/customerOrder/bucket");	
		} else {
			mav.addObject("list",list);
			mav.setViewName("/customerOrder/bucket");	
		}
		return mav;
	}
	
	
}
