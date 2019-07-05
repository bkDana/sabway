package kr.co.subway.headOffice.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.headOffice.dao.MenuDAO;
import kr.co.subway.headOffice.vo.Menu;

@Service("menuService")
public class MenuService {
	@Resource(name="menuDao")
	private MenuDAO menudao;
	//메뉴목록
	public List<Menu> menuList(){
		List<Menu> list = menudao.menuList();
		return (ArrayList<Menu>) list;
	}
	//할인 및 할인율 수정
	@Transactional
	public int updateMenu(Menu menu) {
		int result = menudao.updateMenu(menu);
		return result;
	}
}
