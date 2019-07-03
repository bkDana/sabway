package kr.co.subway.ingreManage.vo;

import java.util.ArrayList;

public class IngrePageNaviData {
	private ArrayList<IngreVo> IngreList;
	private String pageNavi;
	public IngrePageNaviData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IngrePageNaviData(ArrayList<IngreVo> ingreList, String pageNavi) {
		super();
		IngreList = ingreList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<IngreVo> getIngreList() {
		return IngreList;
	}
	public void setIngreList(ArrayList<IngreVo> ingreList) {
		IngreList = ingreList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
