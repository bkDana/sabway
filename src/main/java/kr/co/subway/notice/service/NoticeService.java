package kr.co.subway.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.subway.notice.dao.NoticeDao;
import kr.co.subway.notice.vo.Notice;

@Service("noticeService")
public class NoticeService {
	@Autowired
	@Qualifier(value="noticeDao")
	private NoticeDao noticeDao;
	
	public ArrayList<Notice> noticeSelectAll(){
		return (ArrayList<Notice>)noticeDao.noticeSelectAll();
	}
}
