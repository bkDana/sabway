package kr.co.subway.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.notice.vo.Notice;
import kr.co.subway.notice.vo.PageBound;
import kr.co.subway.notice.vo.Qna;

@Repository("noticeDao")
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List noticeSelectAll(){
		return sqlSession.selectList("notice.noticeSelectAll");
	}
	
	public Notice noticeSelectOne(int noticeNo) {
		return sqlSession.selectOne("notice.noticeSelectOne", noticeNo);
	}
	
	public int noticeInsert(Notice n){
		return sqlSession.insert("notice.noticeInsert", n);
	}
	
	public int noticeUpdate(Notice n){
		return sqlSession.update("notice.noticeUpdate", n);
	}
	
	public int noticeDelete(int noticeNo){
		return sqlSession.delete("notice.noticeDelete", noticeNo);
	}
	
	public int noticeTotalCount() {
		return sqlSession.selectOne("notice.noticeTotalCount");
	}
	
	public List noticeSelectPaging(PageBound pb){
		return sqlSession.selectList("notice.noticeSelectPaging", pb);
	}
	//////////////////////////////////////////////////////////////////////////////
	//여기서 부터 QNA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public List qnaSelectAll(){
		return sqlSession.selectList("notice.qnaSelectAll");
	}
	
	public Qna qnaSelectOne(int qnaNo){
		return sqlSession.selectOne("notice.qnaSelectOne",qnaNo);
	}
	
	public int qnaInsert(Qna q){
		return sqlSession.insert("notice.qnaInsert", q);
	}
	
	public int qnaUpdate(Qna q){
		return sqlSession.update("notice.qnaUpdate", q);
	}
	
	public int qnaDelete(int qnaNo){
		return sqlSession.delete("notice.qnaDelete", qnaNo);
	}
	
	public int qnaTotalCount() {
		return sqlSession.selectOne("notice.qnaTotalCount");
	}
	
	public List qnaSelectPaging(PageBound pb){
		return sqlSession.selectList("notice.qnaSelectPaging", pb);
	}
}
