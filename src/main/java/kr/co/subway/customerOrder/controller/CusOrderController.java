package kr.co.subway.customerOrder.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.subway.customer.vo.Customer;
import kr.co.subway.customerOrder.service.CusOrderService;
import kr.co.subway.customerOrder.vo.Bucket;
import kr.co.subway.customerOrder.vo.CusOrder;
import kr.co.subway.customerOrder.vo.CusOrderPageData;
import kr.co.subway.customerOrder.vo.MyMenu;
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
	@RequestMapping("/insertBucFromMyMenu")
	public String insertBucFromMM(String branchName, String cost, String cNo, String bread, String main, String vegi, String cheese, String topping, 
			String source, String isSalad, String isOvened, String set, String side, String kcal, String quantity ) {
		System.out.println("cost:"+cost+" / kcal:"+kcal+" / quantity:"+quantity );
		Bucket b = new Bucket(0, cNo, "0", bread, main, vegi, cheese, source, topping, side, isSalad, isOvened, set, Integer.parseInt(cost), 0.0, Integer.parseInt(kcal), Integer.parseInt(quantity), null, branchName, true);
		int result = cusOrderService.tempOrderInsert(b);
		if(result>0) {
			System.out.println("임시저장 성공");
		}else{
			System.out.println("임시저장 실패");
		}
		return "redirect:/loadBucket.do";
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
			for(int i = 0; i<getCookie.length; i++) {
				System.out.println(getCookie[i].getName() +" "+  getCookie[i].getValue());
				if(getCookie[i].getName().equals("sabwayNoneCustomer")) {
					customerIdx = getCookie[i].getValue();
				}
			}
			System.out.println("비회원 임시번호 " + customerIdx);
		}

		ArrayList<Bucket> list = cusOrderService.loadBucketList(customerIdx);
		//'나만의 메뉴'에 추가된 항목인지 검사
		for(int i = 0; i<list.size(); i++) {
			Bucket b = list.get(i);
			int bucIdx = b.getBucIdx();
			boolean isOnMM = cusOrderService.checkMM(bucIdx);
			b.setBucChkMM(isOnMM);

		}
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",list);
		mav.setViewName("/customerOrder/bucket");	

		return mav;
	}
	
	//주문정보, 버킷에 주문번호 추가하는 메소드
	@RequestMapping("/insertOrder.do")
	public ModelAndView insertItem(HttpServletRequest request, String cusoOrderState, String cusoTotalCost,
			String cusoPhone, String cusoMemberNo, String cusoCallBy, String cusoOrderNo, String cusoBranchName) {
		ModelAndView mav = new ModelAndView();
		
		/* 회원 비회원 구분 */
		String customerIdx = "-1";
		HttpSession session = request.getSession(false);
		Customer c = (Customer)session.getAttribute("customer");
		if(c != null) {
			customerIdx = String.valueOf(c.getCustomerNo());
			String customerId = c.getCustomerId();
			if(!customerId.equals(cusoCallBy)) {
	
			}
		} else {
			Cookie[]getCookie = request.getCookies();
			for(int i = 0; i<getCookie.length; i++) {
				System.out.println(getCookie[i].getName() +" "+  getCookie[i].getValue());
				if(getCookie[i].getName().equals("sabwayNoneCustomer")) {
					customerIdx = getCookie[i].getValue();
				}
			}
		}
		
		ArrayList<Bucket> list = cusOrderService.loadBucketList(customerIdx); //버킷에 쓸 정보
		int cusoTCost = Integer.parseInt(cusoTotalCost);
		CusOrder cuso = new CusOrder(0,0, 0, cusoTCost, cusoPhone, cusoMemberNo, cusoOrderNo, cusoCallBy, cusoBranchName, null,null);
		int result = cusOrderService.insertCusOrder(cuso); // cusorder에 데이터 추가하기
		if(result>0) {
			for(Bucket b: list) {
				System.out.println(b.getBucIdx());
				System.out.println(cusoOrderNo);
				b.setBucCusoOrderNo(cusoOrderNo);

				int result1 = cusOrderService.updateOrder(b); // 주문번호 업데이트
				if(result1>0) {
					System.out.println("주문정보 저장 성공");
					System.out.println("버킷 업데이트 성공");
				}else{
					System.out.println("버킷 업데이트 실패");
				}
			}
			CusOrder tempCuso = cusOrderService.selectOneCusOrder(cusoOrderNo);
			mav.addObject("tempCuso", tempCuso);
			mav.setViewName("/customerOrder/orderSuccess");
			return mav;
		}else{
			System.out.println("주문정보 저장 실패");
			mav.setViewName("/common/error");
			return mav;
		}
		
	}
	
	//내 주문목록 가져오기(회원용)
	@RequestMapping("/loadOrderList.do")
	public ModelAndView loadOrderList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String customerIdx = "-1";
		HttpSession session = request.getSession();
		Customer c = (Customer)session.getAttribute("customer");
		customerIdx = String.valueOf(c.getCustomerNo());

		ArrayList<CusOrder> orderList = cusOrderService.loadOrderList(customerIdx); // customerIdx = cusoMemberNo
		

		mav.addObject("list",orderList);
		mav.setViewName("customerOrder/oneCusOrder");

		return mav; 
	}
	
	//나만의 메뉴 생성
	@ResponseBody
	@RequestMapping("/insertMyMenu.do")
	public void insertMyMenu(HttpServletResponse response, MyMenu mm) {
		mm.setMmIdx(0);
		System.out.println(mm.getMmCustomerNo());
		System.out.println(mm.getMmMenuLabel());
		System.out.println(mm.getMmBucIdx());
		int result = cusOrderService.insertMyMenu(mm);
	//			System.out.println("controller updateIngreActive() result : "+result);
		response.setContentType("text/html;charset=utf-8");

		new Gson().toJson(String.valueOf(result));
		if(result>0) {
			System.out.println("임시저장 성공");
		}else{
			System.out.println("임시저장 실패");
		}
	}
	
	//나만의 메뉴 목록 불러오기(회원용)
	@RequestMapping("/loadMyMenu.do")
	public ModelAndView loadMyMenu(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Customer c = (Customer)session.getAttribute("customer");
		String customerNo = String.valueOf(c.getCustomerNo());
		ArrayList<MyMenu> menuList = cusOrderService.selectMyMenuList(customerNo);//join용
		ArrayList<Bucket> list = (ArrayList<Bucket>) cusOrderService.loadMenuList(menuList);

		mav.addObject("list",list);
		mav.setViewName("customerOrder/myMenuList");
		return mav; 
	}
	
	//회원 주문 목록 가져오기(관리자용)
	@RequestMapping("/cusOrderList.do")
	public ModelAndView cusOrderList(@RequestParam String currentPage,HttpSession session) {
		Mgr mgr = (Mgr) session.getAttribute("mgr");
		System.out.println("로그인 정보(이름) : "+mgr.getMgrBossName());
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch(Exception e) {
			currentPage1 = 1;
		}
		CusOrderPageData pd = cusOrderService.cusOrderList(currentPage1,mgr);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("pd",pd);
			mav.setViewName("customerOrder/cusOrderList");
		}catch(Exception e) {
			mav.setViewName("redirect:/");
		}
		return mav; 
	}
	//주문 상태 변경
	@RequestMapping("/orderStateUpdate.do")
	public String orderStateUpdate(CusOrder cuso) {
		int result = cusOrderService.orderStateUpdate(cuso);
		String view = "";
		if(result > 0) {
			view = "redirect:/cusOrderList.do?currentPage=''";
		}
		return view;
	}
	//체크박스의 값에 맞는 리스트 가져오기
	@RequestMapping("/checkedCusoOrderList.do")
	public ModelAndView checkedCusoOrderList(@RequestParam String currentPage,@RequestParam String cusoMemberNo,HttpSession session) {
		Mgr mgr = (Mgr) session.getAttribute("mgr");
		System.out.println("로그인 정보(이름) : "+mgr.getMgrBossName());
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch(Exception e) {
			currentPage1 = 1;
		}
		CusOrderPageData pd = cusOrderService.checkedCusoOrderList(currentPage1,cusoMemberNo,mgr);
		//view의 checkbox 순서 - 전체보기 : eq(0), 회원 : eq(1), 비회원 : eq(2)
		//db상 비회원은 0으로 설정, 처음에 값이 없어서 0이기 때문에 db값은 그대로 보내고 view에 전달하는 값에 +2해서 계산
		int checkBoxNo = 2+Integer.parseInt(cusoMemberNo);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("cusoMemberNo",checkBoxNo);
			mav.addObject("pd",pd);
			mav.setViewName("customerOrder/cusOrderList");
		}catch(Exception e) {
			mav.setViewName("redirect:/");
		}
		return mav; 
	}
	//검색어와 일치하는 리스트 가져오기
	@RequestMapping("/orderSearchKeyword.do")
	public ModelAndView searchKeyword(@RequestParam String currentPage,@RequestParam String keyword,HttpSession session) {
		Mgr mgr = (Mgr) session.getAttribute("mgr");
		System.out.println("로그인 정보(이름) : "+mgr.getMgrBossName());
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch(Exception e) {
			currentPage1 = 1;
		}
		CusOrderPageData pd = cusOrderService.orderSearchKeyword(currentPage1,keyword,mgr);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("keyword",keyword);
			mav.addObject("pd",pd);
			mav.setViewName("customerOrder/cusOrderList");
		}catch(Exception e) {
			mav.setViewName("redirect:/");
		}
		return mav; 
	}
	
	@RequestMapping("/cusOrderInfo.do")
	public String cusOrderInfo(String no, Model model) {
		/* 지영지영 추가 */
		CusOrder cusOrder = cusOrderService.cusOrderInfo(no);
		model.addAttribute("cusOrder", cusOrder);
		return "customerOrder/cusOrderInfo";
	}
		
	@ResponseBody
	@RequestMapping("/myMenuDelete.do")
	public void myMenuDelete(HttpServletResponse response, @RequestParam String delIdx){
		int idx = Integer.parseInt(delIdx);
		int result = cusOrderService.myMemuDelete(idx);
		
		if(result>0) {
			System.out.println("나만의메뉴 삭제 성공");
		}else{
			System.out.println("나만의메뉴 삭제실패");
		}
	}
	
	@ResponseBody
	@RequestMapping("/hideFromBucketList.do")
	public void hideFromBucketList(HttpServletResponse response, @RequestParam String delIdx) {
		int idx = Integer.parseInt(delIdx);
		int result = cusOrderService.hideFromBucketList(idx);
		
		if(result>0) {
			System.out.println("감추기 성공");
		}else{
			System.out.println("감추기 실패");
		}
	}
	
	@RequestMapping("/loadSearchStorePopup.do")
	public String loadSearchStorePopup() {
		return "/customerOrder/searchStorePopup";
	}
	
	@RequestMapping("/toMain.do")
	public String toMain() {
		return"/main";
	}
}
