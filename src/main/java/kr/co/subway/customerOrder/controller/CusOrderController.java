package kr.co.subway.customerOrder.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value="submitCusOrder.do")
	public String submitCusOrder(HttpServletRequest request, @RequestParam String isSalad, @RequestParam String main, @RequestParam String is15, @RequestParam String bread, @RequestParam String cheese,
			@RequestParam String topping, @RequestParam String isOvened, @RequestParam String vegi, @RequestParam String source, @RequestParam String side, @RequestParam String set, @RequestParam String quantity) {
		String[] tpnArr; // 반복문용 문자열 배열 준비
		String[] sideArr;
		HttpSession session = request.getSession(false);
		int customerIdx = -1;
		Customer c = (Customer)session.getAttribute("customer");
		if(c == null) { // 비회원이 주문할 때
			session.invalidate(); 
		} else {
			customerIdx = c.getCustomerNo();
		}
																								//가격 정하기
		IngreVo ingre = new IngreVo();															// 메인재료 가격 받아올 객체생성
		ingre.setIngreType("메인재료");															// 가격 받기위한 필터 설정(1)
		ingre.setIngreIdx(Integer.parseInt(main));												// 가격 받기위한 필터 설정(2)
		IngreVo mainIngre = cusOrderService.selectCostMain(ingre); 								// 메인재료 가격 들어있는 객체
		int cost = 0;																			// totalCost 초기화
		if(is15.equals("1")) { 																	// if : 15cm일때
			cost += mainIngre.getIngreCost15();													// 15cm 가격 추가
			if(!topping.equals("00000000")) {													// topping (다중선택가능 -> 배열화하여 for 처리)
				tpnArr = topping.split("");														// 배열 만드는 과정
				for(int i = 0; i<tpnArr.length; i++) {											// i+1로 rownum테이블에서 가격 가져오는코드	
					if(tpnArr[i].equals("1")) {													// tpnArr[i]가 1이면													
						ingre.setIngreType("추가토핑");											// 토핑 가격 받아올 객체생성
						ingre.setIngreIdx(i+1);													// 가격 받기위한 필터 설정
						IngreVo toppingIngre = cusOrderService.selectCostMain(ingre);			// 추가토핑 가격 들어있는 객체
						cost += toppingIngre.getIngreCost15();									// totalCost에 토핑 가격 추가
					}
				}// for ends 
			}
			if(!side.equals("0000000000")) {													// side (다중선택가능 -> 배열화하여 for 처리)
				sideArr = side.split("");														// 배열 만드는 과정
				for(int i = 0; i<sideArr.length; i++) {											// i+1로 rownum테이블에서 가격 가져오는코드	
					if(sideArr[i].equals("1")) {
						//i+1로 rownum테이블에서 가격 가져오는코드
						ingre.setIngreType("사이드메뉴");
						ingre.setIngreIdx(i+1);
						IngreVo sideIngre = cusOrderService.selectCostMain(ingre);				// 사이드 가격 들어있는 객체
						cost += sideIngre.getIngreCost15();										// totalCost에 사이드 가격 추가
					}
				}// for ends
			}
			if(!quantity.equals("1")) {															// 수량이 1 이상이면
				int multiplier = Integer.parseInt(quantity);									// multiplier 설정
				cost *= multiplier;																// totalCost에 계수 곱하기
			}
			
		} else { 																				// 30cm일때 - 위와 같으나 30cm 가격을 받아옴
			cost += mainIngre.getIngreCost30();
			if(!topping.equals("00000000")) {
				tpnArr = topping.split("");
				for(int i = 0; i<tpnArr.length; i++) {
					if(tpnArr[i].equals("1")) {
						//i+1로 rownum테이블에서 가격 가져오는코드
						ingre.setIngreType("추가토핑");
						ingre.setIngreIdx(i+1);
						IngreVo toppingIngre = cusOrderService.selectCostMain(ingre);
						cost += toppingIngre.getIngreCost30();
					}
				}// for ends
			}
			if(!side.equals("0000000000")) {
				sideArr = side.split("");
				for(int i = 0; i<sideArr.length; i++) {
					if(sideArr[i].equals("1")) {
						//i+1로 rownum테이블에서 가격 가져오는코드
						ingre.setIngreType("사이드메뉴");
						ingre.setIngreIdx(i+1);
						IngreVo sideIngre = cusOrderService.selectCostMain(ingre);//추가토핑 가격 들어있는 객체
						cost += sideIngre.getIngreCost15();
					}
				}// for ends
			}	
			if(!quantity.equals("1")) {
				int multiflier = Integer.parseInt(quantity);
				cost *= multiflier;
			}
		}
		
		// test code : 실제로는 이 정보를 바탕으로 아임포트 연결해야하며, 결재 완료 시 '주문정보'와 '주문 아이템 or bucket' 테이블로 나뉘어 정보가 저장된다?
		Bucket buc = new Bucket(0/*bucIdx*/,customerIdx, 100/*cusOrderIdx */, bread, main, vegi, cheese, source, topping, side, is15, isSalad, isOvened, set, 
				cost/*cost*/, ingre.getIngreDiscntRate()/*discntRate*/, 500/*Kcal*/, Integer.parseInt(quantity), null/*Date*/);
		int result = cusOrderService.insertCusOrder(buc);
		if(result>0) {
			return "/customerOrder/bucketSuccess";
		} else {
			return "/common/error";
		}
	}
	
	@RequestMapping("/myBucket.do")
	public ModelAndView loadMyBucket(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Customer c = (Customer)session.getAttribute("customer");
		int customerIdx = c.getCustomerNo();
		ArrayList<Bucket> list = cusOrderService.allBucketList(customerIdx);
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
			mav.setViewName("/customerOrder/myBucket");	
		} else {
			mav.setViewName("/common/error");
		}
		return mav;
	}

}
