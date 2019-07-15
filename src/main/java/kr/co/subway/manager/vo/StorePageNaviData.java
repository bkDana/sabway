package kr.co.subway.manager.vo;

import java.util.ArrayList;

public class StorePageNaviData {
	private ArrayList<Mgr> storeList;
	private String pageNavi;
	public StorePageNaviData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StorePageNaviData(ArrayList<Mgr> storeList, String pageNavi) {
		super();
		this.storeList = storeList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Mgr> getStoreList() {
		return storeList;
	}
	public void setStorelist(ArrayList<Mgr> storeList) {
		this.storeList = storeList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
