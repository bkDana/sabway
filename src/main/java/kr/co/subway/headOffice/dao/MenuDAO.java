package kr.co.subway.headOffice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.headOffice.vo.ApplyMenuPageBound;
import kr.co.subway.ingreManage.vo.IngreVo;

@Repository("menuDao")
public class MenuDAO {
	@Autowired
	private SqlSession session;
	//메뉴목록
	public List<IngreVo> menuList() {
		return session.selectList("ingre.ingreMainList");
	}
	//할인 및 할인율 수정
	public int updateIngre(IngreVo ingre) {
		return session.update("ingre.updateIngre",ingre);
	}
	//메인재료 list 개수
	public int menuListTotalCount(String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		return session.selectOne("ingre.menuListTotalCount",map);
	}
	//메뉴(메인재료) list 페이징
	public List<IngreVo> menuListPaging(ApplyMenuPageBound pb) {
		return session.selectList("ingre.menuListPaging",pb);
	}
}
