package kr.co.subway.managerOrder.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.co.subway.common.SearchVO;
import kr.co.subway.customer.vo.Customer;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.managerOrder.service.ManagerOrderService;
import kr.co.subway.managerOrder.vo.ManagerItemVO;
import kr.co.subway.managerOrder.vo.ManagerOrderListVO;
import kr.co.subway.managerOrder.vo.ManagerOrderVO;

@Controller
public class ManagerOrderController {
	
	@Autowired
	private ManagerOrderService service;
	
	
	/* 발주 리스트 조회(검색 페이지도 동일) */
	@RequestMapping("/managerOrder/orderList.do")
	public String orderList(Model model, HttpServletRequest request) {
		int reqPage;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		}catch (Exception e) {
			reqPage = 1;
		}
		int state;
		try {
			state = Integer.parseInt(request.getParameter("state"));
		}catch (Exception e) {
			state=-1;
		}
		
		String id = "";
		HttpSession session = request.getSession(false);
		if(session.getAttribute("customer")!=null) {
			id = ((Customer)session.getAttribute("customer")).getCustomerId();//TODO 여기는 나중에 관리자 id로 바꿔서 받아와야함
		}else {
			id = "admin";
		}
		String startDay = request.getParameter("startDay");
		String endDay = request.getParameter("endDay");
		String delDay = request.getParameter("delDay");

		String searchType = request.getParameter("searchType");
		String searchVal = request.getParameter("searchVal");
		
		/* 기본 검색 기간 1개월로 설정 */
		Date today = new Date();
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		if(startDay == null) {
			Date sday = new Date();
			sday.setMonth(sday.getMonth()-1);
			
			startDay = f.format(sday);
		}
		if(endDay == null) {
			endDay = f.format(today);
		}
		
		
		//SearchVO search = new SearchVO(reqPage, 0,0,0,id);
		SearchVO search = new SearchVO(reqPage, state, 0, 0, id, startDay, endDay, delDay, searchType, searchVal);
		
		ManagerOrderListVO list = service.selectList(search);
		model.addAttribute("search", search);
		model.addAttribute("list", list);
		return "admin/managerOrder/orderList";
	}
	
	/* 발주서 등록 페이지 이동 */
	@RequestMapping("/managerOrder/orderRegister.do")
	public String orderRegister() {
		return "admin/managerOrder/orderRegister";
	}
	
	
	/* 발주서 등록  */
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
		/* 타이틀 만들기 */
		if(cnt==1) {
			mOrderTitle = request.getParameter("name_1").split("\\(")[0];
		}else {
			mOrderTitle = (request.getParameter("name_1")).split("\\(")[0]+" 외 "+(cnt-1)+"개";
		}
		
		service.addOrder(new ManagerOrderVO(mOrderNo, mOrderManagerId, mOrderTitle, mOrderDelDate,itemList));
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
	
	/*
	 *보경이꺼 써서 지웠다
	@ResponseBody
	@RequestMapping("/getType.do")
	public void selectType(HttpServletResponse response) throws JsonIOException, IOException {
		
		ArrayList<String> list = service.selectType();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	*/
	@ResponseBody
	@RequestMapping("/getIngre.do")
	public void selectIngre(HttpServletResponse response, @RequestParam String type) throws JsonIOException, IOException {
		
		ArrayList<IngreVo> list = service.selectIngre(type);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	
	/* 발주상태 업데이트 */
	@ResponseBody
	@RequestMapping("/managerOrder/updateState.do")
	public void updateState(HttpServletResponse response, String no, String st) throws JsonIOException, IOException {	
		int result = service.updateState(new ManagerOrderVO(no,Integer.parseInt(st)));

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(result,response.getWriter());
	}
	
	//@Scheduled(cron="1 50 16 * * *")
	//@Scheduled(cron="1 1 8 * * *")
	@RequestMapping("/managerOrder/test.do")
	public void deliveryEnd() {
		
		/* 오늘날짜 구해서 세팅 */
		SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
		String endDay = f.format(new Date());
		SearchVO search = new SearchVO();
		search.setDelDay(endDay);
		
		/* 발주서 상태 도착으로 변경 */
		int result = service.deliveryEnd(search);
		System.out.println("["+endDay+"] 총 "+result+"개의 발주상태 변경");
		
		/* 재고 수량 추가 */
		int result2 = service.addStock(search);
		System.out.println("추가된 재고"+result2);
	}
	


}
