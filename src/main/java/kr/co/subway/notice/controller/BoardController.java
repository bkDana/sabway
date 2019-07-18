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
import kr.co.subway.notice.vo.Qna;
import kr.co.subway.notice.vo.Review;

@RequestMapping("/board")
@Controller
public class BoardController {
	
	@Autowired
	private NoticeService noticeService;//기존 서비스
	
	@Autowired
	private BoardService service;//관리자 서비스
	
	/* 게시판 리스트 (공통) */
	@RequestMapping("/boardList.do")
	public ModelAndView boardList(SearchVO search) {
		if(search.getReqPage()==0) {
			search.setReqPage(1);
		}
		PageNaviData pd = service.boardList(search);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd", pd);
		mav.addObject("search", search);
		mav.setViewName("admin/board/"+search.getType()+"/"+search.getType());

		return mav;
	}
	
	
	
	/* 작성 페이지 이동 */
	@RequestMapping("/moveNoticeInsert.do")
	public String moveNoticeInsert() {
		return "admin/board/notice/noticeInsert";
	}
	
	@RequestMapping("/moveQnaInsert.do")
	public String moveQnaInsert() {
		return "admin/board/qna/qnaInsert";
	}
	
	
	
	
	/* 뷰페이지 이동 */
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
	
	@RequestMapping("/qnaOne.do")
	public ModelAndView qnaSelectOne(@RequestParam int qnaNo) {
		ArrayList<Qna> qnaList = noticeService.qnaSelectAll();
		ModelAndView mav = new ModelAndView();
		 if(!qnaList.isEmpty()) {
		      mav.addObject("qnaNo",qnaNo);
	          mav.addObject("qnaList",qnaList);
	          mav.setViewName("admin/board/qna/qnaOne");
	       }else {
	          mav.setViewName("common/error");
	       }
		
		return mav;
	}
	
	@RequestMapping("/reviewOne.do")
	public ModelAndView reviewSelectOne(@RequestParam int reviewNo) {
		ArrayList<Review> reviewList = noticeService.reviewSelectAll();
		ModelAndView mav = new ModelAndView();
		 if(!reviewList.isEmpty()) {
		      mav.addObject("reviewNo",reviewNo);
	          mav.addObject("reviewList",reviewList);
	          mav.setViewName("admin/board/review/reviewOne");
	       }else {
	          mav.setViewName("common/error");
	       }
		
		return mav;
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
		return "redirect:/board/boardList.do?type=notice";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/addComment.do", produces="application/json;charset=utf-8")
	public String addComment(Qna qna) {
		
		int result = service.addComment(qna);
		
		if(result > 0) {
			return new Gson().toJson("성공");
		}else {
			return new Gson().toJson("실패");
		}
	}
	
	
	
	
	/* 삭제 */
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(@RequestParam int noticeNo) {
		int result = noticeService.noticeDelete(noticeNo);
		
		if(result>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "redirect:/board/boardList.do?type=notice";
	}
	
	@RequestMapping("/qnaDelete.do")
	public String qnaDelete(@RequestParam int qnaNo) {
		int result = noticeService.qnaDelete(qnaNo);
		
		if(result>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "redirect:/board/boardList.do?type=qna";
	}
	
	@RequestMapping("/reviewDelete.do")
	public String reviewDelete(@RequestParam int reviewNo) {
		int result = noticeService.reviewDelete(reviewNo);
		
		if(result>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "/board/boardList.do?type=review";
	}
	
	
	/* 선택 삭제 */
	@ResponseBody
	@RequestMapping(value="/allDelete.do", produces="application/json;charset=utf-8")
	public String allDelete(@RequestParam String idx, String boardType) {
		int result = 0;
		String[] no = idx.split(",");
		for(int i=0;i<no.length;i++) {
			if(boardType.equals("notice")) {
				result += noticeService.noticeDelete(Integer.parseInt(no[i]));
			}else if(boardType.equals("qna")) {
				result += noticeService.qnaDelete(Integer.parseInt(no[i]));
			}else if(boardType.equals("review")) {
				result += noticeService.reviewDelete(Integer.parseInt(no[i]));
			}
		}
		
		if(result == no.length) {
			return new Gson().toJson("성공");
		}else {
			return new Gson().toJson("실패");
		}

	}

}
