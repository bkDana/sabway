package kr.co.subway.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.subway.notice.service.NoticeService;
import kr.co.subway.notice.vo.Notice;
import kr.co.subway.notice.vo.PageNaviData;
import kr.co.subway.notice.vo.Qna;
import kr.co.subway.notice.vo.Review;

@Controller
public class NoticeController {
	@Autowired
	@Qualifier(value = "noticeService")
	private NoticeService noticeService;

	@RequestMapping("/notice.do")
	public ModelAndView noticeSelectAll(@RequestParam int currentPage) {
		PageNaviData pd = noticeService.noticeSelectPaging(currentPage);
		ArrayList<Notice> noticeList = pd.getNoticeList();
		String pageNavi = pd.getPageNavi();
		ModelAndView mav = new ModelAndView();
		if (!noticeList.isEmpty()) {
			mav.addObject("noticeList", noticeList); // view에서 사용할 객체 추가
			mav.addObject("pageNavi", pageNavi);
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
	public String moveNoticeInsert() {
		return "/notice/noticeInsert";
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
				System.out.println("파일 업로드 성공");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "redirect:/notice.do?currentPage=1";
	}
	
	@RequestMapping("/moveNoticeUpdate.do")
	public ModelAndView moveNoticeUpdate(@RequestParam int noticeNo) {
		Notice notice = noticeService.noticeSelectOne(noticeNo);
		ModelAndView mav = new ModelAndView();
		 if(notice != null) {
		      mav.addObject("noticeNo",noticeNo);
	          mav.addObject("notice",notice);   //view에서 사용할 객체 추가
	          mav.setViewName("notice/noticeUpdate");
	       }else {
	          mav.setViewName("common/error");
	       }
		return mav;
	}
	
	@RequestMapping(value="/noticeUpdate.do", method=RequestMethod.POST)
	public String noticeUpdate(HttpServletRequest request, @RequestParam MultipartFile fileName, Notice n,@RequestParam String fileStatus) {
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
		}
		if(fileStatus.equals("1")) {
			n.setFilename("");
			n.setFilepath("");
		}
		Notice oldN = noticeService.noticeSelectOne(n.getNoticeNo());
		if(!n.getFilename().equals(oldN.getFilename())){
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
			String oldPath = savePath+"/"+oldN.getFilepath();
			File f = new File(oldPath);
			System.out.println("삭제로직 탓니?");
			if(f.exists()) {
				f.delete();
				System.out.println("삭제햇어~");
			}
		}
		
		int result = noticeService.noticeUpdate(n);
		
		if(result>0) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
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
		return "redirect:/notice.do?currentPage=1";
	}
	
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(@RequestParam int noticeNo) {
		int result = noticeService.noticeDelete(noticeNo);
		
		if(result>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "redirect:/notice.do?currentPage=1";
	}
	///////////////////////////////////////////////////////////////////////////////////////
	//여기서 부터 QNA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@RequestMapping("/qna.do")
	public ModelAndView qnaSelectAll(@RequestParam int currentPage) {
		PageNaviData pd = noticeService.qnaSelectPaging(currentPage);
		ArrayList<Qna> qnaList = pd.getQnaList();
		String pageNavi = pd.getPageNavi();
		ModelAndView mav = new ModelAndView();
		if (!qnaList.isEmpty()) {
			mav.addObject("qnaList", qnaList); // view에서 사용할 객체 추가
			mav.addObject("pageNavi", pageNavi);
			mav.setViewName("qna/qna");
		} else {
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
	          mav.addObject("qnaList",qnaList);   //view에서 사용할 객체 추가
	          mav.setViewName("qna/qnaOne");
	       }else {
	          mav.setViewName("common/error");
	       }
		
		return mav;
	}
	
	@RequestMapping("/moveQnaInsert.do")
	public String moveQnaInsert() {
		return "/qna/qnaInsert";
	}
	
	@RequestMapping(value="/qnaInsert.do", method=RequestMethod.POST)
	public String qnaInsert(HttpServletRequest request, @RequestParam MultipartFile fileName, Qna q ) {
		String fullPath = "";
		if(!fileName.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
			String originName = fileName.getOriginalFilename();
			String onlyFileName = originName.substring(0, originName.indexOf('.'));
			String extension = originName.substring(originName.indexOf('.'));
			String filePath = onlyFileName+"_"+"1"+extension;
			fullPath = savePath+"/"+filePath;
			q.setFilename(originName);
			q.setFilepath(filePath);
		}else {
			q.setFilename("");
			q.setFilepath("");
		}
		int result = noticeService.qnaInsert(q);
		
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
		return "redirect:/qna.do?currentPage=1";
	}
	
	@RequestMapping("/moveQnaUpdate.do")
	public ModelAndView moveQnaUpdate(@RequestParam int qnaNo) {
		Qna qna = noticeService.qnaSelectOne(qnaNo);
		ModelAndView mav = new ModelAndView();
		 if(qna != null) {
		      mav.addObject("qnaNo",qnaNo);
	          mav.addObject("qna",qna);   //view에서 사용할 객체 추가
	          mav.setViewName("qna/qnaUpdate");
	       }else {
	          mav.setViewName("common/error");
	       }
		return mav;
	}
	
	@RequestMapping(value="/qnaUpdate.do", method=RequestMethod.POST)
	public String qnaUpdate(HttpServletRequest request, @RequestParam MultipartFile fileName, Qna q, @RequestParam String fileStatus) {		
		String fullPath = "";
		if(!fileName.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
			String originName = fileName.getOriginalFilename();
			String onlyFileName = originName.substring(0, originName.indexOf('.'));
			String extension = originName.substring(originName.indexOf('.'));
			String filePath = onlyFileName+"_"+"1"+extension;
			fullPath = savePath+"/"+filePath;
			q.setFilename(originName);
			q.setFilepath(filePath);
		}
		if(fileStatus.equals("1")) {
			q.setFilename("");
			q.setFilepath("");
		}
		Qna oldQ = noticeService.qnaSelectOne(q.getQnaNo());
		if(!q.getFilename().equals(oldQ.getFilename())){
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
			String oldPath = savePath+"/"+oldQ.getFilepath();
			File f = new File(oldPath);
			if(f.exists()) {
				f.delete();
			}
		}
		
		int result = noticeService.qnaUpdate(q);
		
		if(result>0) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
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
		return "redirect:/qna.do?currentPage=1";
	}
	
	@RequestMapping("/qnaDelete.do")
	public String qnaDelete(@RequestParam int qnaNo) {
		int result = noticeService.qnaDelete(qnaNo);
		
		if(result>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "redirect:/qna.do?currentPage=1";
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////
	//리뷰 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	@RequestMapping("/moveReviewInsert.do")
	public String moveReviewInsert() {
		return "/review/reviewInsert";
	}
	
	public void deleteFile() {
		File file = new File("C:/123.txt");
	    
	    if( file.exists() ){
	        if(file.delete()){
	            System.out.println("파일삭제 성공");
	        }else{
	            System.out.println("파일삭제 실패");
	        }
	    }else{
	        System.out.println("파일이 존재하지 않습니다.");
	    }
	}
	
	
	@RequestMapping(value = "/reviewInsert.do", method = RequestMethod.POST)
    public String reviewInsert(HttpServletRequest request, MultipartHttpServletRequest multi,Review r){

        Enumeration enumeration = multi.getParameterNames();
        String filenameForDB = "";
        String filepathForDB = "";
        while (enumeration.hasMoreElements()){
            System.out.println("ParamName : " + enumeration.nextElement());
        }
        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = root+"resources/upload/review/";

        String newFileName = ""; // 업로드 되는 파일명

        File dir = new File(path); //파일경로 설정
        if (!dir.exists()) {
            dir.mkdirs();
        }

        Iterator<String> files = multi.getFileNames();

        while(files.hasNext()){

            String uploadFile = files.next();
            System.out.println("uploadFile Name : " + uploadFile);

            List<MultipartFile> mFile = multi.getFiles(uploadFile);

            for (MultipartFile m : mFile) {
                newFileName = "";
                String fileName = m.getOriginalFilename();
                System.out.println("OriginalFilename : " + fileName);
                System.out.println(m);
                //file upload
                if(fileName.trim().length() > 0) {
                    //업로드할 파일이 존재할때
                    newFileName = System.currentTimeMillis() + "."
                            + fileName.substring(fileName.lastIndexOf(".") + 1);
                    try {
        				byte[] bytes = m.getBytes();
        				File f = new File(path + newFileName);
        				FileOutputStream fos = new FileOutputStream(f);
        				BufferedOutputStream bos = new BufferedOutputStream(fos);
        				bos.write(bytes);
        				bos.close();
        				System.out.println("File upload complete");
                        System.out.println(path + newFileName);
                        filenameForDB += fileName+",";
                        filepathForDB += newFileName+",";
        			} catch (IOException e) {
        				// TODO Auto-generated catch block
        				e.printStackTrace();
        			}
                }
            }
        }
        r.setFilename(filenameForDB);
        r.setFilepath(filepathForDB);

        int result = noticeService.reviewInsert(r);
        
        return "redirect:/review.do?currentPage=1";
    }
	
	@RequestMapping("/review.do")
	public ModelAndView reviewSelectAll(@RequestParam int currentPage) {
		PageNaviData pd = noticeService.reviewSelectPaging(currentPage);
		ArrayList<Review> reviewList = pd.getReviewList();
		String pageNavi = pd.getPageNavi();
		ModelAndView mav = new ModelAndView();
		if (!reviewList.isEmpty()) {
			mav.addObject("reviewList", reviewList); // view에서 사용할 객체 추가
			mav.addObject("pageNavi", pageNavi);
			mav.setViewName("review/review");
		} else {
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
	          mav.addObject("reviewList",reviewList);   //view에서 사용할 객체 추가
	          mav.setViewName("review/reviewOne");
	       }else {
	          mav.setViewName("common/error");
	       }
		
		return mav;
	}
	
	@RequestMapping("/moveReviewUpdate.do")
	public ModelAndView moveReviewUpdate(@RequestParam int reviewNo) {
		Review review = noticeService.reviewSelectOne(reviewNo);
		ModelAndView mav = new ModelAndView();
		 if(review != null) {
		      mav.addObject("reviewNo",reviewNo);
	          mav.addObject("review",review);   //view에서 사용할 객체 추가
	          mav.setViewName("review/reviewUpdate");
	       }else {
	          mav.setViewName("common/error");
	       }
		return mav;
	}
	
	@RequestMapping(value = "/reviewUpdate.do", method = RequestMethod.POST)
    public String reviewUpdate(HttpServletRequest request, MultipartHttpServletRequest multi,Review r,@RequestParam String oldpath){
        String filenameForDB = "";
        String filepathForDB = "";

        String root = multi.getSession().getServletContext().getRealPath("/");
        String path = root+"resources/upload/review/";

        String newFileName = ""; // 업로드 되는 파일명

        Iterator<String> files = multi.getFileNames();
        System.out.println(files);
        int checkArr = 0;
        String filename = r.getFilename();
        String filepath = r.getFilepath();
	        while(files.hasNext()){
	            String uploadFile = files.next();
	            System.out.println("uploadFile Name : " + uploadFile);
	
	            List<MultipartFile> mFile = multi.getFiles(uploadFile);
	            for (MultipartFile m : mFile) {
	                newFileName = "";
	                String fileName = m.getOriginalFilename();
	                System.out.println("OriginalFilename : " + fileName);
	                System.out.println(m);
	                //file upload
	                System.out.println("트림 체크 : "+fileName.trim().length());
	                if(fileName.trim().length() > 0) {
	                    //업로드할 파일이 존재할때
	                    newFileName = System.currentTimeMillis() + "."
	                            + fileName.substring(fileName.lastIndexOf(".") + 1);
	                    try {
	        				byte[] bytes = m.getBytes();
	        				File f = new File(path + newFileName);
	        				FileOutputStream fos = new FileOutputStream(f);
	        				BufferedOutputStream bos = new BufferedOutputStream(fos);
	        				bos.write(bytes);
	        				bos.close();
	        				System.out.println("File upload complete");
	                        System.out.println(path + newFileName);
	                        filenameForDB += fileName+",";
	                        filepathForDB += newFileName+",";
	        			} catch (IOException e) {
	        				// TODO Auto-generated catch block
	        				e.printStackTrace();
	        			}
	                    r.setFilename(filenameForDB);
	    		        r.setFilepath(filepathForDB);
	    		        String[] oldpathArr = oldpath.split(",");
	    		        if(checkArr<oldpathArr.length) {
	    		        	File file = new File(path+oldpathArr[checkArr]);
	    		    	    if( file.exists() ){
	    		    	        if(file.delete()){
	    		    	            System.out.println("파일삭제 성공"+oldpathArr[checkArr]);
	    		    	        }else{
	    		    	            System.out.println("파일삭제 실패");
	    		    	        }
	    		    	    }else{
	    		    	        System.out.println("파일이 존재하지 않습니다.");
	    		    	    }
	    		        }
	    		        checkArr++;
	                }else {
	                	if(filename!=null) {
	                		String[] arrName = filename.split(",");
	                		String[] arrPath = filepath.split(",");
	                		if(checkArr<arrName.length) {
	                			filenameForDB += arrName[checkArr]+",";
		                        filepathForDB += arrPath[checkArr]+",";
	                		}
	                        System.out.println("이름체크"+filenameForDB);
	                        r.setFilename(filenameForDB);
		    		        r.setFilepath(filepathForDB);
	                        checkArr++;
	                	}
	                }
	            }
	        }
        int result = noticeService.reviewUpdate(r);
        
        return "redirect:/review.do?currentPage=1";
    }
	
	@RequestMapping("/reviewDelete.do")
	public String reviewDelete(@RequestParam int reviewNo) {
		int result = noticeService.reviewDelete(reviewNo);
		
		if(result>0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		return "redirect:/review.do?currentPage=1";
	}
}
