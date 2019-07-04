package kr.co.subway.ingreManage.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.co.subway.ingreManage.service.IngreManageService;
import kr.co.subway.ingreManage.vo.IngrePageNaviData;
import kr.co.subway.ingreManage.vo.IngreVo;

@Controller
public class IngreManageController {
	@Autowired
	private IngreManageService ingreService;
	
	//재료 등록페이지로 보내기
	@RequestMapping("/goIngreReg.do")
	public String goIngreReg() {
		return "admin/ingreManage/ingreRegisterForm";
	}
	
	//재료 등록하기
	@RequestMapping("/ingreRegister.do")
	public ModelAndView ingreReg(HttpServletRequest request, @RequestParam MultipartFile filepath, IngreVo iv, ModelAndView mav) {
		String fullPath="";
		if(!filepath.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/ingredients");
			String originName = filepath.getOriginalFilename();
			String onlyFileName = originName.substring(0,originName.indexOf('.'));
			String extension = originName.substring(originName.indexOf('.'));
			String filePath = onlyFileName+"_"+getDate()+extension;
			fullPath = savePath+"/"+filePath;
			iv.setIngreFilepath(filePath);
		}else {
			iv.setIngreFilepath("");
		}
		
		if(!filepath.isEmpty()) {
			try {
				byte[] bytes = filepath.getBytes();
				File f = new File(fullPath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				System.out.println("등록 성공");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int result = ingreService.ingreReg(iv);
		if(result>0) {
			mav.addObject("iv",iv);
			mav.setViewName("admin/ingreManage/ingreRegSuccess");
		}else {
			mav.setViewName("common.error");
		}
		return mav;
	}
	
	public String getDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd_HHmmss");
		Date date = new Date();
		System.out.println(format.format(date));
		return format.format(date);
	}
	
	//재료 리스트 가져오기
	@RequestMapping("/ingreList.do")
	public ModelAndView ingreList(String reqPage, String searchType, String searchVal) {
		System.out.println(searchType);
		System.out.println(searchVal);
		ModelAndView mav = new ModelAndView();
		int reqPage1;
		try {
			reqPage1 = Integer.parseInt(reqPage);
		}catch (Exception e) {
			reqPage1=1;
		}
		IngrePageNaviData ip = ingreService.ingreList(reqPage1,searchType,searchVal);
		ArrayList<IngreVo> list = ip.getIngreList();
		String pageNavi = ip.getPageNavi();
		if(!list.isEmpty()) {
			mav.addObject("reqPage",reqPage1);
			mav.addObject("ingreList",list);
			mav.addObject("pageNavi",pageNavi);
			mav.addObject("searchType",searchType);
			mav.addObject("searchVal",searchVal);
			mav.setViewName("admin/ingreManage/ingreList");
		}else {
			mav.setViewName("common/error");
		}
		return mav;
	}
	
	//활성화여부 변경시 업데이트하기
	@ResponseBody
	@RequestMapping("/updateIngreActive.do")
	public void updateIngreActive(HttpServletResponse response,String ingreActive,String ingreIdx) throws IOException {
		System.out.println("활성화:"+ingreActive);
		System.out.println("인덱스:"+ingreIdx);
		int result = ingreService.updateIngreActive(ingreActive,ingreIdx);
		System.out.println(result);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("업데이트 성공");
		}else{
			out.println("업데이트 실패");
		}
	}
	
	//재료 리스트 페이지에서 검색박스에서 재료 카테고리 선택시 하위 값 가져오기
	@ResponseBody
	@RequestMapping("/ingreType.do")
	public void ingreType(HttpServletResponse response) throws JsonIOException, IOException {
		List list = ingreService.ingreType();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//재료정보 가져오기
	@RequestMapping("/goIngreUpdate.do")
	public ModelAndView goUpdatePage(ModelAndView mav, String ingreIdx) {
		System.out.println(ingreIdx);
		IngreVo iv = ingreService.goUpdateIngre(ingreIdx);
		if(iv!=null) {
			mav.addObject("iv",iv);
			mav.setViewName("admin/ingreManage/ingreUpdate");
		}else {
			mav.setViewName("common/error");
		}
		return mav;
	}
	
	//재료 수정하기
	@RequestMapping("/ingreUpdate.do")
	public String ingreUpdate(HttpServletRequest request, @RequestParam MultipartFile filepath, IngreVo iv, String oldFilepath, String deleteFile, RedirectAttributes redirectAttributes) {
		String fullPath="";
		//첨부파일 있으면
		if(!filepath.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/ingredients");
			String originName = filepath.getOriginalFilename();
			String onlyFileName = originName.substring(0,originName.indexOf('.'));
			String extension = originName.substring(originName.indexOf('.'));
			String filePath = onlyFileName+"_"+getDate()+extension;
			fullPath = savePath+"/"+filePath;
			iv.setIngreFilepath(filePath);
			//기존 파일 있었다면 삭제하기
			if(oldFilepath !=null) {
				File delFile = new File(savePath+"/"+oldFilepath);
				System.out.println("파일 삭제됐나요? : "+delFile.delete());
			}else {	//첨부파일 없으면
				if(deleteFile == null) {
					iv.setIngreFilepath(oldFilepath);
				}else {
					File delFile = new File(savePath+"/"+oldFilepath);
					System.out.println("파일 삭제됐나요? : "+delFile.delete());
				}
			}
		}else {
			iv.setIngreFilepath("");
		}
		
		int result = ingreService.ingreUpdate(iv);
		if(result>0) {
			System.out.println("수정 성공");;	
		}else {
			System.out.println("수정 실패");;
		}
		if(!filepath.isEmpty()) {
			try {
				byte[] bytes = filepath.getBytes();
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
		redirectAttributes.addAttribute("reqPage", "1");	//redirect로 값 보내기
		return "redirect:/ingreList.do";
	}
	
	//재료 삭제하기
	@RequestMapping("/ingreDelete.do")
	public String ingreDelete(String ingreIdx, String reqPage, String searchType, String searchVal, RedirectAttributes redirectAttributes) {
		System.out.println("no:"+ingreIdx+" reqPage : "+reqPage+" searchType : "+searchType+" searchVal : "+searchVal);
		int result = ingreService.ingreDelete(ingreIdx);
		if(result>0) {
			redirectAttributes.addAttribute("reqPage", reqPage);	//redirect로 값 보내기
			redirectAttributes.addAttribute("searchType", searchType);
			redirectAttributes.addAttribute("searchVal", searchVal);
			return "redirect:/ingreList.do";
		}else {
			System.out.println("삭제 실패");
			return "common/error";
		}
	}
	
	
	
	
	
	
	
	
	
}
