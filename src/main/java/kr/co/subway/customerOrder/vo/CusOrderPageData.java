package kr.co.subway.customerOrder.vo;

import java.util.ArrayList;

public class CusOrderPageData {
	private ArrayList<CusOrder> list;
	private String pageNavi;
	private int totalCount;
	public CusOrderPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CusOrderPageData(ArrayList<CusOrder> list, String pageNavi, int totalCount) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
	}
	public ArrayList<CusOrder> getList() {
		return list;
	}
	public void setList(ArrayList<CusOrder> list) {
		this.list = list;
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
