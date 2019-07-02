package kr.co.subway.notice.vo;

import java.util.ArrayList;

public class PageNaviData {
	private ArrayList<Notice> noticeList;
	private ArrayList<Qna> qnaList;
	private String pageNavi;
	public PageNaviData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageNaviData(ArrayList<Notice> noticeList, ArrayList<Qna> qnaList, String pageNavi) {
		super();
		this.noticeList = noticeList;
		this.qnaList = qnaList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Notice> getNoticeList() {
		return noticeList;
	}
	public void setNoticeList(ArrayList<Notice> noticeList) {
		this.noticeList = noticeList;
	}
	public ArrayList<Qna> getQnaList() {
		return qnaList;
	}
	public void setQnaList(ArrayList<Qna> qnaList) {
		this.qnaList = qnaList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
