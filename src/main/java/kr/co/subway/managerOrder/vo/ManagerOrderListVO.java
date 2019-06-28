package kr.co.subway.managerOrder.vo;

import java.util.ArrayList;

public class ManagerOrderListVO {
	private ArrayList<ManagerOrderVO> orderList;
	private String pageNavi;
	
	public ManagerOrderListVO() {
		super();
	}
	
	public ManagerOrderListVO(ArrayList<ManagerOrderVO> orderList, String pageNavi) {
		super();
		this.orderList = orderList;
		this.pageNavi = pageNavi;
	}
	
	public ArrayList<ManagerOrderVO> getOrderList() {
		return orderList;
	}
	public void setOrderList(ArrayList<ManagerOrderVO> orderList) {
		this.orderList = orderList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
