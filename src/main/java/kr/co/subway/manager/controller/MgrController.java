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
		if(applyArea.equals("서울특별시")||applyArea.equals("서울")) {
			mgrTel = "02-"+telCenter+"-"+telLast;
			if(applyArea.equals("강남구")) {}
			else if(applyArea.equals("강동구")) {}
			else if(applyArea.equals("강북구")) {}
			else if(applyArea.equals("강서구")) {}
			else if(applyArea.equals("관악구")) {}
			else if(applyArea.equals("광진구")) {}
			else if(applyArea.equals("구로구")) {}
			else if(applyArea.equals("금천구")) {}
			else if(applyArea.equals("노원구")) {}
			else if(applyArea.equals("도봉구")) {}
			else if(applyArea.equals("동대문구")) {}
			else if(applyArea.equals("동작구")) {}
			else if(applyArea.equals("마포구")) {}
			else if(applyArea.equals("서대문구")) {}
			else if(applyArea.equals("서초구")) {}
			else if(applyArea.equals("성동구")) {}
			else if(applyArea.equals("성북구")) {}
			else if(applyArea.equals("송파구")) {}
			else if(applyArea.equals("양천구")) {}
			else if(applyArea.equals("영등포구")) {}
			else if(applyArea.equals("용산구")) {}
			else if(applyArea.equals("은평구")) {}
			else if(applyArea.equals("종로구")) {}
			else if(applyArea.equals("중구")) {}
			else if(applyArea.equals("중랑구")) {}
		}else if(applyArea.equals("인천광역시")||applyArea.equals("인천")||applyArea.equals("부천")) {
			mgrTel = "032-"+telCenter+"-"+telLast;
			if(applyArea.equals("강화군")) {}
			else if(applyArea.equals("계양구")) {}
			else if(applyArea.equals("남구")) {}
			else if(applyArea.equals("남동구")) {}
			else if(applyArea.equals("동구")) {}
			else if(applyArea.equals("부평구")) {}
			else if(applyArea.equals("서구")) {}
			else if(applyArea.equals("연수구")) {}
			else if(applyArea.equals("옹진군")) {}
			else if(applyArea.equals("중구")) {}
		}else if(applyArea.equals("경기도")) {
			mgrTel = "031-"+telCenter+"-"+telLast;
			if(applyArea.equals("가평군")) {}
			else if(applyArea.equals("고양시 덕양구")) {}
			else if(applyArea.equals("고양시 일산동구")) {}
			else if(applyArea.equals("고양시 일산서구")) {}
			else if(applyArea.equals("과천시")) {}
			else if(applyArea.equals("광명시")) {}
			else if(applyArea.equals("광주시")) {}
			else if(applyArea.equals("구리시")) {}
			else if(applyArea.equals("군포시")) {}
			else if(applyArea.equals("김포시")) {}
			else if(applyArea.equals("남양주시")) {}
			else if(applyArea.equals("동두천시")) {}
			else if(applyArea.equals("부천시")) {}
			else if(applyArea.equals("성남시 분당구")) {}
			else if(applyArea.equals("성남시 수정구")) {}
			else if(applyArea.equals("성남시 중원구")) {}
			else if(applyArea.equals("수원시 권선구")) {}
			else if(applyArea.equals("수원시 영통구")) {}
			else if(applyArea.equals("수원시 장안구")) {}
			else if(applyArea.equals("수원시 팔달구")) {}
			else if(applyArea.equals("시흥시")) {}
			else if(applyArea.equals("안산시 단원구")) {}
			else if(applyArea.equals("안산시 상록구")) {}
			else if(applyArea.equals("안성시")) {}
			else if(applyArea.equals("안양시 동안구")) {}
			else if(applyArea.equals("안양시 만안구")) {}
			else if(applyArea.equals("양주시")) {}
			else if(applyArea.equals("양평군")) {}
			else if(applyArea.equals("여주시")) {}
			else if(applyArea.equals("연천군")) {}
			else if(applyArea.equals("오산시")) {}
			else if(applyArea.equals("용인시 기흥구")) {}
			else if(applyArea.equals("용인시 수지구")) {}
			else if(applyArea.equals("용인시 처인구")) {}
			else if(applyArea.equals("의왕시")) {}
			else if(applyArea.equals("의정부시")) {}
			else if(applyArea.equals("이천시")) {}
			else if(applyArea.equals("파주시")) {}
			else if(applyArea.equals("평택시")) {}
			else if(applyArea.equals("포천시")) {}
			else if(applyArea.equals("하남시")) {}
			else if(applyArea.equals("화성시")) {}
		}else if(applyArea.equals("강원도")||applyArea.equals("강원")) {
			mgrTel = "033-"+telCenter+"-"+telLast;
			if(applyArea.equals("강릉시")) {}
			else if(applyArea.equals("고성군")) {}
			else if(applyArea.equals("동해시")) {}
			else if(applyArea.equals("삼척시")) {}
			else if(applyArea.equals("속초시")) {}
			else if(applyArea.equals("양구군")) {}
			else if(applyArea.equals("양양군")) {}
			else if(applyArea.equals("영월군")) {}
			else if(applyArea.equals("원주시")) {}
			else if(applyArea.equals("인제군")) {}
			else if(applyArea.equals("정선군")) {}
			else if(applyArea.equals("철원군")) {}
			else if(applyArea.equals("춘천시")) {}
			else if(applyArea.equals("태백시")) {}
			else if(applyArea.equals("평창군")) {}
			else if(applyArea.equals("홍천군")) {}
			else if(applyArea.equals("화천군")) {}
			else if(applyArea.equals("횡성군")) {}
		}else if(applyArea.equals("충청남도")||applyArea.equals("충남")) {
			mgrTel = "041-"+telCenter+"-"+telLast;
			if(applyArea.equals("계룡시")) {}
			else if(applyArea.equals("공주시")) {}
			else if(applyArea.equals("금산군")) {}
			else if(applyArea.equals("논산시")) {}
			else if(applyArea.equals("당진시")) {}
			else if(applyArea.equals("보령시")) {}
			else if(applyArea.equals("부여군")) {}
			else if(applyArea.equals("서산시")) {}
			else if(applyArea.equals("서천군")) {}
			else if(applyArea.equals("아산시")) {}
			else if(applyArea.equals("예산군")) {}
			else if(applyArea.equals("천안시 동남구")) {}
			else if(applyArea.equals("천안시 서북구")) {}
			else if(applyArea.equals("청양군")) {}
			else if(applyArea.equals("태안군")) {}
			else if(applyArea.equals("홍성군")) {}
		}else if(applyArea.equals("대전광역시")||applyArea.equals("대전")) {
			mgrTel = "042-"+telCenter+"-"+telLast;
			if(applyArea.equals("대덕구")) {}
			else if(applyArea.equals("동구")) {}
			else if(applyArea.equals("서구")) {}
			else if(applyArea.equals("유성구")) {}
			else if(applyArea.equals("중구")) {}
		}else if(applyArea.equals("충청북도")||applyArea.equals("충북")) {
			mgrTel = "043-"+telCenter+"-"+telLast;
			if(applyArea.equals("괴산군")) {}
			else if(applyArea.equals("단양군")) {}
			else if(applyArea.equals("보은군")) {}
			else if(applyArea.equals("영동군")) {}
			else if(applyArea.equals("옥천군")) {}
			else if(applyArea.equals("음성군")) {}
			else if(applyArea.equals("제천시")) {}
			else if(applyArea.equals("증평군")) {}
			else if(applyArea.equals("진천군")) {}
			else if(applyArea.equals("청주시 상당구")) {}
			else if(applyArea.equals("청주시 서원구")) {}
			else if(applyArea.equals("청주시 청원구")) {}
			else if(applyArea.equals("청주시 흥덕구")) {}
			else if(applyArea.equals("충주시")) {}
		}else if(applyArea.equals("세종특별자치시")||applyArea.equals("세종")) {
			mgrTel = "044-"+telCenter+"-"+telLast;
		}else if(applyArea.equals("부산광역시")||applyArea.equals("부산")) {
			mgrTel = "051-"+telCenter+"-"+telLast;
			if(applyArea.equals("강서구")) {}
			else if(applyArea.equals("금정구")) {}
			else if(applyArea.equals("기장군")) {}
			else if(applyArea.equals("남구")) {}
			else if(applyArea.equals("동구")) {}
			else if(applyArea.equals("동래구")) {}
			else if(applyArea.equals("부산진구")) {}
			else if(applyArea.equals("북구")) {}
			else if(applyArea.equals("사상구")) {}
			else if(applyArea.equals("사하구")) {}
			else if(applyArea.equals("서구")) {}
			else if(applyArea.equals("수영구")) {}
			else if(applyArea.equals("연제구")) {}
			else if(applyArea.equals("영도구")) {}
			else if(applyArea.equals("중구")) {}
			else if(applyArea.equals("해운대구")) {}
		}else if(applyArea.equals("울산광역시")||applyArea.equals("울산")) {
			mgrTel = "052-"+telCenter+"-"+telLast;
			if(applyArea.equals("남구")) {}
			else if(applyArea.equals("동구")) {}
			else if(applyArea.equals("북구")) {}
			else if(applyArea.equals("울주군")) {}
			else if(applyArea.equals("중구")) {}
		}else if(applyArea.equals("대구광역시")||applyArea.equals("대구")) {
			mgrTel = "053-"+telCenter+"-"+telLast;
			if(applyArea.equals("남구")) {}
			else if(applyArea.equals("달서구")) {}
			else if(applyArea.equals("달성군")) {}
			else if(applyArea.equals("동구")) {}
			else if(applyArea.equals("북구")) {}
			else if(applyArea.equals("서구")) {}
			else if(applyArea.equals("수성구")) {}
			else if(applyArea.equals("중구")) {}
		}else if(applyArea.equals("경상북도")||applyArea.equals("경북")) {
			mgrTel = "054-"+telCenter+"-"+telLast;
			if(applyArea.equals("경산시")) {}
			else if(applyArea.equals("경주시")) {}
			else if(applyArea.equals("고령군")) {}
			else if(applyArea.equals("구미시")) {}
			else if(applyArea.equals("군위군")) {}
			else if(applyArea.equals("김천시")) {}
			else if(applyArea.equals("문경시")) {}
			else if(applyArea.equals("봉화군")) {}
			else if(applyArea.equals("상주시")) {}
			else if(applyArea.equals("성주군")) {}
			else if(applyArea.equals("안동시")) {}
			else if(applyArea.equals("영덕군")) {}
			else if(applyArea.equals("영양군")) {}
			else if(applyArea.equals("영주시")) {}
			else if(applyArea.equals("영천시")) {}
			else if(applyArea.equals("예천군")) {}
			else if(applyArea.equals("울릉군")) {}
			else if(applyArea.equals("울진군")) {}
			else if(applyArea.equals("의성군")) {}
			else if(applyArea.equals("청도군")) {}
			else if(applyArea.equals("청송군")) {}
			else if(applyArea.equals("칠곡군")) {}
			else if(applyArea.equals("포항시 남구")) {}
			else if(applyArea.equals("포항시 북구")) {}
		}else if(applyArea.equals("경상남도")||applyArea.equals("경남")) {
			mgrTel = "055-"+telCenter+"-"+telLast;
			if(applyArea.equals("거제시")) {}
			else if(applyArea.equals("거창군")) {}
			else if(applyArea.equals("고성군")) {}
			else if(applyArea.equals("김해시")) {}
			else if(applyArea.equals("남해군")) {}
			else if(applyArea.equals("밀양시")) {}
			else if(applyArea.equals("사천시")) {}
			else if(applyArea.equals("산청군")) {}
			else if(applyArea.equals("양산시")) {}
			else if(applyArea.equals("의령군")) {}
			else if(applyArea.equals("진주시")) {}
			else if(applyArea.equals("창녕군")) {}
			else if(applyArea.equals("창원시 마산합포구")) {}
			else if(applyArea.equals("창원시 마산회원구")) {}
			else if(applyArea.equals("창원시 성산구")) {}
			else if(applyArea.equals("창원시 의창구")) {}
			else if(applyArea.equals("창원시 진해구")) {}
			else if(applyArea.equals("통영시")) {}
			else if(applyArea.equals("하동군")) {}
			else if(applyArea.equals("함안군")) {}
			else if(applyArea.equals("함양군")) {}
			else if(applyArea.equals("합천군")) {}
		}else if(applyArea.equals("전라남도")||applyArea.equals("전남")) {
			mgrTel = "061-"+telCenter+"-"+telLast;
			if(applyArea.equals("강진군")) {}
			else if(applyArea.equals("고흥군")) {}
			else if(applyArea.equals("곡성군")) {}
			else if(applyArea.equals("광양시")) {}
			else if(applyArea.equals("구례군")) {}
			else if(applyArea.equals("나주시")) {}
			else if(applyArea.equals("담양군")) {}
			else if(applyArea.equals("목포시")) {}
			else if(applyArea.equals("무안군")) {}
			else if(applyArea.equals("보성군")) {}
			else if(applyArea.equals("순천시")) {}
			else if(applyArea.equals("신안군")) {}
			else if(applyArea.equals("여수시")) {}
			else if(applyArea.equals("영광군")) {}
			else if(applyArea.equals("영암군")) {}
			else if(applyArea.equals("완도군")) {}
			else if(applyArea.equals("장성군")) {}
			else if(applyArea.equals("장흥군")) {}
			else if(applyArea.equals("진도군")) {}
			else if(applyArea.equals("함평군")) {}
			else if(applyArea.equals("해남군")) {}
			else if(applyArea.equals("화순군")) {}
		}else if(applyArea.equals("광주광역시")||applyArea.equals("광주")) {
			mgrTel = "062-"+telCenter+"-"+telLast;
			if(applyArea.equals("광산구")) {}
			else if(applyArea.equals("남구")) {}
			else if(applyArea.equals("동구")) {}
			else if(applyArea.equals("북구")) {}
			else if(applyArea.equals("서구")) {}
		}else if(applyArea.equals("전라북도")||applyArea.equals("전북")) {
			mgrTel = "063-"+telCenter+"-"+telLast;
			if(applyArea.equals("고창군")) {}
			else if(applyArea.equals("군산시")) {}
			else if(applyArea.equals("김제시")) {}
			else if(applyArea.equals("남원시")) {}
			else if(applyArea.equals("무주군")) {}
			else if(applyArea.equals("부안군")) {}
			else if(applyArea.equals("순창군")) {}
			else if(applyArea.equals("완주군")) {}
			else if(applyArea.equals("익산시")) {}
			else if(applyArea.equals("임실군")) {}
			else if(applyArea.equals("장수군")) {}
			else if(applyArea.equals("전주시 덕진구")) {}
			else if(applyArea.equals("전주시 완산구")) {}
			else if(applyArea.equals("정읍시")) {}
			else if(applyArea.equals("진안군")) {}
		}else if(applyArea.equals("제주특별자치도")||applyArea.equals("제주도")) {
			mgrTel = "064-"+telCenter+"-"+telLast;			
			if(applyArea.equals("서귀포시")) {}		
			else if(applyArea.equals("제주시")) {}
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
