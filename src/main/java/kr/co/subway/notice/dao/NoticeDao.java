package kr.co.subway.notice.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.notice.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List noticeSelectAll(){
		return sqlSession.selectList("noticeSelectAll");
	}
}
