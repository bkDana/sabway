package kr.co.subway.headOffice.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.headOffice.dao.MenuDAO;
import kr.co.subway.headOffice.vo.Menu;
import kr.co.subway.ingreManage.vo.IngreVo;

@Service("menuService")
public class MenuService {
	@Resource(name="menuDao")
	private MenuDAO menudao;
	//메뉴목록
	public List<IngreVo> menuList(){
		List<IngreVo> list = menudao.menuList();
		return (ArrayList<IngreVo>) list;
	}
	//할인 및 할인율 수정
	@Transactional
	public int updateIngre(IngreVo ingre) {
		System.out.println("service : "+ingre.getIngreDiscntRate());
		System.out.println("service : "+ingre.getIngreLabel());
		System.out.println("service : "+ingre.getIngreType());
		int result = menudao.updateIngre(ingre);
		return result;
	}
//	//메뉴목록
//	public List<Menu> menuList(){
//		List<Menu> list = menudao.menuList();
//		return (ArrayList<Menu>) list;
//	}
//	//할인 및 할인율 수정
//	@Transactional
//	public int updateMenu(Menu menu) {
//		int result = menudao.updateMenu(menu);
//		return result;
//	}
}
