package kr.co.subway.headOffice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.headOffice.vo.Menu;
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
}
