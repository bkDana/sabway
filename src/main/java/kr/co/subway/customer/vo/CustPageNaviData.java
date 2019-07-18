package kr.co.subway.customer.vo;

import java.util.ArrayList;

public class CustPageNaviData {
	private ArrayList<Customer> custList;
	private String pageNavi;
	public CustPageNaviData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CustPageNaviData(ArrayList<Customer> custList, String pageNavi) {
		super();
		this.custList = custList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Customer> getCustList() {
		return custList;
	}
	public void setCustList(ArrayList<Customer> custList) {
		this.custList = custList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
