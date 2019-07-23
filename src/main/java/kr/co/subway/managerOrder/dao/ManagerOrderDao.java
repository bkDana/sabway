package kr.co.subway.managerOrder.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.common.SearchVO;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.managerOrder.vo.ManagerItemVO;
import kr.co.subway.managerOrder.vo.ManagerOrderVO;
import kr.co.subway.managerOrder.vo.StockVO;


@Repository
public class ManagerOrderDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int totalCount(SearchVO search) {
		return sqlSession.selectOne("managerOrder.totalCount",search);
	}
	
	public List selectList(SearchVO search){
		return sqlSession.selectList("managerOrder.selectList",search);
	}

	public int addOrder(ManagerOrderVO managerOrderVO) {
		return sqlSession.insert("managerOrder.addOrder",managerOrderVO);
	}

	public int addItem(ArrayList<ManagerItemVO> itemList) {
		int result = 0;
		for (ManagerItemVO item : itemList) {
			result += sqlSession.insert("managerOrder.addItem",item);
		}
		return result;
	}

	public ManagerOrderVO selectOrder(String no) {
		return sqlSession.selectOne("managerOrder.selectOrder",no);
	}

	/* 발주서에 등록된 물품 가져오기 */
	public List selectItem(String no) {
		return sqlSession.selectList("managerOrder.selectItem",no);
	}
/*
	public List selectType() {
		return sqlSession.selectList("managerOrder.selectType");
	}
*/
	/* 메뉴관리에 있는 메뉴 가져오기 */
	public List selectIngre(String type) {
		return sqlSession.selectList("managerOrder.selectIngre",type);
	}

	/* 상태 변경 */
	public int updateState(ManagerOrderVO mo) {
		return sqlSession.update("managerOrder.updateState",mo);
	}

	public int deliveryEnd(SearchVO search) {
		return sqlSession.update("managerOrder.deliveryEnd",search);
	}

	public List delStock(SearchVO search) {
		return sqlSession.selectList("managerOrder.delStock",search);
	}
	
	public StockVO findStock(StockVO stock) {
		return sqlSession.selectOne("managerOrder.findStock",stock);
	}
	
	public int insertStock(StockVO stock) {
		return sqlSession.insert("managerOrder.insertStock",stock);
	}
	
	public int updateStock(StockVO stock) {
		return sqlSession.update("managerOrder.updateStock",stock);
	}

	public int updateBucket(String bucketCookie, String customerId) {
		Map<String, String> val = new HashMap<String, String>();
		val.put("bucketCookie", bucketCookie);
		val.put("customerId", customerId);
		return sqlSession.update("managerOrder.updateBucket",val);
	}

	

}
