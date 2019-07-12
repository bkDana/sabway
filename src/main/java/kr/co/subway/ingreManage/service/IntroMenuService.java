package kr.co.subway.ingreManage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.ingreManage.dao.IntroMenuDao;
import kr.co.subway.ingreManage.vo.IngreVo;

@Service
public class IntroMenuService {
	
	@Autowired
	private IntroMenuDao dao;

	public ArrayList<IngreVo> introMenu(IngreVo ingre) {
		return (ArrayList<IngreVo>)dao.introMenu(ingre);
	}
	
	

}
