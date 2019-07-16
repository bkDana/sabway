package kr.co.subway.customerOrder.controller;

import java.io.IOException;
import java.util.ArrayList;

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

	//활성화 여부 ajax로 변경
	@ResponseBody
	@RequestMapping("/tempOrder.do")
	public void tempOrderInsert(HttpServletResponse response, Bucket b){
		
		b.setBucCusoIdx(123123);
		b.setBucCustomerIdx(1111);
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
				
	@RequestMapping("/loadBucket.do")
	public ModelAndView loadBucket(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer c = (Customer)session.getAttribute("customer");
		int customerIdx = c.getCustomerNo();
		ArrayList<Bucket> list = cusOrderService.allOrderList(customerIdx);
		
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("/customerOrder/myOrderList");	
		} else {
			mav.setViewName("/common/error");
		}
		return mav;
	}

}
