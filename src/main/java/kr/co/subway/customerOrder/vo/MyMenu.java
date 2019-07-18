package kr.co.subway.customerOrder.vo;

public class MyMenu {
	private int mmIdx;
	private String mmCustomerNo;
	private int mmBucIdx;
	private String mmMenuLabel;
	public MyMenu() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyMenu(int mmIdx, String mmCustomerNo, int mmBucIdx, String mmMenuLabel) {
		super();
		this.mmIdx = mmIdx;
		this.mmCustomerNo = mmCustomerNo;
		this.mmBucIdx = mmBucIdx;
		this.mmMenuLabel = mmMenuLabel;
	}
	public int getMmIdx() {
		return mmIdx;
	}
	public void setMmIdx(int mmIdx) {
		this.mmIdx = mmIdx;
	}
	public String getMmCustomerNo() {
		return mmCustomerNo;
	}
	public void setMmCustomerNo(String mmCustomerNo) {
		this.mmCustomerNo = mmCustomerNo;
	}
	public int getMmBucIdx() {
		return mmBucIdx;
	}
	public void setMmBucIdx(int mmBucIdx) {
		this.mmBucIdx = mmBucIdx;
	}
	public String getMmMenuLabel() {
		return mmMenuLabel;
	}
	public void setMmMenuLabel(String mmMenuLabel) {
		this.mmMenuLabel = mmMenuLabel;
	}
	
}	