package kr.co.subway.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.subway.common.SearchVO;
import kr.co.subway.notice.service.BoardService;
import kr.co.subway.notice.service.NoticeService;
import kr.co.subway.notice.vo.Notice;
import kr.co.subway.notice.vo.PageNaviData;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/noticeList.do")
	public ModelAndView boardList(SearchVO search) {
		
		if(search.getReqPage()==0) {
			search.setReqPage(1);
		}
		PageNaviData pd = service.boardList(search);
		
		ModelAndView mav = new ModelAndView();
		if (!pd.getNoticeList().isEmpty()) {
			mav.addObject("noticeList", pd.getNoticeList());
			mav.addObject("pageNavi", pd.getPageNavi());
			mav.addObject("search", search);
			mav.setViewName("admin/board/notice/notice");
		} else {
			mav.setViewName("common/error");
		}

		return mav;
		
	}
	
	@RequestMapping("/noticeOne.do")
	public ModelAndView noticeSelectOne(@RequestParam int noticeNo) {
		ArrayList<Notice> noticeList = noticeService.noticeSelectAll();
		ModelAndView mav = new ModelAndView();
		 if(!noticeList.isEmpty()) {
		      mav.addObject("noticeNo",noticeNo);
	          mav.addObject("noticeList",noticeList);
	          mav.setViewName("admin/board/notice/noticeOne");
	       }else {
	          mav.setViewName("common/error");
	       }
		
		return mav;
	}
	
	@RequestMapping("/moveNoticeInsert.do")
	public String moveNoticeInsert() {
		return "admin/board/notice/noticeInsert";
	}
	
	@RequestMapping(value="/noticeInsert.do", method=RequestMethod.POST)
	public String noticeInsert(HttpServletRequest request, @RequestParam MultipartFile fileName, Notice n ) {
		String fullPath = "";
		if(!fileName.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
			String originName = fileName.getOriginalFilename();
			String onlyFileName = originName.substring(0, originName.indexOf('.'));
			String extension = originName.substring(originName.indexOf('.'));
			String filePath = onlyFileName+"_"+"1"+extension;
			fullPath = savePath+"/"+filePath;
			n.setFilename(originName);
			n.setFilepath(filePath);
		}else {
			n.setFilename("");
			n.setFilepath("");
		}
		
		int result = noticeService.noticeInsert(n);
		
		if(result>0) {
			System.out.println("작성 성공");
		}else {
			System.out.println("작성 실패");
		}
		if(!fileName.isEmpty()) {
			try {
				byte[] bytes = fileName.getBytes();
				File f = new File(fullPath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return "redirect:/board/noticeList.do";
	}
	
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(@RequestParam int noticeNo) {
		int result = noticeService.noticeDelete(noticeNo);
		
		if(result>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "redirect:/board/noticeList.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/allDelete.do", produces="application/json;charset=utf-8")
	public String allDelete(@RequestParam String idx) {
		//System.out.println(idx);
		int result = 0;
		String[] noticeNo = idx.split(",");
		for(int i=0;i<noticeNo.length;i++) {
			result += noticeService.noticeDelete(Integer.parseInt(noticeNo[i]));
			//System.out.println(noticeNo[i]);
			//System.out.println(i+":"+noticeNo[i]);
		}
		
		if(result == noticeNo.length) {
			return new Gson().toJson("성공");
		}else {
			return new Gson().toJson("실패");
		}
		
		/*
		int result = noticeService.noticeDelete(noticeNo);
		
		if(result>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "redirect:/board/noticeList.do";
		*/
	}

}
