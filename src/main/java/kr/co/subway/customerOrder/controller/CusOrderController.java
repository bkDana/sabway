package kr.co.subway.customerOrder.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.subway.customer.vo.Customer;
import kr.co.subway.customerOrder.service.CusOrderService;
import kr.co.subway.customerOrder.vo.Bucket;
import kr.co.subway.customerOrder.vo.CusOrder;
import kr.co.subway.customerOrder.vo.Item;
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
		b.setBucCusoOrderNo("0");
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

		ArrayList<Bucket> list = cusOrderService.loadBucketList(customerIdx);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.setViewName("/customerOrder/bucket");	

		return mav;
	}
	
	//주문정보, 아이템을 추가하는 메소드
	@RequestMapping("/insertItem.do")
	public ModelAndView insertItem(HttpServletRequest request, String cusoOrderState,String cusoTotalCost,
			String cusoPhone, String cusoMemberNo, String cusoOrderNo, String cusoBranchName) {
		//test
		System.out.println(cusoMemberNo);
		
		String customerIdx = "-1";
		HttpSession session = request.getSession(false);
		Customer c = (Customer)session.getAttribute("customer");
		if(c != null) {
			customerIdx = String.valueOf(c.getCustomerNo());
		} else {
			Cookie[]getCookie = request.getCookies();
			customerIdx = getCookie[2].getValue();
		}
		ArrayList<Bucket> list = cusOrderService.loadBucketList(customerIdx); //아이템에 쓸 정보
		int cusoTCost = Integer.parseInt(cusoTotalCost);
		CusOrder cuso = new CusOrder(0, 0, cusoTCost, cusoPhone, cusoMemberNo, cusoOrderNo, cusoBranchName, null);
		int result = cusOrderService.insertCusOrder(cuso);
		if(result>0) {
			System.out.println("임시저장 성공");
		}else{
			System.out.println("임시저장 실패");
		}
		for(Bucket b: list) {
			System.out.println(b.getBucIdx());
<<<<<<< HEAD
			System.out.println(cusoOrderNo);
			b.setBucCusoOrderNo(cusoOrderNo);
=======
			b.setBucCusoIdx(cusoOrderNo);
>>>>>>> parent of 296863d... item 삭제
			int result1 = cusOrderService.updateOrder(b);
			if(result1>0) {
				System.out.println("버킷 업데이트 성공");
			}else{
				System.out.println("버킷 업데이트 실패");
			}
		}
		ArrayList<Bucket> listAfter = cusOrderService.loadBucketList(customerIdx); //테스트
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("listAfter",listAfter);
		mav.setViewName("/customerOrder/testSuccess");	

		return mav;
	}
	//새로운 주문을 추가하는 메소드
	
	
	
	//주문 목록 가져오기
	@RequestMapping("/cusOrderList.do")
	public ModelAndView cusOrderList() {
		ArrayList<CusOrder> list = (ArrayList<CusOrder>) cusOrderService.cusOrderList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("customerOrder/cusOrderList");
		}else {
			mav.setViewName("/");
		}
		return mav; 
	}
}
