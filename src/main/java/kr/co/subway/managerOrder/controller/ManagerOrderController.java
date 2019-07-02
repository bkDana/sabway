package kr.co.subway.managerOrder.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.subway.common.SearchVO;
import kr.co.subway.managerOrder.service.ManagerOrderService;
import kr.co.subway.managerOrder.vo.ManagerItemVO;
import kr.co.subway.managerOrder.vo.ManagerOrderListVO;
import kr.co.subway.managerOrder.vo.ManagerOrderVO;

@Controller
public class ManagerOrderController {
	
	@Autowired
	private ManagerOrderService service;
	
	@RequestMapping("/managerOrder/orderList.do")
	public String orderList(Model model, HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch (Exception e) {
			reqPage = 1;
		}
		SearchVO search = new SearchVO(reqPage, 0,0,0);
		ManagerOrderListVO list = service.selectList(search);
		model.addAttribute("list", list);
		return "admin/managerOrder/orderList";
	}
	
	@RequestMapping("/managerOrder/orderRegister.do")
	public String orderRegister() {
		return "admin/managerOrder/orderRegister";
	}
	
	@RequestMapping("/managerOrder/addOrder.do")
	public String addOrder(HttpServletRequest request) {
		
		String mOrderManagerId = request.getParameter("mOrderManagerId");
		String mOrderDelDate = request.getParameter("mOrderDelDate");

		SimpleDateFormat tt = new SimpleDateFormat("yyyyMMddHHmmss");
		String mOrderNo = mOrderManagerId+"_"+tt.format(new Date());
		/*
		System.out.println(mOrderNo);
		System.out.println(mOrderDelDate);
		System.out.println(mOrderManagerId);
		*/
		ArrayList<ManagerItemVO> itemList = new ArrayList<ManagerItemVO>();
		int cnt = 0;
		for(int i=1;;i++) {
			String idx = request.getParameter("idx_"+i);
			if(idx==null || idx.equals("")) break;			
			String name = request.getParameter("name_"+i);
			String amount = request.getParameter("amount_"+i);
			/*
			System.out.println("인덱스"+idx);
			System.out.println("상품명"+name);
			System.out.println("수량"+amount);
			*/
			itemList.add(new ManagerItemVO(0, mOrderNo, Integer.parseInt(idx), name, Integer.parseInt(amount)));
			cnt = i;
		}
		
		String mOrderTitle = ""; 
		if(cnt==1) {
			mOrderTitle = request.getParameter("name_1");
		}else {
			mOrderTitle = request.getParameter("name_1")+" 외 "+(cnt-1)+"개";
		}
		int result = service.addOrder(new ManagerOrderVO(mOrderNo, mOrderManagerId, mOrderTitle, mOrderDelDate,itemList));
		if(result>0) {
			System.out.println("성공?");
		}else {
			System.out.println("실패");
		}
		
		return "redirect:/managerOrder/orderList.do";
	}
	
	
	@RequestMapping("/managerOrder/orderView.do")
	public String orderView(@RequestParam String no, Model model) {
		ManagerOrderVO order = service.selectOrder(no);
		model.addAttribute("order", order);
		return "admin/managerOrder/orderView";
	}
			
			
	@RequestMapping("/managerOrder/stockList.do")
	public String stockList() {
		return "admin/managerOrder/stockList";
	}

}
