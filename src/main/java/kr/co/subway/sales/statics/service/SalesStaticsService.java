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
}
