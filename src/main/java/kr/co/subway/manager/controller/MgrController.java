package kr.co.subway.manager.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.co.subway.manager.service.MgrService;
import kr.co.subway.manager.vo.Mgr;

@Controller
public class MgrController {
	@Resource(name="mgrservice")
	MgrService mgrservice;

	@RequestMapping(value="//mgrEnroll.do")
	public String mgrEnroll() {
		ArrayList<Mgr> list = (ArrayList<Mgr>) mgrservice.mgrList();
		if(mg.getMgrName().equals(mgrName)) {
			mg.setMgrId(mgrId+1);
			mg.setMgrName(mgrName+1);
		}
		int result = mgrservice.enrollMgr(mg);
		System.out.println(mgrId);
		System.out.println(mgrName);
		
		return "redirect:/admin.do";
	}
}
