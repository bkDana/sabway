package kr.co.subway.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.subway.notice.service.NoticeService;
import kr.co.subway.notice.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	@Qualifier(value="noticeService")
	private NoticeService noticeService;
	
	@RequestMapping("/notice.do")
	public ModelAndView noticeSelectAll() {
		ArrayList<Notice> noticeList = noticeService.noticeSelectAll();
		ModelAndView mav = new ModelAndView();
		System.out.println(noticeList.get(0).getNoticeNo());
		 if(!noticeList.isEmpty()) {
	          mav.addObject("noticeList",noticeList);   //view에서 사용할 객체 추가
	          mav.setViewName("notice/notice");
	       }else {
	          mav.setViewName("common/error");
	       }
		
		return mav;
	}
	
	@RequestMapping("/noticeOne.do")
	public ModelAndView noticeSelectOne() {
		ArrayList<Notice> noticeList = noticeService.noticeSelectAll();
		ModelAndView mav = new ModelAndView();
		System.out.println(noticeList.get(0).getNoticeNo());
		 if(!noticeList.isEmpty()) {
	          mav.addObject("noticeList",noticeList);   //view에서 사용할 객체 추가
	          mav.setViewName("notice/notice");
	       }else {
	          mav.setViewName("common/error");
	       }
		
		return mav;
	}
}
