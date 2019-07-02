package kr.co.subway.managerOrder.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.common.SearchVO;
import kr.co.subway.managerOrder.vo.ManagerItemVO;
import kr.co.subway.managerOrder.vo.ManagerOrderVO;


@Repository
public class ManagerOrderDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int totalCount(SearchVO search) {
		return sqlSession.selectOne("managerOrder.totalCount");
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

	public List selectItem(String no) {
		return sqlSession.selectList("managerOrder.selectItem",no);
	}

	

}
