package kr.co.subway.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.notice.vo.Notice;
import kr.co.subway.notice.vo.PageBound;

@Repository("noticeDao")
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List noticeSelectAll(){
		return sqlSession.selectList("noticeSelectAll");
	}
	
	public int noticeInsert(Notice n){
		return sqlSession.insert("noticeInsert", n);
	}
	
	public int noticeUpdate(Notice n){
		return sqlSession.update("noticeUpdate", n);
	}
	
	public int noticeDelete(int noticeNo){
		return sqlSession.delete("noticeDelete", noticeNo);
	}
	
	public int totalCount() {
		return sqlSession.selectOne("totalCount");
	}
	
	public List noticeSelectPaging(PageBound pb){
		return sqlSession.selectList("noticeSelectPaging", pb);
	}
}
