package kr.co.subway.manager.service;

import org.springframework.stereotype.Component;

@Component("addrcode")
public class AddrCode {
	//지역별로 앞자리 구분
	public String addrCode(String ranTel,String addrType) {
		String addrCode = "";
		if(addrType.contains("A")) {
			addrCode = "02-"+ranTel;
		}
		else if(addrType.contains("B")) {
			addrCode = "032-"+ranTel;
		}
		else if(addrType.contains("C")) {
			addrCode = "031-"+ranTel;
		}
		else if(addrType.contains("D")) {
			addrCode = "033-"+ranTel;
		}
		else if(addrType.contains("E")) {
			addrCode = "041-"+ranTel;
		}
		else if(addrType.contains("F")) {
			addrCode = "042-"+ranTel;
		}
		else if(addrType.contains("G")) {
			addrCode = "043-"+ranTel;
		}
		else if(addrType.contains("H")) {
			addrCode = "044-"+ranTel;
		}
		else if(addrType.contains("I")) {
			addrCode = "051-"+ranTel;
		}
		else if(addrType.contains("J")) {
			addrCode = "052-"+ranTel;
		}
		else if(addrType.contains("K")) {
			addrCode = "053-"+ranTel;
		}
		else if(addrType.contains("L")) {
			addrCode = "054-"+ranTel;
		}
		else if(addrType.contains("M")) {
			addrCode = "055-"+ranTel;
		}
		else if(addrType.contains("N")) {
			addrCode = "061-"+ranTel;
		}
		else if(addrType.contains("O")) {
			addrCode = "062-"+ranTel;
		}
		else if(addrType.contains("P")) {
			addrCode = "063-"+ranTel;
		}
		else if(addrType.contains("Q")) {
			addrCode = "064-"+ranTel;
		}
		return addrCode;
	}
}
