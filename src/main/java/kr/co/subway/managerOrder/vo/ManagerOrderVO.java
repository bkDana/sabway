package kr.co.subway.managerOrder.vo;

import java.util.ArrayList;

public class ManagerOrderVO {
	private int rnum;
	private String mOrderNo;
	private String mOrderManagerId;
	private String mOrderTitle;
	private String mOrderDelDate;
	private int mOrderState;
	private String mOrderDate;
	private ArrayList<ManagerItemVO> itemList ;
	private String mgrName;
	
	public ManagerOrderVO() {
		super();
	}
	
	public ManagerOrderVO(int rnum, String mOrderNo, String mOrderManagerId, String mOrderTitle, String mOrderDelDate,
			int mOrderState, String mOrderDate) {
		super();
		this.rnum = rnum;
		this.mOrderNo = mOrderNo;
		this.mOrderManagerId = mOrderManagerId;
		this.mOrderTitle = mOrderTitle;
		this.mOrderDelDate = mOrderDelDate;
		this.mOrderState = mOrderState;
		this.mOrderDate = mOrderDate;
	}
	
	public ManagerOrderVO(String mOrderNo, String mOrderManagerId, String mOrderTitle, String mOrderDelDate, ArrayList<ManagerItemVO> itemList) {
		super();
		this.mOrderNo = mOrderNo;
		this.mOrderManagerId = mOrderManagerId;
		this.mOrderTitle = mOrderTitle;
		this.mOrderDelDate = mOrderDelDate;
		this.itemList = itemList;
	}
	
	public ManagerOrderVO(String mOrderNo, int mOrderState) {
		super();
		this.mOrderNo = mOrderNo;
		this.mOrderState = mOrderState;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getmOrderNo() {
		return mOrderNo;
	}
	public void setmOrderNo(String mOrderNo) {
		this.mOrderNo = mOrderNo;
	}
	public String getmOrderManagerId() {
		return mOrderManagerId;
	}
	public void setmOrderManagerId(String mOrderManagerId) {
		this.mOrderManagerId = mOrderManagerId;
	}
	public String getmOrderTitle() {
		return mOrderTitle;
	}
	public void setmOrderTitle(String mOrderTitle) {
		this.mOrderTitle = mOrderTitle;
	}
	public String getmOrderDelDate() {
		return mOrderDelDate;
	}
	public void setmOrderDelDate(String mOrderDelDate) {
		this.mOrderDelDate = mOrderDelDate;
	}
	public int getmOrderState() {
		return mOrderState;
	}
	public void setmOrderState(int mOrderState) {
		this.mOrderState = mOrderState;
	}
	public String getmOrderDate() {
		return mOrderDate;
	}
	public void setmOrderDate(String mOrderDate) {
		this.mOrderDate = mOrderDate;
	}

	public ArrayList<ManagerItemVO> getItemList() {
		return itemList;
	}

	public void setItemList(ArrayList<ManagerItemVO> itemList) {
		this.itemList = itemList;
	}

	public String getMgrName() {
		return mgrName;
	}

	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}

	
	
	
}
