package kr.co.subway.manager.service;

import org.springframework.stereotype.Component;

@Component("substr")
public class SubStr {
	public String subStr(String applyArea) {
		String subStr = "";
		if(applyArea.contains("특별시")){
			subStr = applyArea.replace("특별시"," ");
		}else if(applyArea.contains("광역시")){
			subStr = applyArea.replace("광역시"," ");
		}
		return subStr;
	}
}
