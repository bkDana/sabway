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
		int result = menudao.updateIngre(ingre);
		return result;
	}
}
