package kr.co.subway.sales.statics.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.sales.statics.dao.SalesStaticsDao;
import kr.co.subway.sales.statics.vo.SalesStaticsGrpVo;

@Service("salesStaticsService")
public class SalesStaticsService {
	@Autowired
	private SalesStaticsDao dao;

	//전체 매출 가져오기
	public ArrayList<SalesStaticsGrpVo> totalSales() {
		ArrayList<SalesStaticsGrpVo> list = (ArrayList<SalesStaticsGrpVo>)dao.totalSales();
		return list;
	}

	//전체 매출페이지에서 선택한 월의 지점별 매출
	public ArrayList<SalesStaticsGrpVo> monthTotalSales(String orderMonth) {
		ArrayList<SalesStaticsGrpVo> list = (ArrayList<SalesStaticsGrpVo>)dao.monthTotalSales(orderMonth);
		return list;
	}

	//지점명 가져오기
	public List getBranch(String cusoBranch) {
		return dao.getBranch(cusoBranch);
	}

	//지점 매출현황 가져오기
	public ArrayList<SalesStaticsGrpVo> getBranchSales(String branchName) {
		ArrayList<SalesStaticsGrpVo> list = (ArrayList<SalesStaticsGrpVo>)dao.getBranchSales(branchName);
		return list;
	}
	
	
	//파이차트 부분
	//해당년도 전체 메뉴 판매 현황
	public ArrayList<SalesStaticsGrpVo> getTotalMenu() {
		ArrayList<SalesStaticsGrpVo> list = (ArrayList<SalesStaticsGrpVo>)dao.getTotalMenu();
		System.out.println(list.size());
		return list;
	}

	//해당 월 메뉴 판매 현황
	public ArrayList<SalesStaticsGrpVo> getMonthTotalMenu(SalesStaticsGrpVo ssg) {
		System.out.println("dao 선택 월 : "+ssg.getOrderMonth());
		ArrayList<SalesStaticsGrpVo> list = (ArrayList<SalesStaticsGrpVo>)dao.getMonthTotalMenu(ssg);
		return list;
	}

	//지점 당월 메뉴 판매현황, 선택한 월
	public ArrayList<SalesStaticsGrpVo> getBranchMenuSales(SalesStaticsGrpVo ssg) {
		ArrayList<SalesStaticsGrpVo> list = (ArrayList<SalesStaticsGrpVo>)dao.getBranchMenuSales(ssg);
		return list;
	}
}
