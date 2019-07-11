package kr.co.subway.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.subway.notice.dao.NoticeDao;
import kr.co.subway.notice.vo.Notice;
import kr.co.subway.notice.vo.PageBound;
import kr.co.subway.notice.vo.PageNaviData;
import kr.co.subway.notice.vo.Qna;
import kr.co.subway.notice.vo.Review;

@Service("noticeService")
public class NoticeService {
	@Autowired
	@Qualifier(value="noticeDao")
	private NoticeDao noticeDao;
	
	public ArrayList<Notice> noticeSelectAll(){
		return (ArrayList<Notice>)noticeDao.noticeSelectAll();
	}
	
	public Notice noticeSelectOne(int noticeNo){
		return noticeDao.noticeSelectOne(noticeNo);
	}
	
	public PageNaviData noticeSelectPaging(int currentPage){
		int numPerPage = 5;
		int totalCount = noticeDao.noticeTotalCount();
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		PageBound pb = new PageBound(start, end);
		ArrayList<Notice> noticeList = (ArrayList<Notice>)noticeDao.noticeSelectPaging(pb);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((currentPage-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage != 1) {
			pageNavi += "<a href='/notice.do?currentPage="+(currentPage-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(currentPage == pageNo) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/notice.do?currentPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(currentPage < totalPage) {
			pageNavi +="<a href='/notice.do?currentPage="+(currentPage+1)+"'>다음</a>";
		}
		
		return new PageNaviData(noticeList,null,null, pageNavi);
	}
	
	@Transactional
	public int noticeInsert(Notice n){
		return noticeDao.noticeInsert(n);
	}
	
	@Transactional
	public int noticeUpdate(Notice n){
		return noticeDao.noticeUpdate(n);
	}
	
	@Transactional
	public int noticeDelete(int noticeNo){
		return noticeDao.noticeDelete(noticeNo);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////
	//여기서 부터 QNA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public ArrayList<Qna> qnaSelectAll(){
		return (ArrayList<Qna>)noticeDao.qnaSelectAll();
	}
	
	public Qna qnaSelectOne(int qnaNo){
		return noticeDao.qnaSelectOne(qnaNo);
	}
	
	public PageNaviData qnaSelectPaging(int currentPage){
		int numPerPage = 5;
		int totalCount = noticeDao.qnaTotalCount();
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		PageBound pb = new PageBound(start, end);
		ArrayList<Qna> qnaList = (ArrayList<Qna>)noticeDao.qnaSelectPaging(pb);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((currentPage-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage != 1) {
			pageNavi += "<a href='/qna.do?currentPage="+(currentPage-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(currentPage == pageNo) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/qna.do?currentPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(currentPage < totalPage) {
			pageNavi +="<a href='/qna.do?currentPage="+(currentPage+1)+"'>다음</a>";
		}
		
		return new PageNaviData(null,qnaList,null, pageNavi);
	}
	
	@Transactional
	public int qnaInsert(Qna q){
		return noticeDao.qnaInsert(q);
	}
	
	@Transactional
	public int qnaUpdate(Qna q){
		return noticeDao.qnaUpdate(q);
	}
	
	@Transactional
	public int qnaDelete(int qnaNo){
		return noticeDao.qnaDelete(qnaNo);
	}
	/////////////////////////////////여기부터 리뷰임!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	@Transactional
	public int reviewInsert(Review r){
		return noticeDao.reviewInsert(r);
	}
	
	public PageNaviData reviewSelectPaging(int currentPage){
		int numPerPage = 5;
		int totalCount = noticeDao.reviewTotalCount();
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		PageBound pb = new PageBound(start, end);
		ArrayList<Review> reviewList = (ArrayList<Review>)noticeDao.reviewSelectPaging(pb);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((currentPage-1)/pageNaviSize)*pageNaviSize+1;
		if(currentPage != 1) {
			pageNavi += "<a href='/review.do?currentPage="+(currentPage-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(currentPage == pageNo) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/review.do?currentPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(currentPage < totalPage) {
			pageNavi +="<a href='/review.do?currentPage="+(currentPage+1)+"'>다음</a>";
		}
		
		return new PageNaviData(null,null,reviewList, pageNavi);
	}
	
	public ArrayList<Review> reviewSelectAll(){
		return (ArrayList<Review>)noticeDao.reviewSelectAll();
	}
	
	public Review reviewSelectOne(int reviewNo){
		return noticeDao.reviewSelectOne(reviewNo);
	}
	
	@Transactional
	public int reviewUpdate(Review r){
		return noticeDao.reviewUpdate(r);
	}
	
	@Transactional
	public int reviewDelete(int reviewNo){
		return noticeDao.reviewDelete(reviewNo);
	}
	
	@Transactional
	public int likeUpInsert(int reviewNo){
		return noticeDao.likeUpInsert(reviewNo);
	}
	
	@Transactional
	public int likeDownInsert(int reviewNo){
		return noticeDao.likeDownInsert(reviewNo);
	}
}
