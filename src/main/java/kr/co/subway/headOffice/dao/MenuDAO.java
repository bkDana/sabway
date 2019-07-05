package kr.co.subway.headOffice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.headOffice.vo.Menu;

@Repository("menuDao")
public class MenuDAO {
	@Autowired
	private SqlSession session;
	//메뉴목록
	public List<Menu> menuList() {
		return session.selectList("menu.menuList");
	}
	//할인 및 할인율 수정
	public int updateMenu(Menu menu) {
		return session.update("menu.updateMenu",menu);
	}
}
