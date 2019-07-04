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

import kr.co.subway.headOffice.service.ApplyService;
import kr.co.subway.headOffice.vo.Apply;
import net.sf.json.JSONObject;

@Controller
public class PromotionController {
	@Resource(name="applyService")
	ApplyService applyService;
	
	@RequestMapping(value="/promotionSelect.do")
	public String promotion() {
		return "headOffice/SelectPromotion";
	}
	@RequestMapping(value="/selectPromotion.do")
	public String selectPromotion(@RequestParam String prdName, @RequestParam int price, @RequestParam double promotion) {
		String name="이름";
		System.out.println(prdName+" : "+price);
		System.out.println("할인율 : "+(int)Math.floor(100-(promotion*100))+"%");
		System.out.println(prdName+" : "+(int)Math.floor(price*promotion)+"원");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/managerApply.do")
	public ModelAndView applyList(HttpServletRequest request) {
		ArrayList<Apply> list = (ArrayList<Apply>) applyService.applyList();
		ModelAndView mav = new ModelAndView();
		if(!list.isEmpty()) {
			mav.addObject("list",list);
			mav.setViewName("headOffice/managerApply");
		}
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/apply.do",produces="text/html;charset=utf-8")
	public String applyManager(@RequestParam String applyName, @RequestParam int applyStatus) {
		JSONObject obj = new JSONObject();
		if(applyName!=null) {
			if(applyStatus == 2) {
				//거절(status 2일 때)
				applyService.rejectManagerUpdate(applyName,applyStatus);
				obj.put("result", 0);
			}
//			else{
				//승인(status 1일 때)
//				applyService.applyManagerUpdate(applyName,applyStatus);
//				obj.put("result", 0);
//			}
		}else {
			obj.put("result", 1);
		}
		return new Gson().toJson(obj);
	}	
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
	
	// 매장찾기페이지이동
	@RequestMapping(value="/shopSearch.do")
	public String shopSearchPage() {
		return "map/map";
	}
	
	
	
	
	

	
}
