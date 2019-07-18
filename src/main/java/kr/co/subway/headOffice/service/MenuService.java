package kr.co.subway.headOffice.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.customerOrder.vo.CusOrder;
import kr.co.subway.customerOrder.vo.CusOrderPageBound;
import kr.co.subway.customerOrder.vo.CusOrderPageData;
import kr.co.subway.headOffice.dao.MenuDAO;
import kr.co.subway.headOffice.vo.ApplyMenuPageBound;
import kr.co.subway.headOffice.vo.ApplyMenuPageData;
import kr.co.subway.headOffice.vo.ApplyPageBound;
import kr.co.subway.headOffice.vo.ApplyPageData;
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
	//메뉴목록 페이징
	public ApplyMenuPageData menuListPaging(int currentPage1){
		String pageNavi = "";
		int numPerPage = 10;
		int pageNaviSize = 5;
		String keyword = "메인재료";
		int totalCount = menudao.menuListTotalCount(keyword);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage1-1)*numPerPage+1;
		int end = currentPage1*numPerPage;
		ApplyMenuPageBound pb = new ApplyMenuPageBound(start,end,keyword);
		ArrayList<IngreVo> list = (ArrayList<IngreVo>) menudao.menuListPaging(pb);
		int pageNo = ((currentPage1-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage1 != 1) {
			pageNavi += "<a href='/promotionSelect.do?currentPage="+(currentPage1-1)+"'>이전</a>&nbsp;";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(currentPage1 == pageNo) {
				pageNavi += "&nbsp;<span style='color:black;font-size:20px;'>"+pageNo+"</span>&nbsp;";
			}else {
				pageNavi += "&nbsp;<a href='/promotionSelect.do?currentPage="+pageNo+"'>"+pageNo+"<a/>&nbsp;";
			}
			pageNo++;
		}
		if(currentPage1 < totalPage) {
			pageNavi += "&nbsp;<a href='/promotionSelect.do?currentPage="+(currentPage1+1)+"'>다음</a>";
		}
		return new ApplyMenuPageData(list,pageNavi,totalCount);
	}
	//검색목록 페이징
	public ApplyMenuPageData searchPromotion(int currentPage1,String keyword){
		String pageNavi = "";
		int numPerPage = 10;
		int pageNaviSize = 5;
		int totalCount = menudao.menuListTotalCount(keyword);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage1-1)*numPerPage+1;
		int end = currentPage1*numPerPage;
		ApplyMenuPageBound pb = new ApplyMenuPageBound(start,end,keyword);
		ArrayList<IngreVo> list = (ArrayList<IngreVo>) menudao.menuListPaging(pb);
		int pageNo = ((currentPage1-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage1 != 1) {
			pageNavi += "<a href='/promotionSelect.do?currentPage="+(currentPage1-1)+"'>이전</a>&nbsp;";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(currentPage1 == pageNo) {
				pageNavi += "&nbsp;<span style='color:black;font-size:20px;'>"+pageNo+"</span>&nbsp;";
			}else {
				pageNavi += "&nbsp;<a href='/promotionSelect.do?currentPage="+pageNo+"'>"+pageNo+"<a/>&nbsp;";
			}
			pageNo++;
		}
		if(currentPage1 < totalPage) {
			pageNavi += "&nbsp;<a href='/promotionSelect.do?currentPage="+(currentPage1+1)+"'>다음</a>";
		}
		return new ApplyMenuPageData(list,pageNavi,totalCount);
	}
}
