package kr.co.subway.managerOrder.vo;

import java.sql.Date;

public class ManagerOrderVO {
	private int rnum;
	private int mOrderIdx;
	private int mOrderManagerId;
	private String mOrderTitle;
	private Date mOrderDelDate;
	private int mOrderState;
	private String mOrderDate;
	
	public ManagerOrderVO() {
		super();
	}
	
	public ManagerOrderVO(int rnum, int mOrderIdx, int mOrderManagerId, String mOrderTitle, Date mOrderDelDate,
			int mOrderState, String mOrderDate) {
		super();
		this.rnum = rnum;
		this.mOrderIdx = mOrderIdx;
		this.mOrderManagerId = mOrderManagerId;
		this.mOrderTitle = mOrderTitle;
		this.mOrderDelDate = mOrderDelDate;
		this.mOrderState = mOrderState;
		this.mOrderDate = mOrderDate;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getmOrderIdx() {
		return mOrderIdx;
	}
	public void setmOrderIdx(int mOrderIdx) {
		this.mOrderIdx = mOrderIdx;
	}
	public int getmOrderManagerId() {
		return mOrderManagerId;
	}
	public void setmOrderManagerId(int mOrderManagerId) {
		this.mOrderManagerId = mOrderManagerId;
	}
	public String getmOrderTitle() {
		return mOrderTitle;
	}
	public void setmOrderTitle(String mOrderTitle) {
		this.mOrderTitle = mOrderTitle;
	}
	public Date getmOrderDelDate() {
		return mOrderDelDate;
	}
	public void setmOrderDelDate(Date mOrderDelDate) {
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
	
	
}
