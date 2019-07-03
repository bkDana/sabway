package kr.co.subway.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.subway.manager.service.MgrService;
import kr.co.subway.manager.vo.Mgr;

@Controller
public class MgrController {
	@Resource(name="mgrservice")
	MgrService mgrservice;

	@RequestMapping(value="/enrollMgr.do")
	public String enrollMgr(@RequestParam String applyArea,@RequestParam String applyName,Model model) {
		//가맹점 승인하면 applyName과 applyArea를 매개변수로 받음
		//applyArea : 지역 정보를 알아보기 위함
		//applyName : 가맹점 등록에 사용할 목적
		String mgrTel = "";
		String telCenter = "";
		String telLast = "";
		Random num = new Random();
		int[] ran = new int[8];
		//난수로 랜덤한 전화번호 생성
		for(int i=0;i<ran.length;i++) {
			ran[i] = num.nextInt(10);
			if(i<4) {
				//중간 4자리
				telCenter += String.valueOf(ran[i]);
			}else if(i>3) {
				//마지막 4자리
				telLast += String.valueOf(ran[i]);
			}
		}
		//넘어오는 지역에 따라 지역번호 변경
		if(applyArea.equals("서울")) {
			mgrTel = "02-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("인천")||applyArea.equals("부천")) {
			mgrTel = "032-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("경기도")) {
			mgrTel = "031-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("강원도")||applyArea.equals("강원")) {
			mgrTel = "033-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("충청남도")||applyArea.equals("충남")) {
			mgrTel = "041-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("대전광역시")||applyArea.equals("대전")) {
			mgrTel = "042-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("충천북도")||applyArea.equals("충북")) {
			mgrTel = "043-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("부산광역시")||applyArea.equals("부산")) {
			mgrTel = "051-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("울산광역시")||applyArea.equals("울산")) {
			mgrTel = "052-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("대구광역시")||applyArea.equals("대구")) {
			mgrTel = "053-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("경상북도")||applyArea.equals("경북")) {
			mgrTel = "054-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("경상남도")||applyArea.equals("경남")) {
			mgrTel = "055-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("전라남도")||applyArea.equals("전남")) {
			mgrTel = "061-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("광주광역시")||applyArea.equals("광주")) {
			mgrTel = "062-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("전라북도")||applyArea.equals("전북")) {
			mgrTel = "063-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("제주도")||applyArea.equals("제주")) {
			mgrTel = "064-"+telCenter+"-"+telLast;
		}		
		model.addAttribute("applyName",applyName);
		model.addAttribute("mgrAddr",applyArea);
		model.addAttribute("mgrTel",mgrTel);
		return "manager/mgrEnroll";
	}
	@RequestMapping(value="/mgrEnroll.do")
	public String mgrEnroll(Mgr mg,@RequestParam String applyName) {
		//가맹점 계정을 등록하면 applyName를 받아와서 DB등록이 완료되면 status를 변경하기 위해 
		int result = mgrservice.enrollMgr(mg,applyName);
		String view = "";
		if(result>0) {
			view = "manager/successMsg";
		}else {
			view = "manager/failMsg";
		}
		return view;
	}
}
