package kr.co.subway.customerOrder.dao;

import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.customerOrder.vo.Bucket;
import kr.co.subway.customerOrder.vo.CusOrder;
import kr.co.subway.customerOrder.vo.CusOrderPageBound;
import kr.co.subway.customerOrder.vo.CusOrderPageData;
import kr.co.subway.customerOrder.vo.MyMenu;
import kr.co.subway.customerOrder.vo.UpdateQuantity;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.manager.vo.Mgr;

@Repository("cusOrderDao")
public class CusOrderDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List ingreSelectAll() {
		return sqlSession.selectList("bucket.ingreSelectAll");
	}

	public List<Bucket> loadBucketList(String bucCustomerIdx) {
		return sqlSession.selectList("bucket.loadBucketList", bucCustomerIdx);
	}

	public IngreVo selectCostMain(IngreVo ingre) {
		return sqlSession.selectOne("ingre.selectOneMain", ingre);
	}
	
	public int tempOrderInsert(Bucket b) {
		return sqlSession.insert("bucket.tempOrderInsert", b);
	}


	public int tempOrderSelect() {
		return sqlSession.selectOne("bucket.tempOrderSelect");
	}
	
	public int tempOrderDelete(int idx) {
		return sqlSession.delete("bucket.tempOrderDelete",idx);
	}
	
	public Mgr mgrSelectOne(int mgrNo) {
		return sqlSession.selectOne("bucket.mgrSelectOne", mgrNo); 
	}
	
	public int updateQuantity(UpdateQuantity uq) {
		
		return sqlSession.update("bucket.updateQuantity", uq);
	}

	public int updateOrder(Bucket b) {
		return sqlSession.update("bucket.updateOrderNo", b);
	}
	//주문 목록 가져오기
	public List<CusOrder> cusOrderList(CusOrderPageBound pb){
		return sqlSession.selectList("cusOrder.cusOrderList",pb);
	}
	public int insertCusOrder(CusOrder cuso) {
		return sqlSession.insert("cusOrder.insertCuso",cuso);
	}
	//주문 상태 변경
	public int orderStateUpdate(CusOrder cuso) {
		return sqlSession.update("cusOrder.orderStateUpdate",cuso);
	}
	
	//회원용 주문목록
	public List<CusOrder> loadOrderList(String customerIdx) {
		return sqlSession.selectList("cusOrder.oneCusOrderList",customerIdx);
	}
	//list 개수 가져오기
	public int totalCount() {
		return sqlSession.selectOne("cusOrder.totalCount");
	}
	//체크박스의 값에 맞는 리스트 가져오기
	public List<CusOrder> checkedCusoOrderList(CusOrderPageBound pb){
		return sqlSession.selectList("cusOrder.checkedCusoOrderList",pb);
	}
	//선택한 체크박스의 list 개수 가져오기
	public int checkedTotalCount(String cusoMemberNo) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("cusoMemberNo", cusoMemberNo);	
		return sqlSession.selectOne("cusOrder.checkedTotalCount",map);
	}
	//검색어와 일치하는 리스트 가져오기
	public List<CusOrder> orderSearchKeyword(CusOrderPageBound pb){
		return sqlSession.selectList("cusOrder.orderSearchKeyword",pb);
	}
	//검색어와 일치하는 list 개수 가져오기
	public int searchKeywordTotalCount(String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);	
		return sqlSession.selectOne("cusOrder.searchKeywordTotalCount",map);
	}
	public int insertMyMenu(MyMenu mm) {
		return sqlSession.insert("mymenu.insertMyMenu",mm);
	}
}
