package kr.co.subway.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.subway.common.SearchVO;
import kr.co.subway.ingreManage.service.IntroMenuService;
import kr.co.subway.ingreManage.vo.IngreVo;
import kr.co.subway.notice.service.BoardService;
import kr.co.subway.notice.vo.PageNaviData;


@Controller
public class PageController {
	
	@Autowired
	private BoardService boardService;//관리자 서비스
	
	@Autowired
	private IntroMenuService menuService;
	
	@RequestMapping("/admin.do")
	public String movePage(HttpSession session) {
		if(session.getAttribute("mgr")==null) {
			System.out.println("로그인 해라@@@!!!!");
			return "redirect:/loginAdmin.do";
		}else {
			//return "admin/index";
			return "redirect:/allCustomerList.do";
		}
	}
	
	@RequestMapping("/main.do")
	public String moveMain(Model model,SearchVO search) {
		
		/* 메인에 공지사항 3개 노출 */
		search.setReqPage(1);
		search.setType("notice");
		PageNaviData pd = boardService.boardList(search);
		model.addAttribute("notice", pd.getNoticeList().subList(0, 3));//리스트에서 3개만 보내기
		
		IngreVo ingre = new IngreVo();
		ingre.setIngreType("메인재료");
		ArrayList<IngreVo> list = menuService.introMenu(ingre);
		model.addAttribute("menu",list);
		return "main";
	}
	
	
	
}
