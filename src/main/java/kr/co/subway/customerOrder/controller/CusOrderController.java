package kr.co.subway.customerOrder.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping("/myOrderInfo.do")
	public ModelAndView loadMyOrder(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer c = (Customer)session.getAttribute("customer");
		int customerIdx = c.getCustomerNo();
		ArrayList<Bucket> list = cusOrderService.allOrderList(customerIdx);
		for(Bucket b : list) {
			String main = b.getBucMain();
			IngreVo ingre = new IngreVo();
			ingre.setIngreType("메인재료");
			ingre.setIngreIdx(Integer.parseInt(main));
			IngreVo mainIngre = cusOrderService.selectCostMain(ingre); 
			b.setBucMain("/resources/upload/ingredients/"+mainIngre.getIngreFilepath());
	
		}

		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("/customerOrder/myOrderList");	
		} else {
			mav.setViewName("/common/error");
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
//			System.out.println("controller updateIngreActive() result : "+result);
			response.setContentType("text/html;charset=utf-8");
			try {
				response.setContentType("application/json");
				new Gson().toJson("result",response.getWriter());
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
	
	@RequestMapping("/loadBucket.do")
	public ModelAndView loadBucket (HttpServletRequest request, Bucket b) {
		
		HttpSession session = request.getSession(false);
		int customerIdx = -1;
		Customer c = (Customer)session.getAttribute("customer");
		if(c == null) { // 비회원이 주문할 때
			session.invalidate(); 
		} else {
			customerIdx = c.getCustomerNo();
		}
		b.setBucCustomerIdx(customerIdx);
		int result = cusOrderService.insertBucket(b);
		System.out.println("/loadBucket.do : " + result);
		ArrayList<Bucket> list = cusOrderService.allOrderList(b.getBucCustomerIdx());
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("/customerOrder/bucket");	
		} else {
			mav.setViewName("/common/error");
		}
		return mav;
	}

}
