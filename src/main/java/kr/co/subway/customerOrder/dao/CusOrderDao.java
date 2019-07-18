package kr.co.subway.customerOrder.dao;

import java.util.ArrayList;
import java.util.List;

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

	public int insertMyMenu(MyMenu mm) {
		return sqlSession.insert("mymenu.insertMyMenu",mm);
	}

	// bucket조인용 리스트
	public List<MyMenu> selectMyMenuList(String customerNo) {
		return sqlSession.selectList("mymenu.selectMyMenuList",customerNo);
	}

	public List loadMenuList(String customerNo) {//customerNo에서 menuList로 바꿔야함
		return sqlSession.selectList("mymenu.loadMyMenu",customerNo);
	}

}
