package kr.co.subway.menuManage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.subway.menuManage.dao.MenuManageDao;

@Service("menuManageService")
public class MenuManageService {
	@Autowired
	private MenuManageDao menuDao;
}
