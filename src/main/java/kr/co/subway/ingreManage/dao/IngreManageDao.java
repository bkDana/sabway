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
	
	
	//�옱猷� �벑濡앺븯湲�
	public int ingreReg(IngreVo iv) {
		return sqlSession.insert("ingre.ingreReg",iv);
	}

	//�옱猷� �쟾泥� 媛쒖닔 援ы븯湲�
	public int ingreTotalCount(String searchType, String searchVal) {
		System.out.println(searchType);
		System.out.println(searchVal);
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchVal", searchVal);
		return sqlSession.selectOne("ingre.ingreTotalCount",map);
	}
	
	//�옱猷� �쟾泥� 紐⑸줉 媛��졇�삤湲�
	public List ingreSelectAll(PageBound pb, String searchType, String searchVal) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", Integer.toString(pb.getStart()));
		map.put("end", Integer.toString(pb.getEnd()));
		map.put("searchType", searchType);
		map.put("searchVal", searchVal);
		return sqlSession.selectList("ingre.ingreSelectAll",map);
	}
	
	//�솢�꽦�솕�뿬遺� 蹂�寃쎌떆 �뾽�뜲�씠�듃�븯湲�
	public int updateIngreActive(String ingreActive, String ingreIdx) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("ingreActive", ingreActive);
		map.put("ingreIdx", ingreIdx);
		return sqlSession.update("ingre.updateIngreActive",map);
	}
	
	//�옱猷� 由ъ뒪�듃 �럹�씠吏��뿉�꽌 寃��깋諛뺤뒪�뿉�꽌 �옱猷� 移댄뀒濡쒓린 �꽑�깮�떆 �븯�쐞 媛� 媛��졇�삤湲�
	public List ingreType() {
		return sqlSession.selectList("ingre.getIngreType");
	}

	//�옱猷뚯젙蹂� 媛��졇�삤湲�
	public IngreVo goUpdateIngre(String ingreIdx) {
		return sqlSession.selectOne("ingre.goIngreUpdate",ingreIdx);
	}
	
	//�옱猷� �닔�젙�븯湲�
	public int ingreUpdate(IngreVo iv) {
		return sqlSession.update("ingre.ingreUpdate",iv);
	}
	
	//�옱猷� �궘�젣�븯湲�
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
