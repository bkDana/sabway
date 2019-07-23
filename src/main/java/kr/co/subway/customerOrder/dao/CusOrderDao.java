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
	public int totalCount(Mgr mgr) {
		return sqlSession.selectOne("cusOrder.totalCount",mgr);
	}
	//체크박스의 값에 맞는 리스트 가져오기
	public List<CusOrder> checkedCusoOrderList(CusOrderPageBound pb){
		return sqlSession.selectList("cusOrder.checkedCusoOrderList",pb);
	}
	//선택한 체크박스의 list 개수 가져오기
	public int checkedTotalCount(String cusoMemberNo,Mgr mgr) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cusoMemberNo", cusoMemberNo);	
		map.put("mgrName", mgr.getMgrBossName());
		map.put("mgrLevel", mgr.getMgrLevel());
		return sqlSession.selectOne("cusOrder.checkedTotalCount",map);
	}
	//검색어와 일치하는 리스트 가져오기
	public List<CusOrder> orderSearchKeyword(CusOrderPageBound pb){
		return sqlSession.selectList("cusOrder.orderSearchKeyword",pb);
	}
	//검색어와 일치하는 list 개수 가져오기
	public int searchKeywordTotalCount(String keyword,Mgr mgr) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("mgrName", mgr.getMgrBossName());
		map.put("mgrLevel", mgr.getMgrLevel());
		return sqlSession.selectOne("cusOrder.searchKeywordTotalCount",map);
	}
	public int insertMyMenu(MyMenu mm) {
		return sqlSession.insert("mymenu.insertMyMenu",mm);
	}

	// bucket조인용 리스트
	public List<MyMenu> selectMyMenuList(String customerNo) {
		return sqlSession.selectList("mymenu.selectMyMenuList",customerNo);
	}

	public List loadMenuList(ArrayList<MyMenu> menuList) {//customerNo에서 menuList로 바꿔야함
		ArrayList<Bucket> resultList = new ArrayList<Bucket>();
		for(MyMenu mm:menuList) {
			Bucket b = sqlSession.selectOne("bucket.loadMyMenu",mm);
			System.out.println(b.getBucIdx());
			resultList.add(b);
		}
		return resultList;
	}

	public int myMenuDelete(int idx) {
		return sqlSession.delete("mymenu.myMenuDelete",idx);
	}

	public CusOrder cusOrderInfo(String no) {
		return sqlSession.selectOne("cusOrder.cusOrderInfo",no);
	}

	public List cusOrderItem(String no) {
		return sqlSession.selectList("cusOrder.cusOrderItem",no);
	}

	public MyMenu selectOneMenu(int bucIdx) {

		return sqlSession.selectOne("mymenu.selectOneMenu",bucIdx);
	}

	public int hideFromBList(int bucIdx) {
		return sqlSession.update("bucket.hideFromBList",bucIdx);
	}

	public CusOrder selectOneCusOrder(String cusoOrderNo) {
		return sqlSession.selectOne("cusOrder.selectOneCusOrder",cusoOrderNo);
	}

	public int cancelOrder(String cusOrderNo) {
		return sqlSession.update("cusOrder.cancelOrder",cusOrderNo);
	}

}
