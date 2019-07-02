package kr.co.subway.ingreManage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.ingreManage.dao.IngreManageDao;

@Service("menuManageService")
public class IngreManageService {
	@Autowired
	private IngreManageDao menuDao;
}
