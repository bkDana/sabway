package kr.co.subway.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.subway.notice.service.NoticeService;
import kr.co.subway.notice.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	@Qualifier(value = "noticeService")
	private NoticeService noticeService;

	@RequestMapping("/notice.do")
	public ModelAndView noticeSelectAll() {
		ArrayList<Notice> noticeList = noticeService.noticeSelectAll();
		ModelAndView mav = new ModelAndView();
		if (!noticeList.isEmpty()) {
			mav.addObject("noticeList", noticeList); // view에서 사용할 객체 추가
			mav.setViewName("notice/notice");
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
	          mav.addObject("noticeList",noticeList);   //view에서 사용할 객체 추가
	          mav.setViewName("notice/noticeOne");
	       }else {
	          mav.setViewName("common/error");
	       }
		
		return mav;
	}
	
	@RequestMapping("/moveNoticeInsert.do")
	public String noticeInsert() {
		return "/notice/noticeInsert";
	}
	
	@RequestMapping(value="/noticeInsert.do", method=RequestMethod.POST)
	public String insertBoard(HttpServletRequest request, @RequestParam MultipartFile fileName, Notice n ) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
		String originName = fileName.getOriginalFilename();
		String onlyFileName = originName.substring(0, originName.indexOf('.'));
		String extension = originName.substring(originName.indexOf('.'));
		String filePath = onlyFileName+"_"+"1"+extension;
		String fullPath = savePath+"/"+filePath;
		
		n.setFilename(originName);
		n.setFilepath(filePath);
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
				System.out.println("파일 업로드 성공");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:/notice.do";
	}
}
