package kr.co.subway.headOffice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.subway.customerOrder.vo.CusOrderPageData;
import kr.co.subway.headOffice.service.ApplyService;
import kr.co.subway.headOffice.service.MenuService;
import kr.co.subway.headOffice.vo.Apply;
import kr.co.subway.headOffice.vo.ApplyPageData;
import kr.co.subway.headOffice.vo.CompletionPageData;
import kr.co.subway.ingreManage.vo.IngreVo;
import net.sf.json.JSONObject;

@Controller
public class HeadOfficeController {
	@Resource(name="applyService")
	private ApplyService applyService;
	@Resource(name="menuService")
	private MenuService menuservice;
	
	//메뉴 목록 출력 및 할인 적용 페이지 이동
	@RequestMapping(value="/promotionSelect.do")
	public ModelAndView promotion(String currentPage) {
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch(Exception e) {
			currentPage1 = 1;
		}
		ApplyPageData pd = menuservice.menuListPaging(currentPage1);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("pd",pd);
			mav.setViewName("headOffice/SelectPromotion");
		}catch(Exception e) {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	//할인 및 할인율 수정
	@ResponseBody
	@RequestMapping(value="/selectPromotion.do",produces="text/html;charset=utf-8")
	public String selectPromotion(@RequestParam int ingreIdx,@RequestParam String ingreType,@RequestParam double discntRate) {
		//정수로 변환
		int ingreDiscntRate = (int)Math.floor(100-(discntRate*100));
		IngreVo ingre = new IngreVo(0, ingreIdx, null, ingreType, 0, 0, ingreDiscntRate, 0, 0, null, null, null, null, null);
		ingre.setIngreDiscntRate(ingreDiscntRate);
		ingre.setIngreIdx(ingreIdx);
		ingre.setIngreType(ingreType);
		System.out.println("할인율 대입 : "+ingre.getIngreDiscntRate()+"%");
		System.out.println("인덱스 대입 : "+ingre.getIngreIdx());
		System.out.println("타입 대입 : "+ingre.getIngreType());
		int result = menuservice.updateIngre(ingre);
		String view = "";
		try {
			if(result>0) {
				view = "redirect:/promotionSelect.do";
			}else {
				view = "redirect:/index.jsp";
			}
		}catch(Exception e) {
			view = "redirect:/promotionSelect.do";
		}
		return new Gson().toJson(view);
	}
	//가맹점 신청목록
	@RequestMapping(value="/managerApply.do")
	public ModelAndView applyList(@RequestParam String currentPage) {
		//페이징
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch(Exception e) {
			currentPage1 = 1;
		}
		ApplyPageData pd = applyService.applyPaging(currentPage1);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("pd",pd);
			mav.setViewName("headOffice/managerApply");
		}catch(Exception e) {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	//가맹점 신청 거절 ajax로 처리
	@ResponseBody
	@RequestMapping(value="/apply.do",produces="text/html;charset=utf-8")
	public String applyManager(@RequestParam String applyName, @RequestParam int applyStatus, @RequestParam int applyNo) {
		JSONObject obj = new JSONObject();
		if(applyName!=null) {
			if(applyStatus == 2) {
				//거절(status 2일 때)
				applyService.rejectManagerUpdate(applyStatus,applyNo);
				obj.put("result", 0);
			}
		}else {
			obj.put("result", 1);
		}
		return new Gson().toJson(obj);
	}	
	//가맹점 신청 글 상세보기 
	@RequestMapping(value="/applyView.do")
	public String applyView(@RequestParam int applyNo,Model model) {
		Apply ap = applyService.applyView(applyNo);
		if(ap != null) {
			model.addAttribute("ap",ap);
		}
		return "headOffice/applyView";
	}
	
	// 가맹신청/문의 페이지 이동
	@RequestMapping(value="/applyPage.do")
	public String applyPage() {
		return "headOffice/applyWrite";
	}
	
	//가맹신청/문의 등록
	@RequestMapping(value="/insertApply.do",method=RequestMethod.POST)
	public String insertApply(HttpServletRequest request, Apply applyVo, @RequestParam MultipartFile applyfilename) {
		System.out.println(applyfilename);
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload");
		
		String originName = applyfilename.getOriginalFilename();
		
		String onlyFileName = originName.substring(0, originName.indexOf('.'));
		
		String extension = originName.substring(originName.indexOf('.'));
		
		String filePath = onlyFileName + "_" + "1" + extension;
		
		String fullPath = savePath+"/"+filePath;
		
		applyVo.setApplyFilename(originName);
		applyVo.setApplyFilepath(filePath);
		
		int result = applyService.insertApply(applyVo);
		
		if(!applyfilename.isEmpty()) {
			try {
				byte [] bytes = applyfilename.getBytes();
				File f = new File(fullPath);
				FileOutputStream fos = new FileOutputStream(f);
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				bos.write(bytes);
				bos.close();
				System.out.println("파일업로드 성공했어!!");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(result>0) {
			return "headOffice/insertSuccess";
		}else {
			return "headOffice/insertFailed";
		}
	}
	//처리한 가맹점 목록 가져오기
	@RequestMapping(value="/applyCompletion.do")
	public ModelAndView applyCompletion(@RequestParam String currentPage) {
		//페이징
		int currentPage1;
		try {
			currentPage1 = Integer.parseInt(currentPage);
		}catch(Exception e) {
			currentPage1 = 1;
		}
		CompletionPageData cpd = applyService.completionPaging(currentPage1);
		ModelAndView mav = new ModelAndView();
		try {
			mav.addObject("cpd",cpd);
			mav.setViewName("headOffice/applyCompletion");
		}catch(Exception e) {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	

	
}
