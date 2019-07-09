package kr.co.subway.sales.statics.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.sales.statics.dao.SalesStaticsDao;
import kr.co.subway.sales.statics.vo.SalesStaticsGrpVo;

@Service("salesStaticsService")
public class SalesStaticsService {
	@Autowired
	private SalesStaticsDao dao;

	//그래프 테스트
	public ArrayList<SalesStaticsGrpVo> getSales() {
		ArrayList<SalesStaticsGrpVo> list = (ArrayList<SalesStaticsGrpVo>)dao.getSales();
		return list;
	}
}
