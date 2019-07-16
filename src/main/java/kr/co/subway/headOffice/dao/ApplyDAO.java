package kr.co.subway.headOffice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.subway.headOffice.vo.Apply;
import kr.co.subway.headOffice.vo.ApplyPageBound;

@Repository("applyDao")
public class ApplyDAO {
	@Autowired
	SqlSession sqlsession;
	//신청목록
	public List<Apply> applyList() {
		return sqlsession.selectList("apply.applyList");
	}
	//승인처리
	public int applyManagerUpdate(int applyNo) {
		return sqlsession.update("apply.applyManagerUpdate",applyNo);
	}
	//거절처리
	public int rejectManagerUpdate(int applyNo) {
		return sqlsession.update("apply.rejectManagerUpdate",applyNo);
	}
	//신청 글 상세보기
	public Apply applyView(int applyNo) {
		return sqlsession.selectOne("apply.applyView",applyNo);
	}
	// 가맹신청/문의 등록
	public int insertApply(Apply applyVo) {
		return sqlsession.insert("apply.insertApply",applyVo);
	}
	//신청리스트 페이징
	public List<Apply> applyPaging(ApplyPageBound pb) {
		return sqlsession.selectList("apply.applyPaging",pb);
	}
	//처리한 리스트 페이징
	public List<Apply> completionPaging(ApplyPageBound pb) {
		return sqlsession.selectList("apply.completionPaging",pb);
	}
	//신청리스트 전체 개수 가져오기
	public int applyTotalCount() {
		return sqlsession.selectOne("apply.applyTotalCount");
	}
	//처리한 목록 전체 개수 가져오기
	public int completionTotalCount() {
		return sqlsession.selectOne("apply.completionTotalCount");
	}
}
