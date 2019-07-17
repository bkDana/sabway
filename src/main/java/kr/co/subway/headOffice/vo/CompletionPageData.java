package kr.co.subway.headOffice.vo;

import java.util.ArrayList;

public class CompletionPageData {
	private ArrayList<Apply> applyList;
	private String pageNavi;
	private int totalCount;
	public CompletionPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CompletionPageData(ArrayList<Apply> applyList, String pageNavi, int totalCount) {
		super();
		this.applyList = applyList;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
	}
	public ArrayList<Apply> getApplyList() {
		return applyList;
	}
	public void setApplyList(ArrayList<Apply> applyList) {
		this.applyList = applyList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

}
