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
	
	
	//재료 등록페이지로
	public int ingreReg(IngreVo iv) {
		return sqlSession.insert("ingre.ingreReg",iv);
	}

	//조건에 따른 재료 개수 구하기
	public int ingreTotalCount(String searchType, String searchVal) {
		System.out.println(searchType);
		System.out.println(searchVal);
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchVal", searchVal);
		return sqlSession.selectOne("ingre.ingreTotalCount",map);
	}
	
	//재료 전체 리스트
	public List ingreSelectAll(PageBound pb, String searchType, String searchVal) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", Integer.toString(pb.getStart()));
		map.put("end", Integer.toString(pb.getEnd()));
		map.put("searchType", searchType);
		map.put("searchVal", searchVal);
		return sqlSession.selectList("ingre.ingreSelectAll",map);
	}
	
	//재료 활성화 여부 업데이트
	public int updateIngreActive(String ingreActive, String ingreIdx) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("ingreActive", ingreActive);
		map.put("ingreIdx", ingreIdx);
		return sqlSession.update("ingre.updateIngreActive",map);
	}
	
	//재료 카테고리에 따른 컬럼 가져오기
	public List ingreType() {
		return sqlSession.selectList("ingre.getIngreType");
	}

	//재료 업데이트 페이지로
	public IngreVo goUpdateIngre(String ingreIdx) {
		return sqlSession.selectOne("ingre.goIngreUpdate",ingreIdx);
	}
	
	//재료 업데이트
	public int ingreUpdate(IngreVo iv) {
		return sqlSession.update("ingre.ingreUpdate",iv);
	}
	
	//재료 삭제
	public int ingreDelete(String ingreIdx) {
		return sqlSession.delete("ingre.ingreDelete",ingreIdx);
	}

	//엑셀 다운로드 할 리스트 가져오기
		public List ingreSelectAll(String searchType, String searchVal) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchType", searchType);
			map.put("searchVal", searchVal);
			return sqlSession.selectList("ingre.ingreListExcel",map);
		}


	
}
