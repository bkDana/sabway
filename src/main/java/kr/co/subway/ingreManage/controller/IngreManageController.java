package kr.co.subway.ingreManage.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.co.subway.ingreManage.service.IngreManageService;
import kr.co.subway.ingreManage.vo.ExcelDown;
import kr.co.subway.ingreManage.vo.IngrePageNaviData;
import kr.co.subway.ingreManage.vo.IngreVo;

@Controller
@RequestMapping("/ingreManage")
public class IngreManageController {
	@Autowired
	private IngreManageService ingreService;
	
	//매출통계테스트
	/*@RequestMapping("/goSalesTest.do")
	public String goSalesTest() {
		return "admin/salesStatics/salesTest";
	}*/
	
	//재료 등록페이지로
	@RequestMapping("/goIngreReg.do")
	public ModelAndView goIngreReg(ModelAndView mav) {
		ArrayList<IngreVo> sauce = (ArrayList<IngreVo>)ingreService.getSauce();
		if(!sauce.isEmpty()) {
			System.out.println(sauce.get(0).getIngreLabel());
			mav.addObject("sauce",sauce);
			mav.setViewName("admin/ingreManage/ingreRegisterForm");
		}else {
			mav.setViewName("common/error");
		}
		return mav;
	}
	
	//재료 카테고리 메인재료 선택시 선택할 추천소스 가져오기
	
	//재료 등록하기
	@RequestMapping("/ingreRegister.do")
	public ModelAndView ingreReg(HttpServletRequest request, @RequestParam MultipartFile filepath, IngreVo iv, ModelAndView mav) {
		System.out.println(iv.getIngreRecomSauce());
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
		System.out.println("controller searchType : "+ searchType+ "searchVal : "+searchVal);
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
	
	//활성화 여부 ajax로 변경
	@ResponseBody
	@RequestMapping("/updateIngreActive.do")
	public void updateIngreActive(HttpServletResponse response,String ingreActive,String ingreIdx) throws IOException {
		System.out.println("활성화:"+ingreActive);
		System.out.println("번호:"+ingreIdx);
		int result = ingreService.updateIngreActive(ingreActive,ingreIdx);
		System.out.println("controller updateIngreActive() result : "+result);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.println("활성화 여부 변경 성공");
		}else{
			out.println("활성화여부 변경 실패");
		}
	}
	
	//재료 카테고리선택시 하위 컬럼 가져오기
	@ResponseBody
	@RequestMapping("/ingreType.do")
	public void ingreType(HttpServletResponse response) throws JsonIOException, IOException {
		List list = ingreService.ingreType();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//재료 업데이트 페이지
	@RequestMapping("/goIngreUpdate.do")
	public ModelAndView goUpdatePage(ModelAndView mav, String ingreIdx) {
		System.out.println("controller goUpdatePage() idx : "+ingreIdx);
		IngreVo iv = ingreService.goUpdateIngre(ingreIdx);
		ArrayList<IngreVo> sauceList = (ArrayList<IngreVo>)ingreService.getSauce();
		//추천소스 , 를 기준으로 잘라서 보내기
		if(iv.getIngreRecomSauce()!=null) {
			String[] sauce = iv.getIngreRecomSauce().split(",");
			System.out.println(sauce);
			for(int i=0;i<sauce.length;i++) {
				System.out.println(sauce[i]);
			}
			mav.addObject("sauce",sauce);
		}		
		if(iv!=null) {
			mav.addObject("iv",iv);
			mav.addObject("sauceList",sauceList);
			mav.setViewName("admin/ingreManage/ingreUpdate");
		}/*else {
			mav.setViewName("common/error");
		}*/
		return mav;
	}
	
	//재료 업데이트
	@RequestMapping("/ingreUpdate.do")
	public String ingreUpdate(HttpServletRequest request, @RequestParam MultipartFile filepath, IngreVo iv, String oldFilepath, String deleteFile, RedirectAttributes redirectAttributes) {
		String fullPath="";
		//파일 있으면
		if(!filepath.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/ingredients");
			String originName = filepath.getOriginalFilename();
			String onlyFileName = originName.substring(0,originName.indexOf('.'));
			String extension = originName.substring(originName.indexOf('.'));
			String filePath = onlyFileName+"_"+getDate()+extension;
			fullPath = savePath+"/"+filePath;
			iv.setIngreFilepath(filePath);
			
			if(oldFilepath !=null) {
				File delFile = new File(savePath+"/"+oldFilepath);
				System.out.println("파일삭제? : "+delFile.delete());
			}else {
				if(deleteFile == null) {
					iv.setIngreFilepath(oldFilepath);
				}else {
					File delFile = new File(savePath+"/"+oldFilepath);
					System.out.println("파일 삭제? : "+delFile.delete());
				}
			}
		}else {
			iv.setIngreFilepath("");
		}
		
		int result = ingreService.ingreUpdate(iv);
		if(result>0) {
			System.out.println("업데이트 완료");;	
		}else {
			System.out.println("업데이트 실패");;
		}
		if(!filepath.isEmpty()) {
			try {
				byte[] bytes = filepath.getBytes();
				File f = new File(fullPath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		redirectAttributes.addAttribute("reqPage", "1");	//redirect로 값 보내기
		return "redirect:/ingreManage/ingreList.do";
	}
	
	//재료 삭제하기
	@RequestMapping("/ingreDelete.do")
	public String ingreDelete(HttpServletRequest request, String ingreIdx, String reqPage, String searchType, String searchVal,String filepath, RedirectAttributes redirectAttributes) {
		System.out.println("no:"+ingreIdx+" reqPage : "+reqPage+" searchType : "+searchType+" searchVal : "+searchVal+" filepath: "+filepath);
		//파일이 있으면
		if(!filepath.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/ingredients");///////
			File delFile = new File(savePath+"/"+filepath);
			System.out.println("파일삭제? : "+delFile.delete());
		}
		
		int result = ingreService.ingreDelete(ingreIdx);
		if(result>0) {
			redirectAttributes.addAttribute("reqPage", reqPage);	//redirect로 값 보내기
			redirectAttributes.addAttribute("searchType", searchType);
			redirectAttributes.addAttribute("searchVal", searchVal);
			return "redirect:/ingreManage/ingreList.do";
		}else {
			System.out.println("삭제실패");
			return "common/error";
		}
	}
	
	//엑셀 다운하기
	@ResponseBody
	@RequestMapping("/excelDown.do")
	public void excelDown(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap, String reqPage, String searchType, String searchVal)  throws Exception, Exception{
		System.out.println("엑셀 다운 컨트롤러");
		List<IngreVo> list = ingreService.ingreList(searchType, searchVal);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일 HH시mm분ss초");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMdd_HHmmss");
		
		for(int i=0;i<list.size();i++) {
			System.out.println(list.get(i).getIngreRegDate());
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("ingreList", list);
		data.put("count", list.size());
		data.put("date", sdf.format(new Date()));
		
		ExcelDown e = new ExcelDown();
		e.download(request, response, data, "ingreInfo"+sdf2.format(new Date()), "sample.xlsx", "");
	}
	
	
	//고객 주문 페이지에 재료 일부 리스트 로드
	@ResponseBody
	@RequestMapping(value="/selectMainList.do")
	public void selectMainList(HttpServletResponse response, @RequestParam String ingreId, @RequestParam String ingreType) throws JsonIOException, IOException {
		IngreVo ingreVo = new IngreVo();
		ingreVo.setIngreLabel(ingreId);
		ingreVo.setIngreType(ingreType);
		ArrayList<IngreVo> list = ingreService.selectIngreList(ingreVo);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	//고객 주문 페이지에서 재료 정보 로드하기
	@ResponseBody
	@RequestMapping(value="/selectOneIngre.do")
	public void selectOneIngre(HttpServletResponse response, @RequestParam String ingreId, @RequestParam String ingreType) throws JsonIOException, IOException {
		IngreVo ingreVo = new IngreVo();
		ingreVo.setIngreLabel(ingreId);
		ingreVo.setIngreType(ingreType);
		IngreVo ingre = ingreService.selectOneIngre(ingreVo);
		System.out.println(ingre.getIngreIdx());
		System.out.println(ingre.getIngreLabel());
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(ingre,response.getWriter());
	}
	
	
	
	
	
	
}
