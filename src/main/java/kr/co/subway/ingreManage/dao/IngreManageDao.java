package kr.co.subway.ingreManage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.notice.vo.PageBound;

@Repository("menuManageDao")
public class IngreManageDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	//재료 등록하기
	public int ingreReg(IngreVo iv) {
		return sqlSession.insert("ingre.ingreReg",iv);
	}

	//재료 전체 개수 구하기
	public int ingreTotalCount(String searchType, String searchVal) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchVal", searchVal);
		return sqlSession.selectOne("ingre.ingreTotalCount",map);
	}
	
	//재료 전체 목록 가져오기
	public List ingreSelectAll(PageBound pb, String searchType, String searchVal) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", Integer.toString(pb.getStart()));
		map.put("end", Integer.toString(pb.getStart()));
		map.put("searchType", searchType);
		map.put("searchVal", searchVal);
		return sqlSession.selectList("ingre.ingreSelectAll",map);
	}

	//재료 리스트 페이지에서 검색박스에서 재료 카테로기 선택시 하위 값 가져오기
	public List ingreType() {
		return sqlSession.selectOne("ingre.getIngreType");
	}

	
}
