package kr.co.subway.manager.service;

import java.util.Random;

import org.springframework.stereotype.Component;

@Component("randomtel")
public class RandomTel {
	public String randomTel() {
		String ranTel = "";
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
		ranTel = telCenter+"-"+telLast;
		return ranTel;
	}
}
