package kr.co.subway.stock.vo;

import java.util.ArrayList;

public class HistoryListVO {
	private ArrayList<HistoryVO> list;
	private String pageNavi;
	
	public HistoryListVO() {
		super();
	}
	public HistoryListVO(ArrayList<HistoryVO> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	
	public ArrayList<HistoryVO> getList() {
		return list;
	}
	public void setList(ArrayList<HistoryVO> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
